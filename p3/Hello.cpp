#include "llvm/Pass.h"
#include "llvm/IR/Function.h"
#include "llvm/Support/raw_ostream.h"

using namespace llvm;

namespace {
  struct Hello : public FunctionPass {
    static char ID;
    Hello() : FunctionPass(ID) {}

    virtual bool runOnFunction(Function &F) {
      errs() << "Hello: ";
      errs() << F.getName() << '\n';
      return false;
    }

	virtual bool teste(){
		Instruction * I;
		for (Instruction::op_iterator o = I->op_begin, oe = I->op_end; o != oe; ++o){
			Value * v = *o;
			if (isa<Instruction>(*v) || isa<Argument>(*v)){
				I->mayHaveSideEffects();
			}
		}
	}
  };
}

char Hello::ID = 0;
static RegisterPass<Hello> X("hello", "Hello World Pass", false, false);
