extends Node2D

@onready var sound_manager = $SoundManager
@onready var music_manager = $MusicManager
@onready var duel_timer = $Duel_Starter
@onready var duel_decider = $Duel_Decider
@onready var duel_anim_player = $DRAW/AnimationPlayer
@onready var rng = RandomNumberGenerator.new()
@onready var micro_swticher: Node2D = $"Micro-Swticher"
@onready var player: Sprite2D = $Player/Sprite2D
@onready var enemy: Sprite2D = $Enemy/Sprite2D
@onready var player_arm: Sprite2D = $Player/Arm
@onready var enemy_arm: Sprite2D = $Enemy/Arm


var input_active = false
var lose_condition = false
var win = false
var shot = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#RNG Generation
	
	micro_swticher.starter.show()
	micro_swticher.starter.play()
	music_manager.load_sound("res://Assets/Sounds/SnapShot/shootout.mp3")
	music_manager.start()
	
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
			early_lose_condition()
		shot -= 1  


func win_condition():
	player_arm.show()
	enemy.position = Vector2(357, 530)
	enemy.texture = load("res://Assets/Art/WesternDOG/WesternDOG_EnemyDogDEAD.png")
	win = true
	print("w")
	Global.add_score()
	ending()


func early_lose_condition():
	player_arm.show()
	Global.lose_lives()
	enemy.position = Vector2(357, 530)
	enemy.texture = load("res://Assets/Art/WesternDOG/WesternDOG_EnemyDogDEAD.png")
	ending()


func late_lose_condition():
	lose_condition = true
	input_active = false
	enemy_arm.show()
	player.position = Vector2(357, 530)
	player.texture = load("res://Assets/Art/WesternDOG/WesternDOG_NormalDogDEAD.png")
	Global.lose_lives()
	micro_swticher.play_anim()


func ending():
	await get_tree().create_timer(2).timeout
	micro_swticher.play_anim()

func _on_duel_timeout() -> void:
	input_active = true
	duel_anim_player.play("alt")
	duel_decider.start()
 

func _on_duel_decider_timeout() -> void:
	if !win:
		late_lose_condition()
