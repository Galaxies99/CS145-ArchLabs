`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/24 19:47:59
// Design Name: 
// Module Name: mips_tb
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


module mips_tb(
    );
    reg clk;
    reg reset;
        
    Top processor(.clk(clk), .reset(reset));
    
    initial begin
        $readmemb("C:/ArchLabs/CS145-ArchLabs/lab06/inst_data.dat", processor.inst_memory.instFile);
        $readmemh("C:/ArchLabs/CS145-ArchLabs/lab06/data.dat", processor.data_memory.memFile);         
        reset = 1;
        clk = 0;
    end
    
    always #20 clk = ~clk;
    
    initial begin
        #40 reset = 0;
        #1500;
        $finish;
    end
endmodule
