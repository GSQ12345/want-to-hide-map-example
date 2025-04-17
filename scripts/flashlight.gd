extends SpotLight3D

var Drain = 0.001

var slider 

var picked_up = false

func _ready():
	Drain /= 2
	slider = get_node("/root/" + get_tree().current_scene.name + "/UI/Control/flashlight")
	slider.value = 1.0
	slider.visible = false
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if picked_up:
		slider.visible = true
	if Input.is_action_just_pressed("flashlight") && picked_up == true:
		StatsHelper.toogledFlashlighttimes += 0.5
		visible = !visible
		$toggle.play()
	if visible:
		slider.value -= Drain
		StatsHelper.flashlightTime += delta / 2.0
	if slider.value == slider.min_value:
		visible = false
