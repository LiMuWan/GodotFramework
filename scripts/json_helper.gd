class_name JsonHelper

# 将对象序列化为 JSON 字符串
static func to_json(obj) -> String:
	return JSON.stringify(obj)
	
# 将 JSON 字符串反序列化为对象
static func to_object(json_str: String):
	var result = JSON.parse_string(json_str)
	if result == null:
		push_error("JSON Parse Error: Invalid JSON string")
	return result
		
# 将 JSON 字符串反序列化为字典，键为整数
static func parse_dictionary(json_str: String, class_type: String) -> Dictionary:
	var json_object = to_object(json_str)
	if not json_object is Dictionary:
		push_error("Expected Dictionary but got: " + str(typeof(json_object)))
		return {}
		
	var dict = {}
	for key in json_object.keys():
		var item_data = json_object[key]
		var item = CommonHelper.create_instance_from_json(class_type, item_data)
		dict[int(key)] = item
		
	return dict
	
# 将 JSON 字符串反序列化为字典，键为字符串
static func parse_string_dictionary(json_str: String, class_type: String) -> Dictionary:
	var json_object = to_object(json_str)
	if not json_object is Dictionary:
		push_error("Expected Dictionary but got: " + str(typeof(json_object)))
		return {}
		
	var dict = {}
	for key in json_object.keys():
		var item_data = json_object[key]
		var item = CommonHelper.create_instance_from_json(class_type, item_data)
		dict[key] = item
		
	return dict
	
# 解析 JSON 数组到对象列表
static func parse_array(json_str: String, class_type: String) -> Array:
	var json_array = to_object(json_str)
	if not json_array is Array:
		push_error("Expected Array but got: " + str(typeof(json_array)))
		return []
		
	var result_array = []
	for item_data in json_array:
		var item = CommonHelper.create_instance_from_json(class_type, item_data)
		result_array.append(item)
		
	return result_array
