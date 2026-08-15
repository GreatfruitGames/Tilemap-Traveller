extends Node

@export var bg_music_player : AudioStreamPlayer
var current_zone : String

func _ready() -> void:
	current_zone = GlobalAudio.current_zone

func _process(delta: float) -> void:
	if current_zone != GlobalAudio.current_zone:
		current_zone = GlobalAudio.current_zone
		update_music_for_zone()

func update_music_for_zone():
	var current_zone_music = str(current_zone + "Music")
	bg_music_player["parameters/switch_to_clip"] = current_zone_music
