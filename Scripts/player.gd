extends CharacterBody2D

@export var coyoteTimer : Timer
@export var jumpTimer : Timer
@export var label : Label

var jumping = false
var fall_gravity = 1000

const SPEED = 50.0
const JUMP_VELOCITY = -210.0


func getGravity():
	if jumping == true:
		return fall_gravity
	else:
		return get_gravity().y

func _physics_process(delta: float) -> void:
	label.text = "Coyote: " + str(coyoteTimer.time_left) + "\n" + "Jump: " + str(jumpTimer.time_left)

	if is_on_floor():
		jumping = false

	# Add the gravity.
	if not is_on_floor():
		velocity.y += getGravity() * delta
		if not jumping && not coyoteTimer.time_left > 0:
			coyoteTimer.start()

	# Handle jump.
	if Input.is_action_just_pressed("jump") and (is_on_floor() or coyoteTimer.time_left > 0):
		jumping = true
		velocity.y = JUMP_VELOCITY
	elif Input.is_action_just_pressed("jump") and not is_on_floor() and not coyoteTimer.time_left > 0:
		jumpTimer.start()
		await jumpTimer.timeout
		if is_on_floor():
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
