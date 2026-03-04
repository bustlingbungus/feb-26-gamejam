extends Control

@onready var timer: Timer = $Timer
@onready var micro_swticher: Node2D = $"Micro-Swticher"
@onready var ui: Control = $UI



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	micro_swticher.starter.show()
	micro_swticher.starter.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		Global.lives = 3
		Global.score = 0
		ui.update_life()
		micro_swticher.play_anim()
		#micro_swticher.intermission_switch()
