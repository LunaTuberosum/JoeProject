extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	$Player.movePoint = $MovePoint
	$MovePoint.position = $Player.position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func change_stamina():
	$HUD/StaminaManager.change_stamina($Player.stamina)
	
func setup_healthManager():
	$HUD/HealthManager.setup_healthManager($Player.health, $Player.maxHealth)

func change_health():
	$HUD/HealthManager.change_health($Player.health)
