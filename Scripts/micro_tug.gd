extends Node

@onready var sprite_2d: Sprite2D = $Sprite2D
#@onready var enemy: Area2D = $enemy
#@onready var you: Area2D = $you

@onready var audio_manager: Node = $AudioManager
@onready var music_manager: Node = $MusicManager
@onready var micro_swticher: Node2D = $"Micro-Swticher"

var is_won = false
var is_lost = false
var is_started = false
var rng = RandomNumberGenerator.new()
var x : int = rng.randi_range(1,4)

func _ready()-> void:
	micro_swticher.starter.show()
	micro_swticher.starter.play()
	audio_manager.load_sound("res://Assets/Sounds/tugofwar/tugowar.mp3")
	audio_manager.start()

	
	rng.randomize()

	pass
func _physics_process(delta: float) -> void:
	if is_started == false:
		await get_tree().create_timer(0.75).timeout
		is_started = true
	pass
	print(is_started)

func _unhandled_input(event: InputEvent) -> void:

	if Input.is_action_just_pressed("ui_accept"):
		if is_won || is_lost == true:
			return
		sprite_2d.position.x += 40
		
	pass

func random_tug() -> void:

	if is_lost == false &&    is_won == false:

		sprite_2d.position.x -= x




func _on_area_2d_area_entered(area: Area2D) -> void:
		is_won = true
		audio_manager.load_sound("res://Assets/Sounds/SnapShot/lightskin-rizz-sin-city.mp3")
		audio_manager.start()
		await get_tree().create_timer(2.0).timeout
		micro_swticher.play_anim()
		Global.add_score()
		


func _on_area_2d_2_area_entered(area: Area2D) -> void:
		is_lost = true
		audio_manager.load_sound("res://Assets/Sounds/SnapShot/metal-pipe-clang.mp3")
		audio_manager.start()
		micro_swticher.play_anim()
		Global.lose_lives()






	#if this variable has been activated once, win achieved

		#release from prison

 



func _on_timer_timeout() -> void:
	if is_won == false && is_lost == false && is_started:
		random_tug()
		





	#thing.visible = true
	pass # Replace with function body.
