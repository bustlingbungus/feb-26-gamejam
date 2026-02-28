extends Node

@onready var audio_player = $AudioStreamPlayer

# loads music from path
func load_sound(sound_path):
	audio_player.stream = load(sound_path)


func stop():
	audio_player.stop()


func start():
	audio_player.play()

# Sets volume, be carful if using this method
func set_db(db):
	AudioServer.set_bus_volume_db(0, db)
