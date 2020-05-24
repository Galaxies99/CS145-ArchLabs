`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/23 13:39:38
// Design Name: 
// Module Name: single_cycle_mips_tb
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


module single_cycle_mips_tb(
    );
    reg clk;
    reg reset;
    
    Top processor(.clk(clk), .reset(reset));
    
    initial begin
        $readmemb("C:/ArchLabs/CS145-ArchLabs/lab05/inst_data.dat", processor.inst_memory.instFile);
        $readmemh("C:/ArchLabs/CS145-ArchLabs/lab05/data.dat", processor.data_memory.memFile);         
        reset = 1;
        clk = 0;
    end
    
    always #20 clk = ~clk;
    
    initial begin
        #40 reset = 0;
        #1000;
        $finish;
    end
endmodule
