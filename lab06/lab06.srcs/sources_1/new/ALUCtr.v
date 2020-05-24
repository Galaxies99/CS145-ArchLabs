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
    input [3 : 0] aluOp,
    input [5 : 0] funct,
    output reg [3 : 0] aluCtrOut,
    output reg shamtSign
    );
    
    always @ (aluOp or funct)
    begin
        if (aluOp == 4'b1101 || aluOp == 4'b1110) begin
            case (funct)
                6'b100000:      // add
                    aluCtrOut = 4'b0000;
                6'b100001:      // addu
                    aluCtrOut = 4'b0001;
                6'b100010:      // sub
                    aluCtrOut = 4'b0010;
                6'b100011:      // subu
                    aluCtrOut = 4'b0011;
                6'b100100:      // and
                    aluCtrOut = 4'b0100;
                6'b100101:      // or
                    aluCtrOut = 4'b0101;
                6'b100110:      // xor
                    aluCtrOut = 4'b0110;
                6'b100111:      // nor
                    aluCtrOut = 4'b0111;
                6'b101010:      // slt
                    aluCtrOut = 4'b1000;
                6'b101011:      // sltu
                    aluCtrOut = 4'b1001;
                6'b000000:      // sll
                    aluCtrOut = 4'b1010;
                6'b000010:      // srl
                    aluCtrOut = 4'b1011;
                6'b000011:      // sra
                    aluCtrOut = 4'b1100;
                6'b000100:      // sllv
                    aluCtrOut = 4'b1010;
                6'b000110:      // srlv
                    aluCtrOut = 4'b1011;
                6'b000111:      // srav
                    aluCtrOut = 4'b1100;
                6'b001000:      // jr
                    aluCtrOut = 4'b1111;
                default:
                    aluCtrOut = 4'b1111;
            endcase
            
            if (funct == 6'b000000 || funct == 6'b000010 || funct == 6'b000011)
                shamtSign = 1;
            else
                shamtSign = 0;
        end else begin
            aluCtrOut = aluOp;
            shamtSign = 0;
        end
    end
endmodule
