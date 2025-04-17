extends StaticBody3D

var interactable = true
var opened = false

func _ready():
	if get_parent().get_parent().AI != null:
		get_parent().get_parent().AI.hide()

func interact():
	if get_parent().get_parent().AI != null:
		get_parent().get_parent().AI.show()
	if not get_parent().get_parent().Interactable: return
	if get_parent().get_parent().locked && get_parent().get_parent().key == null:
		get_parent().get_parent().locked = false
		$locked.play();
	if interactable && !get_parent().get_parent().locked:
		interactable = false
		opened = !opened
		if opened:
			if AprilFoolsManager.is_april_fools_day():
				if get_node("/root/" + get_tree().current_scene.name + "/april fools/Door") != null:
					get_node("/root/" + get_tree().current_scene.name + "/april fools/Door").play()
					await get_tree().create_timer(15.69,false).timeout
				else: if get_node("/root/" + get_tree().current_scene.name + "/april fools/Doora") != null:
					get_node("/root/" + get_tree().current_scene.name + "/april fools/Doora").play()
					await get_tree().create_timer(5.82,false).timeout
				$AnimationPlayer.play("open")
				$open.play();
			else:
				$AnimationPlayer.play("open")
				$open.play();
			if get_parent().get_parent().GiveLore:
				write_to_file("user://checkpoints","11")
			
			if get_parent().get_parent().ChangeScene != "":
				get_parent().get_parent().process_mode = Node.PROCESS_MODE_ALWAYS
				get_node("/root/" + get_tree().current_scene.name + "/Player").moveable = false
				get_tree().paused = true
				await get_tree().create_timer(2,true).timeout
				get_tree().paused = false
				CheckpointSystem.hasFlashlight = true
				CheckpointSystem.hasGun = true
				get_tree().change_scene_to_file(get_parent().get_parent().ChangeScene)
				return
			
			if get_parent().get_parent().TriggerCutscene:
				get_node("/root/" + get_tree().current_scene.name + "/Player").moveable = false
				await get_tree().create_timer(2,false).timeout
			
			if get_parent().get_parent().TriggerAnimation != null:
				if get_parent().get_parent().MonsterWalks != null:
					if get_parent().get_parent().MonsterWalkSpeed != null:
						get_parent().get_parent().MonsterWalks.folllowPlayer(get_parent().get_parent().MonsterWalkSpeed)
					else:
						get_parent().get_parent().MonsterWalks.folllowPlayer()
				get_parent().get_parent().TriggerAnimation.play(get_parent().get_parent().AnimationName)
				
				if get_parent().get_parent().FreezePlayerWhileAnimation:
					get_node("/root/" + get_tree().current_scene.name + "/Player").moveable = false
					await get_tree().create_timer(get_parent().get_parent().AnimationTime,false).timeout
					get_node("/root/" + get_tree().current_scene.name + "/Player").moveable = true
				if get_parent().get_parent().find_child("Quiet") != null:
					while true:
						get_parent().get_parent().find_child("Quiet").play()
						await get_tree().create_timer(76.8,false).timeout
			
		else:
			if get_parent().get_parent().OnlyOpen: return
			if not get_parent().get_parent().OnlyOpen:
				$AnimationPlayer.play("close")
				$open.play();
		await get_tree().create_timer(1.0,false).timeout
		interactable = true
	if interactable && get_parent().get_parent().locked:
		interactable = false
		$AnimationPlayer.play("locked")
		$locked.play();
		await get_tree().create_timer(1.0,false).timeout
		interactable = true

func write_to_file(file_path: String, content: String) -> void:
	var file := FileAccess.open(file_path, FileAccess.WRITE)
	if file:
		file.store_string(content)
		file.close()
	else:
		push_error("Failed to open file for writing: " + file_path)
