`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/22 23:07:08
// Design Name: 
// Module Name: signext_tb
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


module signext_tb(
    );
    
    reg [15 : 0] Inst;
    wire [31 : 0] Data;
    
    signext u0(.inst(Inst), .data(Data));
    
    initial begin
        // Initialize Input
        Inst = 0;
        
        // Current Time: 100 ns
        #100;
        Inst = 1;
        
        // Current Time: 200 ns
        #100;
        Inst = 16'hffff;
        
        // Current Time: 300 ns
        #100;
        Inst = 2;
        
        // Current Time: 400 ns
        #100;
        Inst = 16'hfffe;
        
        // Current Time: 500 ns
        #100;
        Inst = 16'h8000;
        
        // Current TIme: 600 ns
        #100;
        Inst = 16'h7f93;
    end
endmodule
