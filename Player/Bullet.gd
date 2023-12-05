extends StaticBody2D

var SPEED = 375



func _process(delta):
	position.x += delta * SPEED
	

func _on_area_2d_body_entered(body):
		print("bullet hit")
		SPEED = 0
		get_node("BulletSprite").play("impact")
		SFX.play_sfx()
		if body.is_in_group("Mobs"):
			$SquishSFX.play()
		await get_node("BulletSprite").animation_finished
		self.queue_free()
	






