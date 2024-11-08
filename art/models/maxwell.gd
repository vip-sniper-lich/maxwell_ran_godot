extends Node3D

func _physics_process(delta):
	$AnimationPlayer.play("Animation",-1,1.0,false)
