`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.06.2026 10:08:43
// Design Name: 
// Module Name: neuron_state_ram
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
module neuron_state_ram #
(
    parameter WIDTH = 16,
    parameter DEPTH = 256,
    parameter ADDR_WIDTH = 8
)
(
    input clk,

    input we,

    input [ADDR_WIDTH-1:0] addr,

    input [WIDTH-1:0] din,

    output reg [WIDTH-1:0] dout
);

reg [WIDTH-1:0] mem [0:DEPTH-1];

always @(posedge clk)
begin
    if(we)
        mem[addr] <= din;

    dout <= mem[addr];
end

endmodule

