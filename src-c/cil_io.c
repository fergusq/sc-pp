#include <stdio.h>
#include "phl.h"

PHL_ANY read_char() {
	char c = getchar();
	return c;
}

PHL_STRING read_file(PHL_STRING file_name) {
	PHL_STRING s;
	long size;
	FILE *file = fopen(file_name, "rb");
	fseek(file, 0, SEEK_END);
	size = ftell(file);
	rewind(file);
	s = malloc(size * (sizeof(char)));
	fread(s, sizeof(char), size, file);
	fclose(file);
	return s;
}
