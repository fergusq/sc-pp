PHL_JAR=tools/phl.jar
PHL_PATH=src
PHLC_FLAGS=--path $(PHL_PATH)
MAIN=src/pp_main.phl
OUT=sc-pp

all: cil.o cil_io.o
	java -cp $(PHL_JAR) org.kaivos.proceedhl.parser.ProceedParser $(PHLC_FLAGS) $(MAIN)
	cd out; \
	for pil in `ls *.pil`; do \
		java -cp ../$(PHL_JAR) org.kaivos.proceed.parser.ProceedParser $(PILC_FLAGS) --target gas --out $$pil.asm $$pil; \
		as -o ../$$pil.o $$pil.asm; done
	gcc -g -o $(OUT) -L"library" *.o -lgc

%.o: src-c/%.c
	$(CC) $(CFLAGS) -B src-c -c $< -o $@

clear:
	rm *.o out/*.asm out/*.pil
