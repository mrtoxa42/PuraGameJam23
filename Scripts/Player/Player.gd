extends KinematicBody2D


var speed = 400

var activejump = false
var footarea = false

func _ready():
	GameManager.player = self

func _process(delta):
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
		
	if activejump == false:
		if Input.is_action_just_pressed("ui_select"):
			if footarea == false:
				activejump = true
				speed = 150
				Jump()
			else:
				game_over()
	if activejump == true:
		if Input.is_action_just_released("ui_select"):
			var tween = get_tree().create_tween()
			tween.tween_property(self,"scale",Vector2(1,1),1)
			activejump = false
			speed = 400
			z_index = 0
		if footarea == true:
			game_over()
	move_and_slide(velocity * speed)



func Jump():
	z_index = 2
	var tween = get_tree().create_tween()
	tween.tween_property(self,"scale",Vector2(2,2),1)


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
	footarea = false
