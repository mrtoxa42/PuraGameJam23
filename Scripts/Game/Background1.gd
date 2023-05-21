extends ParallaxBackground


var speed = 200


func _ready():
	GameManager.background = self

func _process(delta):
	$ParallaxLayer.motion_offset.y += speed * delta



func move_speed():
	speed += 30

func move_slow():
	if speed > 50:
		speed -= 30
