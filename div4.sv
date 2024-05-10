module div4.sv (
    input logic [2:0] data_i,
    output logic [6:0] seven_segment_display_o
);

    // Use a function to map input data to seven-segment output
    function [6:0] decode_to_seven_segment(input [2:0] data);
        case (data)
            3'h0: decode_to_seven_segment = 7'b1111110;
            3'h1: decode_to_seven_segment = 7'b0110000;
            3'h2: decode_to_seven_segment = 7'b1101101;
            3'h3: decode_to_seven_segment = 7'b1111001;
            3'h4: decode_to_seven_segment = 7'b0110011;
            3'h5: decode_to_seven_segment = 7'b1011011;
            3'h6: decode_to_seven_segment = 7'b1011111;
            3'h7: decode_to_seven_segment = 7'b1110000;
            default: decode_to_seven_segment = 7'b0000000; // Default to all segments off if out of range
        endcase
    endfunction

    // Assign the seven-segment display output using the function
    assign seven_segment_display_o = decode_to_seven_segment(data_i);

endmodule
