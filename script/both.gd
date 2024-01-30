extends Area2D

@export var targetScene: String
func _on_input_event(viewport, event, shape_idx):
   if event.is_pressed():
      
      var targetScenePath = "res://"+targetScene+".tscn"
      get_tree().change_scene_to_file(targetScenePath)


func _on_mouse_entered():
   $sparkle.emitting = true

func _on_mouse_exited():
   $sparkle.emitting = false