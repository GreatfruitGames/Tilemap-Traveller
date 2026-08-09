extends Node2D


@export var foregroundMap : TileMapLayer
@export var backgroundMap : TileMapLayer
@export var midgroundMap : TileMapLayer
@export var player : CharacterBody2D
@export var layers : AnimatedSprite2D

@export_range(0,2,1.0) var activeMap = 1:
	set(updated):
		activeMap = updated
		on_active_changed()


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

func on_active_changed():
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
