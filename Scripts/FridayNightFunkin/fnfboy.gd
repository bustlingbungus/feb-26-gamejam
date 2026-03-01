extends Node2D

@export var TransitionTime : float = 1.0
@export var SpinningSpeed : float = 0.1

var spinning : bool = false
var transition_timer : float = 0.0
var spin_timer : float = 1.0

var gameplay_sprite : Sprite2D
var spinning_sprite : Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	gameplay_sprite = get_child(0)
	spinning_sprite = get_child(1)
	gameplay_sprite.frame = 1 # idle frame


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if spinning:
		SpinSprite(delta)
	else:
		GameplaySprites(delta)
	
	
func GameplaySprites(delta : float) -> void:
	if transition_timer <= 0.0:
		gameplay_sprite.frame = 1 # idle frame
	else:
		transition_timer -= delta
		
	LookTowardKeypress()
	
func SpinSprite(delta : float) -> void:
	if spin_timer <= 0.0:
		spinning_sprite.frame = (spinning_sprite.frame + 1) % spinning_sprite.hframes
		spin_timer = SpinningSpeed
	spin_timer -= delta
		
func StartSpinning() -> void:
	gameplay_sprite.visible = false
	spinning_sprite.visible = true
	spinning = true
	spin_timer = SpinningSpeed
	
func StopSpinning() -> void:
	gameplay_sprite.visible = true
	spinning_sprite.visible = false
	spinning = false


# 0 = down
# 1 = idle
# 2 = left
# 3 = right
# 4 = up
func LookTowardKeypress() -> void:
	# keypress to frame
	if Input.is_action_just_pressed("ui_up"):
		gameplay_sprite.frame = 4
		transition_timer = TransitionTime
	elif Input.is_action_just_pressed("ui_down"):
		gameplay_sprite.frame = 0
		transition_timer = TransitionTime
	elif Input.is_action_just_pressed("ui_left"):
		gameplay_sprite.frame = 2
		transition_timer = TransitionTime
	elif Input.is_action_just_pressed("ui_right"):
		gameplay_sprite.frame = 3
		transition_timer = TransitionTime
