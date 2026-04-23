class_name PowerUp extends Node2D

signal collected

const SPEED_TEXTURE := preload("res://assets/red_bull.png")
const FINISH_TEXTURE := preload("res://assets/albanian_passport.jpg")

@onready var sprite := $Sprite2D

# SPEED: Increases horse speed.
# FINISH: Ends the game when collected.
enum POWER_UPS{SPEED, FINISH}

@export var power_up_name: POWER_UPS = POWER_UPS.SPEED

func _ready() -> void:
	match power_up_name:
		POWER_UPS.SPEED:
			sprite.texture = SPEED_TEXTURE
		POWER_UPS.FINISH:
			sprite.texture = FINISH_TEXTURE

func _on_body_entered(body: Node2D) -> void:
	if body is Horse:
		body.apply_powerup(power_up_name)
	collected.emit()
	queue_free()
