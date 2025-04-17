extends Node

var gun

func _ready():
	gun = get_node("/root/" + get_tree().current_scene.name + "/Player/head/gun")


func interact():
	gun.pickedup = true
	queue_free()
	get_node("/root/" + get_tree().current_scene.name + "/pickup").play();
