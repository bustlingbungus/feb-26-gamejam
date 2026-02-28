extends Node2D

@onready var label: Label = $InfoDisplay/Label
@onready var sprite_2d: Sprite2D = $InfoDisplay/Sprite2D
@onready var curtain_close: AnimatedSprite2D = $CurtainClose
@onready var micro_swticher: Node2D = $"Micro-Swticher"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	micro_selection_assosiation()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_curtain_animation_finished() -> void:
	await get_tree().create_timer(5).timeout
	curtain_close.play("Close")


func _on_curtain_close_animation_finished() -> void:
	micro_swticher.switch()


func micro_selection_assosiation():
	match Global.next_microgame:
		0:
			label.text = "- SpaceBar -"
			sprite_2d.texture = load("res://Assets/Art/Dog Elite Concept Art.png")
		1:
			label.text = "- Left and Right Arrow Keys -"
			sprite_2d.texture = load("res://Assets/Art/Tinder/dog_02.png")
		2:
			label.text = "- SpaceBar -"
			sprite_2d.texture = load("res://Assets/Art/FridayNightFunkin/fnfboy.png")
