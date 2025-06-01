SIM=iverilog
VVP=vvp

TARGET=sim/adder
SRC=tb/adder_tb.v rtl/adder.v

all:
	mkdir -p sim
	$(SIM) -o $(TARGET) $(SRC)
	$(VVP) $(TARGET)
