`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.06.2026 10:09:49
// Design Name: 
// Module Name: spike_router
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
module spike_router
(
    input clk,

    input spike_in,

    input [7:0] neuron_id,

    output reg fifo_wr,

    output reg [7:0] fifo_data
);

always @(posedge clk)
begin
    fifo_wr   <= spike_in;
    fifo_data <= neuron_id;
end

endmodule