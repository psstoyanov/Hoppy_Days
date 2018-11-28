extends CanvasLayer

func _ready():
	Global.GUI = self

func update_GUI(lives, coins):
	$Banner/HBoxContainer/LifeCount.text = str(lives)
	$Banner/HBoxContainer/CoinCount.text = str(coins)