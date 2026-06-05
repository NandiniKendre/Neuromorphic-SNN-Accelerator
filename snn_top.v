`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.06.2026 10:09:11
// Design Name: 
// Module Name: snn_top
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

module snn_top
(
    input clk,
    input rst,

    input spike_valid,
    input [7:0] spike_id,

    output spike_out_valid,
    output [7:0] spike_out_id
);

snn_core CORE
(
    .clk(clk),
    .rst(rst),

    .spike_valid(spike_valid),
    .spike_id(spike_id),

    .spike_out_valid(spike_out_valid),
    .spike_out_id(spike_out_id)
);

endmodule
