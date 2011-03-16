#cmake最低版本需求，不加入此行会受到警告信息
CMAKE_MINIMUM_REQUIRED(VERSION 2.6) 
PROJECT(KsanaVM) #项目名称
# add the binary tree to the search path for include files
# so that we will find TutorialConfig.h
include_directories("${PROJECT_BINARY_DIR/headers}")

#把当前目录(.)下所有源代码文件和头文件加入变量SRC_LIST
AUX_SOURCE_DIRECTORY(. SRC_LIST) 
#生成应用程序 ksanavm 
ADD_EXECUTABLE(ksanavm ${SRC_LIST})

