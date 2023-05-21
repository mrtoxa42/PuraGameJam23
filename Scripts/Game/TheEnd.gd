extends Node2D




func _on_PlayerRunAnimation_animation_finished(anim_name):
	if anim_name== "Run":
		$PlayerRunAnimation.play("Talk")
	if anim_name == "Talk":
		get_tree().change_scene("res://Scenes/Menu/Credits.tscn")
