@tool
extends Node2D

const power_up := preload("res://entities/PowerUp.tscn")

@onready var timer := $Timer
@onready var editor_sprite := $Sprite2D

@export var power_up_type: PowerUp.POWER_UPS = PowerUp.POWER_UPS.SPEED

var spawned_powerup: bool = false

func _ready() -> void:
	if Engine.is_editor_hint():
		editor_sprite.visible = true
	else:
		editor_sprite.visible = false
		spawn_powerup()

func spawn_powerup() -> void:
	var new_power_up = power_up.instantiate()
	new_power_up.power_up_name = power_up_type
	new_power_up.collected.connect(self._on_powerup_collected)
	add_child(new_power_up)
	spawned_powerup = true

func _on_timer_timeout() -> void:
	if !spawned_powerup:
		spawn_powerup()

# Respawns a new powerup, and prevents spawning multiple powerups in the same position
func _on_powerup_collected() -> void:
	spawned_powerup = false
	if (power_up_type == PowerUp.POWER_UPS.SPEED):
		timer.start()
