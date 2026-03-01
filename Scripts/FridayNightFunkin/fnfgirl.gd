extends Node2D

@export var TransitionTime : float = 1.0
@export var IdlePoseTime : float = 0.5

var in_idle : bool = true
var transition_timer : float = 0.0
var idle_timer : float = 0.0


var sprite : Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sprite = get_child(0)
	idle_timer = IdlePoseTime
	sprite.frame = 1 # idle pose 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if !in_idle:
		if transition_timer <= 0.0:
			in_idle = true
			sprite.frame = 1 # idle pose 1
		transition_timer -= delta
	else:
		if idle_timer <= 0.0:
			SwitchIdlePoses()
			idle_timer = IdlePoseTime
		idle_timer -= delta


func ReactToArrow(arrow : Node2D) -> void:
	var frame = DirectionToFrame(arrow.direction)
	sprite.frame = frame
	in_idle = false
	transition_timer = TransitionTime


func SwitchIdlePoses() -> void:
	if sprite.frame == 1:
		sprite.frame = 2
	else:
		sprite.frame = 1


# 0 = down
# 1 = idle 1
# 2 = idle 2
# 3 = left
# 4 = right
# 5 = up
func DirectionToFrame(dir : Glob.ArrowDir) -> int:
	match dir:
		Glob.ArrowDir.UP:
			return 5
		Glob.ArrowDir.DOWN:
			return 0
		Glob.ArrowDir.LEFT:
			return 3
		Glob.ArrowDir.RIGHT:
			return 4
	return 1
