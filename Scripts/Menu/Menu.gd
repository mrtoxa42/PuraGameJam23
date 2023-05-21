extends Node2D


var Go = "Play"

func _ready():
	MouseCursor.show()
func _on_PlayButton_pressed():
	if GameManager.sound == true:
		$Click.play()
	$Timer.start()
	Go = "Play"
	$PlayButton.normal = load("res://Assets/menu_assets/menu_play2.png")
	$Animation.play("BalonAni")


func _on_SettingsButton_pressed():
	if GameManager.sound == true:
		$Click.play()
	$Timer.start()
	Go = "Settings"
	$SettingsButton.normal = load("res://Assets/menu_assets/menu_settings2.png")
	$Animation.play("BalonAni")


func _on_CreditsButton_pressed():
	if GameManager.sound == true:
		$Click.play()
	$Timer.start()
	Go = "Credits"
	$CreditsButton.normal = load("res://Assets/menu_assets/menu_credits2.png")
	$Animation.play("BalonAni")


func _on_AssetsButton_pressed():
	if GameManager.sound == true:
		$Click.play()
	$Timer.start()
	Go = "Assets"
	$AssetsButton.normal = load("res://Assets/menu_assets/menu_assets2.png")
	$Animation.play("BalonAni")


func _on_TutorialButton_pressed():
	if GameManager.sound == true:
		$Click.play()
	$Timer.start()
	Go = "Tutorial"
	$Animation.play("BalonAni")


func _on_Timer_timeout():
	if Go == "Play":
		get_tree().change_scene("res://Scenes/Game/Entry.tscn")
	if Go == "Settings":
		get_tree().change_scene("res://Scenes/Menu/Settings.tscn")
	if Go == "Credits":
		get_tree().change_scene("res://Scenes/Menu/Credits.tscn")
	if Go == "Assets":
		get_tree().change_scene("res://Scenes/Menu/Assets.tscn")
	if Go == "Tutorial":
		get_tree().change_scene("res://Scenes/Menu/Tutorial.tscn")
	if Go == "Infınıty":
		get_tree().change_scene("res://Scenes/Game/Forever.tscn")






func _on_PlayerRunAnimation_animation_finished(anim_name):
	if anim_name == "Run":
		$PlayerRunAnimation.play("Baloon")
		$Sisme.play()


func _on_Infnty_pressed():
	if GameManager.sound == true:
		$Click.play()
	$Timer.start()
	Go = "Infınıty"
	$AssetsButton.normal = load("res://Assets/menu_assets/menu_assets2.png")
	$Animation.play("BalonAni")
