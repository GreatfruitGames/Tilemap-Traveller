extends CharacterBody2D

@export var coyoteTimer : Timer
@export var jumpTimer : Timer

var jumping = false
var fall_gravity = 1000
var coyoteStarted = false

const SPEED = 50.0
const JUMP_VELOCITY = -210.0


func getGravity():
	if jumping == true:
		return fall_gravity
	else:
		return get_gravity().y

func _physics_process(delta: float) -> void:

	if is_on_floor():
		jumping = false
		coyoteStarted = false

	# Add the gravity.
	if not is_on_floor():
		velocity.y += getGravity() * delta
		if not jumping && coyoteTimer.is_stopped() and coyoteStarted == false:
			coyoteStarted = true
			coyoteTimer.start()

	# Handle jump.
	if Input.is_action_just_pressed("jump") and (is_on_floor() or coyoteTimer.is_stopped() == false):
		jumping = true
		velocity.y = JUMP_VELOCITY
	elif Input.is_action_just_pressed("jump") and not is_on_floor() and coyoteTimer.is_stopped():
		jumpTimer.start()
		await jumpTimer.timeout
		if is_on_floor() and Input.is_action_pressed("jump"):
			jumping = true
			velocity.y = JUMP_VELOCITY
	
	if Input.is_action_just_released("jump") and !is_on_floor() and velocity.y < -10:
		velocity.y = -10

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
