extends ParallaxBackground

var scrollingSpeed = 50

func _process(delta):
	
	scroll_offset.x -= scrollingSpeed * delta

