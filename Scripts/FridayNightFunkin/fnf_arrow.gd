extends Node2D


var targetPos : Vector2 = Vector2.ZERO
var vel : Vector2 = Vector2.ZERO
var satisfyAction : String = "None"

# amount of time (in seconds) the arrow will take to reach it's target 
var speed : float

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += vel * delta
	pass


func Init(pos : Vector2, target : Vector2, dir : Glob.ArrowDir, moveSpeed : float) -> void:
	position = pos;
	targetPos = target;
	speed = moveSpeed
	vel = (target - pos).normalized() * speed;
	
	match dir:
		Glob.ArrowDir.UP:
			satisfyAction = "ui_up"
			global_rotation = deg_to_rad(0)
		Glob.ArrowDir.DOWN:
			satisfyAction = "ui_down"
			global_rotation = deg_to_rad(180)
		Glob.ArrowDir.LEFT:
			satisfyAction = "ui_left"
			global_rotation = deg_to_rad(270)
		Glob.ArrowDir.RIGHT:
			satisfyAction = "ui_right"
			global_rotation = deg_to_rad(90)


func ArrowComplete() -> bool:
	return Input.is_action_just_pressed(satisfyAction)


func PassedTarget() -> bool:
	var dir = targetPos - position
	if (dir.dot(vel) <= 0):
		return false
	return true
