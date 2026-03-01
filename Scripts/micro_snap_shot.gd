extends Node2D

@onready var camera_area = $Camera/Area2D/CollisionShape2D
@onready var anim_player = $"CameraFlash/AnimationPlayer"
@onready var dog = $Dog
@onready var sound_manager = $SoundManager
@onready var music_manager = $MusicManager
@onready var micro_swticher: Node2D = $"Micro-Swticher"
@onready var rng = RandomNumberGenerator.new()
@onready var timer: Timer = $Timer


var shot = 1

func _ready() -> void:
	micro_swticher.starter.show()
	music_manager.load_sound("res://Assets/Sounds/SnapShot/pgfindingdog.mp3")
	music_manager.audio_player.play()
	micro_swticher.starter.play()
	#await get_tree().create_timer(2).timeout
	rng.randomize()


func _process(delta: float) -> void:
	#Sets sound, plays animation, enables hitbox
	if Input.is_action_just_pressed("ui_accept") && shot == 1:
		sound_manager.load_sound("res://Assets/Sounds/SnapShot/camera_shutter.ogg")
		sound_manager.audio_player.play()
		anim_player.play("Camera_Flash")
		camera_area.disabled = false
		await get_tree().create_timer(0.2).timeout
		camera_area.disabled = true
		shot = 0
		

func _on_area_2d_area_entered(area: Area2D) -> void:
	dog.caught = true


func caught_result():
	#mostly sound loading stuff
	if dog.caught:
		sound_manager.load_sound("res://Assets/Sounds/SnapShot/pgcorrect.ogg")
		sound_manager.audio_player.play()
		Global.add_score()
		await get_tree().create_timer(2).timeout
		sound_manager.load_sound("res://Assets/Sounds/SnapShot/What The Dog Doin.ogg")
		sound_manager.audio_player.play()
	else:
		sound_manager.load_sound("res://Assets/Sounds/SnapShot/pgwrong.mp3")
		sound_manager.audio_player.play()
	#await get_tree().create_timer(3).timeout
	micro_swticher.play_anim()


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "Camera_Flash":
		caught_result()
		music_manager.stop()


func _on_activator_timeout() -> void:
	await get_tree().create_timer(0.2).timeout
	rng.randomize()
	var x = rng.randi_range(2, 9)
	timer.wait_time = x
	timer.start()
