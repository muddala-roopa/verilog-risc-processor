module DataMemory(
    input clk,
    input mem_read, mem_write,
    input [15:0] address,
    input [15:0] write_data,
    output reg [15:0] read_data
);

reg [15:0] memory [0:255];
integer i;

initial begin
    for(i=0;i<256;i=i+1)
        memory[i] = 0;
end

always @(posedge clk) begin
    if(mem_write)
        memory[address] <= write_data;
end

always @(*) begin
    if(mem_read)
        read_data = memory[address];
    else
        read_data = 0;
end

endmodule