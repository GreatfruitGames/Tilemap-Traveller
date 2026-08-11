extends Node2D

@export var player_lives = 5
@export var player_coins = 0
@export var map : Control

var currentLevel
var currentMap
var new_level

var player



func Load(level : PackedScene):
	map.hide()
	new_level = level.instantiate()
	add_child(new_level)
	player = get_node("/root/Game Manager/Level/Player")

func levelComplete():
	map.show()
	new_level.queue_free()
	currentMap.complete()

func add_coin():
	player_coins += 1
	if player_coins >= 10:
		player_lives += 1
		player_coins -= 10
	player.coins_tracker.text = " " + str(player_coins)
	player.lives_tracker.text = " " + str(player_lives)
