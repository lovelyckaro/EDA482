##
## Auto Generated makefile by CodeLite IDE
## any manual changes will be erased      
##
## Debug
ProjectName            :=labb3_3
ConfigurationName      :=Debug
WorkspacePath          :=/home/love/Documents/skola/EDA482/LV3/codelite
ProjectPath            :=/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3
IntermediateDirectory  :=./Debug
OutDir                 := $(IntermediateDirectory)
CurrentFileName        :=
CurrentFilePath        :=
CurrentFileFullPath    :=
User                   :=Love Lyckaro
Date                   :=05/13/19
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
OutputFile             :=$(IntermediateDirectory)/$(ProjectName).elf
Preprocessors          :=$(PreprocessorSwitch)SIMULATOR 
ObjectSwitch           :=-o 
ArchiveOutputSwitch    := 
PreprocessOnlySwitch   :=-E
ObjectsFileList        :="labb3_3.txt"
PCHCompileFlags        :=
MakeDirCommand         :=mkdir -p
LinkOptions            :=  -T$(ProjectPath)/md407-ram.x -L$(ARM_V6LIB) -L$(ARM_GCC_V6LIB) -nostdlib
IncludePath            :=  $(IncludeSwitch). $(IncludeSwitch)/home/love/Documents/skola/EDA482/libs/include $(IncludeSwitch). 
IncludePCH             := 
RcIncludePath          := 
Libs                   := $(LibrarySwitch)GPIO $(LibrarySwitch)delay $(LibrarySwitch)gcc $(LibrarySwitch)c_nano 
ArLibs                 :=  "GPIO" "delay" "gcc" "c_nano" 
LibPath                := $(LibraryPathSwitch). $(LibraryPathSwitch)/home/love/Documents/skola/EDA482/libs/lib 

##
## Common variables
## AR, CXX, CC, AS, CXXFLAGS and CFLAGS can be overriden using an environment variables
##
AR       := /usr/bin/arm-none-eabi-ar rcu
CXX      := /usr/bin/arm-none-eabi-g++
CC       := /usr/bin/arm-none-eabi-gcc
CXXFLAGS :=  -g -O0 -Wall $(Preprocessors)
CFLAGS   :=  -g -O0 -mthumb -Wall -march=armv6-m -msoft-float -Wa,-adhln=test.s $(Preprocessors)
ASFLAGS  := 
AS       := /usr/bin/arm-none-eabi-as


##
## User defined environment variables
##
CodeLiteDir:=/usr/share/codelite
ARM_V6LIB:=$(GccArmDir)/arm-none-eabi/lib/thumb/v6-m
ARM_GCC_V6LIB:=$(GccArmDir)/lib/gcc/arm-none-eabi/7.2.1/thumb/v6-m
ARM_M4FPLIB:=$(GccArmDir)/arm-none-eabi/lib/thumb/v7e-m/fpv4-sp/hard
ARM_GCC_M4FPLIB:=$(GccArmDir)/lib/gcc/arm-none-eabi/7.2.1/thumb/v7e-m
Objects0=$(IntermediateDirectory)/startup.c$(ObjectSuffix) $(IntermediateDirectory)/graphics.c$(ObjectSuffix) 



Objects=$(Objects0) 

##
## Main Build Targets 
##
.PHONY: all clean PreBuild PrePreBuild PostBuild MakeIntermediateDirs
all: $(OutputFile)

$(OutputFile): $(IntermediateDirectory)/.d $(Objects) 
	@$(MakeDirCommand) $(@D)
	@echo "" > $(IntermediateDirectory)/.d
	@echo $(Objects0)  > $(ObjectsFileList)
	$(LinkerName) $(OutputSwitch)$(OutputFile) @$(ObjectsFileList) $(LibPath) $(Libs) $(LinkOptions)

PostBuild:
	@echo Executing Post Build commands ...
	$(GccArmDir)/bin/arm-none-eabi-objcopy -S -O srec  ./Debug/labb3_3.elf ./Debug/labb3_3.s19
	$(GccArmDir)/bin/arm-none-eabi-objdump -D -S ./Debug/labb3_3.elf > ./Debug/labb3_3.dass
	@echo Done

MakeIntermediateDirs:
	@test -d ./Debug || $(MakeDirCommand) ./Debug


$(IntermediateDirectory)/.d:
	@test -d ./Debug || $(MakeDirCommand) ./Debug

PreBuild:


##
## Objects
##
$(IntermediateDirectory)/startup.c$(ObjectSuffix): startup.c $(IntermediateDirectory)/startup.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/startup.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/startup.c$(DependSuffix): startup.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/startup.c$(ObjectSuffix) -MF$(IntermediateDirectory)/startup.c$(DependSuffix) -MM startup.c

$(IntermediateDirectory)/startup.c$(PreprocessSuffix): startup.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/startup.c$(PreprocessSuffix) startup.c

$(IntermediateDirectory)/graphics.c$(ObjectSuffix): graphics.c $(IntermediateDirectory)/graphics.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/graphics.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/graphics.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/graphics.c$(DependSuffix): graphics.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/graphics.c$(ObjectSuffix) -MF$(IntermediateDirectory)/graphics.c$(DependSuffix) -MM graphics.c

$(IntermediateDirectory)/graphics.c$(PreprocessSuffix): graphics.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/graphics.c$(PreprocessSuffix) graphics.c


-include $(IntermediateDirectory)/*$(DependSuffix)
##
## Clean
##
clean:
	$(RM) -r ./Debug/


