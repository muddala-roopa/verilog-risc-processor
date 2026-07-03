module RegFile(
    input clk,
    input [1:0] rs, rt, rd,
    input [15:0] write_data,
    input reg_write,
    output [15:0] read_data1, read_data2
);

reg [15:0] registers [0:3];
integer i;

initial begin
    for(i=0;i<4;i=i+1)
        registers[i] = 0;
end

assign read_data1 = registers[rs];
assign read_data2 = registers[rt];

always @(posedge clk) begin
    if(reg_write)
        registers[rd] <= write_data;
end

endmodule