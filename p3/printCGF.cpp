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
	struct printCFG : public FunctionPass {
		static char ID;
		printCFG() : FunctionPass(ID) {}

		virtual bool runOnFunction(Function &F) {
			F.viewCFG();
			return false;
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
char printCFG::ID = 0;
static RegisterPass<printCFG> X("printCFG", "Print CFG Pass", false, false);
