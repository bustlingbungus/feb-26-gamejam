extends Node2D
@onready var micro_swticher: Node2D = $"Micro-Swticher"
@onready var animatronic_threat: Node2D = $Animatronic_Threat


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	micro_swticher.starter.show()
	micro_swticher.starter.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if animatronic_threat.winstate || animatronic_threat.failstate:
		micro_swticher.play_anim()
