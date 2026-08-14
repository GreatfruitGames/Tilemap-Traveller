extends Control

@onready var label : Label = $Label
@onready var animation_player :  AnimationPlayer = $AnimationPlayer
@export var level : PackedScene

func _ready() -> void:
	animation_player.play_backwards("big fade")
	await animation_player.animation_finished
	animation_player.play("fade")
	await animation_player.animation_finished
	label.show()
	label.text = "You are part of a game developer's new prototype."
	animation_player.play_backwards("fade")
	await animation_player.animation_finished
	await get_tree().create_timer(2.0).timeout
	animation_player.play("fade")
	await animation_player.animation_finished
	label.text = "Unfortunately, the dev recently discovered a terrible bug in their code."
	animation_player.play_backwards("fade")
	await animation_player.animation_finished
	await get_tree().create_timer(5.0).timeout
	animation_player.play("fade")
	await animation_player.animation_finished
	label.text = "They tried as hard as they could, but couldn't fix the bug."
	animation_player.play_backwards("fade")
	await animation_player.animation_finished
	await get_tree().create_timer(5.0).timeout
	animation_player.play("fade")
	await animation_player.animation_finished
	label.text = "They got so angry that they quit the project and left you, their prototype, all alone."
	animation_player.play_backwards("fade")
	await animation_player.animation_finished
	await get_tree().create_timer(5.0).timeout
	animation_player.play("fade")
	await animation_player.animation_finished
	label.text = "But you can't let yourself go unfinished."
	animation_player.play_backwards("fade")
	await animation_player.animation_finished
	await get_tree().create_timer(2.0).timeout
	animation_player.play("fade")
	await animation_player.animation_finished
	label.text = "You must get through the game to destroy the bug."
	animation_player.play_backwards("fade")
	await animation_player.animation_finished
	await get_tree().create_timer(3.0).timeout
	animation_player.play("fade")
	await animation_player.animation_finished
	animation_player.play("big fade")
	await animation_player.animation_finished
	get_tree().change_scene_to_packed(level)