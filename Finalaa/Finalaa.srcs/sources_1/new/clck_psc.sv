`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/13/2024 05:08:31 PM
// Design Name: 
// Module Name: clck_psc
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


module clck_psc(input logic clk, output logic tick);

logic [31:0]myreg;

always @(posedge clk)
    myreg +=1;
    
    assign tick = myreg[27];
    
   
endmodule