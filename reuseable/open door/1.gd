extends StaticBody3D

func _ready():
	# Duplicate the material so changes affect only this instance.
	$MeshInstance3D.material_override = $MeshInstance3D.material_override.duplicate()
	# Set the initial albedo color to yellow.
	$MeshInstance3D.material_override.albedo_color = Color.YELLOW

func interact():
	# Cycle through the colors step-by-step.
	if $MeshInstance3D.material_override.albedo_color == Color.YELLOW:
		$MeshInstance3D.material_override.albedo_color = Color.GREEN
	elif $MeshInstance3D.material_override.albedo_color == Color.GREEN:
		$MeshInstance3D.material_override.albedo_color = Color.BLUE
	elif $MeshInstance3D.material_override.albedo_color == Color.BLUE:
		$MeshInstance3D.material_override.albedo_color = Color.PURPLE
	elif $MeshInstance3D.material_override.albedo_color == Color.PURPLE:
		$MeshInstance3D.material_override.albedo_color = Color.YELLOW

func shoot():
	# Cycle through the colors step-by-step.
	if $MeshInstance3D.material_override.albedo_color == Color.YELLOW:
		$MeshInstance3D.material_override.albedo_color = Color.GREEN
	elif $MeshInstance3D.material_override.albedo_color == Color.GREEN:
		$MeshInstance3D.material_override.albedo_color = Color.BLUE
	elif $MeshInstance3D.material_override.albedo_color == Color.BLUE:
		$MeshInstance3D.material_override.albedo_color = Color.PURPLE
	elif $MeshInstance3D.material_override.albedo_color == Color.PURPLE:
		$MeshInstance3D.material_override.albedo_color = Color.YELLOW
