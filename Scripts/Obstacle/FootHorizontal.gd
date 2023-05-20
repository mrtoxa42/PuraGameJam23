extends Node2D


var playerarea = false

func _process(delta):
	position.x -= 250 * delta


func attack():
	if playerarea == true:
		if GameManager.player.activejump == false:
			GameManager.player.game_over()


func _on_FootArea_area_entered(area):
	if area.name == "PlayerArea":
		playerarea = true
		
	


func _on_FootArea_area_exited(area):
	if area.name == "PlayerArea":
		playerarea = false
