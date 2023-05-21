extends Node2D

var Go = "Menu"


func _ready():
	MouseCursor.show()
	GameManager.gamein = false


func _process(delta):
	if Input.is_action_just_pressed("ui_select"):
		get_tree().change_scene("res://Scenes/Game/MainGame.tscn")


func _on_MenuButton_pressed():
	if GameManager.sound == true:
		$Click.play()
	$Node2D/MenuButton.normal = load("res://Assets/menu_assets/menu_menu2.png")
	$Timer.start()
	Go = "Menu"
	
	$Animation.play("BalonAni")
	


func _on_Timer_timeout():
	if Go == "Menu" :
		get_tree().change_scene("res://Scenes/Menu/Menu.tscn")
