# we assume the pic directory locates one level above,
# set up include paths -- places to look for header files
# include path for headers to search in
INCLUDE += -Iinclude
# declare the cpp file base path
VPATH = src 
# declare the build directory
BUILDDIR = build
# include proper libraries etc
# use the g++ 4.8 compiler instead of the defaul apple xcode cli tools installed version (4.2)
COMPILER = /usr/local/gcc/usr/local/bin/g++
# be sure to pass the proper flags to include c++11 support
COMPILERFLAGS = -O3 -std=c++11 $(INCLUDE)

# lets define our cc-compile command to prevent repetitiveness 
define cc-command

	$(COMPILER) -c $(COMPILERFLAGS) $< -o $@ $(LIBRARIES)
	
endef

# initiaalize all files in the classes directory
CPP_FILES := $(wildcard src/classes/*.cpp) $(wildcard src/modules/*.cpp)

# object files are created via the substitution path
OBJECTS = $(patsubst src/%.cpp, $(BUILDDIR)/%.o, $(CPP_FILES))

# initialize the output program variable
PROGRAM = current

# declare the classes build command!
$(BUILDDIR)/%.o: %.cpp
	# cc command is generic for all objects being created
	$(cc-command) 	

# compile all
all: $(OBJECTS)

	$(COMPILER) $(COMPILERFLAGS) -o $(PROGRAM) src/main.cpp $(OBJECTS) $(LIBRARIES)

# a simple test for the vpath -- working now!
test.o: classes/test.cpp
	g++ -c $^ -o $@

# debug compiation -- takes slightly longer
debug: src/main.cpp 

	$(COMPILER) $(COMPILERFLAGS) -g -o $(PROGRAM) src/main.cpp src/modules/*.cpp 

# clean up after ourselves
clean:
	-rm -rf *.o *~ .*~ $(PROGRAM)
	-rm -rf src/*.o src/*~
	rm $(OBJECTS)
