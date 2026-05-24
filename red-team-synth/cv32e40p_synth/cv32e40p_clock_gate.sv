module cv32e40p_clock_gate (
    input  logic clk_i,
    input  logic en_i,
    input  logic scan_cg_en_i,
    output logic clk_o
);

  logic clk_en;
  assign clk_en = en_i | scan_cg_en_i;

  sky130_fd_sc_hd__dlclkp_1 cg_inst (
      .CLK(clk_i),
      .GATE(clk_en),
      .GCLK(clk_o)
  );

endmodule  // cv32e40p_clock_gate
