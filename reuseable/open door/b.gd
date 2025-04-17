extends Node3D

@export var Yellow: bool
@export var Green: bool
@export var Blue: bool
@export var Purple: bool

@export var correct: bool


func _process(delta: float) -> void:
	if Yellow:
		correct = false
		if $StaticBody3D2/MeshInstance3D.material_override.albedo_color == Color.YELLOW: correct = true
	if Green:
		correct = false
		if $StaticBody3D2/MeshInstance3D.material_override.albedo_color == Color.GREEN: correct = true
	if Blue:
		correct = false
		if $StaticBody3D2/MeshInstance3D.material_override.albedo_color == Color.BLUE: correct = true
	if Purple:
		correct = false
		if $StaticBody3D2/MeshInstance3D.material_override.albedo_color == Color.PURPLE: correct = true
