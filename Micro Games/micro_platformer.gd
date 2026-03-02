extends Node2D
@onready var micro_swticher: Node2D = $"Micro-Swticher"
@onready var timer: Timer = $Timer
@onready var label: Label = $Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	micro_swticher.starter.show()
	micro_swticher.starter.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	label.visible_characters = 3
	label.text = str(timer.time_left)


func _on_timer_timeout() -> void:
	Global.lose_lives()
	micro_swticher.play_anim()
