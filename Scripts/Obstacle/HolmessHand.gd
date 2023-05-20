extends KinematicBody2D

var velocity = Vector2.ZERO


var speed = 2000

 
func _process(delta):
	velocity.y = GameManager.player.global_position.y - global_position.y
	
	move_and_slide(velocity * speed * delta)


func _on_AttackTimer_timeout():
	pass # Replace with function body.
