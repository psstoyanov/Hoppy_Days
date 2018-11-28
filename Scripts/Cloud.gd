extends Node2D

var timeout = false

func _process(delta):
	if $Sprite/RayCast2D.is_colliding():
		fire()


func fire():
	if not timeout:
		timeout = true
		$Sprite/Timer.start()
		$Sprite/RayCast2D.add_child(load(Global.Lightning).instance())

func _on_Timer_timeout():
	timeout = false
