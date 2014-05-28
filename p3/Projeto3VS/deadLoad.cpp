#include "llvm/Pass.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/Instruction.h"
#include "llvm/IR/Instructions.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Support/InstIterator.h"

using namespace llvm;

namespace {
	struct DeadLoad : public FunctionPass {
		static char ID;
		DeadLoad() : FunctionPass(ID) {}
		
		virtual bool runOnFunction(Function &F) {
			bool ret = false;
			Function * func = &F;
			for (inst_iterator I = inst_begin(func), E = inst_end(func); I != E;){
				int flag = 0;
				if (isa<StoreInst>(*I)){
					Value * op1 = I->getOperand(1);
					errs() << "OP1: " << op1->getName() << "\n";
					inst_iterator Inext = I;
					++Inext;
					if (isa<LoadInst>(*Inext)){
						Value * op2 = Inext->getOperand(0);
						//errs() << "OP2: " << op2->getName() << "\n";
						if (op1->getValueID() == op2->getValueID()){
							Inext->replaceAllUsesWith(I->getOperand(0));
							++I;
							++I;
							Inext->eraseFromParent();
							errs() << "Removeu\n";
							ret = true;
						}
						else{
							++I;
							if (I == E){
								return ret;
							}
						}
					}
					else{
						++I;
						if (I == E){
							return ret;
						}
					}
				}
				else{
					++I;
					if (I == E){
						return ret;
					}
				}
			}
			return ret;
		}

		/*virtual bool teste(){
			Instruction * I;
			for (Instruction::op_iterator o = I->op_begin, oe = I->op_end; o != oe; ++o){
				Value * v = *o;
				if (isa<Instruction>(*v) || isa<Argument>(*v)){
					I->mayHaveSideEffects();
				}
			}
		}*/
	};
}

char DeadLoad::ID = 0;
static RegisterPass<DeadLoad> X("deadLoad", "DeadLoadPass", false, false);
