extends RigidBody2D

@export_enum("Chaser", "Bouncer", "Chouncer", "Flyer", "Chlyer") var enemy_type : String
@export var bounceTimer : Timer
@export var level : Node2D
@export var detector : Area2D

var target

# The layer the enemy is on
@export var layer : int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if enemy_type == "Flyer" or enemy_type == "Chlyer":
		gravity_scale = 0
		physics_material_override.bounce = 0
	if enemy_type == "Chaser":
		physics_material_override.bounce = 0
		mass = 20


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
	if target != null:
		apply_central_impulse((target.global_position - self.global_position))

func bounce():
	if bounceTimer.is_stopped():
		apply_central_impulse(Vector2(randf_range(-1000,1000),randf_range(-1000, -500)))
		bounceTimer.start()

func chounce():
	if bounceTimer.is_stopped() and target != null:
		apply_central_impulse((target.global_position - self.global_position) * 10)
		bounceTimer.start()

func fly():
	if bounceTimer.is_stopped():
		apply_central_impulse(Vector2(randf_range(-100,100),randf_range(-100, 100)))
		bounceTimer.start()

func chly():
	if target != null:
		apply_central_impulse((target.global_position - self.global_position) / 20)

func _on_search_body_entered(body: Node2D) -> void:
	target = body
