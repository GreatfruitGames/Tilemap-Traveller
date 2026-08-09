extends TileMapLayer

@export_enum("Back", "Mid", "Front") var layer : int

func enable():
	collision_enabled = true
	if layer == 0:
		modulate = Color(1.0,0.5,0.5,1.0)
	elif layer == 1:
		modulate = Color(0.5,1.0,0.5,1.0)
	elif layer == 2:
		modulate = Color(0.5,0.5,1.0,1.0)

func disable():
	collision_enabled = false
	if layer == 0:
		modulate = Color(1.0,0.5,0.5,0.25)
	elif layer == 1:
		modulate = Color(0.5,1.0,0.5,0.25)
	elif layer == 2:
		modulate = Color(0.5,0.5,1.0,0.25)