extends Node2D

@onready var label: Label = $InfoDisplay/Label
@onready var sprite_2d: Sprite2D = $InfoDisplay/Sprite2D
@onready var curtain_close: AnimatedSprite2D = $CurtainClose
@onready var micro_swticher: Node2D = $"Micro-Swticher"
@onready var label2: Label = $InfoDisplay/Label2
@onready var controls: Label = $InfoDisplay/Controls


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	micro_selection_assosiation()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_curtain_animation_finished() -> void:
	await get_tree().create_timer(4).timeout
	curtain_close.play("Close")


func _on_curtain_close_animation_finished() -> void:
	if !Global.game_end:
		micro_swticher.switch()
	else:
		micro_swticher.game_over_switch()

func micro_selection_assosiation():
	match Global.next_microgame:
		0: # photo taker
			controls.text = "PhotoBark"
			label.text = "- SpaceBar -"
			sprite_2d.texture = load("res://Assets/Art/Dog Elite Concept Art.png")
			label2.text = "When the dog doin?"
		1: # dog tinder
			controls.text = "Ruff Dating Life"
			label.text = "- Left and Right Arrow Keys -"
			sprite_2d.texture = load("res://Assets/Art/Tinder/dog_04.png")
			label2.text = "Attracted to the US postal service."
		2: # Friday night funkin
			controls.text = "Simon Says"
			label.text = "- W, A, S, D / Arrows -"
			sprite_2d.texture = load("res://Assets/Art/FridayNightFunkin/oiiai_idle.png")
			sprite_2d.scale = Vector2(1.0, 1.0)
			label2.text = "Do what the dog doin'"
