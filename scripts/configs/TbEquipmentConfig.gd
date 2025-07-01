extends RefCounted

class_name TbEquipmentConfig

var _data_map: Dictionary
var _data_list: Array

func _init(content: String):
	_data_map = CsvHelper.parse_dictionary(content, "EquipmentConfig")
	_data_list = _data_map.values()

func get_data_map() -> Dictionary:
	return _data_map
	
func get_data_list() -> Array:
	return _data_list
	
func get_or_default(key):
	return _data_map.get(key, null)
	
func get_by_id(key):
	if _data_map.has(key):
		return _data_map[key]
	push_error("In TbEquipmentConfig: Key not found: " + str(key))
	return null
