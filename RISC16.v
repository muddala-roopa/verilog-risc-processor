module RISC16(
    input clk,
    output reg [7:0] led
);

reg [15:0] PC;
reg [15:0] instruction_memory [0:255];
reg [15:0] instruction;

wire [3:0] opcode;
wire [1:0] rd, rs, rt;

wire reg_write, mem_read, mem_write;
wire [3:0] alu_sel;

wire [15:0] read_data1, read_data2, alu_out, mem_data;


// SAFE INIT (IMPORTANT)

initial begin
    PC = 0;
    instruction = 0;
end


// SAFE FETCH (FIX FOR X)

always @(posedge clk) begin
    if (instruction_memory[PC] !== 16'bx)
        instruction <= instruction_memory[PC];
    else
        instruction <= 16'b0;

    PC <= PC + 1;
    led <= PC[7:0];
end

assign opcode = instruction[15:12];
assign rd     = instruction[11:10];
assign rs     = instruction[9:8];
assign rt     = instruction[7:6];

ControlUnit CU(opcode, reg_write, mem_read, mem_write, alu_sel);

RegFile RF(clk, rs, rt, rd, mem_data, reg_write, read_data1, read_data2);

ALU alu(read_data1, read_data2, alu_sel, alu_out);

DataMemory DM(clk, mem_read, mem_write, alu_out, read_data2, mem_data);

endmodule