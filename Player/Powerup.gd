extends Area2D

func _on_body_entered(body):
	if body.name == "Player":
		Global.powerup = true
		$Power.play()
		visible = false
		await get_tree().create_timer(2).timeout
		self.queue_free()
