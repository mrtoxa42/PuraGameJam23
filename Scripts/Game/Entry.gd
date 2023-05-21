extends Node2D




func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Entry":
		get_tree().change_scene("res://Scenes/Game/MainGame.tscn")


func _process(delta):
	if Input.is_action_just_pressed("ui_select"):
		get_tree().change_scene("res://Scenes/Game/MainGame.tscn")
