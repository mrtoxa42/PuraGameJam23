extends Node2D




var vfoot = preload("res://Scenes/Obstacle/FootVertical.tscn")
var hfoot = preload("res://Scenes/Obstacle/FootHorizontal.tscn")
var hand = preload("res://Scenes/Obstacle/HolmessHand.tscn")

var horfoot = false

func _ready():
	GameManager.gamein = true
	GameManager.maingame = self

func _process(delta):
	$FootHor.position.y += 200 * delta





func _on_VerticalFootTimer_timeout():
	var VFoot = vfoot.instance()
	get_tree().get_root().add_child(VFoot)
	


func _on_HorizontalFootTimer_timeout():
	$FootHor.position.y = 0
	var HFoot = hfoot.instance()
	$FootHor.add_child(HFoot)
	HFoot.global_position = $FootHor.global_position



func _on_LevelTimer_timeout():
	GameManager.Level +=1
	if $HorizontalFootTimer.wait_time > 3:
		$HorizontalFootTimer.wait_time -= 0.2
	if $VerticalFootTimer.wait_time > 4:
		$VerticalFootTimer.wait_time -= 0.2
	if $HandTimer.wait_time > 5:
		$HandTimer.wait_time  -= 0.2
	GameManager.player.set_level()
	GameManager.background.move_speed()
	print(GameManager.Level)


func _on_HandTimer_timeout():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var r = rng.randi_range(0,1)
	var Hand = hand.instance()
	get_tree().get_root().add_child(Hand)
	if r == 0:
		Hand.global_position = $HandPos.global_position
	if r == 1:
		Hand.global_position = $HandPos2.global_position
		Hand.right()
