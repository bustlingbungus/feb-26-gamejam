extends CharacterBody2D

@export var speed = -1500;

var timeout = false
var caught


func _physics_process(delta: float) -> void:
	
	movement()
	# move and slide reuqired to make anything move with velocity
	move_and_slide()


func _on_timer_timeout() -> void:
	timeout = true


func movement():
	# Setting velocity speed
	if timeout:
		velocity.x = speed
		
	if caught:
		velocity.x = 0
