#!/usr/bin/env bash
ctags -f cstdlib.tags \
  --c-kinds=+p \
  --fields=+iaS \
  --extras=+q \
  --language-force=C \
  $(find /usr/include -maxdepth 1 -name "assert.h" -o -name "complex.h" -o -name "ctype.h" -o -name "errno.h" -o -name "fenv.h" -o -name "float.h" -o -name "inttypes.h" -o -name "iso646.h" -o -name "limits.h" -o -name "locale.h" -o -name "math.h" -o -name "setjmp.h" -o -name "signal.h" -o -name "stdalign.h" -o -name "stdarg.h" -o -name "stdatomic.h" -o -name "stdbool.h" -o -name "stddef.h" -o -name "stdint.h" -o -name "stdio.h" -o -name "stdlib.h" -o -name "stdnoreturn.h" -o -name "string.h" -o -name "tgmath.h" -o -name "threads.h" -o -name "time.h" -o -name "uchar.h" -o -name "wchar.h" -o -name "wctype.h")

