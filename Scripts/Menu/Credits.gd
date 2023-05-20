extends Node2D

var Go = "Menu"


func _on_TouchScreenButton_pressed():
	$Timer.start()
	var Go = "Menu"



func _on_Timer_timeout():
	if Go == "Menu":
		get_tree().change_scene("res://Scenes/Menu/Menu.tscn")
