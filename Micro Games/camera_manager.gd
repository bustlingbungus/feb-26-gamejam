extends Node2D

@onready var animatronic_threat: Node2D = $"../Animatronic_Threat"

var in_cam1 = false
var in_cam2 = false
var in_cam3 = false
var current_cam = 0

@onready var camera_board: Sprite2D = $cameras
@onready var cam_1_good: Sprite2D = $cameras/cam1_good
@onready var cam_1_bad: Sprite2D = $cameras/cam1_bad
@onready var cam_2_good: Sprite2D = $cameras/cam2_good
@onready var cam_2_bad: Sprite2D = $cameras/cam2_bad
@onready var cam_3_good: Sprite2D = $cameras/cam3_good
@onready var cam_3_bad: Sprite2D = $cameras/cam3_bad
@onready var cam_blank: Sprite2D = $cameras/cam_blank


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	mouse_input()
	swap_cam()
	# The function that determines the value of door_close
	pass


# Functions that determine if the mouse is inside the Cam1 Button
func _on_cam_1_mouse_entered() -> void:
	in_cam1 = true;
func _on_cam_1_mouse_exited() -> void:
	in_cam1 = false;
# Functions to determine if the mouse is inside the Cam2 Button
func _on_cam_2_mouse_entered() -> void:
	in_cam2 = true
func _on_cam_2_mouse_exited() -> void:
	in_cam2 = false
# Functions to determine if the mouse is inside the Cam3 Button
func _on_cam_3_mouse_entered() -> void:
	in_cam3 = true
func _on_cam_3_mouse_exited() -> void:
	in_cam3 = false

func mouse_input():
	if Input.is_action_just_pressed("ui_accept"):
		if in_cam1:
			current_cam = 1
			print(current_cam)
		if in_cam2:
			current_cam = 2
			print(current_cam)
		if in_cam3:
			current_cam = 3
			print(current_cam)

func swap_cam():
	match current_cam:
		1:
			cam_blank.hide()
			if animatronic_threat.threat_value == 1:
				cam_1_bad.show()
				cam_1_good.hide()
				cam_2_good.hide()
				cam_2_bad.hide()
				cam_3_good.hide()
				cam_3_bad.hide()
			else:
				cam_1_good.show()
				cam_1_bad.hide()
				cam_2_good.hide()
				cam_2_bad.hide()
				cam_3_good.hide()
				cam_3_bad.hide()
			pass
		2:
			cam_blank.hide()
			if animatronic_threat.threat_value == 2:
				cam_1_bad.hide()
				cam_1_good.hide()
				cam_2_good.hide()
				cam_2_bad.show()
				cam_3_good.hide()
				cam_3_bad.hide()
			else:
				cam_1_good.hide()
				cam_1_bad.hide()
				cam_2_good.show()
				cam_2_bad.hide()
				cam_3_good.hide()
				cam_3_bad.hide()
			pass
		3:
			cam_blank.hide()
			if animatronic_threat.threat_value == 3:
				cam_1_bad.hide()
				cam_1_good.hide()
				cam_2_good.hide()
				cam_2_bad.hide()
				cam_3_good.hide()
				cam_3_bad.show()
			else:
				cam_1_good.hide()
				cam_1_bad.hide()
				cam_2_good.hide()
				cam_2_bad.hide()
				cam_3_good.show()
				cam_3_bad.hide()
			pass
