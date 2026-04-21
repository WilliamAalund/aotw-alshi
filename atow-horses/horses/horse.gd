extends CharacterBody2D

@onready var horse_sprite: = $Sprite2D
var direction: Vector2 = Vector2(0.5, 0.5).normalized()
var speed: int = 150;

func _ready() -> void:
	# start with a random normalized direction vector
	horse_sprite.modulate = Color(randf_range(0, 1),randf_range(0, 1),randf_range(0, 1),1)
	print(horse_sprite.modulate)
	direction = Vector2.from_angle(randf_range(0, TAU)).normalized()

func _physics_process(delta: float) -> void:
	velocity = direction * speed
	
	var collision = move_and_collide(velocity * delta)
	if collision:
		handle_collision(collision)
	
	move_and_slide()

func handle_collision(collision):
	# get new direction based off of collison angle with a random offset
	var offset_val = 0.2
	var offset = Vector2(randf_range(-offset_val, offset_val), randf_range(-offset_val, offset_val))
	var normal = (collision.get_normal() + offset).normalized()
	direction = direction.bounce(normal)
	# or get new direction randomly
	#direction = Vector2.from_angle(randf_range(0, TAU))
