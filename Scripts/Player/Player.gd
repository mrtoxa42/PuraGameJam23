extends KinematicBody2D


var speed = 350

var activejump = false


var foot = preload("res://Scenes/Obstacle/Foot.tscn")

func _process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("ui_right"):
		velocity.x = 1
	if Input.is_action_pressed("ui_left"):
		velocity.x = -1

	if activejump == false:
		if Input.is_action_just_pressed("ui_select"):
			activejump = true
			print(activejump)
			$JumpTimer.start()
			Jump()
	move_and_slide(velocity * speed)


func _on_JumpTimer_timeout():
	var tween = get_tree().create_tween()
	tween.tween_property(self,"scale",Vector2(1,1),1)
	activejump = false
	print(activejump)


func Jump():
	var tween = get_tree().create_tween()
	tween.tween_property(self,"scale",Vector2(2,2),1)
