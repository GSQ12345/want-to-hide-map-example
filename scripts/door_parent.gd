extends Node3D

@export var key: StaticBody3D
@export var locked: bool

var TriggerCutscene: bool = false

var TriggerAnimation: AnimationPlayer
var AnimationName: String
var FreezePlayerWhileAnimation: bool
var AnimationTime: float
var MonsterWalks: Node
var MonsterWalkSpeed: float

var ChangeScene: String = ""

@export var Interactable:bool = true

@export var OnlyOpen: bool

var AI: Node3D = null

var GiveLore: bool = false
