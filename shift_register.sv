// Functions
typedef enum logic [1:0] {
    NA     = 2'b00,
    LOAD   = 2'b01,
    LEFT   = 2'b10,
    RIGHT  = 2'b11
} funct_t;

module shift_register #(
    parameter WIDTH = 4
) (
    input logic clk,
    input logic rst,
    input funct_t funct_i,
    input logic [WIDTH-1:0] word_i,
    input logic serial_i,
    output logic [WIDTH-1:0] out_o
);

    logic [WIDTH-1:0] out_d, out_q;
    assign out_o = out_q;

    always_comb begin
        case (funct_i)
            NA:     out_d = out_q;                        // No action
            LOAD:   out_d = word_i;                       // Load the input word into the register
            LEFT:   out_d = {out_q[WIDTH-2:0], serial_i}; // Left-shift operation
            RIGHT:  out_d = {serial_i, out_q[WIDTH-1:1]}; // Right-shift operation
        endcase
    end

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            out_q <= '0;                                  // Reset the output
        end else begin
            out_q <= out_d;                               // Update output with the new data
        end
    end
endmodule
