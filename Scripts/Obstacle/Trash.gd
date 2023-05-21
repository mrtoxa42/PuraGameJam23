extends Area2D


var speed = 350




func _ready():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var r = rng.randi_range(0,3)
	
	if r == 0:
		$Sprite.texture = load("res://Assets/environment_assets/kola.png")
	if r == 1:
		$Sprite.texture = load("res://Assets/environment_assets/waterbottle.png")
	if r == 2:
		$Sprite.texture = load("res://Assets/environment_assets/starbucks.png")
	if r == 3:
		$Sprite.texture = load("res://Assets/environment_assets/leaf.png")


func _process(delta):
	if GameManager.gamein == false:
		queue_free()
	position.y += speed * delta


func _on_Trash_area_entered(area):
	if area.name == "PlayerArea":
		if GameManager.player.jumptime == true:
			$Node2D.show()
			GameManager.background.move_slow()
			$DeathTimer.start()


func _on_DeathTimer_timeout():
	queue_free()
