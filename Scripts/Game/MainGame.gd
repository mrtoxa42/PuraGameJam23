extends Node2D




var vfoot = preload("res://Scenes/Obstacle/FootVertical.tscn")
var hfoot = preload("res://Scenes/Obstacle/FootHorizontal.tscn")

var horfoot = false


func _process(delta):
	if horfoot == true:
		$FootHor.position.y += 200 * delta
		print($FootHor.position.y)




func _on_VerticalFootTimer_timeout():
	var VFoot = vfoot.instance()
	get_tree().get_root().add_child(VFoot)
	


func _on_HorizontalFootTimer_timeout():
	var HFoot = hfoot.instance()
	$FootHor.add_child(HFoot)
	horfoot = true
