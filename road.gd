extends Node2D

const CoffeeScene = preload("res://coffee.tscn")
@onready var sleep: float = 300
const Max_Sleep :float = 300
@onready var coffee_timer = $CoffeeTimer


# Called when the node enters the scene tree for the first time.
func _ready():
	Events.obstacle_hit.connect(on_obstacle_hit)
	Events.sleep_obstacle_hit.connect(on_sleep_obstacle_hit)
	coffee_timer.timeout.connect(coffee_spawn)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	sleep -= delta * 10
	print(str(sleep))
	if sleep <= 0:
		get_tree().quit()

func on_obstacle_hit(obstacle_hit: Obstacle):
	var obstacle = obstacle_hit

func on_sleep_obstacle_hit(obstacle_hit: SleepObstacle):
	var obstacle = obstacle_hit
	sleep += obstacle.sleep_value
	if sleep >= Max_Sleep:
		sleep = Max_Sleep

func coffee_spawn():
	var lane = randi_range(1, 5)
	lane = lane * 27
	var coffee = CoffeeScene.instantiate()
	coffee.position.y = -10
	coffee.position.x = 31 + lane
	
	get_tree().current_scene.add_child(coffee)