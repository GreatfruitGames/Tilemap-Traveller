extends Node2D

var worldManager

func _ready() -> void:
	worldManager = get_node("/root/Game Manager")

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.get_class() == "CharacterBody2D":
		body.coin_sound.play()
		body.coin_sound.pitch_scale = randf_range(0.8,1.2)
		worldManager.add_coin()
		self.queue_free()
