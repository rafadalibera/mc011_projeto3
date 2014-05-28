#include "llvm/Pass.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/Instruction.h"
#include "llvm/ADT/StringExtras.h"
#include "llvm/ADT/Statistic.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Support/InstIterator.h"
#include "llvm/ADT/DenseMap.h"
#include "llvm/IR/User.h"
#include "llvm/IR/Instructions.h"
#include <set>
#include "llvm/ADT/SmallVector.h"
#include "llvm/Support/CFG.h"
#include <set>

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
  class genKill
  {
  public:
	  std::set<Instruction *>gen;
	  std::set<Instruction *>kill;
  };

  class beforeAfter {
  public:
	  std::set<Instruction*> before;
	  std::set<Instruction*> after;
  };

  void computeBBGenKill(Function &F, DenseMap<BasicBlock *, genKill> &bbMap){

  }
}

char Hello::ID = 0;
static RegisterPass<Hello> X("hello", "Hello World Pass", false, false);
