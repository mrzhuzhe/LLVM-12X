.PHONY: all test golden debug comapre
baseline:
	../../build/bin/llc -march=cpu0 -relocation-model=pic \
	-debug-only=isel \
	-filetype=asm mul.ll -o outputs/mul.s

baseline-debug:
	gdb \
	--ex "b FastISel::selectOperator" \
	--args ../../build/bin/llc -march=cpu0 -relocation-model=pic \
	--view-legalize-dags \
	-debug-only=isel \
	-stop-after=finalize-isel \
	-filetype=asm mul.ll -o outputs/mul.s

test:
	../../build/bin/llc -march=cpu0 -relocation-model=pic \
	-debug-only=isel \
	-filetype=asm sqsum.ll -o outputs/sqsum.s

# --ex="b BinaryOperator::AssertOK" \
-debug-only=isel
# interger overflow https://zh.wikipedia.org/zh-cn/%E6%95%B4%E6%95%B0%E6%BA%A2%E5%87%BA

debug:
	gdb \
	--ex "b SelectionDAGISel::CannotYetSelect" \
	--args ../../build/bin/llc -march=cpu0 -relocation-model=pic \
	--view-legalize-dags \
	-debug \
	-stop-after=finalize-isel \
	-filetype=asm sqsum.ll -o outputs/sqsum.s