@tool
extends EditorPlugin

var inspector_plugin: EditorInspectorPlugin

func _enter_tree():
	inspector_plugin = preload("res://addons/node_exporter/node_exporter_inspector.gd").new()
	add_inspector_plugin(inspector_plugin)

func _exit_tree():
	remove_inspector_plugin(inspector_plugin)
