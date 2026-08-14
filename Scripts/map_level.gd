extends Node2D

@export var sprite : AnimatedSprite2D
@export var targetLevel : PackedScene
@export var title : String
var worldManager

func _ready() -> void:
	worldManager = get_node("/root/Game Manager")

func _on_button_pressed() -> void:
	worldManager.Load(targetLevel, title)
	worldManager.currentMap = self

func complete():
	sprite.frame = 2
