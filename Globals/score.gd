extends Control

@onready var score: Label = $Score
@onready var life_1: Sprite2D = $"Lives/1"
@onready var life_2: Sprite2D = $"Lives/2"
@onready var life_3: Sprite2D = $"Lives/3"



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	score.text = str(Global.score)
	update_life()
	


func update_life():
	match Global.lives:
		3:
			life_1.show()
			life_2.show()
			life_3.show()
		2:
			life_1.show()
			life_2.show()
			life_3.hide()
		1:
			life_1.show()
			life_2.hide()
			life_3.hide()
		_:
			life_1.hide()
			life_2.hide()
			life_3.hide()
