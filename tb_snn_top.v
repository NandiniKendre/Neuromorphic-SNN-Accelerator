`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.06.2026 10:19:01
// Design Name: 
// Module Name: tb_snn_top
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
module tb_snn_top;

reg clk;
reg rst;

reg spike_valid;
reg [7:0] spike_id;

wire spike_out_valid;
wire [7:0] spike_out_id;

snn_top dut (
    .clk(clk),
    .rst(rst),
    .spike_valid(spike_valid),
    .spike_id(spike_id),
    .spike_out_valid(spike_out_valid),
    .spike_out_id(spike_out_id)
);

// Clock generation
always #5 clk = ~clk;

// Stimulus
initial begin
    clk = 0;
    rst = 1;

    spike_valid = 0;
    spike_id    = 0;

    $display("========================================");
    $display("      SNN Simulation Started");
    $display("========================================");

    #20;
    rst = 0;

    // First spike
    #10;
    spike_valid = 1;
    spike_id    = 8'd5;

    #10;
    spike_valid = 0;

    // Wait
    #50;

    // Second spike
    spike_valid = 1;
    spike_id    = 8'd10;

    #10;
    spike_valid = 0;

    #100;

    $display("========================================");
    $display("      Simulation Finished");
    $display("========================================");

    $finish;
end

// Print status every clock
always @(posedge clk)
begin
    $display(
        "T=%0t | rst=%b | spike_valid=%b | spike_id=%0d | spike_out_valid=%b | spike_out_id=%0d",
        $time,
        rst,
        spike_valid,
        spike_id,
        spike_out_valid,
        spike_out_id
    );
end

// Print only when neuron fires
always @(posedge clk)
begin
    if(spike_out_valid)
    begin
        $display(
            ">>> TIME=%0t : NEURON %0d FIRED <<<",
            $time,
            spike_out_id
        );
    end
end

// Waveform dump
initial begin
    $dumpfile("snn.vcd");
    $dumpvars(0, tb_snn_top);
end

endmodule