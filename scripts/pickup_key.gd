extends Node3D

func interact():
	get_node("/root/" + get_tree().current_scene.name + "/pickup").play();
	queue_free()
