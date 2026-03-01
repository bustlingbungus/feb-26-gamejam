extends Node2D

var left_door;
var front_door;
var right_door;
var door_closed = 0;
var in_left_button = false
var in_front_button = false
var in_right_button = false
# We use these to check to see if the animations can be allowed to play
var anim_close_checker = false
var anim_open_checker = false
var door_1_close = false
var door_2_close = false
var door_3_close = false

@onready var left_door_anim: AnimationPlayer = $left_door/left_door_anim
@onready var front_door_anim: AnimationPlayer = $front_door/front_door_anim
@onready var right_door_anim: AnimationPlayer = $right_door/right_door_anim



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	left_door = get_node("left_door")
	front_door = get_node("front_door")
	right_door = get_node("right_door")
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	mouse_input()
	
	match door_closed:
		1:
			if door_closed == 1 and anim_close_checker == true:
				left_door_anim.play("left_door_drop")
				anim_close_checker = false
		2:
			if door_closed == 2 and anim_close_checker == true:
				front_door_anim.play("front_door_drop")
				anim_close_checker = false
		3:
			if door_closed == 3 and anim_close_checker == true:
				right_door_anim.play("right_door_drop")
				anim_close_checker = false
	# This is the if statement that allows for the animations to play, and
	# will change/use the anim_checker booleans to determine if the
	# left door is going to play the open/close anims once
	#if door_closed == 1 and anim_close_checker == true:
		#left_door_anim.play("left_door_drop")
		#anim_close_checker = false
		#anim_open_checker = true
	#elif door_closed != 1 and anim_open_checker == true:
		#left_door_anim.play("left_door_open")
		#anim_open_checker = false

	#if door_closed == 2 and anim_close_checker == true:
		#front_door_anim.play("front_door_drop")
		#anim_close_checker = false
		#anim_open_checker = true
	#elif door_closed != 2 and anim_open_checker == true:
		#front_door_anim.play("front_door_open")
		#anim_open_checker = false

	#if door_closed == 3 and anim_close_checker == true:
		#right_door_anim.play("right_door_drop")
		#anim_close_checker = false
		#anim_open_checker = true
	#elif door_closed != 3 and anim_open_checker == true:
		#right_door_anim.play("right_door_open")
		#anim_open_checker = false

# Functions that determine if the mouse is inside the Left Button
func _on_left_button_mouse_entered() -> void:
	in_left_button = true;
func _on_left_button_mouse_exited() -> void:
	in_left_button = false;
# Functions to determine if the mouse is inside the Front Button
func _on_front_button_mouse_entered() -> void:
	in_front_button = true
func _on_front_button_mouse_exited() -> void:
	in_front_button = false
# Functions to determinie if the mouse is inside the Right Button
func _on_right_button_mouse_entered() -> void:
	in_right_button = true
func _on_right_button_mouse_exited() -> void:
	in_right_button = false
# The function that determines the value of door_close
func mouse_input():
	if Input.is_action_just_pressed("ui_accept"):
		if in_left_button:
			door_closed = 1
			anim_close_checker = true
			print(door_closed)
		if in_front_button:
			door_closed = 2
			anim_close_checker = true
			print(door_closed)
		if in_right_button:
			door_closed = 3
			anim_close_checker = true
			print(door_closed)
	
