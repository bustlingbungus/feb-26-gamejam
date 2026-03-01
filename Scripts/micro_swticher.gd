extends Node2D

@export var Games = []

@onready var dogshow = "res://Scenes/dog_show.tscn"
@onready var ender: AnimatedSprite2D = $Ender
@onready var starter: AnimatedSprite2D = $Starter




var rng = RandomNumberGenerator.new()
var prev_game
var intermission = true
var counter = 0
var ignore = 0


func _ready() -> void:
	pass


func _process(delta: float) -> void:
	pass


# Scene Switcher
func switch():
	# Swithces scenes
	get_tree().change_scene_to_file(Games[Global.next_microgame])
	


func intermission_switch():
	rng.randomize()
	var x = rng.randi_range(0, Games.size() - 1)
	if counter >= 3:
		match ignore:
			0:
				pass
	# Swithces scenes
	Global.next_microgame = x
	Global.last_microgame = x
	get_tree().change_scene_to_file(dogshow)
	


func menu_switch():
	rng.randomize()
	var x = rng.randi_range(0, Games.size() - 1)
	# Swithces scenes
	Global.next_microgame = x
	get_tree().change_scene_to_file(dogshow)


func play_anim():
	ender.show()
	ender.play("default")


func _on_animated_sprite_2d_animation_finished() -> void:
	intermission_switch()
