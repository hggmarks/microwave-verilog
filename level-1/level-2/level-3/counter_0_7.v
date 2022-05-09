module counter_0_7(input wire CLK, CLEAR, output reg OUT);

    reg [2:0] actual_state;

    always @(posedge CLK, posedge CLEAR) begin

        if(actual_state < 3'd7)
            actual_state = actual_state + 3'd1;
        else if (CLEAR)
            actual_state = 3'd0;
            OUT = 0;

    end

    always @(actual_state) begin
        OUT = actual_state >= 3'd4;
    end
endmodule