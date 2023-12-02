extends Area2D


func _on_body_entered(body):
	if body.name == "Player":
		GlobalVariables.powerup = true
		queue_free()
