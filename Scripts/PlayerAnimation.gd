extends AnimatedSprite

func updatePlayerAnim(motion):
	if motion.x > 0:
		play("run")
		flip_h = false
	elif motion.x < 0:
		play("run")
		flip_h = true
	else:
		play("idle")
	
	if motion.y < 0:
		play("jump")
