extends Node2D

@export var lifetime : float = 1.5
var timer : float

var turntext : Sprite2D
var wintext : Sprite2D
var losetext : Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer = lifetime
	turntext = get_child(0)
	wintext = get_child(1)
	losetext = get_child(2)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if timer <= 0.0:
		queue_free()
	timer -= delta

func SetText(text : String) -> void:
	match text:
		"Your Turn":
			if turntext == null:
				turntext = get_child(0)
			turntext.visible = true
		"You Win":
			if wintext == null:
				wintext = get_child(1)
			wintext.visible = true
		"You Lose":
			if losetext == null:
				losetext = get_child(2)
			losetext.visible = true
