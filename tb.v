module tb;

reg clk;
RISC16 uut(clk);

always #5 clk = ~clk;

initial begin
    clk = 0;

    // IMPORTANT delay so DUT settles
    #20;

   
    // PROGRAM LOADING
	
    uut.instruction_memory[0] = 16'b0000_01_10_11_0000;
    uut.instruction_memory[1] = 16'b0001_01_10_11_0000;
    uut.instruction_memory[2] = 16'b0010_01_10_11_0000;
    uut.instruction_memory[3] = 16'b0011_01_10_11_0000;
    uut.instruction_memory[4] = 16'b0100_01_00_00_0000;
    uut.instruction_memory[5] = 16'b0101_01_10_11_0000;
    uut.instruction_memory[6] = 16'b0110_01_10_11_0000;
    uut.instruction_memory[7] = 16'b0111_01_10_11_0000;

    #300;
    $finish;
end

endmodule