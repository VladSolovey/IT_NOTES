SELECT DISTINCT eav_color.value
FROM entity e 
  INNER JOIN entity_attribute_value eav_type ON e.id = eav_type.entity_id
  INNER JOIN entity_attribute ea_type ON eav_type.entity_attribute_id = ea_type.id
  INNER JOIN entity_attribute_value eav_color ON e.id = eav_color.entity_id
  INNER JOIN entity_attribute ea_color ON eav_color.entity_attribute_id = ea_color.id
WHERE ea_type.name = 'type' AND eav_type.value = 'T-Shirt' AND ea_color.name = 'color';


тест