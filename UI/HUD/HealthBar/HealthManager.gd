extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func setup_healthManager(player_health: int, player_maxHealth: int):
	$HealthBar.max_value = player_maxHealth
	$HealthBar.value = player_health

func change_health(value):
	$HealthBar.value = value
	if value == 0:
		$HealthBottle.play("Refiling")
	else: 
		$HealthBottle.play("Idle")
	
