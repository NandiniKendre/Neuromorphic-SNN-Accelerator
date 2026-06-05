`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.06.2026 10:10:19
// Design Name: 
// Module Name: weight_bram
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

module weight_memory #
(
    parameter WIDTH = 16,
    parameter ADDR_WIDTH = 16
)
(
    input clk,

    input [ADDR_WIDTH-1:0] addr,

    output reg [WIDTH-1:0] weight
);

reg [WIDTH-1:0] mem [0:(1<<ADDR_WIDTH)-1];

integer i;

initial
begin
    for(i=0;i<(1<<ADDR_WIDTH);i=i+1)
        mem[i] = 16'd1;
end

always @(posedge clk)
begin
    weight <= mem[addr];
end

endmodule