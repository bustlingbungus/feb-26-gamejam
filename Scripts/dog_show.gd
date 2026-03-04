extends Node2D

@onready var label: Label = $InfoDisplay/Label
@onready var sprite_2d: Sprite2D = $InfoDisplay/Sprite2D
@onready var curtain_close: AnimatedSprite2D = $CurtainClose
@onready var micro_swticher: Node2D = $"Micro-Swticher"
@onready var label2: Label = $InfoDisplay/Label2
@onready var controls: Label = $InfoDisplay/Controls
@onready var audio_manager: Node = $AudioManager


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	micro_selection_assosiation()
	audio_manager.load_sound("res://Assets/Sounds/SnapShot/betweenframe.mp3")
	audio_manager.start()
	#play transition music
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_curtain_animation_finished() -> void:
	await get_tree().create_timer(4).timeout
	curtain_close.play("Close")


func _on_curtain_close_animation_finished() -> void:
	if !Global.game_end:
		micro_swticher.switch()
	else:
		micro_swticher.game_over_switch()

func micro_selection_assosiation():
	match Global.games_shuffle[Global.games_shuffle_indices]:
		0: # photo taker
			controls.text = "PhotoBark"
			label.text = "- Space -"
			sprite_2d.texture = load("res://Assets/Art/Dog Elite Concept Art.png")
			label2.text = "Capture the dog in the frame"
		1: # dog tinder
			controls.text = "Ruff Dating Life"
			label.text = "- Left and Right Arrow Keys -"
			sprite_2d.texture = load("res://Assets/Art/Tinder/dog_04.png")
			label2.text = "Attracted to the US postal service."
		2: # quick draw
			controls.text = "Quickdraw"
			label.text = "- Space -"
			sprite_2d.texture = load("res://Assets/Art/Tinder/dog_04.png")
			label2.text = "Wait for the time to strike."
		3: # platformer
			controls.text = "Fetch"
			label.text = "- WASD / Arrow Keys + Space -"
			sprite_2d.texture = load("res://Assets/Art/Platformer/dog pxiel.png")
			label2.text = "he jump doe."
		4: # tug
			controls.text = "Tug of War"
			label.text = "- Space -"
			sprite_2d.texture = load("res://Assets/Art/tug_of_war/AllElementsTogether_TugofWar.png")
			label2.text = "Mash as fast as you can."
		5: # fnf
			controls.text = "Simon Says"
			label.text = "- WASD / Arrow keys -"
			sprite_2d.texture = load("res://Assets/Art/FridayNightFunkin/oiiai_idle.png")
			sprite_2d.scale = Vector2(1.0, 1.0)
			label2.text = "Do what hte dog doin'"
		6: #fnaf
			controls.text = "Watchdog"
			label.text = "- Mouse -"
			#sprite_2d.texture = load("res://Assets/Art/tug_of_war/AllElementsTogether_TugofWar.png")
			label2.text = "Check the cameras at the bottom and close the right door."
