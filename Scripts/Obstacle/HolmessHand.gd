extends KinematicBody2D

var velocity = Vector2.ZERO

var follow = true
var speed = 2000

 
func _process(delta):
	if GameManager.gamein == false:
		queue_free()
	if follow == true and GameManager.player != null:
		velocity.y = GameManager.player.global_position.y - global_position.y
	
		move_and_slide(velocity * speed * delta)
		


func _on_AttackTimer_timeout():
	follow = false
	var tween = get_tree().create_tween()
	tween.tween_property(self,"position",Vector2(800,position.y),1)
	print("a")
