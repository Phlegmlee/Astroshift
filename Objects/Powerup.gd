extends Area2D

func _on_body_entered(body):
	if body.name == "Player":
		SFX.play_sfx(0, 1, 1, 1)
		GlobalVariables.powerup = true
		queue_free()
