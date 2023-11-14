extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func change_stamina(value):
	$StaminaBar.value = value
	if value == 0:
		$StaminaBottle.play("Refiling")
	else: 
		$StaminaBottle.play("Idle")
	
