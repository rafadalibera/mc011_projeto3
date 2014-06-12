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
				if (!(*i).getName().empty()){
					s.kill.insert(&*i);
					bb.kill.push_back(&*i);
					//errs() << "nome: " << (*i).getName();
				}
				else{
				}
			}
		//	errs() << "outGen: " << bb.gen.size() << "\n";
			basicBlocksList.push_back(bb);
		}
	}

	std::list<Instruction *> FazerUniao(std::list<Instruction *> l1, std::list<Instruction *> l2){
	//	errs() << "l1Uniao: " << l1.size() << "\n";
	//	errs() << "l2Uniao: " << l2.size() << "\n";
		
		std::list<Instruction *> retorno;
		for (std::list<Instruction *>::iterator del1 = l1.begin(); del1 != l1.end(); ++del1)
		{
			bool teste = false;
			for (std::list<Instruction *>::iterator del2 = l2.begin(); del2 != l2.end(); ++del2)
			{
				if ((*del2)->getValueID() == (*del1)->getValueID()){
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

	std::list<Use *> FazerUniao(std::list<Use *> l1, std::list<Use *> l2){
		std::list<Use *> retorno;
		if (l1.empty()){
		//	errs() << "Lista 1 vazia\n";
		}
		if (l2.empty()){
	//		errs() << "Lista 2 vazia\n";
		}
		for (std::list<Use *>::iterator del1 = l1.begin(); del1 != l1.end(); ++del1)
		{
			bool teste = false;
			for (std::list<Use *>::iterator del2 = l2.begin(); del2 != l2.end(); ++del2)
			{
				if ((*del2)->getUser()->getValueID() == (*del1)->getUser()->getValueID()){
					teste = true;
				}
			}
			if (!teste){
				retorno.push_back((*del1));
			}
		}
		for (std::list<Use *>::iterator del2 = l2.begin(); del2 != l2.end(); ++del2)
		{
			retorno.push_back((*del2));
		}
		return retorno;
	}

	std::list<Instruction *> SubtracaoConjunto(std::list<Instruction *> in, std::list<Instruction *>kill){
		std::list<Instruction *> retorno;

		for (std::list<Instruction *>::iterator var1 = in.begin(); var1 != in.end(); ++var1)
		{
			bool teste = false;
			for (std::list<Instruction *>::iterator var2 = kill.begin(); var2 != kill.end(); ++var2)
			{
				if ((*var2)->getValueID() == (*var1)->getValueID()){
					teste = true;
				}
			}
			if (!teste){
				retorno.push_back((*var1));
			}
		}
		return retorno;
	}
	/*
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
	}*/


	BasicBlockInfo * RetornaBasicBlockInfoPorBasicBlock(std::list<BasicBlockInfo> lista, BasicBlock *bb){
		for (std::list<BasicBlockInfo>::iterator it = lista.begin(); it != lista.end(); ++it){
			if (it->bloco->getValueID() == bb->getValueID()){
				return &*it;
			}
		}
		return NULL;
	}

	void ComputeInOut(std::list<BasicBlockInfo> bbInfoList){
		bool rodar = false;
		do{
			rodar = false;
			for (std::list<BasicBlockInfo>::reverse_iterator ret = bbInfoList.rbegin(); ret != bbInfoList.rend(); ++ret)
			{
				std::list<Instruction *> uniao;
				int count = 0;
				for (succ_iterator suc = succ_begin(ret->bloco), E = succ_end(ret->bloco); suc != E; ++suc){
					uniao = FazerUniao(uniao, RetornaBasicBlockInfoPorBasicBlock(bbInfoList, *suc)->in);
					count++;
				}
				
				errs() << "qtdeSucessores:" << count << "\n";

				ret->out = uniao;

				std::list<Instruction *> novoIn;
				novoIn = FazerUniao(ret->gen, SubtracaoConjunto(ret->out, ret->kill));
			//	errs() << "quantidadeIn: " << novoIn.size() << "\n";
		//		errs() << "quantidadeRetGen: " << ret->gen.size() << "\n";
			//	errs() << "quantidadeKill: " << ret->kill.size() << "\n";
		//		errs() << "ImprimeOut\n";
		//		errs() << "quantidadeOut: " << ret->out.size() << "\n";
				if (novoIn.size() != ret->in.size()){
					rodar = true;
				}
				ret->in = novoIn;
			}
			//errs() << "novohile\n";
		} while (rodar);
	}

	bool TestaSeEstaNaLista(std::list<Instruction *> lista, Instruction* inst){
		//errs() << "Testando presenca na lista instruction * instruction *\n";
		if (inst == NULL){
			return true;
		}
		for (std::list<Instruction *>::iterator it = lista.begin(); it != lista.end(); ++it){
			if ((*it)->getValueID() == inst->getValueID()){
				//errs() << "Fim teste presenca lista instruction * instruction * - success\n";
				return true;
			}
		}
		//errs() << "Fim teste presenca na lista instruction * instruction *\n";
		return false;
	}

	bool TestaSeEstaNaLista(std::list<Use *> lista, Instruction* inst){
		//errs() << "Testando presenca na lista use * instruction *\n";
		for (std::list<Use *>::iterator it = lista.begin(); it != lista.end(); ++it){
			//errs() << "Executando for\n";
			if ((*it) != NULL && inst != NULL){
				if ((*it)->getUser()->getValueID() == inst->getValueID()){
			//		errs() << "Fim teste presenca lista use * instruction * - success\n";
					return true;
				}
			}
			else{
		//		errs() << "Deu NULL\n";
			}
		//	errs() << "Terminando for\n";
		}
		//errs() << "Fim teste presenca lista use * instruction *\n";
		return false;
	}

	std::list<Instruction *> CalculaGenInstrucao(Instruction * inst){
		std::list<Instruction *> retorno;
		/*for (Instruction::op_iterator it = inst->op_begin(); it != inst->op_end(); ++it){
				retorno.push_back(it);
				errs() << "Gen: " << it->getUser()->getName() << "\n";
		}*/

		/*if (!inst->getName().empty()){
			errs() << "Instrucao calculagenkill: " << inst->getName() << " " << inst->getOperand(1)->getName() << "\n";
		}*/

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
		return retorno;
	}

	void LivenessAnalysis(BasicBlockInfo bbinfo){
		std::list<InstructionInfo> infoInstructions;
	//	errs() << "Preenchendo outBlock\n";
		std::list<Instruction *> outBlock = PreencheOutBlock(bbinfo);
	//	errs() << "Outblock preenchido:" << outBlock.size() << "\n";
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
		bool t = true;
		for (std::list<InstructionInfo>::iterator instr = infoInstructions.begin(); instr != infoInstructions.end(); ++instr)
		{
			if (t){
				t = false;
			}
			else{
				if (!TestaSeEstaNaLista((*instr).Out, (*instr).kill)){
					errs() << "InstrucaoTestaLista:" << (*instr).inst->getName() << "\n";
					if (!(*instr).inst->mayHaveSideEffects()){
						errs() << "Removeu " << (*instr).inst->getName() << "\n";
						(*instr).inst->removeFromParent();
					}
				}
			}
		}
	//	errs() << "Termino analise lista\n";
	}


	struct DCE : public FunctionPass {
		static char ID;
		DCE() : FunctionPass(ID) {}

		virtual bool runOnFunction(Function &F) {
			errs() << "Iniciando...\n";
			std::list<BasicBlockInfo> listaGlobalBB;
			errs() << "Hello2.0: ";
			errs() << F.getName() << '\n';
			computeBBGenKill(F, listaGlobalBB);
			errs() << "Computando funcao " << F.getName() << "\n";
			ComputeInOut(listaGlobalBB);
			errs() << "Fim calculo inout\n";
			bool ret = false;
			for (std::list<BasicBlockInfo>::iterator bb = listaGlobalBB.begin(); bb != listaGlobalBB.end(); ++bb)
			{
				errs() << "Entrando Passo Liveness\n";
				LivenessAnalysis((*bb));
				errs() << "Terminado passo Liveness\n";
				ret = true;
			}
			return ret;
		}
	};
}

char DCE::ID = 0;
static RegisterPass<DCE> X("dce2", "DeadCodeElimination", false, false);
