extends Node2D

@export var map : Control

var currentLevel

func Load(level : PackedScene):
	map.hide()
	var new_level = level.instantiate()
	add_child(new_level)

func levelComplete():
	pass
