`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/22 10:51:16
// Design Name: 
// Module Name: ALUCtr
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


module ALUCtr(
    input [2 : 0] aluOp,
    input [5 : 0] funct,
    output reg [3 : 0] aluCtrOut,
    output reg shamtSign,
    output reg jrSign
    );
    
    always @ (aluOp or funct)
    begin
        casex ({aluOp, funct})
            9'b000xxxxxx:  // lw or sw: actually add
                aluCtrOut = 4'b0010;
            9'b001xxxxxx:  // beq: actually sub
                aluCtrOut = 4'b0110;
            9'b010xxxxxx:  // addi: actually add
                aluCtrOut = 4'b0010;
            9'b011xxxxxx:  // andi: acutally and
                aluCtrOut = 4'b0000;
            9'b100xxxxxx:  // ori: acutally or
                aluCtrOut = 4'b0001;
            9'b101000000:  // sll: actually left-shift
                aluCtrOut = 4'b0011;
            9'b101000010:  // srl: actuall right-shift
                aluCtrOut = 4'b0100;
            9'b101001000:  // jr: actually not change
                aluCtrOut = 4'b0101;
            9'b101100000:  // add: actually add
                aluCtrOut = 4'b0010;
            9'b101100010:  // sub: actually sub
                aluCtrOut = 4'b0110;
            9'b101100100:  // and: actually and
                aluCtrOut = 4'b0000;
            9'b101100101:  // or: actually or
                aluCtrOut = 4'b0001;
            9'b101101010:  // slt: actually set on less than
                aluCtrOut = 4'b0111;
            9'b110xxxxxx:  // jump / jal: actually not change
                aluCtrOut = 4'b0101;
        endcase        
        
        if ({aluOp, funct} == 9'b101000000 || {aluOp, funct} == 9'b101000010)
            shamtSign = 1;
        else 
            shamtSign = 0;
        
        if ({aluOp, funct} == 9'b101001000)
            jrSign = 1;
        else 
            jrSign = 0;
            
    end
endmodule
