extends Node2D

export var starting_lives = 3
export var starting_coins = 0
var lives
var coins

func _ready():
	Global.GameState = self
	lives = starting_lives
	coins = starting_coins
	update_GUI()

func update_GUI():
	Global.GUI.update_GUI(lives, coins)

func hurt():
	lives -= 1
	Global.Player.hurt()
	update_GUI()
	
	if lives < 0:
		end_game() 

func coin_up():
	coins += 1
	update_GUI()

func end_game():
	get_tree().change_scene("res://Scenes/GameOver.tscn")