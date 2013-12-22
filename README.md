sc-pp
=====

SC Preprocessor

## Building

**These instructions are for Linux**

To build sc-pp, you need phl environment. Using installation script is the recommended way.

### Installing PHL environment

#### Using installation script

```
~ $ mkdir phl
~ $ cd phl
~/phl $ wget -nv -O installphl.sh [http://www.kaivos.org/doc/phl/installphl.sh.all]
~/phl $ bash installphl.sh
```

#### Manual download

Look more information from [http://www.kaivos.org/doc/phl/phl.html]

### Download libraries

Download phl::lang::collections -library.

```
wget -nv -O lib/phl/lang/collections.phl [http://www.kaivos.org/doc/phl/src-1.2.6/phl/lang/collections.phl]
wget -nv -O lib/phl/lang/arrays.phl [http://www.kaivos.org/doc/phl/src-1.2.6/phl/lang/arrays.phl]
```

### Compiling

Using script:

```
tools/compile.sh src/pp_main.phl sc_pp
```

Manually: TODO

## Using SC Preprocessor

### Directives

Following directives are supported:

#### #define

Defines a new macro. Works like in CPP.

Simple macro:

```
#define NAME BODY
```

Macro with parameters:

```
#define NAME(ARGS) BODY
```

No space can exist between NAME and (.

Preprocessor replaces all occurances of NAME with BODY.

```
#define PI 3.14

PI*2 ; 3.14*2

#define MAX(x,y) ((x)<(y)?(y):(x))

MAX(a,b) ; ((a)<(b)?(b):(a))
```

#### #undefine

```
#undefine NAME
```

Undefines NAME.

#### #ifdef

```
#ifdef MACRO
IF-BLOCK
#endif
```

Removes the if-block if macro does not exist.

#### #ifndef

```
#ifndef MACRO
IF-BLOCK
#endif
```

Removes the if-block if macro does exist.
