extends KinematicBody2D


var speed = 400
var bounce = 100
var activejump = false
var footarea = false
var timejump = true
func _ready():
	GameManager.player = self

func _process(delta):
	$GUI/Bounce/BounceBar.value = bounce
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("ui_right"):
		velocity.x = 1
		rotation_degrees = 45
	if Input.is_action_pressed("ui_left"):
		velocity.x = -1
		rotation_degrees = -45
	if Input.is_action_pressed("ui_up"):
		velocity.y = -1
	if Input.is_action_pressed("ui_down"):
		velocity.y = 1
	if velocity.x == 0:
		rotation_degrees = 0
		
	if activejump == false and timejump == true:
		if Input.is_action_just_pressed("ui_select"):
					$GUI/Bounce.show()
					if footarea == false:
						activejump = true
						timejump = false
						speed = 150
						Jump()
					else:
						game_over()
	if activejump == true and timejump == false:
		if Input.is_action_just_released("ui_select"): 
			var tween = get_tree().create_tween()
			tween.tween_property(self,"scale",Vector2(1,1),1)
			activejump = false
			$BounceEndTimer.start()
			speed = 400
			z_index = 0
			$GUI/Bounce.hide()
		if footarea == true:
			game_over()
	move_and_slide(velocity * speed)


func Jump():
	z_index = 2
	var tween = get_tree().create_tween()
	tween.tween_property(self,"scale",Vector2(2,2),1)
	$GUI/Bounce/BounceTimer.start()


func _on_PlayerArea_area_entered(area):
	if area.is_in_group("Foot"):
		if activejump == false:
			footarea = true

		
func game_over():
	get_tree().change_scene("res://Scenes/Menu/GameOver.tscn")
	queue_free()

func _on_BackLookTimer_timeout():
	$PlayerRunAnimation.play("BackLook")


func _on_PlayerRunAnimation_animation_finished(anim_name):
	if anim_name == "BackLook":
		$PlayerRunAnimation.play("Run")


func _on_PlayerArea_area_exited(area):
	if area.is_in_group("Foot"):
			footarea = false

func set_level():
	speed += 0.1
	$PlayerRunAnimation.playback_speed += 0.1


func _on_BounceTimer_timeout():
	if activejump == true:
		if bounce >0:
			$GUI/Bounce.show()
			bounce -=3
			var i = bounce - 42
			$GUI/Bounce/BounceLabel.bbcode_text = "[shake rate="+ str(i)+ "level=20]BALON PATLAMAK ÜZERE!![/shake]"
			$GUI/Bounce/BounceTimer.start()
		else:
			game_over()
	else:
		bounce = 100
		$GUI/Bounce.hide()


func _on_BounceEndTimer_timeout():
	timejump == true
