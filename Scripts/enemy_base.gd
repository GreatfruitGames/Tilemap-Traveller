extends RigidBody2D

@export_enum("Chaser", "Bouncer", "Chouncer", "Flyer", "Chlyer") var enemy_type : String
@export var bounceTimer : Timer
@export var level : Node2D

# The layer the enemy is on
@export var layer : int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if level.activeMap != layer:
		freeze = true
	else:
		freeze = false
		move()

func move():
	if enemy_type == "Chaser":
		chase()
	elif enemy_type == "Bouncer":
		bounce()
	elif enemy_type == "Chouncer":
		chounce()
	elif enemy_type == "Flyer":
		fly()
	elif enemy_type == "Chlyer":
		chly()

func chase():
	pass

func bounce():
	#if Vector2(roundi(linear_velocity.x), roundi(linear_velocity.y)) == Vector2(0,0):
	if bounceTimer.is_stopped():
		apply_central_impulse(Vector2(randf_range(-1000,1000),randf_range(-1000, -500)))
		bounceTimer.start()

func chounce():
	pass

func fly():
	pass

func chly():
	pass
