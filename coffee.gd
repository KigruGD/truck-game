extends SleepObstacle

func _ready():
	var coffee = SleepObstacle.new()
	coffee.speed = 1
	coffee.sleep_value = 35
	
	var shape = RectangleShape2D.new()
	shape.set_size(Vector2(17,17))
	coffee.hitbox = shape
	
	velocity.y = 100 * coffee.speed
