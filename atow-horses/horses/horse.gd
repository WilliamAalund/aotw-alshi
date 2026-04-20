extends CharacterBody2D


var direction: Vector2 = Vector2(0.5, 0.5).normalized()
var speed: int = 90;

func _ready() -> void:
	# start with a random normalized direction vector
	direction = Vector2.from_angle(randf_range(0, TAU))

func _physics_process(delta: float) -> void:
	velocity = direction * speed
	
	var collision = move_and_collide(velocity * delta)
	if collision:
		handle_collision(collision)
	
	move_and_slide()

func handle_collision(collision):
	# get new direction based off of collison angle
	var normal  = collision.get_normal()
	direction = direction.bounce(normal)
	# or get new direction randomly
	#direction = Vector2.from_angle(randf_range(0, TAU))
