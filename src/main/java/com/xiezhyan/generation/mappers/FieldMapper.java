package com.xiezhyan.generation.mappers;

import java.util.List;
import java.util.Map;

import com.xiezhyan.generation.entity.Fields;

public interface FieldMapper {

	List<Fields> findFieldByTable(Map<String,String> map);
}
