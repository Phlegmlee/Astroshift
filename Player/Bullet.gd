extends StaticBody2D

var SPEED = 300

func _physics_process(delta):
	position.x += delta * SPEED
	
func _on_area_2d_body_entered(body):
		$Impact.play()
		SPEED = 0
		if body.is_in_group("Mobs"):
			$Flesh.play()
		$BulletSprite.play("impact")
		await get_node("BulletSprite").animation_finished
		self.queue_free()
	
