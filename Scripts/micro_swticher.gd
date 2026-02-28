extends Node2D

@export var Games = []

var rng = RandomNumberGenerator.new()
var prev_game


func _ready() -> void:
	pass


func _process(delta: float) -> void:
	pass


# Scene Switcher
func switch():
		rng.randomize()
		var x = rng.randi_range(0, Games.size() - 1)
		get_tree().change_scene_to_file(Games[x])
		prev_game = x
		
