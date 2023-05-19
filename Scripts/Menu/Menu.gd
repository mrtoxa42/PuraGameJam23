extends Node2D


func _ready():
	pass # Replace with function body.


func _on_PlayButton_pressed():
	pass#get_tree().change_scene()


func _on_SettingsButton_pressed():
	get_tree().change_scene("res://Scenes/Menu/Settings.tscn")


func _on_CreditsButton_pressed():
	get_tree().change_scene("res://Scenes/Menu/Credits.tscn")


func _on_AssetsButton_pressed():
	get_tree().change_scene("res://Scenes/Menu/Assets.tscn")
