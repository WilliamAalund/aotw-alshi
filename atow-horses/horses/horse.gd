extends CharacterBody2D


var direction: Vector2 = Vector2(0.5, 0.5).normalized()
var speed: int = 90;


func _physics_process(delta: float) -> void:
	velocity = direction * speed
	var collision = move_and_collide(velocity * delta)
	
	if collision:
		handle_collision(collision)
	
	
	move_and_slide()

func handle_collision(collision):
	var normal  = collision.get_normal()
	direction = direction.bounce(normal)
