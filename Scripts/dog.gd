extends CharacterBody2D

@export var speed = -1200

var timeout = false
var caught


func _physics_process(delta: float) -> void:
	
	movement()
	
	move_and_slide()


func _on_timer_timeout() -> void:
	timeout = true


func movement():
	if timeout:
		velocity.x = speed
		
	if caught:
		velocity.x = 0
