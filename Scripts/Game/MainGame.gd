extends Node2D




var foot = preload("res://Scenes/Obstacle/FootVertical.tscn")









func _on_VerticalFootTimer_timeout():
	var Foot = foot.instance()
	get_tree().get_root().add_child(Foot)
	
