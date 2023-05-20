extends Node2D




var vfoot = preload("res://Scenes/Obstacle/FootVertical.tscn")
var hfoot = preload("res://Scenes/Obstacle/FootHorizontal.tscn")

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

