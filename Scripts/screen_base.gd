@tool
extends Node2D

@export var level : Node2D
@export var rectangle : ReferenceRect
@export var label : Label
@export var cameraSpot : Marker2D

# References to spawn locations
@export var leftSpawn : Marker2D
@export var rightSpawn : Marker2D
@export var topSpawn : Marker2D
@export var bottomSpawn : Marker2D

# References to the transition areas
@export var leftDoor : Area2D
@export var rightDoor : Area2D
@export var bottomDoor : Area2D
@export var topDoor : Area2D

# References to the screens that are transitioned to
@export var rightScreen : int
@export var leftScreen : int
@export var topScreen : int
@export var bottomScreen : int

# Keeps the rectangles clearly different
func _draw() -> void:
	rectangle.border_color = Color(randf(),randf(),randf())
	if level != null:
		label.text = str(level.screens.find(self))
	if !Engine.is_editor_hint():
		label.hide()
	

func _on_ceiling_body_entered(body: Node2D) -> void:
	if topScreen == -1:
		pass
	else:
		level.camera.global_position = level.screens[topScreen].cameraSpot.global_position
		level.player.global_position.y = level.screens[topScreen].bottomSpawn.global_position.y

func _on_floor_body_entered(body: Node2D) -> void:
	if bottomScreen == -1:
		pass
	else:
		level.camera.global_position = level.screens[bottomScreen].cameraSpot.global_position
		level.player.global_position.y = level.screens[bottomScreen].topSpawn.global_position.y

func _on_right_body_entered(body: Node2D) -> void:
	if rightScreen == -1:
		pass
	else:
		level.camera.global_position = level.screens[rightScreen].cameraSpot.global_position
		level.player.global_position.x = level.screens[rightScreen].leftSpawn.global_position.x

func _on_left_body_entered(body: Node2D) -> void:
	if leftScreen == -1:
		pass
	else:
		level.camera.global_position = level.screens[leftScreen].cameraSpot.global_position
		level.player.global_position.x = level.screens[leftScreen].rightSpawn.global_position.x
