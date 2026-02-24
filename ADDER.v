module BTAdder (input [31:0] BT_in1,
                 input [31:0] BT_in2,
                 output [31:0] Branch_Target);
assign Branch_Target = BT_in1 + BT_in2 ;
 endmodule 