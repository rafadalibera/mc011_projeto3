#include "llvm/Pass.h"
#include "llvm/IR/Function.h"
#include "llvm/Support/raw_ostream.h"

using namespace llvm;

namespace {
  struct printCFG : public FunctionPass {
    static char ID;
    printCFG() : FunctionPass(ID) {}

    virtual bool runOnFunction(Function &F) {
	  F.viewCFG(); 
      return false;
    }
  };
}

char printCFG::ID = 0;
static RegisterPass<printCFG> X("printCFG", "Print CFG Pass", false, false);
