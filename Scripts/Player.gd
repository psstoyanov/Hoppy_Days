extends KinematicBody2D

const SPEED = 600
const GRAVITY = 5000
const UP = Vector2(0,-1)
const JUMP_SPEED = -1800
const JUMP_BOOST = 2

var motion = Vector2()

export var world_limit = 3000

func _ready():
	Global.Player = self

func hurt():
	motion.y = JUMP_SPEED
	Global.PainSFX.play()

func _physics_process(delta):
	update_motion(delta)
	
func _process(delta):
	update_animation()

func update_motion(delta):
	fall(delta)
	run()
	jump()
	move_and_slide(motion, UP)

func update_animation():
	$AnimatedSprite.updatePlayerAnim(motion)

func run():
	if Input.is_action_pressed("ui_right") and not Input.is_action_pressed("ui_left"):
		motion.x = SPEED
	elif Input.is_action_pressed("ui_left") and not Input.is_action_pressed("ui_right"):
		motion.x = -SPEED
	else:
		motion.x = 0

func fall(delta):
	if is_on_floor() or is_on_ceiling():
		motion.y = 10
	else:
		motion.y += GRAVITY * delta
	
	if position.y > world_limit:
		Global.GameState.end_game()

func jump():
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		motion.y = JUMP_SPEED
		Global.JumpSFX.play()


func boost():
	motion.y = JUMP_SPEED * JUMP_BOOST
	Global.JumpSFX.play()
