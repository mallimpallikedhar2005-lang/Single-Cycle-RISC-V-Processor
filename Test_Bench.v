module testbench_single_cycle_RISC ;
reg clk;
reg reset;

single_cycle_risc dut (.clk(clk), .reset(reset) );

initial begin
clk =0;
forever #5 clk = ~clk;
end

initial begin
reset = 1;
#30;
reset = 0;
end

initial begin
#300;
$stop;
end
endmodule 
