extends Node2D

export var starting_lives = 3
export var starting_coins = 0
export var coin_target = 5 # How many coins for extra life
var lives
var coins

onready var GUI = Global.GUI

func _ready():
	Global.GameState = self
	lives = starting_lives
	coins = starting_coins
	update_GUI()

func update_GUI():
	Global.GUI.update_GUI(lives, coins)

func animate_GUI(animation):
	GUI.animate(animation)

func hurt():
	lives -= 1
	Global.Player.hurt()
	update_GUI()
	animate_GUI("Hurt")
	if lives < 0:
		end_game() 

func coin_up():
	coins += 1
	update_GUI()
	animate_GUI("CoinPulse")
	var multiple_of_coin_target = (coins % coin_target) == 0
	if multiple_of_coin_target:
		life_up()

func life_up():
	lives += 1
	update_GUI()
	animate_GUI("LifePulse")

func end_game():
	get_tree().change_scene(Global.GameOver)