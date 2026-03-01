extends Node

@export var oiiai : Node2D
@export var ArrowManager : Node
@export var winRound : int = 5
@export var maxMisses : int = 3
@export var ApplauseSound : AudioStreamPlayer
@export var bkgMusic : AudioStreamPlayer
@export var EndOfGameTime : float = 2.0
@onready var micro_switcher: Node2D = $"Micro-Swticher"

@export var fnfText : PackedScene
var text : Node2D


var game_over : bool = false

var round_num : int = 0
var misses : int = 0

var game_over_timer : float

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	bkgMusic.play()
	micro_switcher.starter.show()
	micro_switcher.starter.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if game_over:
		var t = game_over_timer + 0.1
		if t > 0.0:
			text.timer = t
			
		if game_over_timer <= 0.0:
			#ApplauseSound.stop()
			micro_switcher.play_anim() # this function also exits the micro game
		game_over_timer -= delta
	
	
func NewRound() -> void:
	round_num += 1
	if round_num > winRound:
		WinEvent()



func WinEvent() -> void:
	Global.add_score()
	ArrowManager.EndGame()
	ApplauseSound.play()
	
	text = fnfText.instantiate()
	text.SetText("You Win")
	add_child(text)
	
	game_over = true
	game_over_timer = EndOfGameTime
	
func LoseEvent() -> void:
	Global.lose_lives()
	ArrowManager.EndGame()
	oiiai.SpinningTime = 1e99
	oiiai.StartSpinning()
	
	text = fnfText.instantiate()
	text.SetText("You Lose")
	add_child(text)
	
	game_over = true
	game_over_timer = EndOfGameTime



func ArrowHit(arrow : Node2D) -> void:
	arrow.Destroy()
	
func ArrowMiss(arrow : Node2D) -> void:
	misses += 1
	if misses >= maxMisses:
		LoseEvent()
	else:
		oiiai.StartSpinning()
