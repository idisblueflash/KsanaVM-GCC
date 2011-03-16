CMAKE_MINIMUM_REQUIRED(VERSTION 2.6) #cmake的最低版本需求
PROJECT(HELLO) #项目名称
AUX_SOURCE_DIRECTORY(. SRC_LIST)   #把当前目录(.)下所有源代码文件和头文件加入变量SRC_LIST
#生成应用程序 hello (在windows下会自动生成hello.exe)
ADD_EXECUTABLE(hello ${SRC_LIST})



