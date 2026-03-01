extends Node

@export var oiiai : Node2D
@export var ArrowManager : Node
@export var winRound : int = 5
@export var maxMisses : int = 3

var round_num : int = 0
var misses : int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
	
func NewRound() -> void:
	round_num += 1
	if round_num > winRound:
		WinEvent()

func WinEvent() -> void:
	ArrowManager.EndGame()
	print("you win!")
	
func LoseEvent() -> void:
	ArrowManager.EndGame()
	oiiai.SpinningTime = 1e99
	oiiai.StartSpinning()
	print("you lose!")

func ArrowHit(arrow : Node2D) -> void:
	arrow.Destroy()
	
func ArrowMiss(arrow : Node2D) -> void:
	misses += 1
	if misses >= maxMisses:
		LoseEvent()
	else:
		oiiai.StartSpinning()
