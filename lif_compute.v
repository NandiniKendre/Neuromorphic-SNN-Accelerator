`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.06.2026 10:07:36
// Design Name: 
// Module Name: lif_compute
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

module lif_compute #
(
    parameter WIDTH      = 16,
    parameter THRESHOLD = 16'd1,
    parameter LEAK       = 16'd1
)
(
    input  [WIDTH-1:0] membrane_in,
    input  [WIDTH-1:0] weight_in,

    output reg [WIDTH-1:0] membrane_out,
    output reg             spike_out
);

reg [WIDTH-1:0] temp;

always @*
begin
    if(membrane_in > LEAK)
        temp = membrane_in - LEAK;
    else
        temp = 0;

    temp = temp + weight_in;

    if(temp >= THRESHOLD)
    begin
        membrane_out = 0;
        spike_out    = 1'b1;
    end
    else
    begin
        membrane_out = temp;
        spike_out    = 1'b0;
    end
end

endmodule