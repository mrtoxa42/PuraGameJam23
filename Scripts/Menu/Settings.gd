extends Node2D


var Go = "Menu"

func _on_BackButton_pressed():
	$Timer.start()
	var Go = "Menu"
	
	$Animation.play("BalonAni")
	
func _on_Timer_timeout():
	if Go == "Menu":
		get_tree().change_scene("res://Scenes/Menu/Menu.tscn")


func _on_sfx_pressed():
	if GameManager.sound == false:
		GameManager.sound = true
	else:
		GameManager.sound = false
	
	


func _on_Music_pressed():
	if GameManager.music == false:
		GameManager.music = true
	else:
		GameManager.music = false
