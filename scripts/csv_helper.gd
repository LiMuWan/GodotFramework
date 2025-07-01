# CsvHelper.gd
class_name CsvHelper

const ARRAY_ELEMENT_SEPARATOR = ";"
const DEFAULT_KEY_COLUMN = "id"

# 解析CSV内容为对象列表
static func parse_csv_content(csv_content: String, class_type: String) -> Array:
	if csv_content.is_empty():
		print("CsvHelper: CSV content is null or empty.")
		return []

	var data_list = []
	var lines = csv_content.split("\n", false)

	if lines.size() < 2:
		print("CsvHelper: CSV file is empty or has no header.")
		return data_list

	var header_line = lines[0].strip_edges()
	var headers = _map_string_array(header_line.split(","), func(h): return h.strip_edges())
	var header_map = {}
	for i in range(headers.size()):
		header_map[headers[i].to_lower()] = i

	var script_path = "res://scripts/configs/" + class_type + ".gd"
	var script = load(script_path)
	if not script:
		push_error("Could not load script for class: " + class_type + " at path: " + script_path)
		return []

	# 获取目标脚本的属性列表
	var script_properties = {}
	# 尝试获取属性列表，如果脚本没有暴露 get_property_list 方法，就跳过类型检查，直接赋值
	if script.new().has_method("get_property_list"):
		var properties = script.new().get_property_list()
		for prop_info in properties:
			script_properties[prop_info.name.to_lower()] = prop_info
	else:
		push_warning("Script '" + class_type + "' does not expose 'get_property_list'. Cannot perform type-safe assignment.")

	for line_number in range(1, lines.size()):
		var data_line = lines[line_number].strip_edges()
		if data_line.is_empty():
			continue

		var values = data_line.split(",")
		var instance_data = {} # 用于临时存储解析后的数据

		for header in headers:
			var header_lower = header.to_lower()
			if header_map.has(header_lower):
				var column_index = header_map[header_lower]
				if column_index < values.size():
					var cell_value = values[column_index].strip_edges()
					instance_data[header_lower] = cell_value
				else:
					instance_data[header_lower] = ""

		var instance = script.new()

		# 填充实例属性
		for prop_name_lower in script_properties:
			if instance_data.has(prop_name_lower):
				var cell_value = instance_data[prop_name_lower]
				var prop_info = script_properties[prop_name_lower]

				var converted_value = convert_cell_value(cell_value, prop_info)

				# 安全地设置属性值，直接通过属性名访问
				# 如果属性不存在，GDScript 会自动处理（通常是忽略或产生警告）
				if converted_value != null:
					# 直接访问属性，这是 Godot 中设置属性的标准方式
					instance[prop_name_lower] = converted_value

		data_list.append(instance)

	return data_list

# 转换单元格值为指定类型
static func convert_cell_value(cell_value: String, prop_info: Dictionary) -> Variant:
	cell_value = cell_value.strip_edges()
	if cell_value.is_empty():
		return null

	var type_id = prop_info.get("type", TYPE_STRING)
	match type_id:
		TYPE_INT:
			return cell_value.to_int()
		TYPE_FLOAT:
			return cell_value.to_float()
		TYPE_BOOL:
			return cell_value.to_lower() == "true"
		TYPE_STRING:
			return cell_value
		TYPE_ARRAY:
			return convert_array(cell_value, prop_info)
		_:
			# 如果是其他类型，尝试直接返回字符串，或者根据实际需求进行转换
			# print("CsvHelper: Unsupported conversion for type ID %s. Returning as string." % type_id)
			return cell_value

# 转换单元格值为数组
static func convert_array(cell_value: String, prop_info: Dictionary) -> Array:
	if cell_value.strip_edges() == "null" or cell_value.is_empty():
		return []

	var elements = _map_string_array(cell_value.split(ARRAY_ELEMENT_SEPARATOR), func(h): return h.strip_edges())
	var result_array = []
	
	var element_type_id = TYPE_STRING
	if prop_info.has("hint_string"):
		var hint_parts = prop_info["hint_string"].split(",")
		if hint_parts.size() > 0 and hint_parts[0].begins_with("array"):
			var type_part = hint_parts[0].split(":")
			if type_part.size() > 1:
				var element_type_str = type_part[1]
				# 尝试将类型字符串转换为 Godot 的 type_id
				if element_type_str.is_valid_integer():
					element_type_id = element_type_str.to_int()
				else:
					# 如果不是数字类型 ID，可能需要查找类型名称对应的 ID
					# 例如：TYPE_STRING, TYPE_INT 等
					# 这里简单处理，如果不是 int，就当作 string
					pass # 默认就是 TYPE_STRING

	for element in elements:
		# 创建一个临时的 prop_info 来传递给 convert_cell_value
		result_array.append(convert_cell_value(element, {"type": element_type_id}))

	return result_array

# 解析CSV内容为字典，键为指定列的值
static func parse_dictionary(csv_content: String, class_type: String, key_column: String = DEFAULT_KEY_COLUMN) -> Dictionary:
	var data_list = parse_csv_content(csv_content, class_type)
	var result = {}

	if data_list.is_empty():
		return result

	for item in data_list:
		# 安全地访问属性
		var key_value = item.get(key_column)

		if key_value == null:
			print("CsvHelper: Key column '%s' not found or is null for an item." % key_column)
			continue

		var dict_key = key_value
		if typeof(key_value) == TYPE_STRING and key_value.is_valid_integer():
			dict_key = key_value.to_int()

		if result.has(dict_key):
			print("CsvHelper: Duplicate key '%s' found." % dict_key)
		else:
			result[dict_key] = item

	return result


# 辅助函数：对 PackedStringArray 进行映射操作
static func _map_string_array(array: PackedStringArray, callback: Callable) -> Array:
	var result = []
	for item in array:
		result.append(callback.call(item))
	return result
