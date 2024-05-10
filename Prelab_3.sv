module Lab_3_counter #(
    parameter WIDTH = 3
) (
    input logic clk,
    input logic rst,
    output logic [WIDTH-1:0] count_o,
    input logic enable_i,
    input logic dir_i
);

    logic [WIDTH-1:0] count_p;   // Present value of the counter
    logic [WIDTH-1:0] next_count; // Next value based on direction and enable

    // Output assignment
    assign count_o = count_p;

    // Compute the next count value based on direction
    always_comb begin
        if (dir_i) begin
            next_count = count_p - 1;  // Decrement counter
        end else begin
            next_count = count_p + 1;  // Increment counter
        end
    end

    // Sequential logic for updating the counter
    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            count_p <= '0;              // Reset counter to zero
        end else if (enable_i) begin
            count_p <= next_count;     // Update counter if enabled
        end else begin
            count_p <= count_p;        // Hold counter if not enabled
        end
    end

endmodule
