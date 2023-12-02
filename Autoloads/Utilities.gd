extends Node



const SAVE_PATH = "res://savegame.bin"

func saveGame():
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	var data: Dictionary = {
		#"filename" : get_scene_file_path(),
		#"parent" : get_parent().get_path(),
		"powerupStatus": GlobalVariables.powerup,
		"pos_x" : GlobalVariables.playerPosX,
		"pos_y" : GlobalVariables.playerPosY,
		"current_health" : GlobalVariables.current_health,
		"max_health" : GlobalVariables.max_health,
		"is_alive" : GlobalVariables.is_alive
	}
	var jstr = JSON.stringify(data)
	file.store_line(jstr)
	
func loadGame():
	var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
	if FileAccess.file_exists(SAVE_PATH) == true:
		if not file.eof_reached():
			var current_line = JSON.parse_string(file.get_line())
			if current_line:
				GlobalVariables.powerup = current_line ["powerupStatus"]
				GlobalVariables.playerPosX = current_line ["pos_x"]
				GlobalVariables.playerPosY= current_line ["pos_y"]
				GlobalVariables.current_health = current_line ["current_health"]
				GlobalVariables.max_health = current_line ["max_health"]
				GlobalVariables.is_alive = current_line ["is_alive"]
