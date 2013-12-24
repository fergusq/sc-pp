sc-pp
=====

SC Preprocessor. A derivate of the preprocessor included with the SC Interpreter (<https://github.com/fergusq/sc-interpreter/>).
The lexer does not remove spaces from the code, and thinks any character not in range a-z, A-Z or 0-9 as token separator.

## Building

**These instructions are for Linux**

To build sc-pp, you need phl environment. Using installation script is the recommended way.

### Downloading sources

Cloning git-repository:

```
$ git clone https://github.com/fergusq/sc-pp.git
```

### Installing PHL environment

#### Using installation script

```
$ cd sc-pp
sc-pp $ wget -nv -O installphl.sh http://www.kaivos.org/doc/phl/installphl.sh.all
sc-pp $ bash installphl.sh
```

#### Manual download

Look more information from <http://www.kaivos.org/doc/phl/phl.html>

### Install libraries

PHL implementation uses Boehm-Demers-Weiser as garbage collector. <http://www.hpl.hp.com/personal/Hans_Boehm/gc/>

In Debian systems (Ubuntu, Mint, etc) bdwgc is usually in package libgc.

```
sudo apt-get install libgc
```

### Compiling

Using script:

```
PHLC_FLAGS="--path src" tools/compile.sh src/pp_main.phl sc-pp
```

Manually: TODO

## Using SC Preprocessor

### Comments

Comment character is ;. Newline terminates comment.

```
not_comment ; comment
not_comment
```

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
