class_name PowerUp extends Node2D

signal collected

var speed_texture := preload("res://assets/placeholder_image.png")

@onready var sprite := $Sprite2D

# SPEED: Increases horse speed.
# FINISH: Ends the game when collected.
enum POWER_UPS{SPEED, FINISH}

@export var power_up_name: POWER_UPS = POWER_UPS.SPEED

func _ready() -> void:
	sprite.texture = speed_texture

func _on_body_entered(body: Node2D) -> void:
	print("I was collected by", body)
	collected.emit()
	queue_free()
