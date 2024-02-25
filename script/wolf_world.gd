extends Control

@onready var player_answer = $LineEdit
@onready var label = $Label
var correct_answer = false
var answer = "CursedBloodline"
@onready var shader = $".."

func _process(delta):
   if Input.is_action_just_pressed("quit"):
      get_tree().change_scene_to_file("res://scene/bedroom.tscn")
      
func _on_button_pressed():
   if player_answer.text == answer:
      AudioPlayer.play_sound("correct")
      label.text = "Correct"
      label.add_theme_color_override("font_color", Color(0, 1, 0))
      correct_answer = true
      hide()
      get_tree().change_scene_to_file("res://video wolf.tscn")

      
   else:
      AudioPlayer.play_sound("wrong")
      label.text = "Try again"
      label.add_theme_color_override("font_color", Color(1, 0, 0))
      
      
   $Timer.start()
      
func _on_timer_timeout():
   label.add_theme_color_override("font_color", Color(1, 1, 1))
   label.text = "In the history of the Manor of Shadows,
    what dark legacy has haunted the family for generations, 
   binding them to a malevolent pact with supernatural forces?"
   $Timer.stop()
   
func _is_corrected():
   return correct_answer
