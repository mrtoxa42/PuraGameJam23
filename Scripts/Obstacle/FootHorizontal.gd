extends Node2D


var playerarea = false


func _ready():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var r = rng.randi_range(0,1)

	if r == 0:
		$Sprite.flip_v = false
		$FootShadow.flip_v = false
	else:
		$Sprite.flip_h = true
		$FootShadow.flip_v = true


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
