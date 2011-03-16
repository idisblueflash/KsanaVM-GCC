//main loop of Ksana Minimal Virtual Machine
//release under GPL 3.0
//yap 2007.12.20

#include <stdio.h>
#include "headers/vm.h"
#include "headers/lesson.h"

void main()
{
	char cmd [1024];            // buffer to hold input command
	KsanaVm *vm;               // the instance of virtual machine
	vm=KVMCreate();          // create the virtual machine

	memset(cmd,0,sizeof(cmd));

	puts("Tutorial of Ksana Minimal Virtual Machine");
	puts("http://tutor.ksana.tw");

	while (1) {
		printf("ok>");                    // the command prompt
		gets_s(cmd, sizeof(cmd));   // get the command from console
		KVMSetTib(vm,cmd);         // set it as Vm's terminal input buffer

		lesson1(vm);
		//lesson2(vm);
		//lesson3(vm);
	
		if (vm->terminate) break;
	}

	KVMFree(vm);             // free the virtual machine
}
