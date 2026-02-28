extends Node2D

@export var Games = []

@onready var dogshow = "res://Scenes/dog_show.tscn"

var rng = RandomNumberGenerator.new()
var prev_game
var intermission = true


func _ready() -> void:
	pass


func _process(delta: float) -> void:
	pass


# Scene Switcher
func switch():
		rng.randomize()
		var x = rng.randi_range(0, Games.size() - 1)
		# Swithces scenes
		get_tree().change_scene_to_file(Games[x])
		Global.next_microgame = x
		Global.dog_display = x
		Global.controls_display = x
		


func intermission_switch():
	rng.randomize()
	var x = rng.randi_range(0, Games.size() - 1)
	# Swithces scenes
	Global.next_microgame = x
	get_tree().change_scene_to_file(dogshow)
