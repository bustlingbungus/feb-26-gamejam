extends Node

@export var ArrowSpawner : Node
@export var SpawnSpeed : float = 1.0
@export var ArrowSpeed : float = 100.0
@export var fnfgirl : Node2D
@export var fnfboy : Node2D

var activePlayer : Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	activePlayer = fnfgirl
	SpawnArrows()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


#func SwitchSides() -> void:
	


func SpawnArrows() -> void:
	if ArrowSpawner == null:
		push_error("null arrow spawner!")
		return
	
	if activePlayer:
		push_error("couldn't find arrow targets!")
		return
		
	ArrowSpawner.SpawnArrows(fnfgirl.position, 4, SpawnSpeed, ArrowSpeed)
