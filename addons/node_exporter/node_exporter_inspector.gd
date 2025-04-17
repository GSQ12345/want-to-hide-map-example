extends EditorInspectorPlugin

# Check if the object can be handled
func _can_handle(object):
	return object.is_class("Node") and object.has_method("export_nodes_to_file_with_path")

# Begin parsing the node properties
func _parse_begin(object):
	var container = VBoxContainer.new()
	container.add_theme_constant_override("separation", 8)

	var spacer_top = Control.new()
	spacer_top.custom_minimum_size = Vector2(0, 8)
	container.add_child(spacer_top)

	var button = Button.new()
	button.text = "Export Nodes to File"
	container.add_child(button)

	var spacer_bottom = Control.new()
	spacer_bottom.custom_minimum_size = Vector2(0, 8)
	container.add_child(spacer_bottom)

	# File dialog setup
	var file_dialog := FileDialog.new()
	file_dialog.access = FileDialog.ACCESS_FILESYSTEM  # Allows access outside of res://
	file_dialog.file_mode = FileDialog.FILE_MODE_SAVE_FILE
	file_dialog.filters = PackedStringArray(["*.txt ; Text File"])
	file_dialog.visible = false

	# On file selection, export nodes to file
	file_dialog.file_selected.connect(func (path: String):
		export_nodes_to_file(object, path)
	)
	
	container.add_child(file_dialog)

	# Open file dialog when button is pressed
	button.pressed.connect(func ():
		file_dialog.popup_centered()
	)

	add_custom_control(container)

# Function to export the node's properties and data to a file
func export_nodes_to_file(node: Node, path: String):
	# Use FileAccess.open for file operations
	var file = FileAccess.open(path, FileAccess.WRITE)  # Corrected to open with FileAccess mode
	if file == null:
		print("Failed to open file!")
		return
	
	# Write the node data as JSON-like structure
	file.store_string(serialize_node(node))
	file.close()

	print("Nodes exported to file:", path)

# Function to serialize a node's data (properties, scenes, etc.)
func serialize_node(node: Node) -> String:
	var result = ""

	# Node name
	result += "Node: " + node.name + "\n"

	# Serialize properties of the node
	for property in node.get_property_list():
		var prop_name = property.name
		var prop_value = node.get(prop_name)

		# Special handling for scene references (if the value is a Resource or PackedScene)
		if prop_value is PackedScene:
			prop_value = prop_value.resource_path  # Store the scene path

		# Store the property name and value
		result += "  " + prop_name + ": " + str(prop_value) + "\n"
	
	# Recursively serialize child nodes
	for child in node.get_children():
		result += "  Child: " + child.name + "\n"
		result += serialize_node(child)  # Recursively serialize child nodes

	return result
