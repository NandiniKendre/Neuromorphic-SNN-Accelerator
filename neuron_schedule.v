`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.06.2026 10:08:07
// Design Name: 
// Module Name: neuron_schedule
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

module scheduler #
(
    parameter ADDR_WIDTH = 8
)
(
    input clk,
    input rst,

    input enable,

    output reg [ADDR_WIDTH-1:0] neuron_id
);

always @(posedge clk)
begin
    if(rst)
        neuron_id <= 0;
    else if(enable)
        neuron_id <= neuron_id + 1'b1;
end

endmodule