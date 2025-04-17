extends Node

@export var drain: float
@export var hide: bool


var flashlight1
var flashlight2

func _ready():
	flashlight1 = get_node("/root/" + get_tree().current_scene.name + "/Player/head/flashlight1")
	flashlight2 = get_node("/root/" + get_tree().current_scene.name + "/Player/head/flashlight2")
	
	flashlight1.Drain = drain
	flashlight2.Drain = drain

var State_April = 0
var InIt = false

func interact():
		flashlight1.picked_up = true
		flashlight2.picked_up = true
		queue_free()
		get_node("/root/" + get_tree().current_scene.name + "/pickup").play();
		get_node("/root/" + get_tree().current_scene.name + "/UI/Control/flashlight_text").visible = true
	

func _process(delta: float) -> void:
	if not hide: return
	var flashlight = get_node("/root/" + get_tree().current_scene.name + "/UI/Control/flashlight")
	flashlight.position += Vector2(45329, 0)
