extends Node2D

@export var Games = []

var rng = RandomNumberGenerator.new()
var prev_game

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		switch()


# Scene Switcher
func switch():
		rng.randomize()
		var x = rng.randi_range(0, Games.size() - 1)
		get_tree().change_scene_to_file(Games[x])
		prev_game = x
		
