extends StaticBody2D

var SPEED = 375



func _process(delta):
	position.x += delta * SPEED
	

func _on_area_2d_body_entered(_body):
		print("bullet hit")
		SPEED = 0
		get_node("BulletSprite").play("impact")
		await get_node("BulletSprite").animation_finished
		self.queue_free()
	






