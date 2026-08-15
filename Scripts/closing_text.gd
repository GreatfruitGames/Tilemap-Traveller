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
	label.text = "You successfully destroyed the bug!"
	animation_player.play_backwards("fade")
	await animation_player.animation_finished
	await get_tree().create_timer(2.0).timeout
	animation_player.play("fade")
	await animation_player.animation_finished
	label.text = "Now the developer can finish the game and you won't be a prototype!"
	animation_player.play_backwards("fade")
	await animation_player.animation_finished
	await get_tree().create_timer(5.0).timeout
	animation_player.play("fade")
	await animation_player.animation_finished
	label.text = "As long as they don't start another project..."
	animation_player.play_backwards("fade")
	await animation_player.animation_finished
	await get_tree().create_timer(3.0).timeout
	animation_player.play("fade")
	await animation_player.animation_finished
	animation_player.play("big fade")
	await animation_player.animation_finished
	get_tree().change_scene_to_packed(level)