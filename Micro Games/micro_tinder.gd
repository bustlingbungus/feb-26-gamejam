extends Node2D

var rng = RandomNumberGenerator.new()

@export var images : Array = []

@onready var image: Sprite2D = $Image
@onready var animation_player: AnimationPlayer = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	next_image()
	pass



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	await animation_player.animation_finished
	next_image()
	
func next_image() -> void:
	
	#randomize image
	rng.randomize()
	var x = rng.randi_range(0, images.size() - 1)
	image.texture = load(images[x]) #load is how you change textures mid-runtimee
	#await
	#play animation
	animation_player.play("fade_in")
	
	pass

func _unhandled_input(_event: InputEvent) -> void:
	pass
	if Input.is_action_just_pressed("ui_left"):
		animation_player.play("fade_left")
		#wait for animation to be finished
		
	
		pass
	if Input.is_action_just_pressed("ui_right"):
		animation_player.play("fade_right")
		#wait for animation to be finished
		
		
