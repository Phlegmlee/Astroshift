extends Control

func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://Title Page/LevelSelect.tscn")

func _on_options_button_pressed():
	get_tree().change_scene_to_file("res://Title Page/OptionsPage.tscn")

func _on_quit_button_pressed():
	get_tree().quit()
