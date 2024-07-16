extends SleepObstacle

@onready var coffee = SleepObstacle.new()
@onready var hitbox = $Hitbox

func _ready():
	hitbox.body_entered.connect(on_body_entered)
	
	coffee.speed = 1
	coffee.sleep_value = 100
	
	velocity.y = 90 * coffee.speed

func _physics_process(_delta):
	move_and_slide()

func _process(_delta):
	if position.y >= 190:
		queue_free()
	

func on_body_entered(_body):
	Events.sleep_obstacle_hit.emit(coffee)
	queue_free()
