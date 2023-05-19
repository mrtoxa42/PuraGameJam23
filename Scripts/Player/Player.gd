extends KinematicBody2D


var speed = 400

var activejump = false




func _process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("ui_right"):
		velocity.x = 1
	if Input.is_action_pressed("ui_left"):
		velocity.x = -1

	if activejump == false:
		if Input.is_action_just_pressed("ui_select"):
			activejump = true
			speed = 150
			Jump()
	if activejump == true:
		if Input.is_action_just_released("ui_select"):
			var tween = get_tree().create_tween()
			tween.tween_property(self,"scale",Vector2(1,1),1)
			activejump = false
			speed = 400
	move_and_slide(velocity * speed)



func Jump():
	var tween = get_tree().create_tween()
	tween.tween_property(self,"scale",Vector2(2,2),1)
