extends Node2D


var coll = false
func _process(delta):
	if GameManager.gamein == false:
		queue_free()


func _on_VisibilityNotifier2D_screen_exited():
	GameManager.maingame.out_horizontal_foot()
	queue_free()


func _on_FootArea_area_entered(area):
	if coll == true:
		if area.name == "PlayerArea":
			GameManager.player.game_over()

func coll_active():
	if coll == true:
		coll = false
	else:
		coll = true
