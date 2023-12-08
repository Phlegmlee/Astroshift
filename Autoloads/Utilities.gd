extends Node



const SAVE_PATH = "res://savegame.bin"

func saveGame():
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	var data: Dictionary = {
		#"filename" : get_scene_file_path(),
		#"parent" : get_parent().get_path(),
		"powerupStatus": Global.powerup,
		"pos_x" : Global.playerPosX,
		"pos_y" : Global.playerPosY,
		"current_health" : Global.current_health,
		"max_health" : Global.max_health,
		"is_alive" : Global.is_alive
	}
	var jstr = JSON.stringify(data)
	file.store_line(jstr)
	
func loadGame():
	var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
	if FileAccess.file_exists(SAVE_PATH) == true:
		if not file.eof_reached():
			var current_line = JSON.parse_string(file.get_line())
			if current_line:
				Global.powerup = current_line ["powerupStatus"]
				Global.playerPosX = current_line ["pos_x"]
				Global.playerPosY= current_line ["pos_y"]
				Global.current_health = current_line ["current_health"]
				Global.max_health = current_line ["max_health"]
				Global.is_alive = current_line ["is_alive"]
