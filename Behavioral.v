// Multiplier behavioural
module multiplier4bit(A,B,Y);
    input [3:0]A,B;
    output [7:0]Y;
  
  integer i=0;
  
  always @(A or B)
    begin
      Y=0;
      for(i=0;i<4;i++)
        begin 
          if(B[i]==1)
            Y=Y+(A<<i);
          else
            Y=Y;
        end
    end 
endmodule

// testbench
module multiplier4bit_tb;
  reg  [3:0]A,B;
  wire [7:0]O;
  multiplier4bit mul4(.A(A),.B(B),.Y(O));
      initial begin
      #5 A=4'b1110;
      #5 B=4'b1101;
      #10
      #5 A=4'b1110;
      #5 B=4'b1111;
      end
     initial begin
       $monitor("time=%t,A=%b,B=%b,Y=%b",$time,A,B,Y);
         #80 $finish;
     end
     initial begin
         $dumpfile("multiplier4bit.vcd");
         $dumpvars(0,multiplier4bit_tb);
     end
endmodule
