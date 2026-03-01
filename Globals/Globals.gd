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
var last_microgame = 1
var score = 0
var lives = 3
var game_end = false

func add_score():
	score += 1
	

func lose_lives():
	lives -= 1
	if lives == 0:
		game_end = true


func game_over():
	pass
