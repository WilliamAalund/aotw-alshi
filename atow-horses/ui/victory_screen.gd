extends Control

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var winner_name = $Label
@onready var eric_adams = $eric_adams_player

func _ready() -> void:
	GameSignals.to_main.connect(_on_to_main)
	GameSignals.finish_game.connect(_on_finish_game)

func play_victory_screen(horse_name: String) -> void:
	winner_name.text = horse_name + " won!"
	animation_player.play("begin_victory")
	await animation_player.animation_finished
	animation_player.play("victory")
	await animation_player.animation_finished
	eric_adams.play()

func _on_finish_game(horse_name: String) -> void:
	play_victory_screen(horse_name)

func _on_to_main() -> void:
	animation_player.stop()
	animation_player.play("RESET")


func _on_button_pressed() -> void:
	GameSignals.to_main.emit()
