#pragma once

#include <stdlib.h>

#define dynamic_array_struct(type, counter_type) \
	{                                            \
		type		*data;                       \
		counter_type size;                       \
		counter_type capacity;                   \
	}

#define dummy_dynamic_array_init(array)                 \
	do                                                  \
	{                                                   \
		array.data	   = malloc(sizeof(array.data[0])); \
		array.size	   = 0;                             \
		array.capacity = 1;                             \
	} while (0)

#define dummy_dynamic_array_push_back(array, value)                                   \
	do                                                                                \
	{                                                                                 \
		if (array.size >= array.capacity)                                             \
		{                                                                             \
			array.capacity *= 2;                                                      \
			array.data = realloc(array.data, sizeof(array.data[0]) * array.capacity); \
		}                                                                             \
		array.data[array.size++] = value;                                             \
	} while (0)

#define dummy_dynamic_array_pop_back(array)                                           \
	do                                                                                \
	{                                                                                 \
		if (--array.size > array.capacity / 2)                                        \
		{                                                                             \
			array.capacity /= 2;                                                      \
			array.data = realloc(array.data, sizeof(array.data[0]) * array.capacity); \
		}                                                                             \
	} while (0)

#define dummy_dynamic_array_destroy(array) \
	do                                     \
	{                                      \
		free(array.data);                  \
	} while (0)

#define dynamic_array_init(array)			  dummy_dynamic_array_init((array))
#define dynamic_array_push_back(array, value) dummy_dynamic_array_push_back((array), (value))
#define dynamic_array_pop_back(array)		  dummy_dynamic_array_pop_back((array))
#define dynamic_array_destroy(array)		  dummy_dynamic_array_destroy((array))
