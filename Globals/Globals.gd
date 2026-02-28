extends Node
# Global stuff here
class_name Glob

enum ArrowDir
{
	UP,
	DOWN,
	LEFT,
	RIGHT
}

var next_microgame = 0
var dog_display = 0
var controls_display = 0


var score = 0
var lives

func add_score():
	score += 1
	

func lose_lives():
	lives -= 1


func game_over():
	pass
