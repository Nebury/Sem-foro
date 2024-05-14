`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/13/2024 05:18:55 PM
// Design Name: 
// Module Name: FSM_ahhh
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


module FSM_ahhh(input logic clk, input logic P, E, TB, TA, output logic [2:0]SM1, [2:0]SM2, PA);

logic [2:0]current_state;
logic [2:0]next_state;
logic [1:0]LA;
logic [1:0]LB;

always @(posedge clk)
    begin 
    current_state <= next_state;
    end

assign next_state[2] = (~current_state[2] & P) | (~current_state[1] & ~current_state[0] & P);
assign next_state[1] = (~current_state[2] & ~current_state[1] & current_state[0] & ~P & ~E) | (~current_state[2] & current_state[1] & ~current_state[0] & ~P & ~E);
assign next_state[0] = (~current_state[2] & ~current_state[1] & ~current_state[0] & ~P & ~E & ~TA) | (~current_state[2] & current_state[1] & ~current_state[0] & ~P & ~E & ~TB & TA);

assign LA[1] = (~current_state[2] & current_state[1]);
assign LA[0] = (~current_state[2] & ~current_state[1] & current_state[0]) | (current_state[2] & ~current_state[1] & ~current_state[0]);
assign LB[1] = (~current_state[2] & ~current_state[1]);
assign LB[0] = (~current_state[2] & current_state[1] & current_state[0]) | (current_state[2] & ~current_state[1] & ~current_state[0]);

assign PA =  (current_state[2] & ~current_state[1] & ~current_state[0]);

assign SM1[0] = ~LA[1] & ~LA[0];
assign SM1[1] = ~LA[1] & LA[0];
assign SM1[2] = LA[1] & ~LA[0];

assign SM2[0] = ~LB[1] & ~LB[0];
assign SM2[1] = ~LB[1] & LB[0];
assign SM2[2] = LB[1] & ~LB[0];

endmodule
