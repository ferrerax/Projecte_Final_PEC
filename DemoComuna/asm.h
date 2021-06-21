#define ENTRY(name) \
  .globl name; \
    .type name, @function; \
    .align 0; \
  name:
