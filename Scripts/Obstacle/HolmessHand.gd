extends KinematicBody2D

var velocity = Vector2.ZERO

var follow = true
var speed = 2000
var playerarea = false
 
func _process(delta):
	if GameManager.gamein == false:
		queue_free()
	if follow == true and GameManager.player != null:
		var i = GameManager.player.global_position.y - global_position.y
		velocity.y = i -20
	
		move_and_slide(velocity * speed * delta)
		


func _on_AttackTimer_timeout():
	follow = false
	var tween = get_tree().create_tween()
	tween.tween_property(self,"position",Vector2(640,position.y),0.7)
	tween.connect("finished",self,"tween_finished")

func tween_finished():
	$AnimationPlayer.play("Slap")


func _on_AnimationPlayer_animation_finished(anim_name):
	if playerarea == true and GameManager.player !=null:
		if GameManager.player.activejump == false:
			GameManager.player.game_over()
	queue_free()


func _on_Area2D_area_entered(area):
	if area.name == "PlayerArea":
		playerarea = true

func right():
	$Sprite.flip_h = true

func _on_Area2D_area_exited(area):
	if area.name == "PlayerArea":
		playerarea = false
