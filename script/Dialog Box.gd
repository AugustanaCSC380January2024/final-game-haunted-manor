extends ColorRect

@export var dialogPath = "res://Dialog.json"
@export var textSpeed = 0.05

var dialog
var phraseNum : int = 0
var finished :bool = false



func _ready():
	$Timer.wait_time = textSpeed
	dialog = getDialog()
	assert(dialog, "Dialog not found!")
	nextPhrase()
	
func _process(delta):
	$Indicator.visible = finished
	if Input.is_action_just_pressed("Action") or Input.is_action_just_pressed("ActionSpace"):
		if finished:
			nextPhrase()
		else: 
			$Text.visible_characters = len($Text.text)
	
func getDialog() -> Array:
	var f = FileAccess.open(dialogPath, FileAccess.READ)
	assert(f.file_exists(dialogPath),"File path does not exist")
	
	f.open(dialogPath, f.READ)
	var json = f.get_as_text()
	var json_object = JSON.new()
	json_object.parse(json)
	var output = json_object.data
	
	if typeof(output) == TYPE_ARRAY:
		return output
	else:
		return []
		
func nextPhrase():
	if phraseNum >= len(dialog):
		queue_free()
		return
	finished = false
	
	$Name.bbcode_text = dialog[phraseNum]["Name"]
	$Text.bbcode_text = dialog[phraseNum]["Text"]
	$Text.visible_characters = 0

	var f = FileAccess
	var img = "res://asset/other/woman figure.png"
	if f.file_exists(img):
		$Portrait.texture = load(img)
	else: $Portrait.texture = null
		
		
		
	while $Text.visible_characters < len($Text.text):
		$Text.visible_characters += 1
		$Timer.start()
		await $Timer.timeout
		
	finished = true
	phraseNum += 1
	return