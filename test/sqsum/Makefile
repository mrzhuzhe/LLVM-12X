.PHONY: all test golden debug comapre
all:
	echo "all"
test:
	../../build/bin/llc -march=cpu0 -relocation-model=pic \
	--view-legalize-dags \
	-debug-only=isel \
	-stop-after=finalize-isel \
	-filetype=asm sqsum.ll -o outputs/sqsum.s

debug:
	gdb --ex "b LLParser::parseInstruction" \
	--args ../../build/bin/llc -march=cpu0 -relocation-model=pic \
	-view-legalize-dags \
	-debug-only=isel \
	-stop-after=finalize-isel \
	-filetype=asm sqsum.ll -o outputs/sqsum.s