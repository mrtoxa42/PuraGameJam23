extends Node2D


var playerarea = false


func _ready():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var r = rng.randi_range(0,4)
	if r == 0:
		$Sprite.texture = load("res://Assets/enemy_assets/shoe2.png")
		$Sprite.flip_v = false
		$FootShadow.flip_v = false
	if r == 1:
		$Sprite.texture = load("res://Assets/enemy_assets/shoe1.png")
		$Sprite.flip_v = true
		$FootShadow.flip_v = true
	if r == 2:
		$Sprite.texture = load("res://Assets/enemy_assets/shoe3.png")
		$Sprite.flip_v = true
		$FootShadow.flip_v = true
	if r == 3:
		$Sprite.texture = load("res://Assets/enemy_assets/shoe4.png")
		$Sprite.flip_v = false
		$FootShadow.flip_v = false


func _process(delta):
	if GameManager.gamein == false:
		queue_free()
	position.x -= 250 * delta


func attack():
	if playerarea == true:
		if GameManager.player.activejump == false:
			GameManager.player.game_over()


func _on_FootArea_area_entered(area):
	if area.name == "PlayerArea":
		playerarea = true
		
	


func _on_FootArea_area_exited(area):
	if area.name == "PlayerArea":
		playerarea = false
