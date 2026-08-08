extends TileMapLayer



func enable():
	collision_enabled = true
	modulate = Color(1.0,1.0,1.0)

func disable():
	collision_enabled = false
	modulate = Color(0.5,0.5,0.5)