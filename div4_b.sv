//part b
module div4_b #(
    parameter WIDTH = 4
)(
    input logic clk, 
    input logic [WIDTH-1:0] data_i, 
    input logic en_i, 
    output logic [WIDTH-1:0] data_o, 
    output logic valid_o
);

logic [WIDTH-1:0] data_d;

always_comb begin
    // Default values
    data_d = data_o; // hold the previous output
    valid_o = 1'b0;

    if (en_i) begin
        data_d = data_i[WIDTH-1:2]; 
        valid_o = 1'b1;
    end
end

always_ff @(posedge clk) begin
    data_o <= data_d; // Update data_o only on the rising edge of clk
end

endmodule
