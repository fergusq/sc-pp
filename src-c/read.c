#include <stdio.h>
#define PHL_STRING char*
#define PHL_ANY void*
#define PHL_VOID void
#define PHL_INTEGER long

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

PHL_VOID err_println(PHL_STRING s) {fprintf(stderr,"%s\n",s);}
