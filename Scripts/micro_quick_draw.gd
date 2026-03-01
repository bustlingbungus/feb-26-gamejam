extends Node2D

@onready var sound_manager = $SoundManager
@onready var music_manager = $MusicManager
@onready var duel_timer = $Duel_Starter
@onready var duel_decider = $Duel_Decider
@onready var duel_anim_player = $DRAW/AnimationPlayer
@onready var rng = RandomNumberGenerator.new()
@onready var micro_swticher: Node2D = $"Micro-Swticher"


var input_active = false
var lose_condition = false
var win = false
var shot = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#RNG Generation
	
	micro_swticher.starter.show()
	micro_swticher.starter.play()
	
	rng.randomize()
	var x = rng.randi_range(6, 10)
	# Setting Timer time
	duel_timer.wait_time = x
	duel_timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept") && shot == 1:
		if input_active && !lose_condition:
			win_condition()
		if !input_active && !lose_condition:
			print("Early shot")
		shot -= 1  


func win_condition():
	win = true
	print("w")


func early_lose_condition():
	pass


func late_lose_condition():
	pass


func _on_duel_timeout() -> void:
	input_active = true
	duel_anim_player.play("Flash")
	duel_decider.start()
 

func _on_duel_decider_timeout() -> void:
	lose_condition = true
	input_active = false
	print("L")
