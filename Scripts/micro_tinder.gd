extends Node2D

var rng = RandomNumberGenerator.new()
var inactive : bool = false
var image_value : int = rng.randi_range(0, images.size() - 1)
var guarantee : int = 0
@export var images : Array = []

@onready var image: Sprite2D = $Image
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var sound_manager: Node = $SoundManager
@onready var music_manager: Node = $MusicManager
@onready var micro_swticher: Node2D = $"Micro-Swticher"
@onready var heart: Sprite2D = $Heart
@onready var x: Sprite2D = $X
@onready var heart_player: AnimationPlayer = $HeartPlayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	micro_swticher.starter.show()
	heart.visible = false
	rng.randomize()
	next_image()
	micro_swticher.starter.play()


	
func next_image() -> void:
	
	#randomize image
	#guarantee
	
	#if x = 0 ten times
	#everytime you generate a new thing, increment if guarantee = 10 guarantees, spawnn
	image_value = rng.randi_range(0, images.size() - 1)
	image.texture = load(images[image_value]) #load is how you change textures mid-runtimee
	
	print(image_value)
	if image_value == 1 or image_value == 2 or image_value == 3:
		guarantee += 1
	if guarantee == 10:
		image.texture = load(images[0]) #include mailman
		guarantee = 0 #reset
	print(image.global_position)
	inactive = true
	#await

	#play animation
	animation_player.play("fade_in")
	pass

func _unhandled_input(_event: InputEvent) -> void:
	pass
	if Input.is_action_just_pressed("ui_left") && inactive:
		if image_value == 0:
			x.visible = true
			heart_player.play("x")
		animation_player.play("fade_left")
		sound_manager.load_sound("res://Assets/Sounds/SnapShot/cut_explosion.mp3") 
		sound_manager.start()#test
		inactive = false
		#wait for animation to be finished
		
	
		pass
	if Input.is_action_just_pressed("ui_right") && inactive:
		if image_value == 0:
			Global.add_score()
			heart.visible = true
			#animation_player.stop()
			heart_player.play("heart")
			music_manager.load_sound("res://Assets/Sounds/SnapShot/careless_whispers.mp3")
			music_manager.start()
			# end game
		
		else: 
			x.visible = true
			heart_player.play("x")
			Global.lose_lives()
		animation_player.play("fade_right")
		sound_manager.load_sound("res://Assets/Sounds/SnapShot/woof-woof-flo-flo.mp3")
		sound_manager.start() #test
		inactive = false
		
		#wait for animation to be finished
		


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "fade_left" or anim_name == "fade_right":
		next_image()
		


func _on_heart_player_animation_finished(anim_name: StringName) -> void:
	micro_swticher.play_anim()
