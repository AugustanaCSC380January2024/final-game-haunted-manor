extends Node
var door = preload("res://asset/music/Door open sound effect.mp3")
var wolf = preload("res://asset/music/wolf sound effect.mp3")
var correct = preload("res://asset/music/correct.mp3")
var wrong = preload("res://asset/wrong pass.mp3")
var dust = preload("res://asset/music/Fairy dust, magic sound effect.mp3")
var press = preload("res://asset/music/button-press-sound-effect-free-no-copyright_CNFUSWuc.mp3")
var creak = preload("res://asset/music/door-creaking-121673_10vi55xt.mp3")
var win = preload("res://scene/WIN sound effect no copyright.mp3")
func play_sound(sound: String):
   var stream = null
   if sound == "door":
      stream = door
   elif sound == "wolf":
      stream = wolf
   if sound == "correct":
      stream = correct
   elif sound == "wrong":
      stream = wrong
   elif sound == "dust":
      stream = dust
   elif sound == "press":
      stream = press
   elif sound == "creak":
      stream = creak
   elif sound == "win":
      stream = win
   else:
      print("Invalid")
      return 
   var audio = AudioStreamPlayer.new()
   audio.stream = stream
   audio.name = "SFX"
   add_child(audio)
   audio.play()
   
   await audio.finished
   audio.queue_free()
