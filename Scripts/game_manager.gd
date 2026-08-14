extends Node2D

@export var player_lives = 5
@export var player_coins = 0
@export var map : Control

var currentLevel
var currentMap
var new_level

var player

@onready var animation_player : AnimationPlayer = $AnimationPlayer
@onready var label : Label = $Label

func _ready() -> void:
	animation_player.play_backwards("big fade")

func Load(level : PackedScene, title : String):
	animation_player.play("big fade")
	await animation_player.animation_finished
	label.text = title
	animation_player.play_backwards("fade")
	await animation_player.animation_finished
	await get_tree().create_timer(2.0).timeout
	map.hide()
	currentLevel = level
	new_level = level.instantiate()
	add_child(new_level)
	player = get_node("/root/Game Manager/Level/Player")
	animation_player.play_backwards("big fade")
	await animation_player.animation_finished
	animation_player.play("fade")

func levelComplete():
	animation_player.play("big fade")
	await animation_player.animation_finished
	map.show()
	new_level.queue_free()
	currentMap.complete()
	animation_player.play_backwards("big fade")

func levelFailed():
	animation_player.play("big fade")
	await animation_player.animation_finished
	map.show()
	new_level.queue_free()
	animation_player.play_backwards("big fade")

func add_coin():
	player_coins += 1
	if player_coins >= 10:
		player_lives += 1
		player_coins -= 10
	player.coins_tracker.text = " " + str(player_coins)
	player.lives_tracker.text = " " + str(player_lives)

func updateLives():
	player.lives_tracker.text = " " + str(player_lives)

func reloadLevel():
	animation_player.play("big fade")
	await animation_player.animation_finished
	new_level.queue_free()
	new_level = currentLevel.instantiate()
	await get_tree().create_timer(1.0).timeout
	add_child(new_level)
	player = get_node("/root/Game Manager/Level/Player")
	animation_player.play_backwards("big fade")
