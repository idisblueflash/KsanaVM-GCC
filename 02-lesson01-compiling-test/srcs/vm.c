/*
Ksana Minimal Virtual Machine
yap 2007.12.17
*/

#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include "../headers/vm.h"


/* --------------------------Lesson 1 ------------------------*/
//constructor 
KsanaVm *KVMCreate()
{
	KsanaVm *vm;
	vm=(KsanaVm*)(malloc(sizeof(KsanaVm)));
	memset(vm,0,sizeof(KsanaVm));
	vm->sp=-1;
	return vm;
}
//destructor
KVMFree(KsanaVm *vm)
{
	free(vm);
}

KVMSetTib(KsanaVm *vm, char *tib)
{
	vm->tib=tib;
	vm->ntib=0;
}

/* get a token from tib, delimiter by space character (ascii <=32) */
int KVMNextToken(KsanaVm *vm)
{
	char *ptib,*ptoken;
	if (!vm->tib) return 0; // nothing to process

	ptib=vm->tib+vm->ntib;


	while (*ptib && *ptib <=' ') {
		ptib++;  // skip the leading delimiter
	}
	
	ptoken=vm->token;
	while (*ptib && *ptib>' ') {
		*ptoken++ = *ptib++;
		if ((ptoken-vm->token)>=sizeof(vm->token)-1) break;  // check if exceed maximum token
	}
	*ptoken=0;  // ending null byte

	vm->ntib = ptib-vm->tib ;//update the consumed index

	return *(vm->token);  // return true if token length>0 ( not null string)
}


/* --------------------------Lesson 2 ------------------------*/

void KVMPush(KsanaVm *vm, int v)
{
	if ( (vm->sp)  >= STACK_DEPTH) {
		puts("Stack Overflow");
		return;
	}
	vm->sp++;
	vm->datastack[vm->sp]=v;
}
int KVMPop(KsanaVm *vm)
{
	int v;
	if ( vm->sp  < 0 ) {
		puts("Stack under flow");
		return 0;
	}

	v= vm->datastack[vm->sp];
	vm->sp--;
	return v;
}

//macro for getting the Top-Of-Stack
#define KVMTOS(vm)  ((vm)->datastack[(vm)->sp])


// pop two item , do multiplication and push back
// stack effect diagram ( n1 n2 -- r )
void KVMAdd(KsanaVm *vm)
{
	int n1,n2 ,r ;
	n2=KVMPop(vm);    // pop second operand
	n1=KVMPop(vm);    // pop first operand
	r= n1+n2;              // do addition
	KVMPush(vm,  r );   // push to stack
}

// pop two item , do multiplication and push back
// ( n1 n2 -- r )
void KVMMultiply(KsanaVm *vm)
{
	int n1,n2 ,r ;
	n2=KVMPop(vm);    // pop second operand
	n1=KVMPop(vm);    // pop first operand
	r= n1*n2;              // do multiplication
	KVMPush(vm,  r );   // push to stack
}
void KVMDumpStack(KsanaVm *vm)
{
	int i;
	char buf[2048];
	char str[16];

	if (vm->sp<0) {
		puts("Empty stack");
		return;
	}
	memset(buf,0,sizeof(buf));
	memset(str,0,sizeof(str));

	strncat(buf,"stack:",sizeof(buf));
	for (i=0;i<=vm->sp;i++)
	{
		itoa(vm->datastack[i],str,10);
		strncat(buf,str,sizeof(buf));
		strncat(buf," ",sizeof(buf));
	}
	puts(buf);
}

/* --------------------------Lesson 3 ------------------------*/

/* add a new word  */
void KVMAddWord(KsanaVm *vm, char *name, KVMXT xt)
{
	if( vm->nword>=MAXWORD) {
		puts("too many words!");
		return;
	}

	strncpy( vm->vectors[vm->nword].name, name, MAXNAMELEN);
	vm->vectors[vm->nword].xt = xt;

	vm->nword++;
}

/* given a name , return the execution vector , return NULL if not found*/
KVMXT KVMFindWord(KsanaVm *vm,char *name)
{
	int i;
	KsanaWord *word;
	for (i=vm->nword;i>=0;i--) {  // scan from bottom, newly added word.
		word = &(vm->vectors[i]);
		if (strcmp(word->name, name)==0) return word->xt;
	}
	return NULL;
}


// ( n -- n n )
void KVMDup(KsanaVm *vm)
{
	if ( (vm->sp)  >= STACK_DEPTH) {
		puts("Stack Overflow");
		return;
	}
	KVMPush(vm, KVMTOS(vm));
}
// ( n -- )
void KVMDrop(KsanaVm *vm)
{
	KVMPop(vm);
}
// ( n1 n2 -- n2 n1 )
void KVMSwap(KsanaVm *vm)
{
	int temp;
	if (vm->sp<1) {
		puts("need at least 2 items on stack");
		return;
	}

	temp=KVMTOS(vm);
	KVMTOS(vm)=((vm)->datastack[(vm)->sp-1]);
	((vm)->datastack[(vm)->sp-1]) = temp;
}

// ( n1 n2 -- n1 n2 n1 )
void KVMOver(KsanaVm *vm)
{
	int temp;
	if (vm->sp<1) {
		puts("need at least 2 items on stack");
		return;
	}

	temp=((vm)->datastack[(vm)->sp-1]);
	KVMPush(vm,temp);
}


void KVMMinus(KsanaVm *vm)
{
	int n1,n2 ,r ;
	n2=KVMPop(vm);    // pop second operand
	n1=KVMPop(vm);    // pop first operand
	r= n1-n2;              // do addition
	KVMPush(vm,  r );   // push to stack
}

// pop two item , do division and push back
// ( n1 n2 -- r )
void KVMDivide(KsanaVm *vm)
{
	int n1,n2 ,r ;
	n2=KVMPop(vm);    // pop second operand
	n1=KVMPop(vm);    // pop first operand
	r= n1 /n2;              // do multiplication
	KVMPush(vm,  r );   // push to stack
}
void KVMBye(KsanaVm *vm)
{
	vm->terminate=1;
}
