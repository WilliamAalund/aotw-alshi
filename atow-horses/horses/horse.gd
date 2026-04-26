class_name Horse extends CharacterBody2D

signal finished_race

@onready var horse_sprite: = $Sprite2D
@onready var bounce_sfx = $Thud
@onready var horse_label = $horse_label

const MAX_COLLISION_OFFSET := 0.4
const BASE_SPEED := 100
const SPEED_ITEM_BOOST_MAGNITUDE = 25

var direction: Vector2 = Vector2(0.5, 0.5).normalized()
var speed: int = BASE_SPEED;
@onready var paused = true
@onready var horse_name = ""


func _ready() -> void:
	# start with a random normalized direction vector
	# horse_sprite.modulate = Color(randf_range(0, 1),randf_range(0, 1),randf_range(0, 1),1)
	# print(horse_sprite.modulate)
	direction = Vector2.from_angle(randf_range(0, TAU)).normalized()

func _physics_process(delta: float) -> void:
	
	if (!(paused)):
		velocity = direction * speed
		var collision = move_and_collide(velocity * delta)
		if collision:
			handle_collision(collision)
		
		move_and_slide()

func handle_collision(collision) -> void:
	# get new direction based off of collison angle with a random offset
	var offset = Vector2(randf_range(-MAX_COLLISION_OFFSET, MAX_COLLISION_OFFSET), randf_range(-MAX_COLLISION_OFFSET, MAX_COLLISION_OFFSET))
	var normal = (collision.get_normal() + offset).normalized()
	direction = direction.bounce(normal)
	bounce_sfx.play()
	# or get new direction randomly
	#direction = Vector2.from_angle(randf_range(0, TAU))

func apply_powerup(powerup: PowerUp.POWER_UPS) -> void:
	match powerup:
		PowerUp.POWER_UPS.SPEED:
			speed += SPEED_ITEM_BOOST_MAGNITUDE
		PowerUp.POWER_UPS.FINISH:
			print("Hooray! I finished the race!")
			finished_race.emit()
			GameSignals.finish_game.emit(horse_name, horse_sprite.texture)
			
func update_name(name : String) -> void:
	if not is_node_ready():
		await ready 
	horse_name = name
	horse_label.text = horse_name
	
func hide_label() -> void:
	horse_label.visible = false
