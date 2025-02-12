extends CharacterBody2D

@onready var animated_sprite_2d = $AnimatedSprite2D

var target_x
var is_moving_left = false
var is_moving_right = false
var is_moving = false
var lane = 3

func _ready():
	animated_sprite_2d.play("driving")

func _physics_process(_delta):
	if Input.is_action_just_pressed("turn left") and !is_moving and lane != 1:
		lane -= 1
		target_x = position.x - 27
		animated_sprite_2d.play("turn left")
		rotate(-0.05)
		velocity.x = -150
		is_moving_left = true
		is_moving = true
	
	if Input.is_action_just_pressed("turn right") and !is_moving and lane != 5:
		lane += 1
		target_x = position.x + 27
		animated_sprite_2d.play("turn right")
		rotate(0.05)
		velocity.x = 150
		is_moving_right = true
		is_moving = true
	
	move_and_slide()
	
	if is_moving_left and position.x <= target_x:
		velocity.x = 0
		position.x = target_x
		rotate(0.05)
		animated_sprite_2d.play("driving")
		is_moving_left = false
		is_moving = false
		
	if is_moving_right and position.x >= target_x:
		velocity.x = 0
		position.x = target_x
		rotate(-0.05)
		animated_sprite_2d.play("driving")
		is_moving_right = false
		is_moving = false
