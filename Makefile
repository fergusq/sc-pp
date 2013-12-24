PHL_JAR=tools/phl.jar
PHL_PATH=src
PHLC_FLAGS=--path $(PHL_PATH)
MAIN=src/pp_main.phl
OUT=sc-pp

all:
	java -cp $(PHL_JAR) org.kaivos.proceedhl.parser.ProceedParser $(PHLC_FLAGS) $(MAIN)
	for pil in `ls out/*.pil`; do \
		java -cp $(PHL_JAR) org.kaivos.proceed.parser.ProceedParser $(PILC_FLAGS) --target gas --out $$pil.asm $$pil; \
		as -o $$pil.o $$pil.asm; done
	gcc -c -o out/phlcil.o src-c/cil.c
	gcc -g -o $(OUT) -L"library" out/*.o -lgc

clear:
	rm out/*.o out/*.asm out/*.pil
