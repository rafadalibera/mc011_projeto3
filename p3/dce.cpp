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
		//	errs() << "outGen: " << bb.gen.size() << "\n";
			basicBlocksList.push_back(bb);
			/*
			errs() << " ------------- montando bbInfoList ------------- ";
			errs() << "quantidadeIn: " << bb.in.size() << "\n";
			PrintInst(bb.in);
			errs() << "quantidadeRetGen: " << bb.gen.size() << "\n";
			PrintInst(bb.gen);
			errs() << "quantidadeKill: " << bb.kill.size() << "\n";
			PrintInst(bb.kill);
			errs() << "quantidadeOut: " << bb.out.size() << "\n";
			PrintInst(bb.out);
			*/
		}
	}

	std::list<Instruction *> FazerUniao(std::list<Instruction *> l1, std::list<Instruction *> l2){
	//	errs() << "l1Uniao: " << l1.size() << "\n";
	//	errs() << "l2Uniao: " << l2.size() << "\n";
	/*	
	errs() << "FazerUniao\n";
	errs() << "l1: ";
	PrintInst(l1);
	errs() << "l2: ";
	PrintInst(l2);
	*/
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
		/*
		errs() << "retornoTEMP: ";
		PrintInst(retorno);
		*/
		for (std::list<Instruction *>::iterator del2 = l2.begin(); del2 != l2.end(); ++del2)
		{
			retorno.push_back((*del2));
		}
		/*
		errs() << "retorno: ";
		PrintInst(retorno);
		*/
		return retorno;
	}

	std::list<Instruction *> SubtracaoConjunto(std::list<Instruction *> out, std::list<Instruction *>kill){
		std::list<Instruction *> retorno;
		/*
		errs() << "SubtracaoConjunto\n";
		errs() << "out: ";
		PrintInst(out);
		errs() << "kill: ";
		PrintInst(kill);
		*/
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
		/*
		errs() << "retorno: ";
		PrintInst(retorno);
		*/
		return retorno;
	}

	BasicBlockInfo * RetornaBasicBlockInfoPorBasicBlock(std::list<BasicBlockInfo> lista, BasicBlock *bb){
		for (std::list<BasicBlockInfo>::iterator it = lista.begin(); it != lista.end(); ++it){
			//errs() << "hey\n";
			//if (it->bloco->getValueID() == bb->getValueID()){
			//if (it->bloco->getValueID() == bb->getValueID()){
			if (&*it->bloco == bb){
				//errs() << "retornei um BasicBlock, in: " << it->in.size() << "\n";
				//errs() << "retornei um BasicBlock, kill: " << it->kill.size() << "\n";
				//errs() << "retornei um BasicBlock, gen: " << it->gen.size() << "\n";
				//errs() << "retornei um BasicBlock, out: " << it->out.size() << "\n";
				return &*it;
			}
		}
		return NULL;
	}

	std::list<BasicBlockInfo> ComputeInOut(std::list<BasicBlockInfo> bbInfoList){
		bool rodar = false;
		bool saida = true;
		do{
			//errs() << "------------------------------------------------- passo InOut\n";
			//errs() << bbInfoList.size() << "\n";
			//sleep(8);

			rodar = false;

			for (std::list<BasicBlockInfo>::reverse_iterator ret = bbInfoList.rbegin(); ret != bbInfoList.rend(); ++ret)
			{
				if (saida == true) {
					saida = false;
				} else {
					BasicBlockInfo temp;
					std::list<Instruction *> novoOut;
					std::list<Instruction *> novoIn;

					//errs() << "xxx\n";
					/*
					errs() << "quantidadeIn: " << ret->in.size() << "\n";
					PrintInst(ret->in);
					errs() << "quantidadeRetGen: " << ret->gen.size() << "\n";
					PrintInst(ret->gen);
				    errs() << "quantidadeKill: " << ret->kill.size() << "\n";
				    PrintInst(ret->kill);
					errs() << "quantidadeOut: " << ret->out.size() << "\n";
					PrintInst(ret->out);
					*/
					//errs() << "-----------------------\n";
					
					int count = 0;
					for (succ_iterator suc = succ_begin(ret->bloco), E = succ_end(ret->bloco); suc != E; ++suc){
						novoOut = FazerUniao(novoOut, RetornaBasicBlockInfoPorBasicBlock(bbInfoList, *suc)->in);
						count++;
						//errs() << "uniao: " << uniao.size() << "\n"; 
					}
					//errs() << "qtdeSucessores:" << count << "\n";

					//ret->out = uniao;

					novoIn = FazerUniao(ret->gen, SubtracaoConjunto(ret->out, ret->kill));
					/*
					errs() << "novoIn: ";
					PrintInst(novoIn);
					*/
					//errs() << novoIn.size() << "--" << ret->in.size() << "\n";
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
				//ret->in = novoIn;
			}
			/*
			for (std::list<BasicBlockInfo>::reverse_iterator ret = bbInfoList.rbegin(); ret != bbInfoList.rend(); ++ret)
			{
				//errs() << "passo InOut\n";
				errs() << "quantidadeIn: " << ret->in.size() << "\n";
				errs() << "quantidadeRetGen: " << ret->gen.size() << "\n";
			    errs() << "quantidadeKill: " << ret->kill.size() << "\n";
				errs() << "quantidadeOut: " << ret->out.size() << "\n";
				errs() << "-----------------------\n";
				std::list<Instruction *> uniao;
				int count = 0;
				for (succ_iterator suc = succ_begin(ret->bloco), E = succ_end(ret->bloco); suc != E; ++suc){
					uniao = FazerUniao(uniao, RetornaBasicBlockInfoPorBasicBlock(bbInfoList, *suc)->in);
					count++;
				}
				
				//errs() << "qtdeSucessores:" << count << "\n";

				*ret.out = uniao;

				std::list<Instruction *> novoIn;
				novoIn = FazerUniao(ret->gen, SubtracaoConjunto(ret->out, ret->kill));
				if (novoIn.size() != ret->in.size()){
					rodar = true;
				}
				*ret.in = novoIn;
			}
			*/
			//errs() << "novohile\n";
		} while (rodar);
		std::list<BasicBlockInfo> retorno;
		for (std::list<BasicBlockInfo>::iterator n = bbInfoList.begin(); n != bbInfoList.end(); ++n) {
			retorno.push_back(*n);
		}
		return retorno;
	}

	bool TestaSeEstaNaLista(std::list<Instruction *> lista, Instruction* inst){
		//errs() << "Testando presenca na lista instruction * instruction *\n";
		if (inst == NULL){
			return true;
		}
		for (std::list<Instruction *>::iterator it = lista.begin(); it != lista.end(); ++it){
			if (((*it)->getName()).compare(inst->getName()) == 0){
				//errs() << "Fim teste presenca lista instruction * instruction * - success\n";
				return true;
			}
		}
		//errs() << "Fim teste presenca na lista instruction * instruction *\n";
		return false;
	}

	std::list<Instruction *> CalculaGenInstrucao(Instruction * inst){
		std::list<Instruction *> retorno;

		unsigned n = inst->getNumOperands();
		for (unsigned j = 0; j < n; j++) {
			Value *v = inst->getOperand(j);
			if (isa<Instruction>(v)) {
				Instruction *op = cast<Instruction>(v);
			//	errs() << "Instrucao: " << op->getName() << "\n";
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
		//errs() << "bbinfoOut: ";
		//PrintInst(bbinfo.out);
		for (std::list<Instruction *>::iterator it = bbinfo.out.begin(); it != bbinfo.out.end(); ++it){
			unsigned n = (*it)->getNumOperands();
			for (unsigned j = 0; j < n; j++) {
				Value *v = (*it)->getOperand(j);
				if (isa<Instruction>(v)) {
					Instruction *op = cast<Instruction>(v);
				//	errs() << "InstrucaoPreencheOutBlock: " << op->getName() << "\n";
					retorno.push_back(op);
				}
			}
		}
		//errs() << "retorno: ";
		//PrintInst(retorno);
		return retorno;
	}

	void LivenessAnalysis(BasicBlockInfo bbinfo){
		std::list<InstructionInfo> infoInstructions;
	//	errs() << "Preenchendo outBlock\n";
	//	std::list<Instruction *> outBlock = PreencheOutBlock(bbinfo);
		std::list<Instruction *> outBlock = bbinfo.out;
	//	errs() << "Outblock preenchido:" << outBlock.size() << "\n";
	//	errs() << "outBlock: ";
	//	PrintInst(outBlock);
		for (BasicBlock::reverse_iterator ri = bbinfo.bloco->rbegin(); ri != bbinfo.bloco->rend(); ++ri){
	//		errs() << "Iniciando calculo Gen Instrucao:" << ri->getName() << "\n";
			std::list<Instruction *> genLocal = CalculaGenInstrucao(&*ri);
	//		errs() << "Termino calculo Gen instrucao:" << genLocal.size() << "\n";
			Instruction * killLocal = CalculaKill(&*ri);
			std::list<Instruction *> killLocalList;
			if (killLocal != NULL){

				killLocalList.push_back(killLocal);
			}
		//	errs() << "Kills:" << killLocalList.size() << "\n";

			std::list<Instruction *> inLocal = FazerUniao(genLocal, SubtracaoConjunto(outBlock, killLocalList));
			InstructionInfo temp;
			temp.In = inLocal;
		//	errs() << "In: " << temp.In.size() << "\n";
			temp.Out = outBlock;
		//	errs() << "Out: " << temp.Out.size() << "\n";
			temp.inst = &*ri;
			temp.kill = killLocal;
			infoInstructions.push_back(temp);
			outBlock = inLocal;
		}

	//	errs() << "Inicio analise lista\n";
		//bool t = true;
		for (std::list<InstructionInfo>::iterator instr = infoInstructions.begin(); instr != infoInstructions.end(); ++instr)
		{
		//	if (t){
		//		t = false;
		//	}
		//	else{errs() << "quantidadeIn: " << ret->in.size() << "\n";
					//errs() << "-------------------------------\n";
					//errs() << "In: ";
					//PrintInst((*instr).In);
					//errs() << "Gen: ";
					//PrintInst((*instr).gen);
				    if ((*instr).kill != NULL) {
				    	//errs() << "Kill: " << (*instr).kill->getName() << "\n";
				    } else {
				    	//errs() << "Kill: \n";
				    }
					//errs() << "Out: ";
					//PrintInst((*instr).Out);
				if (!TestaSeEstaNaLista((*instr).Out, (*instr).kill)){
					//errs() << "InstrucaoTestaLista:" << (*instr).inst->getName() << "\n";
					if (!(*instr).inst->mayHaveSideEffects()){
						errs() << "Removeu " << (*instr).inst->getName() << "<--------------------------------------------------- \n";
						(*instr).inst->eraseFromParent();
					}
				}
		//	}
		}
	//	errs() << "Termino analise lista\n";
	}


	struct DCE : public FunctionPass {
		static char ID;
		DCE() : FunctionPass(ID) {}

		virtual bool runOnFunction(Function &F) {
			
			std::list<BasicBlockInfo> listaGlobalBB;
			//errs() << "Hello2.0: ";
			//errs() << "-------> " << F.getName() << '\n';
			computeBBGenKill(F, listaGlobalBB);
			errs() << "Computando funcao " << F.getName() << "\n";

			listaGlobalBB = ComputeInOut(listaGlobalBB);
			
			//errs() << listaGlobalBB.size() << "\n";
			bool ret = false;
			for (std::list<BasicBlockInfo>::iterator bb = listaGlobalBB.begin(); bb != listaGlobalBB.end(); ++bb)
			{
				//errs() << "Entrando Passo Liveness\n";
				LivenessAnalysis((*bb));
				//errs() << "Terminado passo Liveness\n";
				ret = true;
			}
			return ret;
		}
	};
}

char DCE::ID = 0;
static RegisterPass<DCE> X("dce2", "DeadCodeElimination", false, false);
