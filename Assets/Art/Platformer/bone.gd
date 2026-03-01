extends Node2D
@onready var area_2d: Area2D = $Area2D
@onready var music_manager: Node = $"../MusicManager"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_area_2d_area_entered(area: Area2D) -> void:
	print("here")
	#increment points
	music_manager.load_sound("res://Assets/Sounds/SnapShot/twitch-follower-alert-sound.mp3")
	music_manager.start()
	queue_free()
