`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/22 22:17:45
// Design Name: 
// Module Name: DataMemory
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


module DataMemory(
    input clk,
    input [31 : 0] address,
    input [31 : 0] writeData,
    input memWrite,
    input memRead,
    output reg [31 : 0] readData
    );
    
    reg [31 : 0] memFile [0 : 1023];
    
    
    always @ (memRead or address)
    begin
        // check if the address is valid
        if (memRead && ! memWrite)
        begin
            if(address <= 1023)
                readData = memFile[address];
            else
                readData = 0;
            $display("Memory Reading:\n    Mem[%d] = %d\n", address, readData);
        end
    end
    
    always @ (negedge clk)
    begin
        if (memWrite && address <= 1023)
        begin
            memFile[address] = writeData;
            $display("Memory Writing:\n    Mem[%d] = %d\n", address, writeData);
       end
    end
endmodule
