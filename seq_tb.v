module zero_one_detector_tb;

reg a,clk,reset;
wire y;

zero_one_detector m1(a,reset,clk,y);
initial

begin

reset = 0; clk = 0; a = 0;

$monitor($time,,,"clk = %b",clk,,"A = %b",a,,"y = %b",y);
#10 a = 1;
#10 a = 0;
#10 a = 0;
#10 a = 1;
#10 a = 1;
#10 a = 0;
#10 a = 1;

end
always
#5 clk =~clk;
initial
#100 $finish;
endmodule
