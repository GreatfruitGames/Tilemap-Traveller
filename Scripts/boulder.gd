extends RigidBody2D

@export var layer : int
var offScreen = true
@export var level : Node2D


func _ready() -> void:
	if layer == 0:
		modulate = Color(1.0,0.5,0.5,1.0)
	elif layer == 1:
		modulate = Color(0.5,1.0,0.5,1.0)
	elif layer == 2:
		modulate = Color(0.5,0.5,1.0,1.0)

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.get_script().get_global_name() == "enemy" and body.enemy_type != "Boss":
		body.die()
	elif body.get_script().get_global_name() == "enemy" and body.enemy_type == "Boss":
		body.bossHealth -= 1
		if body.bossHealth == 0:
			body.die()
		Break()
	elif body.get_class() == "CharacterBody2D":
		if body.immunityTimer.is_stopped():
			body.damage(1)


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	offScreen = true
	freeze = true


func _on_visible_on_screen_notifier_2d_screen_entered() -> void:
	offScreen = false
	if level.activeMap == layer:
		freeze = false

func _process(delta: float) -> void:
	if level.activeMap != layer or offScreen == true:
		freeze = true
	elif offScreen == false:
		freeze = false

func Break():
	queue_free()
