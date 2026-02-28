extends Node

@export var ArrowSpawner : Node
@export var fnfgirl : Node2D
@export var fnfboy : Node2D

@export var TimeBetweenTurns : float = 1.0

@export var SpawnSpeed : float = 1.0
@export var ArrowSpeed : float = 100.0
@export var ArrowCountRange : Vector2i = Vector2i(3, 6)

@export var SpawnScaling : float = 1
@export var SpeedScaling : float = 1
@export var CountScaling : float = 1
@export var TurnScaling : float = 1

var activePlayer : Node2D
var spawn_scale : float = 1
var speed_scale : float = 1
var cnt_scale : float = 1
var turn_scale : float = 1

var req_directions : Array

var turn_time : float
var turn_switch_timer : float = 0.0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	turn_time = TimeBetweenTurns
	req_directions = Array()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if ArrowSpawner == null:
		push_error("null arrow spawner!")
	else:
		if !ArrowSpawner.spawning:
			if turn_switch_timer > 0.0:
				turn_switch_timer -= delta
			else:			
				SwitchSides()
				SpawnArrows()


func AddArrow(dir : Glob.ArrowDir):
	req_directions.append(dir)


func SwitchSides() -> void:
	if activePlayer == fnfgirl:
		print("boy turn")
		activePlayer = fnfboy
	else:
		print("girl turn")
		activePlayer = fnfgirl
		req_directions.clear()
		turn_scale += TurnScaling / 10.0
		spawn_scale += SpawnScaling / 10.0
		speed_scale += SpeedScaling / 10.0
		cnt_scale += CountScaling / 10.0
		
	turn_switch_timer = turn_time / turn_scale


func SpawnArrows() -> void:
	if ArrowSpawner == null:
		push_error("null arrow spawner!")
		return
	
	if activePlayer == null:
		push_error("couldn't find arrow targets!")
		return
		
	var cnt : int
	if req_directions.size() == 0:
		cnt = randi_range(int(ArrowCountRange.x * cnt_scale), int(ArrowCountRange.y * cnt_scale))
	else:	
		cnt = req_directions.size()
	print(cnt)
	ArrowSpawner.SpawnArrows(activePlayer.position, cnt, SpawnSpeed / spawn_scale, ArrowSpeed * speed_scale)


func AcceptingDirections() -> bool:
	return activePlayer == fnfgirl

func GetNextDirection() -> Glob.ArrowDir:
	return req_directions.pop_front()
	
func AddDirection(dir : Glob.ArrowDir) -> void:
	req_directions.push_back(dir)
