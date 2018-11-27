extends KinematicBody2D

const SPEED = 600

var motion = Vector2()

func _physics_process(delta):
	motion.x = 0
	
	if Input.is_action_pressed("ui_right") and not Input.is_action_pressed("ui_left"):
		motion.x = SPEED
		
	if Input.is_action_pressed("ui_left") and not Input.is_action_pressed("ui_right"):
		motion.x = -SPEED
	
	move_and_slide(motion)