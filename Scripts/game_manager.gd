extends Node2D

@export var map : Control

var currentLevel
var new_level


func Load(level : PackedScene):
	map.hide()
	new_level = level.instantiate()
	add_child(new_level)

func levelComplete():
	new_level.queue_free()
	map.show()
