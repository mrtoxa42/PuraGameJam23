extends ParallaxBackground


var speed = 200

func _process(delta):
	$ParallaxLayer.motion_offset.y += speed * delta
