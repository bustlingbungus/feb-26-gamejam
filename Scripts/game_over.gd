extends Control

@onready var timer: Timer = $Timer
@onready var micro_swticher: Node2D = $"Micro-Swticher"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	micro_swticher.starter.show()
	micro_swticher.starter.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		micro_swticher.intermission_switch()
