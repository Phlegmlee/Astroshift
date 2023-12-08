extends Control

func _on_new_game_button_pressed():
	get_tree().change_scene_to_file("res://Levels/Level_1_Normal.tscn")


func _on_load_game_pressed():
	Utilities.loadGame()


func _on_back_pressed():
	get_tree().change_scene_to_file("res://Title Page/TilePage.tscn")
