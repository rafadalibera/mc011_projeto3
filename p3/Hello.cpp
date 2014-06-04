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
	class genKill {
	public:
		std::set<Instruction*> gen;
		std::set<Instruction*> kill;
	};

	class BasicBlockInfo
	{
	public:
		std::list<Instruction*> gen;
		std::list<Instruction*> kill;
		std::list<Instruction*> in;
		std::list<Instruction*> out;
		BasicBlock * bloco;
	};

	class InstructionInfo{
	public:
		std::list<Use *> In;
		std::list<Use *> Out;
		Use * kill;
		Instruction * inst;
	};

	void computeBBGenKill(Function &F, std::list<BasicBlockInfo> &basicBlocksList)
	{
		for (Function::iterator b = F.begin(), e = F.end(); b != e; ++b) {
			genKill s;
			BasicBlockInfo bb;
			bb.bloco = b;

			for (BasicBlock::iterator i = b->begin(), e = b->end(); i != e; ++i) {
				// The GEN set is the set of upwards-exposed uses:
				// pseudo-registers that are used in the block before being
				// defined. (Those will be the pseudo-registers that are defined
				// in other blocks, or are defined in the current block and used
				// in a phi function at the start of this block.) 
				unsigned n = i->getNumOperands();
				for (unsigned j = 0; j < n; j++) {
					Value *v = i->getOperand(j);
					if (isa<Instruction>(v)) {
						Instruction *op = cast<Instruction>(v);
						if (!s.kill.count(op)){
							s.gen.insert(op);
							bb.gen.push_back(op);
						}
					}
				}
				// For the KILL set, you can use the set of all instructions
				// that are in the block (which safely includes all of the
				// pseudo-registers assigned to in the block).
				s.kill.insert(&*i);
				bb.kill.push_back(&*i);
			}
			basicBlocksList.push_back(bb);
		}
	}

	std::list<Instruction *> FazerUniao(std::list<Instruction *> l1, std::list<Instruction *> l2){
		std::list<Instruction *> retorno;
		for each (Instruction * del1 in l1)
		{
			bool teste = false;
			for each (Instruction * del2 in l2)
			{
				if (del2->getValueID() == del1->getValueID()){
					teste = true;
				}
			}
			if (!teste){
				retorno.push_back(del1);
			}
		}
		for each (Instruction * del2 in l2)
		{
			retorno.push_back(del2);
		}
		return retorno;
	}

	std::list<Use *> FazerUniao(std::list<Use *> l1, std::list<Use *> l2){
		std::list<Use *> retorno;
		for each (Use * del1 in l1)
		{
			bool teste = false;
			for each (Use * del2 in l2)
			{
				if (del2->getUser()->getValueID() == del1->getUser()->getValueID()){
					teste = true;
				}
			}
			if (!teste){
				retorno.push_back(del1);
			}
		}
		for each (Use * del2 in l2)
		{
			retorno.push_back(del2);
		}
		return retorno;
	}

	std::list<Instruction *> SubtracaoConjunto(std::list<Instruction *> in, std::list<Instruction *>kill){
		std::list<Instruction *> retorno;

		for each (Instruction * var1 in in)
		{
			bool teste = false;
			for each (Instruction * var2 in kill)
			{
				if (var2->getValueID() == var1->getValueID()){
					teste = true;
				}
			}
			if (!teste){
				retorno.push_back(var1);
			}
		}
		return retorno;
	}

	std::list<Use *> SubtracaoConjunto(std::list<Use *> in, std::list<Use *>kill){
		std::list<Use *> retorno;

		for each (Use * var1 in in)
		{
			bool teste = false;
			for each (Use * var2 in kill)
			{
				if (var2->getUser()->getValueID() == var1->getUser()->getValueID()){
					teste = true;
				}
			}
			if (!teste){
				retorno.push_back(var1);
			}
		}
		return retorno;
	}

	std::list<Instruction *> InterseccaoConjuntos(std::list<Instruction *> l1, std::list<Instruction *> l2){
		std::list<Instruction *> retorno;
		for each (Instruction * var1 in l1)
		{
			bool teste = false;
			for each (Instruction * var2 in l2)
			{
				if (var2->getValueID() == var1->getValueID()){
					teste = true;
				}
			}
			if (teste){
				retorno.push_back(var1);
			}
		}
		return retorno;
	}

	BasicBlockInfo * RetornaBasicBlockInfoPorBasicBlock(std::list<BasicBlockInfo> lista, BasicBlock *bb){
		for (std::list<BasicBlockInfo>::iterator it = lista.begin(); it != lista.end(); ++it){
			if (it->bloco->getValueID() == bb->getValueID()){
				return &*it;
			}
		}
		return NULL;
	}

	void ComputeInOut(std::list<BasicBlockInfo> bbInfoList){
		for (std::list<BasicBlockInfo>::reverse_iterator ret = bbInfoList.rbegin(); ret != bbInfoList.rend(); ++ret)
		{
			std::list<Instruction *> uniao;
			int numIn;
			int numOut;
			do {
				numIn = ret->in.size();
				numOut = ret->out.size();
				for (succ_iterator suc = succ_begin(ret->bloco), E = succ_end(ret->bloco); suc != E; ++suc){
					uniao = FazerUniao(uniao, RetornaBasicBlockInfoPorBasicBlock(bbInfoList, *suc)->in);
				}
				ret->out = uniao;

				ret->in = FazerUniao(ret->gen, SubtracaoConjunto(ret->out, ret->kill));

			} while (numIn != ret->in.size() && numOut != ret->out.size());
		}
	}

	bool TestaSeEstaNaLista(std::list<Instruction *> lista, Instruction* inst){
		for (std::list<Instruction *>::iterator it = lista.begin(); it != lista.end(); ++it){
			if ((*it)->getValueID() == inst->getValueID()){
				return true;
			}
		}
		return false;
	}

	bool TestaSeEstaNaLista(std::list<Use *> lista, Use* inst){
		for (std::list<Use *>::iterator it = lista.begin(); it != lista.end(); ++it){
			if ((*it)->getUser()->getValueID() == inst->getUser()->getValueID()){
				return true;
			}
		}
		return false;
	}

	std::list<Use *> PreencheOutBlock(BasicBlockInfo bbinfo){
		std::list<Use *> retorno;
		for (std::list<Instruction *>::iterator it = bbinfo.out.begin(); it != bbinfo.out.end(); ++it){
			for (Instruction::op_iterator opi = (*it)->op_begin(); opi != (*it)->op_end(); ++opi){
				retorno.push_back(opi);
			}
		}
		return retorno;
	}

	void LivenessAnalysis(BasicBlockInfo bbinfo){
		std::list<InstructionInfo> infoInstructions;
		std::list<Use *> outBlock = PreencheOutBlock(bbinfo);
		for (BasicBlock::reverse_iterator ri = bbinfo.bloco->rbegin; ri != bbinfo.bloco->rend(); ++ri){
			std::list<Use *> genLocal = CalculaGenInstrucao(&*ri);
			Use * killLocal = CalculaKill(&*ri);
			std::list<Use *> killLocalList;
			killLocalList.push_back(killLocal);
			std::list<Use *> inLocal = FazerUniao(genLocal, SubtracaoConjunto(outBlock, killLocalList));
			InstructionInfo temp;
			temp.In = inLocal;
			temp.Out = outBlock;
			temp.inst = &*ri;
			temp.kill = killLocal;
			infoInstructions.push_back(temp);
			outBlock = inLocal;
		}

		for each (InstructionInfo instr in infoInstructions)
		{
			if (!TestaSeEstaNaLista(instr.Out, instr.kill)){
				if (!instr.inst->mayHaveSideEffects()){
					instr.inst->removeFromParent();
				}
			}
		}
	}

	std::list<Use *> CalculaGenInstrucao(Instruction * inst){
		std::list<Use *> retorno;
		for (Instruction::op_iterator it = inst->op_begin(); it != inst->op_end(); ++it){
			retorno.push_back(it);
		}
		return retorno;
	}

	Use * CalculaKill(Instruction * inst){
		Use * retorno = dyn_cast<Use>(&inst);
		if (inst->getName() != ""){
			return retorno;
		}
		return NULL;
	}
}

char Hello::ID = 0;
static RegisterPass<Hello> X("hello", "Hello World Pass", false, false);
