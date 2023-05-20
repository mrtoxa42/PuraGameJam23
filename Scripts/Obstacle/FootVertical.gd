extends Node2D

var playerarea = false
func _ready():
	GameManager.foot = self
	foot_attack()
	
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
		if playerarea == true:
			GameManager.player.game_over()
			queue_free()
		var tween = get_tree().create_tween()
		tween.tween_property(self,"position",Vector2(position.x,900),1.5)
		tween.connect("finished",self,"tween_finished")
	else:
		var tween = get_tree().create_tween()
		tween.tween_property(self,"scale",Vector2(2,6),1)
		tween.connect("finished",self,"tween_finished")



func _on_FootArea_area_exited(area):
	if area.name == "PlayerArea":
		playerarea = false


func _on_FootArea_area_entered(area):
	playerarea = true
