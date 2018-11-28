extends AnimatedSprite

var taken = false


func _on_body_entered(body):
	if not taken:
		Global.GameState.coin_up()
		$CoinSFX.play()
		$AnimationPlayer.play("die")
		taken = true

func die():
	queue_free()