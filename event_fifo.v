`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.06.2026 10:07:05
// Design Name: 
// Module Name: event_fifo
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

module event_fifo #
(
    parameter WIDTH = 8,
    parameter DEPTH = 16,
    parameter PTR_WIDTH = 4
)
(
    input clk,
    input rst,

    input wr_en,
    input rd_en,

    input [WIDTH-1:0] din,

    output reg [WIDTH-1:0] dout,

    output full,
    output empty
);

reg [WIDTH-1:0] mem [0:DEPTH-1];

reg [PTR_WIDTH-1:0] wr_ptr;
reg [PTR_WIDTH-1:0] rd_ptr;

reg [PTR_WIDTH:0] count;

assign full  = (count == DEPTH);
assign empty = (count == 0);

always @(posedge clk)
begin
    if(rst)
    begin
        wr_ptr <= 0;
        rd_ptr <= 0;
        count  <= 0;
    end
    else
    begin
        if(wr_en && !full)
        begin
            mem[wr_ptr] <= din;
            wr_ptr <= wr_ptr + 1'b1;
            count <= count + 1'b1;
        end

        if(rd_en && !empty)
        begin
            dout <= mem[rd_ptr];
            rd_ptr <= rd_ptr + 1'b1;
            count <= count - 1'b1;
        end
    end
end

endmodule
