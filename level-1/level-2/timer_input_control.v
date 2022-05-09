`include "level-3/counter_0_7.v"
`include "level-3/div_freq_100hz.v"
`include "level-3/encoder_dec_to_bcd.v"
`include "level-3/mux_2to1.v"

module timer_input_control(input wire [9:0] KPAD,
                           input wire EN_N,
                           input CLK_100HZ,
                           output wire [3:0] D,
                           output wire LOAD_N,
                           output wire CLK_1HZ
                           );

    wire mux_D0_debouncer_0_7, mux_D1_clk_1hz;


encoder_dec_to_bcd encoder(KPAD, EN_N, D, LOAD_N);
counter_0_7 counter(CLK_100HZ, LOAD_N, mux_D0_debouncer_0_7);
div_freq_100hz freq_div100(CLK_100HZ, mux_D1_clk_1hz);
mux_2to1 mux2to1(EN_N, mux_D0_debouncer_0_7 ,mux_D1_clk_1hz, CLK_1HZ);

endmodule