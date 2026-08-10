extends CharacterBody2D


@export var health = 5
@export var max_health = 5
@export var health_container : HBoxContainer

@export var respawn_cast : RayCast2D

# Exports for jump related timers
@export var coyoteTimer : Timer
@export var jumpTimer : Timer
@export var immunityTimer : Timer

# Regular variables for jumping
var jumping = false
var fall_gravity = 1000
var coyoteStarted = false

# Default movement variables
const SPEED = 50.0
const JUMP_VELOCITY = -210.0

var respawn_coords = Vector2(0,0)
var respawn_layer = 0

@export var level : Node2D

# Used to determine the gravity based on whether the player is jumping or just falling
func getGravity():
	if jumping == true:
		return fall_gravity
	else:
		return get_gravity().y


func _physics_process(delta: float) -> void:
	if respawn_cast.is_colliding():
		respawn()


	# Resets floor dependent variables
	if is_on_floor():
		jumping = false
		coyoteStarted = false

	# Applies gravity to the player when not on the floor
	if not is_on_floor():
		velocity.y += getGravity() * delta
		# Activates the timer for coyote time jumping
		if not jumping and coyoteTimer.is_stopped() and coyoteStarted == false:
			coyoteStarted = true
			coyoteTimer.start()

	# Applies velocity when the jump button is pressed
	if Input.is_action_just_pressed("jump") and (is_on_floor() or coyoteTimer.is_stopped() == false):
		jumping = true
		velocity.y = JUMP_VELOCITY
	# Allows the player to press the jump button slightly before hitting the ground
	elif Input.is_action_just_pressed("jump") and not is_on_floor() and coyoteTimer.is_stopped():
		jumpTimer.start()
		await jumpTimer.timeout
		if is_on_floor() and Input.is_action_pressed("jump"):
			jumping = true
			velocity.y = JUMP_VELOCITY
	# Applies pressure based jumping
	if Input.is_action_just_released("jump") and !is_on_floor() and velocity.y < -10:
		velocity.y = -10

	# Horizontal velocity is applied based on the buttons pressed
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func damage(value : int):
	immunityTimer.start()
	health -= value
	for i in value:
		health_container.kill_heart()
	if health <= 0:
		die()

func die():
	pass

func respawn():
	level.activeMap = respawn_layer
	await get_tree().create_timer(1.0).timeout
	self.global_position = respawn_coords
