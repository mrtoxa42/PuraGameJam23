extends Node2D

var Go = "Menu"


func _on_TouchScreenButton_pressed():
	$Click.play()
	$Timer.start()
	var Go = "Menu"

	$Animation.play("BalonAni")

func _on_Timer_timeout():
	if Go == "Menu":
		get_tree().change_scene("res://Scenes/Menu/Menu.tscn")


func _on_Website_pressed():
	OS.shell_open("https://42studyo42.com/%22")


func _on_Instagram_pressed():
	OS.shell_open("https://www.instagram.com/studyo42/")


func _on_Discord_pressed():
	OS.shell_open("https://discord.gg/WE8GjVrCTT")


func _on_Itachio_pressed():
	OS.shell_open("https://studyo42.itch.io/")
