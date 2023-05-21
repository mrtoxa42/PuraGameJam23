extends Area2D


var speed = 200




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
	
	position.y += speed * delta


func _on_Trash_area_entered(area):
	if area.name == "PlayerArea":
		if GameManager.player.jumptime == true:
			queue_free()
