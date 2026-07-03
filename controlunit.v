module ControlUnit(
    input [3:0] opcode,
    output reg reg_write, mem_read, mem_write,
    output reg [3:0] alu_sel
);

always @(*) begin
    case(opcode)

        // Arithmetic
        4'b0000: begin reg_write=1; mem_read=0; mem_write=0; alu_sel=4'b0000; end // ADD
        4'b0001: begin reg_write=1; mem_read=0; mem_write=0; alu_sel=4'b0001; end // SUB

        // Logical
        4'b0010: begin reg_write=1; mem_read=0; mem_write=0; alu_sel=4'b0010; end // AND
        4'b0011: begin reg_write=1; mem_read=0; mem_write=0; alu_sel=4'b0011; end // OR

        // Data transfer
        4'b0100: begin reg_write=1; mem_read=1; mem_write=0; alu_sel=4'b0000; end // LOAD
        4'b0101: begin reg_write=0; mem_read=0; mem_write=1; alu_sel=4'b0000; end // STORE

        // Extra instructions (to make 8 instruction ISA)
        4'b0110: begin reg_write=1; mem_read=0; mem_write=0; alu_sel=4'b0000; end // MOV
        4'b0111: begin reg_write=1; mem_read=0; mem_write=0; alu_sel=4'b0000; end // MOVI

        default: begin reg_write=0; mem_read=0; mem_write=0; alu_sel=4'b0000; end

    endcase
end

endmodule