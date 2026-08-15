extends Node2D

# References
@export var foregroundMap : TileMapLayer
@export var backgroundMap : TileMapLayer
@export var midgroundMap : TileMapLayer
@export var player : CharacterBody2D
@export var layers : AnimatedSprite2D
@export var camera : Camera2D
@export var change_sound : AudioStreamPlayer2D

# Holds each screen that makes up the level
@export var screens : Array[Node2D]

# Keeps track of the current tilemap active
@export_range(0,2,1.0) var activeMap = 1:
	set(updated):
		activeMap = updated
		on_active_changed()

# Searches for player input to change the active maps
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("down"):
		if activeMap > 0:
			activeMap -= 1
		else:
			activeMap = 2
	
	if Input.is_action_just_pressed("up"):
		if activeMap < 2:
			activeMap += 1
		else:
			activeMap = 0

# When the player changes the map, the other maps are disabled and the layer UI is updated
func on_active_changed():
	change_sound.play()
	change_sound.pitch_scale = randf_range(0.8,1.2)
	if activeMap == 0:
		layers.frame = 0
		backgroundMap.enable()
		midgroundMap.disable()
		foregroundMap.disable()
	elif activeMap == 1:
		layers.frame = 1
		backgroundMap.disable()
		midgroundMap.enable()
		foregroundMap.disable()
	elif activeMap == 2:
		layers.frame = 2
		backgroundMap.disable()
		midgroundMap.disable()
		foregroundMap.enable()
