// part c
module div4_c #(
    parameter WIDTH = 4
)(
    input logic [WIDTH-1:0] data_i, 
    input logic en_i, 
    output logic [WIDTH-1:0] data_o, 
    output logic valid_o
);

always_latch begin
    if (en_i) begin
        data_o = data_i[WIDTH-1:2];
    end
    // No else part; latching behavior when en_i is low
end

always_comb begin
    valid_o = en_i;  // Simplified valid_o logic
end

endmodule
