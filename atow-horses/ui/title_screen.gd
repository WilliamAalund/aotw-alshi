extends Control

func _on_button_pressed() -> void:
	GameSignals.start_game.emit()
