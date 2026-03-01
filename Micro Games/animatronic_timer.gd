extends Node2D

@onready var animatronic_timer: Timer = $Animatronic_Timer
@onready var rng = RandomNumberGenerator.new()
@onready var jumpscare_anim: AnimationPlayer = $jumpscare_sprite/jumpscare_anim
@onready var door_manager: Node2D = $"../Door_Manager"
@onready var victory_anim: AnimationPlayer = $victory_mark/victory_anim

var failstate = false
var winstate = false
var threat_value = 0


# Called when the node enters the scene tree for the first time.
func _ready() -> void: 
	rng.randomize()
	threat_value = rng.randi_range(1, 3)
	print(threat_value)
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_animatronic_timer_timeout() -> void:
	print(door_manager.door_closed)
	
	if threat_value == door_manager.door_closed:
		winstate = true;
		victory_anim.play("jumpscare")
	else:
		failstate = true
	
	if failstate == true:
		jumpscare_anim.play("jumpscare")
