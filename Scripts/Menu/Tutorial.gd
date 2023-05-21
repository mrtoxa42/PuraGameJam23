extends Node2D

var Go = "Menu"



func _on_BackButton_pressed():
	$Click.play()
	$Timer.start()
	Go = "Menu"
	
	$Animation.play("BalonAni")



func _on_Timer_timeout():
	if Go == "Menu":
		get_tree().change_scene("res://Scenes/Menu/Menu.tscn")
		
