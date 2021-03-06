// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// Register Top module auto-generated by `reggen`

module entropy_src_reg_top (
  input clk_i,
  input rst_ni,

  // Below Regster interface can be changed
  input  tlul_pkg::tl_h2d_t tl_i,
  output tlul_pkg::tl_d2h_t tl_o,
  // To HW
  output entropy_src_reg_pkg::entropy_src_reg2hw_t reg2hw, // Write
  input  entropy_src_reg_pkg::entropy_src_hw2reg_t hw2reg, // Read

  // Config
  input devmode_i // If 1, explicit error return for unmapped register access
);

  import entropy_src_reg_pkg::* ;

  localparam AW = 6;
  localparam DW = 32;
  localparam DBW = DW/8;                    // Byte Width

  // register signals
  logic           reg_we;
  logic           reg_re;
  logic [AW-1:0]  reg_addr;
  logic [DW-1:0]  reg_wdata;
  logic [DBW-1:0] reg_be;
  logic [DW-1:0]  reg_rdata;
  logic           reg_error;

  logic          addrmiss, wr_err;

  logic [DW-1:0] reg_rdata_next;

  tlul_pkg::tl_h2d_t tl_reg_h2d;
  tlul_pkg::tl_d2h_t tl_reg_d2h;

  assign tl_reg_h2d = tl_i;
  assign tl_o       = tl_reg_d2h;

  tlul_adapter_reg #(
    .RegAw(AW),
    .RegDw(DW)
  ) u_reg_if (
    .clk_i,
    .rst_ni,

    .tl_i (tl_reg_h2d),
    .tl_o (tl_reg_d2h),

    .we_o    (reg_we),
    .re_o    (reg_re),
    .addr_o  (reg_addr),
    .wdata_o (reg_wdata),
    .be_o    (reg_be),
    .rdata_i (reg_rdata),
    .error_i (reg_error)
  );

  assign reg_rdata = reg_rdata_next ;
  assign reg_error = (devmode_i & addrmiss) | wr_err ;

  // Define SW related signals
  // Format: <reg>_<field>_{wd|we|qs}
  //        or <reg>_{wd|we|qs} if field == 1 or 0
  logic intr_state_es_entropy_valid_qs;
  logic intr_state_es_entropy_valid_wd;
  logic intr_state_es_entropy_valid_we;
  logic intr_state_es_entropy_fifo_err_qs;
  logic intr_state_es_entropy_fifo_err_wd;
  logic intr_state_es_entropy_fifo_err_we;
  logic intr_enable_es_entropy_valid_qs;
  logic intr_enable_es_entropy_valid_wd;
  logic intr_enable_es_entropy_valid_we;
  logic intr_enable_es_entropy_fifo_err_qs;
  logic intr_enable_es_entropy_fifo_err_wd;
  logic intr_enable_es_entropy_fifo_err_we;
  logic intr_test_es_entropy_valid_wd;
  logic intr_test_es_entropy_valid_we;
  logic intr_test_es_entropy_fifo_err_wd;
  logic intr_test_es_entropy_fifo_err_we;
  logic es_regen_qs;
  logic es_regen_wd;
  logic es_regen_we;
  logic es_conf_qs;
  logic es_conf_wd;
  logic es_conf_we;
  logic [7:0] es_rev_abi_revision_qs;
  logic [7:0] es_rev_hw_revision_qs;
  logic [7:0] es_rev_chip_type_qs;
  logic [31:0] es_entropy_qs;
  logic es_entropy_re;
  logic es_ctrl_qs;
  logic es_ctrl_wd;
  logic es_ctrl_we;
  logic es_status_qs;
  logic es_status_re;
  logic [6:0] es_fdepthst_qs;
  logic es_fdepthst_re;
  logic [6:0] es_thresh_qs;
  logic [6:0] es_thresh_wd;
  logic es_thresh_we;
  logic [15:0] es_rate_qs;
  logic [15:0] es_rate_wd;
  logic es_rate_we;
  logic [31:0] es_seed_qs;
  logic [31:0] es_seed_wd;
  logic es_seed_we;

  // Register instances
  // R[intr_state]: V(False)

  //   F[es_entropy_valid]: 0:0
  prim_subreg #(
    .DW      (1),
    .SWACCESS("W1C"),
    .RESVAL  (1'h0)
  ) u_intr_state_es_entropy_valid (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (intr_state_es_entropy_valid_we),
    .wd     (intr_state_es_entropy_valid_wd),

    // from internal hardware
    .de     (hw2reg.intr_state.es_entropy_valid.de),
    .d      (hw2reg.intr_state.es_entropy_valid.d ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.intr_state.es_entropy_valid.q ),

    // to register interface (read)
    .qs     (intr_state_es_entropy_valid_qs)
  );


  //   F[es_entropy_fifo_err]: 1:1
  prim_subreg #(
    .DW      (1),
    .SWACCESS("W1C"),
    .RESVAL  (1'h0)
  ) u_intr_state_es_entropy_fifo_err (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (intr_state_es_entropy_fifo_err_we),
    .wd     (intr_state_es_entropy_fifo_err_wd),

    // from internal hardware
    .de     (hw2reg.intr_state.es_entropy_fifo_err.de),
    .d      (hw2reg.intr_state.es_entropy_fifo_err.d ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.intr_state.es_entropy_fifo_err.q ),

    // to register interface (read)
    .qs     (intr_state_es_entropy_fifo_err_qs)
  );


  // R[intr_enable]: V(False)

  //   F[es_entropy_valid]: 0:0
  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_intr_enable_es_entropy_valid (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (intr_enable_es_entropy_valid_we),
    .wd     (intr_enable_es_entropy_valid_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.intr_enable.es_entropy_valid.q ),

    // to register interface (read)
    .qs     (intr_enable_es_entropy_valid_qs)
  );


  //   F[es_entropy_fifo_err]: 1:1
  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_intr_enable_es_entropy_fifo_err (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (intr_enable_es_entropy_fifo_err_we),
    .wd     (intr_enable_es_entropy_fifo_err_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.intr_enable.es_entropy_fifo_err.q ),

    // to register interface (read)
    .qs     (intr_enable_es_entropy_fifo_err_qs)
  );


  // R[intr_test]: V(True)

  //   F[es_entropy_valid]: 0:0
  prim_subreg_ext #(
    .DW    (1)
  ) u_intr_test_es_entropy_valid (
    .re     (1'b0),
    .we     (intr_test_es_entropy_valid_we),
    .wd     (intr_test_es_entropy_valid_wd),
    .d      ('0),
    .qre    (),
    .qe     (reg2hw.intr_test.es_entropy_valid.qe),
    .q      (reg2hw.intr_test.es_entropy_valid.q ),
    .qs     ()
  );


  //   F[es_entropy_fifo_err]: 1:1
  prim_subreg_ext #(
    .DW    (1)
  ) u_intr_test_es_entropy_fifo_err (
    .re     (1'b0),
    .we     (intr_test_es_entropy_fifo_err_we),
    .wd     (intr_test_es_entropy_fifo_err_wd),
    .d      ('0),
    .qre    (),
    .qe     (reg2hw.intr_test.es_entropy_fifo_err.qe),
    .q      (reg2hw.intr_test.es_entropy_fifo_err.q ),
    .qs     ()
  );


  // R[es_regen]: V(False)

  prim_subreg #(
    .DW      (1),
    .SWACCESS("W1C"),
    .RESVAL  (1'h1)
  ) u_es_regen (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (es_regen_we),
    .wd     (es_regen_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.es_regen.q ),

    // to register interface (read)
    .qs     (es_regen_qs)
  );


  // R[es_conf]: V(False)

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_es_conf (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface (qualified with register enable)
    .we     (es_conf_we & es_regen_qs),
    .wd     (es_conf_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.es_conf.q ),

    // to register interface (read)
    .qs     (es_conf_qs)
  );


  // R[es_rev]: V(False)

  //   F[abi_revision]: 7:0
  prim_subreg #(
    .DW      (8),
    .SWACCESS("RO"),
    .RESVAL  (8'h1)
  ) u_es_rev_abi_revision (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    .we     (1'b0),
    .wd     ('0  ),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.es_rev.abi_revision.q ),

    // to register interface (read)
    .qs     (es_rev_abi_revision_qs)
  );


  //   F[hw_revision]: 15:8
  prim_subreg #(
    .DW      (8),
    .SWACCESS("RO"),
    .RESVAL  (8'h2)
  ) u_es_rev_hw_revision (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    .we     (1'b0),
    .wd     ('0  ),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.es_rev.hw_revision.q ),

    // to register interface (read)
    .qs     (es_rev_hw_revision_qs)
  );


  //   F[chip_type]: 23:16
  prim_subreg #(
    .DW      (8),
    .SWACCESS("RO"),
    .RESVAL  (8'h1)
  ) u_es_rev_chip_type (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    .we     (1'b0),
    .wd     ('0  ),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.es_rev.chip_type.q ),

    // to register interface (read)
    .qs     (es_rev_chip_type_qs)
  );


  // R[es_entropy]: V(True)

  prim_subreg_ext #(
    .DW    (32)
  ) u_es_entropy (
    .re     (es_entropy_re),
    .we     (1'b0),
    .wd     ('0),
    .d      (hw2reg.es_entropy.d),
    .qre    (reg2hw.es_entropy.re),
    .qe     (),
    .q      (reg2hw.es_entropy.q ),
    .qs     (es_entropy_qs)
  );


  // R[es_ctrl]: V(False)

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_es_ctrl (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface (qualified with register enable)
    .we     (es_ctrl_we & es_regen_qs),
    .wd     (es_ctrl_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.es_ctrl.q ),

    // to register interface (read)
    .qs     (es_ctrl_qs)
  );


  // R[es_status]: V(True)

  prim_subreg_ext #(
    .DW    (1)
  ) u_es_status (
    .re     (es_status_re),
    .we     (1'b0),
    .wd     ('0),
    .d      (hw2reg.es_status.d),
    .qre    (),
    .qe     (),
    .q      (reg2hw.es_status.q ),
    .qs     (es_status_qs)
  );


  // R[es_fdepthst]: V(True)

  prim_subreg_ext #(
    .DW    (7)
  ) u_es_fdepthst (
    .re     (es_fdepthst_re),
    .we     (1'b0),
    .wd     ('0),
    .d      (hw2reg.es_fdepthst.d),
    .qre    (),
    .qe     (),
    .q      (reg2hw.es_fdepthst.q ),
    .qs     (es_fdepthst_qs)
  );


  // R[es_thresh]: V(False)

  prim_subreg #(
    .DW      (7),
    .SWACCESS("RW"),
    .RESVAL  (7'h0)
  ) u_es_thresh (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (es_thresh_we),
    .wd     (es_thresh_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (reg2hw.es_thresh.qe),
    .q      (reg2hw.es_thresh.q ),

    // to register interface (read)
    .qs     (es_thresh_qs)
  );


  // R[es_rate]: V(False)

  prim_subreg #(
    .DW      (16),
    .SWACCESS("RW"),
    .RESVAL  (16'h1)
  ) u_es_rate (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (es_rate_we),
    .wd     (es_rate_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (reg2hw.es_rate.qe),
    .q      (reg2hw.es_rate.q ),

    // to register interface (read)
    .qs     (es_rate_qs)
  );


  // R[es_seed]: V(False)

  prim_subreg #(
    .DW      (32),
    .SWACCESS("RW"),
    .RESVAL  (32'h12345678)
  ) u_es_seed (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface (qualified with register enable)
    .we     (es_seed_we & es_regen_qs),
    .wd     (es_seed_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (reg2hw.es_seed.qe),
    .q      (reg2hw.es_seed.q ),

    // to register interface (read)
    .qs     (es_seed_qs)
  );




  logic [12:0] addr_hit;
  always_comb begin
    addr_hit = '0;
    addr_hit[ 0] = (reg_addr == ENTROPY_SRC_INTR_STATE_OFFSET);
    addr_hit[ 1] = (reg_addr == ENTROPY_SRC_INTR_ENABLE_OFFSET);
    addr_hit[ 2] = (reg_addr == ENTROPY_SRC_INTR_TEST_OFFSET);
    addr_hit[ 3] = (reg_addr == ENTROPY_SRC_ES_REGEN_OFFSET);
    addr_hit[ 4] = (reg_addr == ENTROPY_SRC_ES_CONF_OFFSET);
    addr_hit[ 5] = (reg_addr == ENTROPY_SRC_ES_REV_OFFSET);
    addr_hit[ 6] = (reg_addr == ENTROPY_SRC_ES_ENTROPY_OFFSET);
    addr_hit[ 7] = (reg_addr == ENTROPY_SRC_ES_CTRL_OFFSET);
    addr_hit[ 8] = (reg_addr == ENTROPY_SRC_ES_STATUS_OFFSET);
    addr_hit[ 9] = (reg_addr == ENTROPY_SRC_ES_FDEPTHST_OFFSET);
    addr_hit[10] = (reg_addr == ENTROPY_SRC_ES_THRESH_OFFSET);
    addr_hit[11] = (reg_addr == ENTROPY_SRC_ES_RATE_OFFSET);
    addr_hit[12] = (reg_addr == ENTROPY_SRC_ES_SEED_OFFSET);
  end

  assign addrmiss = (reg_re || reg_we) ? ~|addr_hit : 1'b0 ;

  // Check sub-word write is permitted
  always_comb begin
    wr_err = 1'b0;
    if (addr_hit[ 0] && reg_we && (ENTROPY_SRC_PERMIT[ 0] != (ENTROPY_SRC_PERMIT[ 0] & reg_be))) wr_err = 1'b1 ;
    if (addr_hit[ 1] && reg_we && (ENTROPY_SRC_PERMIT[ 1] != (ENTROPY_SRC_PERMIT[ 1] & reg_be))) wr_err = 1'b1 ;
    if (addr_hit[ 2] && reg_we && (ENTROPY_SRC_PERMIT[ 2] != (ENTROPY_SRC_PERMIT[ 2] & reg_be))) wr_err = 1'b1 ;
    if (addr_hit[ 3] && reg_we && (ENTROPY_SRC_PERMIT[ 3] != (ENTROPY_SRC_PERMIT[ 3] & reg_be))) wr_err = 1'b1 ;
    if (addr_hit[ 4] && reg_we && (ENTROPY_SRC_PERMIT[ 4] != (ENTROPY_SRC_PERMIT[ 4] & reg_be))) wr_err = 1'b1 ;
    if (addr_hit[ 5] && reg_we && (ENTROPY_SRC_PERMIT[ 5] != (ENTROPY_SRC_PERMIT[ 5] & reg_be))) wr_err = 1'b1 ;
    if (addr_hit[ 6] && reg_we && (ENTROPY_SRC_PERMIT[ 6] != (ENTROPY_SRC_PERMIT[ 6] & reg_be))) wr_err = 1'b1 ;
    if (addr_hit[ 7] && reg_we && (ENTROPY_SRC_PERMIT[ 7] != (ENTROPY_SRC_PERMIT[ 7] & reg_be))) wr_err = 1'b1 ;
    if (addr_hit[ 8] && reg_we && (ENTROPY_SRC_PERMIT[ 8] != (ENTROPY_SRC_PERMIT[ 8] & reg_be))) wr_err = 1'b1 ;
    if (addr_hit[ 9] && reg_we && (ENTROPY_SRC_PERMIT[ 9] != (ENTROPY_SRC_PERMIT[ 9] & reg_be))) wr_err = 1'b1 ;
    if (addr_hit[10] && reg_we && (ENTROPY_SRC_PERMIT[10] != (ENTROPY_SRC_PERMIT[10] & reg_be))) wr_err = 1'b1 ;
    if (addr_hit[11] && reg_we && (ENTROPY_SRC_PERMIT[11] != (ENTROPY_SRC_PERMIT[11] & reg_be))) wr_err = 1'b1 ;
    if (addr_hit[12] && reg_we && (ENTROPY_SRC_PERMIT[12] != (ENTROPY_SRC_PERMIT[12] & reg_be))) wr_err = 1'b1 ;
  end

  assign intr_state_es_entropy_valid_we = addr_hit[0] & reg_we & ~wr_err;
  assign intr_state_es_entropy_valid_wd = reg_wdata[0];

  assign intr_state_es_entropy_fifo_err_we = addr_hit[0] & reg_we & ~wr_err;
  assign intr_state_es_entropy_fifo_err_wd = reg_wdata[1];

  assign intr_enable_es_entropy_valid_we = addr_hit[1] & reg_we & ~wr_err;
  assign intr_enable_es_entropy_valid_wd = reg_wdata[0];

  assign intr_enable_es_entropy_fifo_err_we = addr_hit[1] & reg_we & ~wr_err;
  assign intr_enable_es_entropy_fifo_err_wd = reg_wdata[1];

  assign intr_test_es_entropy_valid_we = addr_hit[2] & reg_we & ~wr_err;
  assign intr_test_es_entropy_valid_wd = reg_wdata[0];

  assign intr_test_es_entropy_fifo_err_we = addr_hit[2] & reg_we & ~wr_err;
  assign intr_test_es_entropy_fifo_err_wd = reg_wdata[1];

  assign es_regen_we = addr_hit[3] & reg_we & ~wr_err;
  assign es_regen_wd = reg_wdata[0];

  assign es_conf_we = addr_hit[4] & reg_we & ~wr_err;
  assign es_conf_wd = reg_wdata[0];




  assign es_entropy_re = addr_hit[6] && reg_re;

  assign es_ctrl_we = addr_hit[7] & reg_we & ~wr_err;
  assign es_ctrl_wd = reg_wdata[0];

  assign es_status_re = addr_hit[8] && reg_re;

  assign es_fdepthst_re = addr_hit[9] && reg_re;

  assign es_thresh_we = addr_hit[10] & reg_we & ~wr_err;
  assign es_thresh_wd = reg_wdata[6:0];

  assign es_rate_we = addr_hit[11] & reg_we & ~wr_err;
  assign es_rate_wd = reg_wdata[15:0];

  assign es_seed_we = addr_hit[12] & reg_we & ~wr_err;
  assign es_seed_wd = reg_wdata[31:0];

  // Read data return
  always_comb begin
    reg_rdata_next = '0;
    unique case (1'b1)
      addr_hit[0]: begin
        reg_rdata_next[0] = intr_state_es_entropy_valid_qs;
        reg_rdata_next[1] = intr_state_es_entropy_fifo_err_qs;
      end

      addr_hit[1]: begin
        reg_rdata_next[0] = intr_enable_es_entropy_valid_qs;
        reg_rdata_next[1] = intr_enable_es_entropy_fifo_err_qs;
      end

      addr_hit[2]: begin
        reg_rdata_next[0] = '0;
        reg_rdata_next[1] = '0;
      end

      addr_hit[3]: begin
        reg_rdata_next[0] = es_regen_qs;
      end

      addr_hit[4]: begin
        reg_rdata_next[0] = es_conf_qs;
      end

      addr_hit[5]: begin
        reg_rdata_next[7:0] = es_rev_abi_revision_qs;
        reg_rdata_next[15:8] = es_rev_hw_revision_qs;
        reg_rdata_next[23:16] = es_rev_chip_type_qs;
      end

      addr_hit[6]: begin
        reg_rdata_next[31:0] = es_entropy_qs;
      end

      addr_hit[7]: begin
        reg_rdata_next[0] = es_ctrl_qs;
      end

      addr_hit[8]: begin
        reg_rdata_next[0] = es_status_qs;
      end

      addr_hit[9]: begin
        reg_rdata_next[6:0] = es_fdepthst_qs;
      end

      addr_hit[10]: begin
        reg_rdata_next[6:0] = es_thresh_qs;
      end

      addr_hit[11]: begin
        reg_rdata_next[15:0] = es_rate_qs;
      end

      addr_hit[12]: begin
        reg_rdata_next[31:0] = es_seed_qs;
      end

      default: begin
        reg_rdata_next = '1;
      end
    endcase
  end

  // Assertions for Register Interface
  `ASSERT_PULSE(wePulse, reg_we, clk_i, !rst_ni)
  `ASSERT_PULSE(rePulse, reg_re, clk_i, !rst_ni)

  `ASSERT(reAfterRv, $rose(reg_re || reg_we) |=> tl_o.d_valid, clk_i, !rst_ni)

  `ASSERT(en2addrHit, (reg_we || reg_re) |-> $onehot0(addr_hit), clk_i, !rst_ni)

  // this is formulated as an assumption such that the FPV testbenches do disprove this
  // property by mistake
  `ASSUME(reqParity, tl_reg_h2d.a_valid |-> tl_reg_h2d.a_user.parity_en == 1'b0, clk_i, !rst_ni)

endmodule
