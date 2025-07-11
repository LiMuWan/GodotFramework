extends MarginContainer

const GameDataTypes = preload("res://addons/godot_ui_framework/examples/core_demo/data/game_data_types.gd")

@onready var avatar_button: TextureButton = %AvatarButton
@onready var player_name: Label = %PlayerName
@onready var player_level: Label = %PlayerLevel

signal pressed

func _on_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			pressed.emit()
	# 针对触摸屏
	if event is InputEventScreenTouch:
		if event.pressed:
			pressed.emit()

func _on_ui_widget_component_initialized(data: Dictionary) -> void:
	var player_data : GameDataTypes.PlayerData = GameDataTypes.PlayerData.from_dict(data)
	if player_name == null:
		player_name = self.get_node("HBoxContainer/PlayerName")
	if player_level == null:
		player_level = self.get_node("HBoxContainer/PlayerLevel")
	if avatar_button == null:
		avatar_button = self.get_node("HBoxContainer/AvatarButton")
	player_name.text = player_data.name
	player_level.text = "Lv.%d" % player_data.level
	if ResourceLoader.exists(player_data.avatar):
		avatar_button.texture_normal = load(player_data.avatar)
