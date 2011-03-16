/* lesson 4 
  the Dictionary

yap 2007.12.17 release under GPL 3.0

*/

#include "vm.h"
#include <stdio.h>
#include <string.h>

int lesson4(KsanaVm *vm)
{	
	// fetch all token , and print it out
	while ( KVMNextToken(vm) ) {
		puts(vm->token);
		if (strcmp(vm->token,"bye")==0) return 1;
	}
	return 0;
}		