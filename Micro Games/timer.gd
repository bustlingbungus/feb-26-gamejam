extends Node
@onready var label: Label = $Label
@onready var timer: Timer = $Timer

var start_time : int = 10

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	label.visible_characters = 3
	label.text = str(timer.time_left)
	pass


func _on_timer_timeout() -> void:
	print("timeout")
	#move to next scene #LOSER
	pass # Replace with function body.
