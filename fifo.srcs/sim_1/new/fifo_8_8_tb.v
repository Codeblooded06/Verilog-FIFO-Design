`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.10.2026 21:29:33
// Design Name: 
// Module Name: fifo_8_8_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module fifo_8_8_tb();
reg clk,rst,wr_en,rd_en;
reg [7:0] data_in;
wire [7:0] data_out;
wire full,empty;
fifo_8_8 dut (
.clk(clk),
.rst(rst),
.wr_en(wr_en),
.rd_en(rd_en),
.data_in(data_in),
.full(full),
.empty(empty),
.data_out(data_out)
);
initial begin 
clk=0; rst=0;
wr_en = 0; rd_en=0;
data_in = 0;
end
always #5 clk = ~clk;
initial begin
rst =1;
#10 rst = 0;

@(negedge clk);
wr_en = 1;
data_in = 8'd5;

@(negedge clk);
data_in =8'd10;

@(negedge clk);
data_in = 8'd50;

@(negedge clk);
data_in = 8'd50;

@(negedge clk);
data_in = 8'd50;

@(negedge clk);
data_in = 8'd50;

@(negedge clk);
data_in = 8'd50;

@(negedge clk);
data_in = 8'd50;

@(negedge clk);
data_in = 8'd50;

@(negedge clk);
wr_en = 0;
rd_en = 1;

repeat (8) @(negedge clk);
rd_en = 0;
#10 ;
$finish;
end
endmodule
