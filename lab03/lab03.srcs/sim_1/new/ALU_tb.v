`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/22 10:04:53
// Design Name: 
// Module Name: ALU_tb
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


module ALU_tb(
    );
    
    wire [31 : 0] ALURes;
    reg [31 : 0] InputA;
    reg [31 : 0] InputB;
    reg [3 : 0] ALUCtrOut;
    wire Zero;
    
    ALU u0(.inputA(InputA), .inputB(InputB),
           .aluCtrOut(ALUCtrOut), .zero(Zero),
           .aluRes(ALURes));
    
    initial begin
        // Initialize Inputs
        InputA = 0;
        InputB = 0;
        ALUCtrOut = 0;
        
        // Wait 100 ns for global reset to finish
        #100;
        
        // testing and
        InputA = 15;
        InputB = 10;
        ALUCtrOut = 4'b0000;
        #100;
        
        // testing or
        InputA = 15;
        InputB = 10;
        ALUCtrOut = 4'b0001;
        #100;
        
        // testing add
        InputA = 15;
        InputB = 10;
        ALUCtrOut = 4'b0010;
        #100;
        
        // testing sub 1
        InputA = 15;
        InputB = 10;
        ALUCtrOut = 4'b0110;
        #100;
        
        // testing sub 2
        InputA = 10;
        InputB = 15;
        ALUCtrOut = 4'b0110;
        #100;
        
        // testing set on less than 1
        InputA = 15;
        InputB = 10;
        ALUCtrOut = 4'b0111;
        #100;
        
        // testing set on less than 2
        InputA = 10;
        InputB = 15;
        ALUCtrOut = 4'b0111;
        #100;
        
        // testing nor 1
        InputA = 1;
        InputB = 1;
        ALUCtrOut = 4'b1100;
        #100;
        
        // testing nor 2
        InputA = 16;
        InputB = 1;
        ALUCtrOut = 4'b1100;
        #100;
    end
endmodule
