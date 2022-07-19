# Verilog-code-for-Multiplier
Here the Verilog code in dataflow model for the multiplier block is given with testbench

// Multiplier Dataflow
module multiplier_4bit(A,B,O);
  input [3:0]A,B;
  output [7:0]O;
  
  wire [3:0] m0;
  wire [4:0] m1;
  wire [5:0] m2;
  wire [6:0] m3;
  wire [7:0] s1,s2,s3;
  
  assign m0={4{B[0]}} & A[3:0];
  assign m1={4{B[1]}} & A[3:0];
  assign m2={4{B[2]}} & A[3:0];
  assign m3={4{B[3]}} & A[3:0];
  
  assign s1=m0+(m1<<1);
  assign s2=s1+(m2<<2);
  assign s3=s2+(m3<<3);
  assign O=s3;
endmodule

//  testbench 
module multiplier_4bit_tb;
  reg [3:0]A,B;
  wire [7:0]O;
  
  multiplier_4bit dut(A,B,O);
  
  initial begin
    #5 A=4'b1110;
    #5 B=4'b1101;
    #10
    #5 A=4'b1110;
    #5 B=4'b1111;
  end
  
  initial begin
    $monitor("time=%t,A=%d,B=%d,O=%d",$time,A,B,O);
    #80 $finish;
  end
  
  initial begin
    $dumpfile("multiplier.vcd");
    $dumpvars(0,multiplier_4bit_tb);
  end
endmodule
