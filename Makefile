LLVM_CONFIG?=llvm-config

SRC_DIR=./p3
PASS_SO=Release/P3.so

CPP_FILES=$(wildcard $(SRC_DIR)/*.cpp)
OBJ_FILES=$(addprefix $(SRC_DIR)/, $(notdir $(CPP_FILES:.cpp=.o)))

LOADABLE_MODULE_OPTIONS=-shared -Wl,-O1

CXX=g++
COMMON_FLAGS=-Wall -Wextra -fvisibility=hidden
CXXFLAGS+=$(COMMON_FLAGS) $(shell $(LLVM_CONFIG) --cxxflags)


CPP_OPTIONS+=$(CPPFLAGS) $(shell $(LLVM_CONFIG) --cppflags) \
	     -MD -MP -I$(SRC_DIR)

LD_OPTIONS+=$(LDFLAGS) $(shell $(LLVM_CONFIG) --ldflags)

default: $(PASS_SO)

$(SRC_DIR)/%.o : %.cpp
	@echo Compiling $*.cpp for `$(LLVM_CONFIG) --build-mode` build
	$(QUIET)$(CXX) -c $(CPP_OPTIONS) $(CXXFLAGS) $<

$(PASS_SO): $(OBJ_FILES) 
	@echo Linking $@
	$(QUIET)$(CXX) -o $@ $(LOADABLE_MODULE_OPTIONS) $(CXXFLAGS) \
	$(LD_OPTIONS) $(OBJ_FILES)

clean::
	$(QUIET)rm -f $(SRC_DIR)/*.o $(PASS_SO)


