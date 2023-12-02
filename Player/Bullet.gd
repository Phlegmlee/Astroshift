extends Node2D

func _on_area_2d_body_entered(body):
	print("bullet hit")
	get_node("AnimatedSprite2D").play("impact")
	await get_node("AnimatedSprite2D").animation_finished
	self.queue_free()
