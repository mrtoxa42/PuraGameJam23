extends Node2D


var Go = "Play"



func _on_PlayButton_pressed():
	$Timer.start()
	Go = "Play"
	$PlayButton.normal = load("res://Assets/menu_assets/menu_play2.png")

func _on_SettingsButton_pressed():
	$Timer.start()
	Go = "Settings"
	$SettingsButton.normal = load("res://Assets/menu_assets/menu_settings2.png")


func _on_CreditsButton_pressed():
	$Timer.start()
	Go = "Credits"
	$CreditsButton.normal = load("res://Assets/menu_assets/menu_credits2.png")


func _on_AssetsButton_pressed():
	$Timer.start()
	Go = "Assets"
	$AssetsButton.normal = load("res://Assets/menu_assets/menu_assets2.png")



func _on_Timer_timeout():
	if Go == "Play":
		get_tree().change_scene("res://Scenes/Game/MainGame.tscn")
	if Go == "Settings":
		get_tree().change_scene("res://Scenes/Menu/Settings.tscn")
	if Go == "Credits":
		get_tree().change_scene("res://Scenes/Menu/Credits.tscn")
	if Go == "Assets":
		get_tree().change_scene("res://Scenes/Menu/Assets.tscn")




