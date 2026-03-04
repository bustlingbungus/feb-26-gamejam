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
var games_shuffle = []
var allow_shuffle = true
var games_shuffle_indices = 0

func add_score():
	score += 1

func lose_lives():
	lives -= 1
	if lives == 0:
		pass



func game_over():
	pass
