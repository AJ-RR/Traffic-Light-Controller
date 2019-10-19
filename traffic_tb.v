module traffic_tb;

reg Ta,Tb,clk,reset;

wire Ga,Ra,Ya,Gb,Rb,Yb;

reg rst;
wire x,y;

integer z;

lfsr m2
(clk, rst,x,y);


traffic_light_controller m1(Ta,Tb,reset,clk,Ra,Ga,Ya,Rb,Gb,Yb);
initial

begin

reset = 0; clk = 0; Ta = 0; Tb = 0;rst = 1;
#15;

rst = 0;
#200;
end
always
begin
z = 0;
$monitor($time,,,"clk = %b",clk,,"Ta = %b",Ta,,"Tb = %b",Tb,,"Ra = %b",Ra,,"Ya = %b",Ya,,"Ga = %b",Ga,,"Rb = %b",Rb,,"Yb = %b",Yb,,"Gb = %b",Gb);
while(z < 10)
 begin
 #10;
 Ta = x;Tb = y;
 z = z + 1;
 end



end
always
#5 clk =~clk;
initial
#100 $finish;
endmodule

