extends Node

# - >| Finite State Machine |

var character: KinematicBody2D = owner;
var last_direction: Vector2;

var states: Dictionary = {};

var current_state: Node;
var previous_state: Node;

var _active: bool = false setget set_active;


func start() -> void:
	set_active(true);
	get_states_nodes();
	change_state("Idle");


func get_states_nodes() -> void:
	for state_node in get_children():
		if state_node in states:
			continue
		
		states[state_node.name] = state_node;
		states[state_node.name].character = owner;
		states[state_node.name].anim_character = owner.animation_player;


func _input(event) -> void:
	current_state.handle_input(event);


func _physics_process(delta) -> void:
	current_state.update(delta);


func change_state(state_name) -> void:
	if !_active:
		return
	
	if state_name in states:
		if current_state:
			previous_state = current_state;
			current_state.exit();
		
		current_state = states[state_name];
		current_state.enter();


func set_active(value) -> void:
	_active = value;
	set_physics_process(value);
	set_process_input(value);
	
	if !_active:
		current_state = null;
