extends Node2D

var left_door;
var front_door;
var right_door;
var door_closed = 0;
var in_left_button = false
var in_front_button = false
var in_right_button = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	left_door = get_node("left_door")
	front_door = get_node("front_door")
	right_door = get_node("right_door")
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	mouse_input()

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
			print(door_closed)
		if in_front_button:
			door_closed = 2
			print(door_closed)
		if in_right_button:
			door_closed = 3
			print(door_closed)
	
