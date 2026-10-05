# lzsse: needs SSE4.1 and a 64-bit CPU, so it is only built when the compiler
# flags target one (e.g. MOREFLAGS="-march=native")
CODECS += LZSSE

ifeq ($(BUILD_ARCH),32-bit)
    DONT_BUILD_LZSSE ?= 1
endif
ifneq ($(shell $(CXX) $(filter-out $(DEPFLAGS),$(CXXFLAGS)) -dM -E -x c++ - </dev/null 2>/dev/null | grep -Ec '__(SSE4_1|x86_64)__'), 2)
    DONT_BUILD_LZSSE ?= 1
endif

LZSSE_OBJS  := lz/lzsse/lzsse2/lzsse2.o lz/lzsse/lzsse4/lzsse4.o lz/lzsse/lzsse8/lzsse8.o
