extends "res://src/modules/player/platformer_char.gd"

onready var reload_time = $Reload;

var default_bullet = load("res://actors/bullet/Bullet.tscn");


func _ready() -> void:
	pass


func _process(delta):
	if Input.is_action_pressed("attack"):
		fire(default_bullet);
		


func _physics_process(delta):
	.apply_gravity(delta);
	


func fire(bullet) -> void:
	if !self.reload_time.is_stopped() || !direction.x:
		return
	
	var new_bullet = bullet.instance();
	self.get_parent().add_child(new_bullet);
	new_bullet.global_position = self.gun_pos.global_position;
	new_bullet.direction = direction;
	
	self.reload_time.start();
