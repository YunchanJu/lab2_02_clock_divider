`timescale 1ns/1ps
module lab2_clock_divider(input wire clk,rst,button,input wire [7:0] sw,output wire [7:0] led);
wire reset,press; wire [7:0] switches;
input_frontend inputs(clk,rst,button,sw,reset,press,switches);
wire d2,d10,d50,d1000,tick;
clock_divider #(.DIVISOR(2)) ratio2(.clk(clk),.rst(reset),.divided(d2),.tick());
clock_divider #(.DIVISOR(10)) ratio10(.clk(clk),.rst(reset),.divided(d10),.tick());
clock_divider #(.DIVISOR(50)) ratio50(.clk(clk),.rst(reset),.divided(d50),.tick());
clock_divider #(.DIVISOR(1000)) ratio1000(.clk(clk),.rst(reset),.divided(d1000),.tick(tick));
assign led={3'b0,tick,d1000,d50,d10,d2};
endmodule
