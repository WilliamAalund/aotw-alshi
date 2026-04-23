extends Control

@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	GameSignals.to_main.connect(_on_to_main)
	GameSignals.finish_game.connect(_on_finish_game)

func play_victory_screen() -> void:
	animation_player.play("begin_victory")
	await animation_player.animation_finished
	animation_player.play("victory")
	await animation_player.animation_finished

func _on_finish_game() -> void:
	play_victory_screen()

func _on_to_main() -> void:
	animation_player.stop()
	animation_player.play("RESET")


func _on_button_pressed() -> void:
	GameSignals.to_main.emit()
