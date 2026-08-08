extends Node2D


@export var foregroundMap : TileMapLayer
@export var backgroundMap : TileMapLayer
@export var midgroundMap : TileMapLayer

@export_range(0,2,1.0) var activeMap = 1:
	set(updated):
		activeMap = updated
		on_active_changed()


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func on_active_changed():
	if activeMap == 0:
		backgroundMap.enable()
		midgroundMap.disable()
		foregroundMap.disable()
	elif activeMap == 1:
		backgroundMap.disable()
		midgroundMap.enable()
		foregroundMap.disable()
	elif activeMap == 2:
		backgroundMap.disable()
		midgroundMap.disable()
		foregroundMap.enable()
