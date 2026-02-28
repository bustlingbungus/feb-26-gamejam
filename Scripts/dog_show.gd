extends Node2D

@onready var label: Label = $InfoDisplay/Label
@onready var sprite_2d: Sprite2D = $InfoDisplay/Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	micro_selection_assosiation()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func micro_selection_assosiation():
	match Global.next_microgame:
		0:
			label.text = "- SpaceBar -"
			sprite_2d.texture = load("res://Assets/Art/Dog Elite Concept Art.png")
		1:
			label.text = "- tester 1 -"
			sprite_2d.texture = load("res://Assets/Art/Tinder/dog_02.png")
		2:
			label.text = "- tester 2 -"
			sprite_2d.texture = load("res://Assets/Art/FridayNightFunkin/fnfboy.png")
