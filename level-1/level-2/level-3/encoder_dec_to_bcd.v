module encoder_dec_to_bcd(input wire [9:0] DEC, input wire EN,
                          output reg [3:0] BCD, output reg AI);


    always @(DEC) begin

        if(!EN) begin
            case(DEC)
                10'b0000000001: BCD = 4'b0000;
                10'b0000000010: BCD = 4'b0001;
                10'b0000000100: BCD = 4'b0010;
                10'b0000001000: BCD = 4'b0011;
                10'b0000010000: BCD = 4'b0100;
                10'b0000100000: BCD = 4'b0101;
                10'b0001000000: BCD = 4'b0110;
                10'b0010000000: BCD = 4'b0111;
                10'b0100000000: BCD = 4'b1000;
                10'b1000000000: BCD = 4'b1001;
            default:
                BCD = 4'b0000;
            endcase

            AI = (DEC != 0);
        end
        else begin
            BCD = 0;
            AI = 0;
        end
    end
endmodule