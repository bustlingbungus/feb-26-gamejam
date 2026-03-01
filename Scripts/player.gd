extends CharacterBody2D


const SPEED = 800.0
const JUMP_VELOCITY = -500.0
const GRAVITY = 760
const MAX_JUMP_VELOCITY = -500
@onready var sprite: Sprite2D = $Sprite2D
@onready var idle_player: AnimationPlayer = $AnimationPlayer
@onready var jump_player: AnimationPlayer = $AnimationPlayer2

@onready var animation_player: AnimationPlayer = $"../bone/AnimationPlayer"
@onready var music_manager: Node = $"../MusicManager"

@onready var bone: Node2D = $"../bone"

var speed : int = 300

func _ready() -> void:
	idle_player.play("idle")
	animation_player.play("bone_idle")
	music_manager.load_sound("res://Assets/Sounds/SnapShot/yoinkyahhplatforming.ogg")
	music_manager.start()
func _physics_process(delta: float) -> void:
	horizontal()
	apply_gravity(delta)
	jump()
	move_and_slide()
	

func horizontal():
	var dir = Input.get_axis("ui_left", "ui_right")
	if dir:
		#animation (walk)
		pass
		velocity.x = move_toward(velocity.x, speed * dir, speed)
		sprite.flip_h = (dir > 0)
	else: 
		velocity.x = move_toward(velocity.x, 0, speed)
		#idle animation

func apply_gravity(delta):
		velocity.y += GRAVITY * delta


func jump():
	if is_on_floor():
		if Input.is_action_just_pressed("ui_accept"):
			#play animation
			idle_player.play("idle")
			velocity.y = MAX_JUMP_VELOCITY
	if !is_on_floor():
		if Input.is_action_just_released("ui_accept") && velocity.y < -50:
			jump_player.play("jump")
			velocity.y = -50


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
   
