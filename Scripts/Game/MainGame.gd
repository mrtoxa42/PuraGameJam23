extends Node2D





var foot = preload("res://Scenes/Obstacle/Foot.tscn")



#
#
#
func _on_FootTimer_timeout():
	GameManager.footpos = $FootSpawner.global_position
	var Foot = foot.instance()
	get_tree().get_root().add_child(Foot)
	Foot.global_position = $FootSpawner.global_position
	
