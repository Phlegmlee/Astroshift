extends StaticBody2D

var SPEED = 375

func _process(delta):
	position.x += delta * SPEED
	

func _on_area_2d_body_entered(body):
		print("bullet hit")
		SFX.play_sfx(AF.bulletImpact, 0, 0, 1)
		SPEED = 0
		if body.is_in_group("Mobs"):
			SFX.play_sfx(AF.fleshImpact, 0, 0, 1)
		get_node("BulletSprite").play("impact")
		await get_node("BulletSprite").animation_finished
		self.queue_free()
	






