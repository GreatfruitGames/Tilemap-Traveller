extends Area2D

@export var damage : int
@export var respawn = false


func _on_body_entered(body: Node2D) -> void:
	if body.get_class() == "CharacterBody2D":
		if body.immunityTimer.is_stopped():
			body.damage(damage)
			if respawn == true:
				body.respawn()
