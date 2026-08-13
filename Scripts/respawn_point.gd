extends Node2D

@export var level : Node2D
@export var screenNum : int

@export_enum("Background", "Midground", "Foreground") var layer : int
@export var respawn_marker : Marker2D

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.get_class() == "CharacterBody2D":
		body.respawn_coords = respawn_marker.global_position
		body.respawn_layer = layer
		level.camera.global_position = level.screens[screenNum].cameraSpot.global_position
