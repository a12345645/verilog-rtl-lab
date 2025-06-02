SIM=iverilog
VVP=vvp

RTL=rtl/adder.v
TB=tb/adder_tb.v
SRC=$(TB) $(RTL)

TARGET=sim/adder
SYNTH_OUT=synth/adder_synth.v

.PHONY: all clean synth

all: $(TARGET)
	$(VVP) $(TARGET)
	make synth

$(TARGET): $(SRC)
	mkdir -p sim
	$(SIM) -o $(TARGET) $(SRC)

synth: $(RTL)
	rm -rf synth
	mkdir -p synth
	yosys -p "read_verilog $(RTL); synth -top adder; write_verilog $(SYNTH_OUT)"

clean:
	rm -rf sim
	rm -rf synth
