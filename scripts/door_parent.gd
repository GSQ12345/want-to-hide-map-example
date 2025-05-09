extends Node3D

@export var key: StaticBody3D
@export var locked: bool

var TriggerCutscene: bool = false

@export var TriggerAnimation: AnimationPlayer
@export var AnimationName: String
@export var FreezePlayerWhileAnimation: bool
@export var AnimationTime: float
var MonsterWalks: Node
var MonsterWalkSpeed: float

var ChangeScene: String = ""

@export var Interactable:bool = true

@export var OnlyOpen: bool

@export var OpenOnGenerators: Array[Node3D]

@export var OpenOnColorGeneratorOrSmt: Array[Node3D]

var AI: Node3D = null

var GiveLore: bool = false
