@tool
extends Node

func export_nodes_to_file_with_path(path: String):
	var file = FileAccess.open(path, FileAccess.WRITE)
	if file == null:
		push_error("Failed to open file: " + path)
		return
	
	_write_node(self, file, 0)
	file.close()
	print("Exported nodes to " + path)

func _write_node(node: Node, file: FileAccess, indent: int):
	var indent_str = "    ".repeat(indent)  # Here we use `.repeat()` to create spaces
	file.store_line(indent_str + node.name + " : " + node.get_class())

	for child in node.get_children():
		if child is Node:
			_write_node(child, file, indent + 1)
