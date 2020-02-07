RTL_SRC = ../rtl/
MODEL_SRC = ../model/

IF = input_if.sv \
	output_if.sv
RTL =  ../../hw-sim/stochastic-manual/mux2.v \
	../../hw-sim/stochastic-manual/mux4.v \
	../../hw-sim/stochastic-manual/stochFunction.v \
	../../hw-sim/stochastic-manual/stochLFSR8bit.v \
	../../hw-sim/stochastic-manual/stochLFSR16bit.v \
	../../hw-sim/stochastic-manual/stochWrapper.v


REFMOD = ../model/refmod.cpp
PKGS = ./my_pkg.sv 

INCLUDES = /usr/include/python3.6m/
INCLUEDE_CONFIG = /usr/include/python3.6m/config-3.6m

export PYTHONHOME=/mnt/hdd1tera/iuri/.local/lib/python3.6:/usr/lib64/python3.6:../model
export PYTHONPATH=/mnt/hdd1tera/iuri/.local/lib/python3.6:/usr/lib64/python3.6:../model


SEED = 100
COVER = 100
TRANSA = 5000

RUN_ARGS_COMMON = -access +r -input shm.tcl \
          +uvm_set_config_int=*,recording_detail,1 -coverage all -covoverwrite

sim:
	@export PATH=$(echo "$PATH" | sed -e 's/\/usr\/local\/mentor\/calibre\/aoj\_cal\_2019.1\_29.17\/bin://')
	@g++ -g -fPIC -Wall -std=c++0x ${REFMOD} -I"/usr/include/python3.6m"  -Wno-unused-result \
	-Wsign-compare -O2 -pipe -Wp,-D_FORTIFY_SOURCE=2 -fexceptions -fstack-protector-strong --param=ssp-buffer-size=4 \
	-grecord-gcc-switches -m64 -mtune=generic -D_GNU_SOURCE  \
	-fwrapv -L/usr/lib64 -L"/usr/include/python3.6m/config-3.6m" -l"python3.6m" \
	-lpthread -ldl  -lutil -lm  -Xlinker -export-dynamic -shared -o test.so
	@xrun -64bit -uvm  +incdir+$(RTL_SRC) $(IF) $(RTL) $(PKGS) top.sv -sv_lib test.so \
	+UVM_TESTNAME=simple_test -covtest simple_test-$(SEED) -svseed $(SEED)  \
	-defparam top.min_cover=$(COVER) -defparam top.min_transa=$(TRANSA) $(RUN_ARGS_COMMON) $(RUN_ARGS)

clean:
	@rm -rf INCA_libs waves.shm rtlsim/* *.history *.log rtlsim/* *.key mdv.log imc.log imc.key ncvlog_*.err *.trn *.dsn .simvision/ xcelium.d simv.daidir *.so *.o *.err

rebuild: clean sim

view_waves:
	simvision waves.shm &

view_cover:
	imc &