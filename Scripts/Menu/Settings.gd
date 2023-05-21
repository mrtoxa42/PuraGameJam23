extends Node2D


var Go = "Menu"



func _process(delta):
	if GameManager.sound == true:
		$SoundLabel.text = "SFX ON"
	else:
		$SoundLabel.text = "SFX OFF"
	if GameManager.music == true:
		$MusicLabel.text = "MUSIC ON"
	else:
		$MusicLabel.text = "MUSIC OFF"





func _on_BackButton_pressed():
	$Click.play()
	$Timer.start()
	var Go = "Menu"
	
	$Animation.play("BalonAni")
	
func _on_Timer_timeout():
	if Go == "Menu":
		get_tree().change_scene("res://Scenes/Menu/Menu.tscn")



func _on_sfx_pressed():
	if GameManager.sound == false:
		GameManager.sound = true
		$SoundLabel.text = "SFX ON"
	else:
		GameManager.sound = false
		$SoundLabel.text = "SFX OFF"
	


func _on_Music_pressed():
	if GameManager.music == false:
		GameManager.music = true
		$MusicLabel.text = "MUSIC ON"
	else:
		GameManager.music = false
		$MusicLabel.text = "MUSIC OFF"

