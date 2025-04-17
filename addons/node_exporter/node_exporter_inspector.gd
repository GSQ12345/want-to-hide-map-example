extends EditorInspectorPlugin

# Check if the object can be handled
func _can_handle(object):
	return object is Node

# Begin parsing the node properties
func _parse_begin(object):
	var container = VBoxContainer.new()
	container.add_theme_constant_override("separation", 8)

	var spacer_top = Control.new()
	spacer_top.custom_minimum_size = Vector2(0, 8)
	container.add_child(spacer_top)

	var button = Button.new()
	button.text = "Export Map"
	container.add_child(button)

	var spacer_bottom = Control.new()
	spacer_bottom.custom_minimum_size = Vector2(0, 8)
	container.add_child(spacer_bottom)

	# File dialog setup
	var file_dialog := FileDialog.new()
	file_dialog.access = FileDialog.ACCESS_FILESYSTEM
	file_dialog.file_mode = FileDialog.FILE_MODE_SAVE_FILE
	file_dialog.filters = PackedStringArray(["*.txt ; Text File"])
	file_dialog.visible = false

	file_dialog.file_selected.connect(func (path: String):
		export_scene_to_txt(object, path)
	)

	container.add_child(file_dialog)

	button.pressed.connect(func ():
		file_dialog.popup_centered()
	)

	add_custom_control(container)

# Function to export the scene's .tscn text
func export_scene_to_txt(node: Node, path: String) -> void:
	var scene_path = node.scene_file_path
	if scene_path == "":
		push_error("This node is not from a saved scene!")
		return
	
	var file = FileAccess.open(scene_path, FileAccess.READ)
	if file == null:
		push_error("Failed to open scene file: " + scene_path)
		return
	
	var scene_text = file.get_as_text()
	file.close()

	var save_file = FileAccess.open(path, FileAccess.WRITE)
	if save_file == null:
		push_error("Failed to create export file: " + path)
		return
	
	save_file.store_string(scene_text)
	save_file.close()

	print("Scene exported successfully to:", path)
