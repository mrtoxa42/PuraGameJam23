extends Node2D

var playerarea = false
func _ready():
	GameManager.foot = self
	foot_attack()
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var r = rng.randi_range(0,4)

	if r == 0:
		$FootArea/FootSprite.texture = load("res://Assets/enemy_assets/shoe2.png")
		$FootArea/FootSprite.flip_v = false
		$FootShadow.flip_v = false
	if r == 1:
		$FootArea/FootSprite.texture = load("res://Assets/enemy_assets/shoe1.png")
		$FootArea/FootSprite.flip_v = true
		$FootShadow.flip_v = true
	if r == 2:
		$FootArea/FootSprite.texture = load("res://Assets/enemy_assets/shoe3.png")
		$FootArea/FootSprite.flip_v = true
		$FootShadow.flip_v = true
	if r == 3:
		$FootArea/FootSprite.texture = load("res://Assets/enemy_assets/shoe4.png")
		$FootArea/FootSprite.flip_v = false
		$FootShadow.flip_v = false
	
func _process(delta):
	if GameManager.gamein == false:
		queue_free()
func foot_attack():
	position.y = 900
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var r = rng.randi_range(20,1240)
	var tween = get_tree().create_tween()
	position.x = r
	tween.tween_property(self,"position",Vector2(r,450),1)
	tween.connect("finished",self,"tween_finished")
	
func tween_finished():
	if scale == Vector2(2,6):
		var tween = get_tree().create_tween()
		$BOOM.visible = true
		tween.tween_property(self,"position",Vector2(position.x,900),1.5)
		tween.connect("finished",self,"tween_finished")
		if playerarea == true:
			if GameManager.player.activejump == false:
				GameManager.player.game_over()
				queue_free()
	else:
		var tween = get_tree().create_tween()
		tween.tween_property(self,"scale",Vector2(2,6),1)
		tween.connect("finished",self,"tween_finished")



func _on_FootArea_area_exited(area):
	if area.name == "PlayerArea":
		playerarea = false


func _on_FootArea_area_entered(area):
	if area.name == "PlayerArea":
		playerarea = true
