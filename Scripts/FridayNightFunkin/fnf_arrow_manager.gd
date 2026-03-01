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
var player_arrows : Array

var turn_time : float
var turn_switch_timer : float = 0.0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	turn_time = TimeBetweenTurns
	req_directions = Array()
	player_arrows = Array()


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
				
	HandleTopArrow()


func SwitchSides() -> void:
	player_arrows.clear()
	if activePlayer == fnfgirl:
		activePlayer = fnfboy
	else:
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
	ArrowSpawner.SpawnArrows(activePlayer.position, cnt, SpawnSpeed / spawn_scale, ArrowSpeed * speed_scale)


func AcceptingDirections() -> bool:
	return activePlayer == fnfgirl

func GetNextDirection() -> Glob.ArrowDir:
	return req_directions.pop_front()
	
func AddDirection(dir : Glob.ArrowDir) -> void:
	req_directions.push_back(dir)
	
func AddArrow(arrow : Node2D) -> void:
	player_arrows.push_back(arrow)
	
func HandleTopArrow() -> void:
	if player_arrows.size() == 0:
		return
	if activePlayer == fnfboy:
		HandlePlayerInput()
	else:
		HandleGirlArrow()
			
func HandlePlayerInput() -> void:
	var top_arrow = player_arrows[0]
	if top_arrow.ArrowComplete():
		print("correct!")
		top_arrow.Destroy()
		player_arrows.pop_front()
	elif DirectionalInput():
		print("missed")
		fnfboy.StartSpinning()
		player_arrows.pop_front()
	elif top_arrow.PassedTarget():
		print("missed")
		player_arrows.pop_front()
		
		
func HandleGirlArrow() -> void:
	var top_arrow = player_arrows[0]
	if top_arrow.PassedTarget():
		fnfgirl.ReactToArrow(top_arrow)
		player_arrows.pop_front()
		
func DirectionalInput() -> bool:
	return Input.is_action_just_pressed("ui_up") || Input.is_action_just_pressed("ui_down") || Input.is_action_just_pressed("ui_left") || Input.is_action_just_pressed("ui_right")
