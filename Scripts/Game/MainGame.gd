extends Node2D










func _on_FootTimer_timeout():
	$Foot/FootAnimation.play("Attack")
	


func _on_FootAnimation_animation_finished(anim_name):
	if anim_name == "Attack":
		$Foot/FootAnimation.play("Back")
