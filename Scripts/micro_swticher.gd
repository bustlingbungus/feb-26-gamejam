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
	print(Games[Global.games_shuffle[Global.games_shuffle_indices]])
	get_tree().change_scene_to_file(Games[Global.games_shuffle[Global.games_shuffle_indices]])
	


func intermission_switch():
	if (Global.allow_shuffle):
		init_shuffler()
	rng.randomize()
	#var x = rng.randi_range(0, Global.games_shuffle.size() - 1)
	
	# Swithces scenes
	Global.games_shuffle_indices = (Global.games_shuffle_indices + 1) % (Games.size() - 1)
	if (Global.games_shuffle_indices == 0):
		Global.games_shuffle.shuffle()
		print(Global.games_shuffle)
	
	#Global.last_microgame = x
	if Global.lives == 0:
		get_tree().change_scene_to_file("res://Scenes/game_over.tscn")
	elif Global.score >= 1:
		get_tree().change_scene_to_file("res://Scenes/Winner.tscn")
	else:
		get_tree().change_scene_to_file(dogshow)
		#print(Global.games_shuffle)


func menu_switch():
	rng.randomize()
	var x = rng.randi_range(0, Games.size() - 1)
	# Swithces scenes
	Global.next_microgame = x
	get_tree().change_scene_to_file(dogshow)


func game_over_switch():
	# Swithces scenes
	get_tree().change_scene_to_file("res://Scenes/game_over.tscn")


func play_anim():
	ender.show()
	ender.play("default")
	


func init_shuffler():
	if Global.allow_shuffle:
		for i in range(Games.size()):
			Global.games_shuffle.append(i)
		Global.games_shuffle.shuffle()
		print(Global.games_shuffle)
		Global.allow_shuffle = false
		


func normal_shuffler():
	if Global.allow_shuffle:
		Global.games_shuffle.shuffle()
		print(Global.games_shuffle)
		Global.allow_shuffle = false


func _on_animated_sprite_2d_animation_finished() -> void:
	intermission_switch()
