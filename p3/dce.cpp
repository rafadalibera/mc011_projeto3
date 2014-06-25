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

#include <unistd.h>
#include <stdio.h>
#include <string.h>

using namespace llvm;

namespace {
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
		std::list<Instruction *> In;
		std::list<Instruction *> Out;
		Instruction * kill;
		Instruction * inst;
	};

	void PrintInst (std::list<Instruction *> lista) {
		for (std::list<Instruction*>::iterator in = lista.begin(); in != lista.end(); in++) {
			errs() << (*in)->getName() << " ";
		}
		errs() << "\n";
	}

	void computeBBGenKill(Function &F, std::list<BasicBlockInfo> &basicBlocksList)
	{
		for (Function::iterator b = F.begin(), e = F.end(); b != e; ++b) {
			genKill s;
			BasicBlockInfo bb;
			bb.bloco = &*b;

			for (BasicBlock::iterator i = b->begin(), e = b->end(); i != e; ++i) {

				unsigned n = i->getNumOperands();
				for (unsigned j = 0; j < n; j++) {
					Value *v = i->getOperand(j);
					if (isa<Instruction>(v)) {
						Instruction *op = cast<Instruction>(v);
						if (!s.kill.count(op)){
							if (!s.gen.count(op)) {
								s.gen.insert(op);
								bb.gen.push_back(op);								
							}
						}
					}
				}

				if (!(*i).getName().empty()){
					s.kill.insert(&*i);
					bb.kill.push_back(&*i);
				}
			}
			basicBlocksList.push_back(bb);

		}
	}

	std::list<Instruction *> FazerUniao(std::list<Instruction *> l1, std::list<Instruction *> l2){

	std::list<Instruction *> retorno;
	for (std::list<Instruction *>::iterator del1 = l1.begin(); del1 != l1.end(); ++del1)
		{
			bool teste = false;
			for (std::list<Instruction *>::iterator del2 = l2.begin(); del2 != l2.end(); ++del2)
			{
				if (((*del2)->getName()).compare((*del1)->getName()) == 0){
					teste = true;
				}
			}
			if (!teste){
				retorno.push_back((*del1));
			}
		}
		for (std::list<Instruction *>::iterator del2 = l2.begin(); del2 != l2.end(); ++del2)
		{
			retorno.push_back((*del2));
		}
		return retorno;
	}

	std::list<Instruction *> SubtracaoConjunto(std::list<Instruction *> out, std::list<Instruction *>kill){
		std::list<Instruction *> retorno;
		for (std::list<Instruction *>::iterator var1 = out.begin(); var1 != out.end(); ++var1)
		{
			bool teste = false;
			for (std::list<Instruction *>::iterator var2 = kill.begin(); var2 != kill.end(); ++var2)
			{
				if (((*var2)->getName()).compare((*var1)->getName()) == 0){
					teste = true;
				}
			}
			if (!teste){
				retorno.push_back((*var1));
			}
		}
		return retorno;
	}

	BasicBlockInfo * RetornaBasicBlockInfoPorBasicBlock(std::list<BasicBlockInfo> lista, BasicBlock *bb){
		for (std::list<BasicBlockInfo>::iterator it = lista.begin(); it != lista.end(); ++it){
			if (&*it->bloco == bb){
				return &*it;
			}
		}
		return NULL;
	}

	std::list<BasicBlockInfo> ComputeInOut(std::list<BasicBlockInfo> bbInfoList){
		bool rodar = false;
		bool saida = true;
		do{

			rodar = false;

			for (std::list<BasicBlockInfo>::reverse_iterator ret = bbInfoList.rbegin(); ret != bbInfoList.rend(); ++ret)
			{
				if (saida == true) {
					saida = false;
				} else {
					BasicBlockInfo temp;
					std::list<Instruction *> novoOut;
					std::list<Instruction *> novoIn;
					
					int count = 0;
					for (succ_iterator suc = succ_begin(ret->bloco), E = succ_end(ret->bloco); suc != E; ++suc){
						novoOut = FazerUniao(novoOut, RetornaBasicBlockInfoPorBasicBlock(bbInfoList, *suc)->in);
						count++;
					}

					novoIn = FazerUniao(ret->gen, SubtracaoConjunto(ret->out, ret->kill));
					if (novoIn.size() != ret->in.size()){
						rodar = true;
					}

					temp.in = novoIn;
					temp.out = novoOut;
					temp.gen = ret->gen;
					temp.kill = ret->kill;
					temp.bloco = ret->bloco;

					*ret = temp;
				}	
			}

		} while (rodar);
		std::list<BasicBlockInfo> retorno;
		for (std::list<BasicBlockInfo>::iterator n = bbInfoList.begin(); n != bbInfoList.end(); ++n) {
			retorno.push_back(*n);
		}
		return retorno;
	}

	bool TestaSeEstaNaLista(std::list<Instruction *> lista, Instruction* inst){
		if (inst == NULL){
			return true;
		}
		for (std::list<Instruction *>::iterator it = lista.begin(); it != lista.end(); ++it){
			if (((*it)->getName()).compare(inst->getName()) == 0){
				return true;
			}
		}
		return false;
	}

	std::list<Instruction *> CalculaGenInstrucao(Instruction * inst){
		std::list<Instruction *> retorno;

		unsigned n = inst->getNumOperands();
		for (unsigned j = 0; j < n; j++) {
			Value *v = inst->getOperand(j);
			if (isa<Instruction>(v)) {
				Instruction *op = cast<Instruction>(v);
				retorno.push_back(op);
			}
		}
		return retorno;
	}

	Instruction * CalculaKill(Instruction * inst){
		if (inst->getName() != ""){
			return inst;
		}
		return NULL;
	}

	std::list<Instruction *> PreencheOutBlock(BasicBlockInfo bbinfo){
		std::list<Instruction *> retorno;
		for (std::list<Instruction *>::iterator it = bbinfo.out.begin(); it != bbinfo.out.end(); ++it){
			unsigned n = (*it)->getNumOperands();
			for (unsigned j = 0; j < n; j++) {
				Value *v = (*it)->getOperand(j);
				if (isa<Instruction>(v)) {
					Instruction *op = cast<Instruction>(v);
					retorno.push_back(op);
				}
			}
		}
		return retorno;
	}

	void LivenessAnalysis(BasicBlockInfo bbinfo){
		std::list<InstructionInfo> infoInstructions;
		std::list<Instruction *> outBlock = bbinfo.out;
		for (BasicBlock::reverse_iterator ri = bbinfo.bloco->rbegin(); ri != bbinfo.bloco->rend(); ++ri){
			std::list<Instruction *> genLocal = CalculaGenInstrucao(&*ri);
			Instruction * killLocal = CalculaKill(&*ri);
			std::list<Instruction *> killLocalList;
			if (killLocal != NULL){

				killLocalList.push_back(killLocal);
			}

			std::list<Instruction *> inLocal = FazerUniao(genLocal, SubtracaoConjunto(outBlock, killLocalList));
			InstructionInfo temp;
			temp.In = inLocal;
			temp.Out = outBlock;
			temp.inst = &*ri;
			temp.kill = killLocal;
			infoInstructions.push_back(temp);
			outBlock = inLocal;
		}

		for (std::list<InstructionInfo>::iterator instr = infoInstructions.begin(); instr != infoInstructions.end(); ++instr)
		{
			if (!TestaSeEstaNaLista((*instr).Out, (*instr).kill)){
				if (!(*instr).inst->mayHaveSideEffects()){
					errs() << "Removeu " << (*instr).inst->getName() << "<--------------------------------------------------- \n";
					(*instr).inst->eraseFromParent();
				}
			}
		}
	}


	struct DCE : public FunctionPass {
		static char ID;
		DCE() : FunctionPass(ID) {}

		virtual bool runOnFunction(Function &F) {
			
			std::list<BasicBlockInfo> listaGlobalBB;
			computeBBGenKill(F, listaGlobalBB);
			errs() << "Computando funcao " << F.getName() << "\n";

			listaGlobalBB = ComputeInOut(listaGlobalBB);
			
			bool ret = false;
			for (std::list<BasicBlockInfo>::iterator bb = listaGlobalBB.begin(); bb != listaGlobalBB.end(); ++bb)
			{
				LivenessAnalysis((*bb));
				ret = true;
			}
			return ret;
		}
	};
}

char DCE::ID = 0;
static RegisterPass<DCE> X("dce2", "DeadCodeElimination", false, false);
