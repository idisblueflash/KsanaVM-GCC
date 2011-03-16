#ifndef KSANA4TH_VM
#define KSANA4TH_VM

struct KsanaVm;
typedef struct KsanaVm KsanaVm;
#define MAXNAMELEN 15
// lesson 3
typedef void (*KVMXT)(KsanaVm *vm);  // the execution vector
typedef struct {
	char name[MAXNAMELEN+1];  // the name
	KVMXT xt;         // the execuate vector
} KsanaWord ;   // Word is the execution unit in ksana virtual machine


/* main structure of Virtual Machine */
struct KsanaVm {
//Lesson 1
	char *tib;             //terminal input buffer, hold the text to be interpreted.
	int ntib;                //consumed index
	char token[1024];  //current token
	int terminate;       // true if VM is terminating 

//Lesson 2
#define STACK_DEPTH 256
	int datastack [STACK_DEPTH]; // the stack
	int sp ;                                  // the stack pointer

//Lesson 3
#define MAXWORD 256
	KsanaWord vectors[MAXWORD];    // array to hold name and execution vector
	int nword;                                   //number of words
} ;

//lesson 1
KsanaVm *KVMCreate();
KVMFree(KsanaVm *vm);
KVMSetTib(KsanaVm *vm, char *tib);
int KVMNextToken(KsanaVm *vm);


//lesson 2
void KVMDumpStack(KsanaVm *vm);
void KVMAdd(KsanaVm *vm);
void KVMMultiply(KsanaVm *vm);
void KVMPush(KsanaVm *vm, int v);
int KVMPop(KsanaVm *vm);

// lesson 3
KVMXT KVMFindWord(KsanaVm *vm,char *name);
void KVMAddWord(KsanaVm *vm, char *name, KVMXT xt);

void KVMMinus(KsanaVm *vm);
void KVMDivide(KsanaVm *vm);
void KVMDup(KsanaVm *vm);
void KVMDrop(KsanaVm *vm);
void KVMSwap(KsanaVm *vm);
void KVMOver(KsanaVm *vm);
void KVMBye(KsanaVm *vm);

#endif