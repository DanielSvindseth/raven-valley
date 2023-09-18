extends CharacterBody2D

const ACCELERATION = 1200
const FRICTION = 1200
const MAX_SPEED = 200
@export var player_speed = 5.0

func _physics_process(delta):
	# Get the input direction and handle the movement/deceleration.
	var direction = Vector2.ZERO
	direction.x = Input.get_axis("left", "right")
	direction.y = Input.get_axis("up", "down")
	direction = direction.normalized()
	if direction:
		# velocity += direction * player_speed * ACCELERATION * delta
		# velocity = velocity.limit_length(MAX_SPEED)
		velocity = velocity.move_toward(direction * MAX_SPEED, ACCELERATION * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta * player_speed)

	move_and_slide()
	# move_and_collide(velocity * delta)
