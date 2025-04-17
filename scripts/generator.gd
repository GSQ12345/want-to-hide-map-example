extends Node3D

var state = 0
var light = -1

var IsCorrect : bool = false

var canInteract = true

@export var MaxLight = 1

@export var solution = -1

var ForReset

var AmountOfLight = 6

func solve():
	canInteract = false
	activate()
	light = solution
	IsCorrect = true



func _ready():
	ForReset = MaxLight

func interact():
	if !canInteract:
		return
	if light + 1 < MaxLight:
		light += 1
		
		get_child(light + 1).get_child(1).visible = true
	else:
		deactivate()
	if $light1a/green.visible:
		$light1a/red.visible = false
	if $light2a/green.visible:
		$light2a/red.visible = false
	if $light3a/green.visible:
		$light3a/red.visible = false
	
	if $light1b/green.visible:
		$light1b/red.visible = false
	if $light2b/green.visible:
		$light2b/red.visible = false
	if $light3b/green.visible:
		$light3b/red.visible = false
	
	
func deactivate():
	canInteract = true
	state = 0
	light = -1
	MaxLight = ForReset
	
	$light1a/red.visible = true
	$light2a/red.visible = true
	$light3a/red.visible = true
	
	$light1b/red.visible = true
	$light2b/red.visible = true
	$light3b/red.visible = true
	
	$light1a/green.visible = false
	$light2a/green.visible = false
	$light3a/green.visible = false
	
	$light1b/green.visible = false
	$light2b/green.visible = false
	$light3b/green.visible = false
	
func activate():
	canInteract = false
	state = 3
	light = 6
	MaxLight = 6
	
	$light1a/red.visible = false
	$light2a/red.visible = false
	$light3a/red.visible = false
	
	$light1b/red.visible = false
	$light2b/red.visible = false
	$light3b/red.visible = false
	
	$light1a/green.visible = true
	$light2a/green.visible = true
	$light3a/green.visible = true
	
	$light1b/green.visible = true
	$light2b/green.visible = true
	$light3b/green.visible = true

func _process(delta):
	
	if light + 1 >= AmountOfLight / 4:
		state = 1
	if light + 1 >= AmountOfLight / 2:
		state = 2
	if light + 1 >= AmountOfLight / 1:
		state = 3
	
	
	
	$"button states".get_child(0).visible = false
	$"button states".get_child(1).visible = false
	$"button states".get_child(2).visible = false
	$"button states".get_child(3).visible = false
	
	$"button states".get_child(state).visible = true
	
	if light + 1 == solution:
		IsCorrect = true
	else:
		IsCorrect = false
	
