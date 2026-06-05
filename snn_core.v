`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.06.2026 10:15:46
// Design Name: 
// Module Name: snn_core
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
module snn_core
(
    input clk,
    input rst,

    input spike_valid,
    input [7:0] spike_id,

    output spike_out_valid,
    output [7:0] spike_out_id
);

wire [15:0] membrane_old;
wire [15:0] membrane_new;

wire [15:0] weight;

wire spike_fire;

neuron_state_ram state_ram
(
    .clk(clk),
    .we(1'b1),
    .addr(spike_id),
    .din(membrane_new),
    .dout(membrane_old)
);

weight_memory weights
(
    .clk(clk),
    .addr({8'd0,spike_id}),
    .weight(weight)
);

lif_compute neuron
(
    .membrane_in(membrane_old),
    .weight_in(weight),
    .membrane_out(membrane_new),
    .spike_out(spike_fire)
);

assign spike_out_valid = spike_fire;
assign spike_out_id    = spike_id;

endmodule