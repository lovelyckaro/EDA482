##
## Auto Generated makefile by CodeLite IDE
## any manual changes will be erased      
##
## Release
ProjectName            :=GPIO
ConfigurationName      :=Release
WorkspacePath          :=/home/love/Documents/skola/EDA482/LV3/codelite
ProjectPath            :=/home/love/Documents/skola/EDA482/LV3/codelite/GPIO
IntermediateDirectory  :=./Release
OutDir                 := $(IntermediateDirectory)
CurrentFileName        :=
CurrentFilePath        :=
CurrentFileFullPath    :=
User                   :=Love Lyckaro
Date                   :=05/02/19
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
ObjectsFileList        :="GPIO.txt"
PCHCompileFlags        :=
MakeDirCommand         :=mkdir -p
LinkOptions            :=  
IncludePath            :=  $(IncludeSwitch). $(IncludeSwitch). 
IncludePCH             := 
RcIncludePath          := 
Libs                   := 
ArLibs                 :=  
LibPath                := $(LibraryPathSwitch). 

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
Objects0=$(IntermediateDirectory)/libGPIO.c$(ObjectSuffix) 



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
	@echo rebuilt > "/home/love/Documents/skola/EDA482/LV3/codelite/.build-release/GPIO"

PostBuild:
	@echo Executing Post Build commands ...
	cp Release/GPIO.a /home/love/Documents/skola/EDA482/libs/lib/libGPIO.a
	cp libGPIO.h /home/love/Documents/skola/EDA482/libs/include/
	@echo Done

MakeIntermediateDirs:
	@test -d ./Release || $(MakeDirCommand) ./Release


./Release:
	@test -d ./Release || $(MakeDirCommand) ./Release

PreBuild:


##
## Objects
##
$(IntermediateDirectory)/libGPIO.c$(ObjectSuffix): libGPIO.c $(IntermediateDirectory)/libGPIO.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/home/love/Documents/skola/EDA482/LV3/codelite/GPIO/libGPIO.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/libGPIO.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/libGPIO.c$(DependSuffix): libGPIO.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/libGPIO.c$(ObjectSuffix) -MF$(IntermediateDirectory)/libGPIO.c$(DependSuffix) -MM libGPIO.c

$(IntermediateDirectory)/libGPIO.c$(PreprocessSuffix): libGPIO.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/libGPIO.c$(PreprocessSuffix) libGPIO.c


-include $(IntermediateDirectory)/*$(DependSuffix)
##
## Clean
##
clean:
	$(RM) -r ./Release/


