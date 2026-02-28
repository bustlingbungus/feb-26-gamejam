extends Node

@export var arrow_scene : PackedScene
@export var arrowManager : Node


var spawn_cnt : int = 0
var spawn_target : Vector2
var spawn_time : float
var timer : float
var arrow_speed : float
var spawning = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if arrowManager == null:
		push_error("couldn't find arrow manager!")
		return 
		
	if spawn_cnt > 0:
		if timer <= 0:
			SpawnArrow(spawn_target, arrow_speed)
			timer = spawn_time
			spawn_cnt -= 1
			if spawn_cnt == 0:
				spawning = false
		timer -= delta
			

func SpawnArrows(target : Vector2, num : int, spawnSpeed : float, arrowSpeed : float) -> void:
	spawn_cnt = num;
	spawn_target = target
	arrow_speed = arrowSpeed
	spawn_time = spawnSpeed
	timer = 0
	spawning = true

func SpawnArrow(target : Vector2, arrowSpeed : float) -> void:
	if arrow_scene == null:
		push_error("arrow scene not assigned");
		return
		
	var spawnPos = Vector2(target.x, -100.0)
	var dir = GetArrowDirection()
		
	var arrow = arrow_scene.instantiate()
	arrow.Init(spawnPos, target, dir, arrow_speed)
	add_child(arrow)


func GetArrowDirection() -> Glob.ArrowDir:
	if arrowManager.AcceptingDirections():
		var dir = randi_range(Glob.ArrowDir.UP, Glob.ArrowDir.RIGHT)
		arrowManager.AddDirection(dir)
		return dir
	else:
		var dir = arrowManager.GetNextDirection()
		if dir == null:
			dir = randi_range(Glob.ArrowDir.UP, Glob.ArrowDir.RIGHT)
		return dir
