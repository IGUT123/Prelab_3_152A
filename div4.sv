//Part a
module div4 #(
    parameter WIDTH = 4
)(
    input logic [WIDTH-1:0] data_i, 
    input logic en_i, 
    output logic [WIDTH-1:0] data_o, 
    output logic valid_o
);

always_comb begin
    // Default values
    data_o = {WIDTH{1'b0}};
    valid_o = 1'b0;

    // Conditional logic
    if (en_i) begin
        data_o = data_i[WIDTH-1:2];  // Note: This line assumes WIDTH > 2
        valid_o = 1'b1;
    end
end
endmodule
