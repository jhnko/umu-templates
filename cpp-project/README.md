# Project name

## Building the program

The following command produces a release optimized binary:

```sh
just build
```

## Project template

This template supports a sensible project structure.

- The `main()` function is found in `src/main.cpp`, as it should be.
- When adding new C++ source files (.cpp), add the file paths relative to the src/ folder in the `SRC` list in CMakeLists.txt, So for the file `src/bacon/ham.cpp`, just add `bacon/ham.cpp` below `main.cpp`. 
- Include a header file `foo/bar/baz.hpp` from `bacon/ham.cpp` simply by writing:
  ```cpp
  #include "foo/bar/baz.hpp"
  ```
- The project's compiler is specified in `CmakePresets.json`. If you are using another compiler than your project peers use `CmakeUserPresets.json` instead.
