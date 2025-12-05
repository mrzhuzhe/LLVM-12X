 // https://llvm.org/docs/WritingAnLLVMNewPMPass.html
#include "llvm/Transforms/Utils/Helloworld.h"

using namespace llvm;

PreservedAnalyses HelloWorldPass::run(Function &F,
                                      FunctionAnalysisManager &AM) {
  errs() << F.getName() << "\n";
  return PreservedAnalyses::all();
}

