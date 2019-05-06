##
## Auto Generated makefile by CodeLite IDE
## any manual changes will be erased      
##
## Release
ProjectName            :=ascii
ConfigurationName      :=Release
WorkspacePath          :=/home/love/Documents/skola/EDA482/LV3/codelite
ProjectPath            :=/home/love/Documents/skola/EDA482/LV3/codelite/ascii
IntermediateDirectory  :=./Release
OutDir                 := $(IntermediateDirectory)
CurrentFileName        :=
CurrentFilePath        :=
CurrentFileFullPath    :=
User                   :=Love Lyckaro
Date                   :=05/01/19
CodeLitePath           :=/home/love/.codelite
LinkerName             :=/usr/bin/arm-none-eabi-g++
SharedObjectLinkerName :=/usr/bin/arm-none-eabi-g++ -shared -fPIC
ObjectSuffix           :=.o
DependSuffix           :=.o.d
PreprocessSuffix       :=.i
DebugSwitch            :=-g 
IncludeSwitch          :=-I
LibrarySwitch          :=-l
OutputSwitch           :=-o 
LibraryPathSwitch      :=-L
PreprocessorSwitch     :=-D
SourceSwitch           :=-c 
OutputFile             :=$(IntermediateDirectory)/$(ProjectName).a
Preprocessors          :=$(PreprocessorSwitch)NDEBUG 
ObjectSwitch           :=-o 
ArchiveOutputSwitch    := 
PreprocessOnlySwitch   :=-E
ObjectsFileList        :="ascii.txt"
PCHCompileFlags        :=
MakeDirCommand         :=mkdir -p
LinkOptions            :=  
IncludePath            :=  $(IncludeSwitch). $(IncludeSwitch). $(IncludeSwitch)/home/love/Documents/skola/EDA482/libs/include 
IncludePCH             := 
RcIncludePath          := 
Libs                   := $(LibrarySwitch)GPIO $(LibrarySwitch)delay 
ArLibs                 :=  "GPIO" "delay" 
LibPath                := $(LibraryPathSwitch). $(LibraryPathSwitch)/home/love/Documents/skola/EDA482/libs/lib 

##
## Common variables
## AR, CXX, CC, AS, CXXFLAGS and CFLAGS can be overriden using an environment variables
##
AR       := /usr/bin/arm-none-eabi-ar rcu
CXX      := /usr/bin/arm-none-eabi-g++
CC       := /usr/bin/arm-none-eabi-gcc
CXXFLAGS :=  -O2 $(Preprocessors)
CFLAGS   :=  -O2 -mthumb -W -march=armv6-m -msoft-float -Wa,-adhln=test.s $(Preprocessors)
ASFLAGS  := 
AS       := /usr/bin/arm-none-eabi-as


##
## User defined environment variables
##
CodeLiteDir:=/usr/share/codelite
lib_destination:=/home/love/Documents/skola/EDA482/libs/lib/
include_destination:=/home/love/Documents/skola/EDA482/libs/include/
Objects0=$(IntermediateDirectory)/libascii.c$(ObjectSuffix) 



Objects=$(Objects0) 

##
## Main Build Targets 
##
.PHONY: all clean PreBuild PrePreBuild PostBuild MakeIntermediateDirs
all: $(IntermediateDirectory) $(OutputFile)

$(OutputFile): $(Objects)
	@$(MakeDirCommand) $(@D)
	@echo "" > $(IntermediateDirectory)/.d
	@echo $(Objects0)  > $(ObjectsFileList)
	$(AR) $(ArchiveOutputSwitch)$(OutputFile) @$(ObjectsFileList) $(ArLibs)
	@$(MakeDirCommand) "/home/love/Documents/skola/EDA482/LV3/codelite/.build-release"
	@echo rebuilt > "/home/love/Documents/skola/EDA482/LV3/codelite/.build-release/ascii"

PostBuild:
	@echo Executing Post Build commands ...
	cp Release/ascii.a /home/love/Documents/skola/EDA482/libs/lib/libascii.a
	cp libascii.h /home/love/Documents/skola/EDA482/libs/include/
	@echo Done

MakeIntermediateDirs:
	@test -d ./Release || $(MakeDirCommand) ./Release


./Release:
	@test -d ./Release || $(MakeDirCommand) ./Release

PreBuild:


##
## Objects
##
$(IntermediateDirectory)/libascii.c$(ObjectSuffix): libascii.c $(IntermediateDirectory)/libascii.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/home/love/Documents/skola/EDA482/LV3/codelite/ascii/libascii.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/libascii.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/libascii.c$(DependSuffix): libascii.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/libascii.c$(ObjectSuffix) -MF$(IntermediateDirectory)/libascii.c$(DependSuffix) -MM libascii.c

$(IntermediateDirectory)/libascii.c$(PreprocessSuffix): libascii.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/libascii.c$(PreprocessSuffix) libascii.c


-include $(IntermediateDirectory)/*$(DependSuffix)
##
## Clean
##
clean:
	$(RM) -r ./Release/


