module traffic_light_controller(Ta,Tb,reset,clk,Ra,Ga,Ya,Rb,Gb,Yb);

output reg Ra,Ga,Ya,Rb,Gb,Yb;

input Ta,Tb;
input clk;
input reset;

reg [1:0] cst,nst;

parameter S0 = 2'b00, //unable to run system verilog, i am using the normal verilog.
	  S1 = 2'b01,
	  S2 = 2'b10,
	  S3 = 2'b11;

always @(cst or Ta or Tb)
 begin
 case(cst)
	S0 : if(Ta == 1'b1)
		begin
		nst = cst;
		Ga = 1;
		Ra = 0;
		Ya = 0;
		Gb = 0;
		Rb = 1;
		Yb = 0;
		end
	     else
		begin
		nst = S1;
		Ga = 0;
		Ra = 0;
		Ya = 1;
		Gb = 0;
		Rb = 1;
		Yb = 0;
		end

	S1 : 	begin
		nst = S2;
		Ga = 0;
		Ra = 1;
		Ya = 0;
		Gb = 1;
		Rb = 0;
		Yb = 0;
		end

	S2 : if(Tb == 1'b1)
		begin
		nst = cst;
		Ga = 0;
		Ra = 1;
		Ya = 0;
		Gb = 1;
		Rb = 0;
		Yb = 0;
		end
	     else
		begin
		nst = S3;
		Ga = 0;
		Ra = 1;
		Ya = 0;
		Gb = 0;
		Rb = 0;
		Yb = 1;
		end

	S3 : 	begin
		nst = S0;
		Ga = 1;
		Ra = 0;
		Ya = 0;
		Gb = 0;
		Rb = 1;
		Yb = 0;
		end
	default : nst = S0;
 endcase 
 end

always@(posedge clk)
begin
 if(reset)
	cst <= S0;
 else
	cst <= nst;
end

endmodule


module lfsr (clk, rst,x,y);

  output reg x,y;
  reg [4:0] out1,out2;
  input clk, rst;

  wire feedback1,feedback2;

  assign feedback1 = ~(out1[4] ^ out1[2]);
  assign feedback2 = ~(out2[4] ^ out2[1] ^ out2[2]);
always @(posedge clk, posedge rst)
  begin
    if (rst)
      begin
      out1 = 5'b0;
      out2 = 5'b0;
      end
    else
      begin
      out1 <= {out1[3:0],feedback1};
      out2 <= {out2[3:0],feedback2};
      x = feedback1;
      y = feedback2;
      end
  end

endmodule


