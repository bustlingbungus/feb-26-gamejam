extends Node
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var area_2d: Area2D = $Area2D
@onready var area_2d_2: Area2D = $Area2D2
@onready var audio_manager: Node = $AudioManager
@onready var music_manager: Node = $MusicManager
var is_won = false

var rng = RandomNumberGenerator.new()
var x : int = 0
func _ready()-> void:
	audio_manager.load_sound("res://Assets/Sounds/SnapShot/jeopardy-themelq.mp3")
	audio_manager.start()
	rng.randomize()
	
	pass

func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		sprite_2d.position.x += 40
	pass

func random_tug() -> void:
	x = rng.randi_range(0,4)
	sprite_2d.position.x -= x
	 
	pass

func _on_area_2d_area_entered(area: Area2D) -> void:
	print("floppa")
	if area == area_2d: #WIN condition
		print("right")
	
	if is_won == false:
		is_won = true   
		
		
	#if this variable has been activated once, win achieved
		audio_manager.load_sound("res://Assets/Sounds/SnapShot/lightskin-rizz-sin-city.mp3")
		audio_manager.start()
		await get_tree().create_timer(2.0).timeout
		#release from prison
		
 
	if area == area_2d_2: #LOSE condition
		audio_manager.load_sound("res://Assets/Sounds/SnapShot/metal-pipe-clang.mp3")
		audio_manager.start()
		print("left")
	pass # Replace with function body.


func _on_timer_timeout() -> void:
	random_tug()
	#thing.visible = true
	pass # Replace with function body.
