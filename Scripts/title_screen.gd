extends Control

@export var targetScene : PackedScene
@onready var transition_player : AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	transition_player.play_backwards("big fade")

func _on_button_pressed() -> void:
	transition_player.play("big fade")
	await transition_player.animation_finished
	get_tree().change_scene_to_packed(targetScene)

func _on_button_2_pressed() -> void:
	get_tree().quit()
