extends Control

@onready var micro_switcher = $"Micro-Swticher"
@onready var transition: AnimatedSprite2D = $Transition



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_start_pressed() -> void:
	transition.play("default")


func _on_transition_animation_finished() -> void:
	micro_switcher.intermission_switch()
