extends Node2D

@onready var sound_manager = $SoundManager
@onready var music_manager = $MusicManager
@onready var duel_timer = $Duel


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_duel_timeout() -> void:
	print("Shoot")
