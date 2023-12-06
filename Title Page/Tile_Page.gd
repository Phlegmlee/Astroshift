extends Control

func _ready():
	MusicController.play_music(0, -8.0, 0.5)
	SFX.play_sfx(0, 1.5, 0.5, 1)

func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://Title Page/LevelSelect.tscn")

func _on_options_button_pressed():
	get_tree().change_scene_to_file("res://Title Page/OptionsPage.tscn")

func _on_quit_button_pressed():
	get_tree().quit()

