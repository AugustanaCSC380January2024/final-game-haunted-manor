extends VideoStreamPlayer


func _on_finished():
   get_tree().change_scene_to_file("res://scene/bedroom.tscn")
func _process(delta):
   if Input.is_action_just_pressed("quit"):
      queue_free()
      get_tree().change_scene_to_file("res://scene/bedroom.tscn")
      

   
