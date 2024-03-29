extends Area2D
@onready var ui_layer = $"/root/Ui"
@export var targetScene: String
var time = 0

func _on_input_event(viewport, event, shape_idx):
   if event.is_pressed():
      var keyPad = ui_layer.get_keyPad()
      if !keyPad.is_password_found():
         ui_layer.show_keyPad(true)
      elif keyPad.is_password_found():
         var targetScenePath = "res://scene/"+targetScene+".tscn"
         get_tree().change_scene_to_file(targetScenePath)
         
func _on_mouse_entered():
   $sparkle.emitting = true

func _on_mouse_exited():
   $sparkle.emitting = false
