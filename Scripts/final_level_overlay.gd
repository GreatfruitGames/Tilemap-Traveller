extends ColorRect

@export var level : Node2D



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if level.activeMap == 0:
		color = Color(1.0,0.5,0.5,0.5)
	elif level.activeMap == 1:
		color = Color(0.5,1.0,0.5,0.5)
	elif level.activeMap == 2:
		color = Color(0.5,0.5,1.0,0.5)
