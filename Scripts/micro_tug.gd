extends Node
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var enemy: Area2D = $enemy
@onready var you: Area2D = $you

@onready var audio_manager: Node = $AudioManager
@onready var music_manager: Node = $MusicManager

var is_won = false
var is_lost = false
var rng = RandomNumberGenerator.new()
var x : int = rng.randi_range(0,4)

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
	if is_lost == false && is_lost == false:
		
		sprite_2d.position.x -= x

		
	

func _on_area_2d_area_entered(area: Area2D) -> void:
	print("floppa")
	if area == you && is_won == false: #WIN condition
		print("right")
		is_won = true
		audio_manager.load_sound("res://Assets/Sounds/SnapShot/lightskin-rizz-sin-city.mp3")
		audio_manager.start()
		await get_tree().create_timer(2.0).timeout
	

	
	if area == enemy && is_lost == false: #loSE condition
		is_lost = true
		audio_manager.load_sound("res://Assets/Sounds/SnapShot/metal-pipe-clang.mp3")
		audio_manager.start()
		print("left")
		
	 

		  
		
		
	#if this variable has been activated once, win achieved
		
		#release from prison
		
 



func _on_timer_timeout() -> void:
	if is_won == false && is_lost == false:
		random_tug()
		

		
  	
	#thing.visible = true
	pass # Replace with function body.
