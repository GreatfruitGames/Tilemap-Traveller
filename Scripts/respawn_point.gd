extends Node2D

@export_enum("Background", "Midground", "Foreground") var layer : int

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.get_class() == "CharacterBody2D":
		body.respawn_coords = self.global_position
		body.respawn_layer = layer
