extends Area2D

func _on_body_entered(body):
	if body.name == "Player":
		SFX.play_sfx(0, -15, 0.8, 1)
		GlobalVariables.powerup = true
		queue_free()
