`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/13/2024 05:46:18 PM
// Design Name: 
// Module Name: top_final
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


module top_final( input logic CLK100MHZ, input logic [3:0]sw, output logic [7:0]LED);

logic internal_clk;

clck_psc my_clk(.clk(CLK100MHZ), .tick(internal_clk));

FSM_ahhh finalsemaforo (.clk(internal_clk), .TA(sw[0]), .TB(sw[1]), .E(sw[2]), .P(sw[3]), .SM1(LED[2:0]), .SM2(LED[5:3]), .PA(LED[6]));

    assign LED[7] = internal_clk;
    
endmodule
