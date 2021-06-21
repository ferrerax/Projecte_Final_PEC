onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /test_sisa/SoC/io0/sd_ctr/uut/state
add wave -noupdate /test_sisa/SoC/io0/sd_ctr/uut/new_state
add wave -noupdate /test_sisa/SoC/io0/sd_ctr/uut/sd_busy
add wave -noupdate /test_sisa/SoC/io0/sd_ctr/sd_drv_rd
add wave -noupdate -divider {I/O PORTS SD}
add wave -noupdate -group ADDR -radix hexadecimal /test_sisa/SoC/proc0/e0/BR/BR(7)
add wave -noupdate -group ADDR -radix hexadecimal -childformat {{/test_sisa/SoC/proc0/e0/BR/BR(1)(15) -radix hexadecimal} {/test_sisa/SoC/proc0/e0/BR/BR(1)(14) -radix hexadecimal} {/test_sisa/SoC/proc0/e0/BR/BR(1)(13) -radix hexadecimal} {/test_sisa/SoC/proc0/e0/BR/BR(1)(12) -radix hexadecimal} {/test_sisa/SoC/proc0/e0/BR/BR(1)(11) -radix hexadecimal} {/test_sisa/SoC/proc0/e0/BR/BR(1)(10) -radix hexadecimal} {/test_sisa/SoC/proc0/e0/BR/BR(1)(9) -radix hexadecimal} {/test_sisa/SoC/proc0/e0/BR/BR(1)(8) -radix hexadecimal} {/test_sisa/SoC/proc0/e0/BR/BR(1)(7) -radix hexadecimal} {/test_sisa/SoC/proc0/e0/BR/BR(1)(6) -radix hexadecimal} {/test_sisa/SoC/proc0/e0/BR/BR(1)(5) -radix hexadecimal} {/test_sisa/SoC/proc0/e0/BR/BR(1)(4) -radix hexadecimal} {/test_sisa/SoC/proc0/e0/BR/BR(1)(3) -radix hexadecimal} {/test_sisa/SoC/proc0/e0/BR/BR(1)(2) -radix hexadecimal} {/test_sisa/SoC/proc0/e0/BR/BR(1)(1) -radix hexadecimal} {/test_sisa/SoC/proc0/e0/BR/BR(1)(0) -radix hexadecimal}} -subitemconfig {/test_sisa/SoC/proc0/e0/BR/BR(1)(15) {-height 16 -radix hexadecimal} /test_sisa/SoC/proc0/e0/BR/BR(1)(14) {-height 16 -radix hexadecimal} /test_sisa/SoC/proc0/e0/BR/BR(1)(13) {-height 16 -radix hexadecimal} /test_sisa/SoC/proc0/e0/BR/BR(1)(12) {-height 16 -radix hexadecimal} /test_sisa/SoC/proc0/e0/BR/BR(1)(11) {-height 16 -radix hexadecimal} /test_sisa/SoC/proc0/e0/BR/BR(1)(10) {-height 16 -radix hexadecimal} /test_sisa/SoC/proc0/e0/BR/BR(1)(9) {-height 16 -radix hexadecimal} /test_sisa/SoC/proc0/e0/BR/BR(1)(8) {-height 16 -radix hexadecimal} /test_sisa/SoC/proc0/e0/BR/BR(1)(7) {-height 16 -radix hexadecimal} /test_sisa/SoC/proc0/e0/BR/BR(1)(6) {-height 16 -radix hexadecimal} /test_sisa/SoC/proc0/e0/BR/BR(1)(5) {-height 16 -radix hexadecimal} /test_sisa/SoC/proc0/e0/BR/BR(1)(4) {-height 16 -radix hexadecimal} /test_sisa/SoC/proc0/e0/BR/BR(1)(3) {-height 16 -radix hexadecimal} /test_sisa/SoC/proc0/e0/BR/BR(1)(2) {-height 16 -radix hexadecimal} /test_sisa/SoC/proc0/e0/BR/BR(1)(1) {-height 16 -radix hexadecimal} /test_sisa/SoC/proc0/e0/BR/BR(1)(0) {-height 16 -radix hexadecimal}} /test_sisa/SoC/proc0/e0/BR/BR(1)
add wave -noupdate -group ADDR -radix hexadecimal /test_sisa/SoC/io0/sd_ctr/sd_drv/addr
add wave -noupdate -group ADDR /test_sisa/SoC/io0/sd_ctr/uut/addr
add wave -noupdate -group ADDR -radix hexadecimal /test_sisa/SoC/io0/mem(22)
add wave -noupdate -radix hexadecimal /test_sisa/SoC/io0/mem(23)
add wave -noupdate -radix hexadecimal /test_sisa/SoC/io0/mem(24)
add wave -noupdate -radix hexadecimal /test_sisa/SoC/io0/mem(25)
add wave -noupdate -divider {fi I/O PORTS SD}
add wave -noupdate -radix hexadecimal /test_sisa/SoC/io0/mem(25)
add wave -noupdate -group test_sisa -radix hexadecimal /test_sisa/addr_mem
add wave -noupdate -group test_sisa -radix hexadecimal /test_sisa/addr_SoC
add wave -noupdate -group test_sisa -radix hexadecimal /test_sisa/b_HEX0
add wave -noupdate -group test_sisa -radix hexadecimal /test_sisa/b_HEX1
add wave -noupdate -group test_sisa -radix hexadecimal /test_sisa/b_HEX2
add wave -noupdate -group test_sisa -radix hexadecimal /test_sisa/b_HEX3
add wave -noupdate -group test_sisa -radix hexadecimal /test_sisa/b_KEY
add wave -noupdate -group test_sisa -radix hexadecimal /test_sisa/b_LEDG
add wave -noupdate -group test_sisa -radix hexadecimal /test_sisa/b_LEDR
add wave -noupdate -group test_sisa -radix hexadecimal /test_sisa/b_ps2_clk
add wave -noupdate -group test_sisa -radix hexadecimal /test_sisa/b_ps2_data
add wave -noupdate -group test_sisa -radix hexadecimal /test_sisa/botones
add wave -noupdate -group test_sisa -radix hexadecimal /test_sisa/ce_m
add wave -noupdate -group test_sisa -radix hexadecimal /test_sisa/ce_m2
add wave -noupdate -group test_sisa -radix hexadecimal /test_sisa/clk
add wave -noupdate -group test_sisa -radix hexadecimal /test_sisa/data_mem
add wave -noupdate -group test_sisa -radix hexadecimal /test_sisa/lb_m
add wave -noupdate -group test_sisa -radix hexadecimal /test_sisa/oe_m
add wave -noupdate -group test_sisa -radix hexadecimal /test_sisa/reset_proc
add wave -noupdate -group test_sisa -radix hexadecimal /test_sisa/reset_ram
add wave -noupdate -group test_sisa -radix hexadecimal /test_sisa/ub_m
add wave -noupdate -group test_sisa -radix hexadecimal /test_sisa/we_m
add wave -noupdate -group SOC -radix hexadecimal /test_sisa/SoC/CLOCK_50
add wave -noupdate -group SOC -radix hexadecimal /test_sisa/SoC/KEY
add wave -noupdate -group SOC -radix hexadecimal /test_sisa/SoC/SW
add wave -noupdate -group SOC -radix hexadecimal /test_sisa/SoC/HEX0
add wave -noupdate -group SOC -radix hexadecimal /test_sisa/SoC/HEX1
add wave -noupdate -group SOC -radix hexadecimal /test_sisa/SoC/HEX2
add wave -noupdate -group SOC -radix hexadecimal /test_sisa/SoC/HEX3
add wave -noupdate -group SOC -radix hexadecimal /test_sisa/SoC/LEDG
add wave -noupdate -group SOC -radix hexadecimal /test_sisa/SoC/LEDR
add wave -noupdate -group SOC -radix hexadecimal /test_sisa/SoC/SRAM_ADDR
add wave -noupdate -group SOC -radix hexadecimal /test_sisa/SoC/SRAM_CE_N
add wave -noupdate -group SOC -radix hexadecimal /test_sisa/SoC/SRAM_LB_N
add wave -noupdate -group SOC -radix hexadecimal /test_sisa/SoC/SRAM_OE_N
add wave -noupdate -group SOC -radix hexadecimal /test_sisa/SoC/SRAM_UB_N
add wave -noupdate -group SOC -radix hexadecimal /test_sisa/SoC/SRAM_WE_N
add wave -noupdate -group SOC -radix hexadecimal /test_sisa/SoC/VGA_B
add wave -noupdate -group SOC -radix hexadecimal /test_sisa/SoC/VGA_G
add wave -noupdate -group SOC -radix hexadecimal /test_sisa/SoC/VGA_HS
add wave -noupdate -group SOC -radix hexadecimal /test_sisa/SoC/VGA_R
add wave -noupdate -group SOC -radix hexadecimal /test_sisa/SoC/VGA_VS
add wave -noupdate -group SOC -radix hexadecimal /test_sisa/SoC/PS2_CLK
add wave -noupdate -group SOC -radix hexadecimal /test_sisa/SoC/PS2_DAT
add wave -noupdate -group SOC -radix hexadecimal /test_sisa/SoC/SRAM_DQ
add wave -noupdate -group SOC -group sisa_internals -radix hexadecimal /test_sisa/SoC/addr_io_t
add wave -noupdate -group SOC -group sisa_internals -radix hexadecimal /test_sisa/SoC/mem0_rd_data
add wave -noupdate -group SOC -group sisa_internals -radix hexadecimal /test_sisa/SoC/mem0_we
add wave -noupdate -group SOC -group sisa_internals -radix hexadecimal /test_sisa/SoC/proc0_addr_m
add wave -noupdate -group SOC -group sisa_internals -radix hexadecimal /test_sisa/SoC/proc0_data_wr
add wave -noupdate -group SOC -group sisa_internals -radix hexadecimal /test_sisa/SoC/proc0_datard_m
add wave -noupdate -group SOC -group sisa_internals -radix hexadecimal /test_sisa/SoC/proc0_word_byte
add wave -noupdate -group SOC -group sisa_internals -radix hexadecimal /test_sisa/SoC/proc0_wr_m
add wave -noupdate -group SOC -group sisa_internals -radix hexadecimal /test_sisa/SoC/rd_io_en
add wave -noupdate -group SOC -group sisa_internals -radix hexadecimal /test_sisa/SoC/rd_io_t
add wave -noupdate -group SOC -group sisa_internals -radix hexadecimal /test_sisa/SoC/rellotge
add wave -noupdate -group SOC -group sisa_internals -radix hexadecimal /test_sisa/SoC/rellotge_proves
add wave -noupdate -group SOC -group sisa_internals -radix hexadecimal /test_sisa/SoC/vga_addr_vga
add wave -noupdate -group SOC -group sisa_internals -radix hexadecimal /test_sisa/SoC/vga_rd_data
add wave -noupdate -group SOC -group sisa_internals -radix hexadecimal /test_sisa/SoC/vga_we
add wave -noupdate -group SOC -group sisa_internals -radix hexadecimal /test_sisa/SoC/wr_io_en
add wave -noupdate -group SOC -group sisa_internals -radix hexadecimal /test_sisa/SoC/wr_io_t
add wave -noupdate -group SOC -group sisa_internals -radix hexadecimal /test_sisa/SoC/wr_m_t
add wave -noupdate -group SOC -radix hexadecimal /test_sisa/SoC/proc0/c0/m0/state
add wave -noupdate -group proc -radix hexadecimal /test_sisa/SoC/proc0/boot
add wave -noupdate -group proc -radix hexadecimal /test_sisa/SoC/proc0/clk
add wave -noupdate -group proc -radix hexadecimal /test_sisa/SoC/proc0/datard_m
add wave -noupdate -group proc -radix hexadecimal /test_sisa/SoC/proc0/rd_io
add wave -noupdate -group proc -radix hexadecimal /test_sisa/SoC/proc0/addr_io
add wave -noupdate -group proc -radix hexadecimal /test_sisa/SoC/proc0/addr_m
add wave -noupdate -group proc -radix hexadecimal /test_sisa/SoC/proc0/data_wr
add wave -noupdate -group proc -radix hexadecimal /test_sisa/SoC/proc0/rd_in
add wave -noupdate -group proc -radix hexadecimal /test_sisa/SoC/proc0/word_byte
add wave -noupdate -group proc -radix hexadecimal /test_sisa/SoC/proc0/wr_io
add wave -noupdate -group proc -radix hexadecimal /test_sisa/SoC/proc0/wr_m
add wave -noupdate -group proc -radix hexadecimal /test_sisa/SoC/proc0/wr_out
add wave -noupdate -group proc -group proc_internals -radix hexadecimal /test_sisa/SoC/proc0/a2a
add wave -noupdate -group proc -group proc_internals -radix hexadecimal /test_sisa/SoC/proc0/b2b
add wave -noupdate -group proc -group proc_internals -radix hexadecimal /test_sisa/SoC/proc0/c0_pc_out
add wave -noupdate -group proc -group proc_internals -radix hexadecimal /test_sisa/SoC/proc0/c0_tknbr_out
add wave -noupdate -group proc -group proc_internals -radix hexadecimal /test_sisa/SoC/proc0/d2d
add wave -noupdate -group proc -group proc_internals -radix hexadecimal /test_sisa/SoC/proc0/e0_pc_out
add wave -noupdate -group proc -group proc_internals -radix hexadecimal /test_sisa/SoC/proc0/i2i
add wave -noupdate -group proc -group proc_internals -radix hexadecimal /test_sisa/SoC/proc0/ind2ind
add wave -noupdate -group proc -group proc_internals -radix hexadecimal /test_sisa/SoC/proc0/insd2insd
add wave -noupdate -group proc -group proc_internals -radix hexadecimal /test_sisa/SoC/proc0/ix2ix
add wave -noupdate -group proc -group proc_internals -radix hexadecimal /test_sisa/SoC/proc0/o2o
add wave -noupdate -group proc -group proc_internals -radix hexadecimal /test_sisa/SoC/proc0/rb2rb
add wave -noupdate -group proc -group proc_internals -radix hexadecimal /test_sisa/SoC/proc0/w2w
add wave -noupdate -group proc -group proc_internals -radix hexadecimal /test_sisa/SoC/proc0/z2z
add wave -noupdate -group unidad_control -group c0_internals -radix hexadecimal /test_sisa/SoC/proc0/c0/deco_tknbr
add wave -noupdate -group unidad_control -group c0_internals -radix hexadecimal /test_sisa/SoC/proc0/c0/ldir_o
add wave -noupdate -group unidad_control -group c0_internals -radix hexadecimal /test_sisa/SoC/proc0/c0/ldpc_o
add wave -noupdate -group unidad_control -group c0_internals -radix hexadecimal /test_sisa/SoC/proc0/c0/w_b_t
add wave -noupdate -group unidad_control -group c0_internals -radix hexadecimal /test_sisa/SoC/proc0/c0/wr_m_t
add wave -noupdate -group unidad_control -group c0_internals -radix hexadecimal /test_sisa/SoC/proc0/c0/wrd_t
add wave -noupdate -group unidad_control -group control_l -radix hexadecimal /test_sisa/SoC/proc0/c0/deco/ir
add wave -noupdate -group unidad_control -group control_l -radix hexadecimal /test_sisa/SoC/proc0/c0/deco/z
add wave -noupdate -group unidad_control -group control_l -radix hexadecimal /test_sisa/SoC/proc0/c0/deco/tknbr
add wave -noupdate -group unidad_control -group control_l -radix hexadecimal /test_sisa/SoC/proc0/c0/deco/op
add wave -noupdate -group unidad_control -group control_l -radix hexadecimal /test_sisa/SoC/proc0/c0/deco/Rb_N
add wave -noupdate -group unidad_control -group control_l -radix hexadecimal /test_sisa/SoC/proc0/c0/deco/wrd
add wave -noupdate -group unidad_control -group control_l -radix hexadecimal /test_sisa/SoC/proc0/c0/deco/addr_a
add wave -noupdate -group unidad_control -group control_l -radix hexadecimal /test_sisa/SoC/proc0/c0/deco/addr_b
add wave -noupdate -group unidad_control -group control_l -radix hexadecimal /test_sisa/SoC/proc0/c0/deco/addr_d
add wave -noupdate -group unidad_control -group control_l -radix hexadecimal /test_sisa/SoC/proc0/c0/deco/immed
add wave -noupdate -group unidad_control -group control_l -radix hexadecimal /test_sisa/SoC/proc0/c0/deco/wr_m
add wave -noupdate -group unidad_control -group control_l -radix hexadecimal /test_sisa/SoC/proc0/c0/deco/in_d
add wave -noupdate -group unidad_control -group control_l -radix hexadecimal /test_sisa/SoC/proc0/c0/deco/immed_x2
add wave -noupdate -group unidad_control -group control_l -radix hexadecimal /test_sisa/SoC/proc0/c0/deco/addr_io
add wave -noupdate -group unidad_control -group control_l -radix hexadecimal /test_sisa/SoC/proc0/c0/deco/rd_in
add wave -noupdate -group unidad_control -group control_l -radix hexadecimal /test_sisa/SoC/proc0/c0/deco/wr_out
add wave -noupdate -group unidad_control -group control_l -radix hexadecimal /test_sisa/SoC/proc0/c0/deco/word_byte
add wave -noupdate -group unidad_control -group control_l -group deco_internals -radix hexadecimal /test_sisa/SoC/proc0/c0/deco/coop
add wave -noupdate -group unidad_control -group control_l -group deco_internals -radix hexadecimal /test_sisa/SoC/proc0/c0/deco/f1
add wave -noupdate -group unidad_control -group control_l -group deco_internals -radix hexadecimal /test_sisa/SoC/proc0/c0/deco/f3
add wave -noupdate -group unidad_control -group control_l -group deco_internals -radix hexadecimal /test_sisa/SoC/proc0/c0/deco/immed_6
add wave -noupdate -group unidad_control -group control_l -group deco_internals -radix hexadecimal /test_sisa/SoC/proc0/c0/deco/immed_8
add wave -noupdate -group unidad_control -group control_l -group deco_internals -radix hexadecimal /test_sisa/SoC/proc0/c0/deco/br_si_t
add wave -noupdate -group unidad_control -group control_l -group deco_internals -radix hexadecimal /test_sisa/SoC/proc0/c0/deco/jmp_si_t
add wave -noupdate -group unidad_control -expand -group multi -group m0_internals /test_sisa/SoC/proc0/c0/m0/state
add wave -noupdate -group unidad_control -expand -group multi -group m0_internals /test_sisa/SoC/proc0/c0/m0/int_excp_q
add wave -noupdate -group unidad_control -expand -group multi -radix hexadecimal /test_sisa/SoC/proc0/c0/m0/tknbr_in
add wave -noupdate -group unidad_control -expand -group multi -radix hexadecimal /test_sisa/SoC/proc0/c0/m0/wrd_l
add wave -noupdate -group unidad_control -expand -group multi -radix hexadecimal /test_sisa/SoC/proc0/c0/m0/wr_m_l
add wave -noupdate -group unidad_control -expand -group multi -radix hexadecimal /test_sisa/SoC/proc0/c0/m0/w_b
add wave -noupdate -group unidad_control -expand -group multi -radix hexadecimal /test_sisa/SoC/proc0/c0/m0/int_en
add wave -noupdate -group unidad_control -expand -group multi -radix hexadecimal /test_sisa/SoC/proc0/c0/m0/intr
add wave -noupdate -group unidad_control -expand -group multi -radix hexadecimal /test_sisa/SoC/proc0/c0/m0/is_getiid
add wave -noupdate -group unidad_control -expand -group multi -radix hexadecimal /test_sisa/SoC/proc0/c0/m0/excp
add wave -noupdate -group unidad_control -expand -group multi -radix hexadecimal /test_sisa/SoC/proc0/c0/m0/int
add wave -noupdate -group unidad_control -expand -group multi -radix hexadecimal /test_sisa/SoC/proc0/c0/m0/int_excp
add wave -noupdate -group unidad_control -expand -group multi -radix hexadecimal /test_sisa/SoC/proc0/c0/m0/inta
add wave -noupdate -group unidad_control -expand -group multi -radix hexadecimal /test_sisa/SoC/proc0/c0/m0/tknbr_out
add wave -noupdate -group unidad_control -expand -group multi -radix hexadecimal /test_sisa/SoC/proc0/c0/m0/wrd
add wave -noupdate -group unidad_control -expand -group multi -radix hexadecimal /test_sisa/SoC/proc0/c0/m0/wr_m
add wave -noupdate -group unidad_control -expand -group multi -radix hexadecimal /test_sisa/SoC/proc0/c0/m0/ldir
add wave -noupdate -group unidad_control -expand -group multi -radix hexadecimal /test_sisa/SoC/proc0/c0/m0/ins_dad
add wave -noupdate -group unidad_control -expand -group multi -radix hexadecimal /test_sisa/SoC/proc0/c0/m0/word_byte
add wave -noupdate -group unidad_control -radix hexadecimal /test_sisa/SoC/proc0/c0/boot
add wave -noupdate -group unidad_control -radix hexadecimal /test_sisa/SoC/proc0/c0/clk
add wave -noupdate -group unidad_control -radix hexadecimal /test_sisa/SoC/proc0/c0/datard_m
add wave -noupdate -group unidad_control -radix hexadecimal /test_sisa/SoC/proc0/c0/z
add wave -noupdate -group unidad_control -radix hexadecimal /test_sisa/SoC/proc0/c0/pc_in
add wave -noupdate -group unidad_control -radix hexadecimal /test_sisa/SoC/proc0/c0/int_en
add wave -noupdate -group unidad_control -radix hexadecimal /test_sisa/SoC/proc0/c0/intr
add wave -noupdate -group unidad_control -radix hexadecimal /test_sisa/SoC/proc0/c0/excp
add wave -noupdate -group unidad_control -radix hexadecimal /test_sisa/SoC/proc0/c0/inta
add wave -noupdate -group unidad_control -radix hexadecimal /test_sisa/SoC/proc0/c0/op
add wave -noupdate -group unidad_control -radix hexadecimal /test_sisa/SoC/proc0/c0/Rb_N
add wave -noupdate -group unidad_control -radix hexadecimal /test_sisa/SoC/proc0/c0/tknbr
add wave -noupdate -group unidad_control -radix hexadecimal /test_sisa/SoC/proc0/c0/wrd
add wave -noupdate -group unidad_control -radix hexadecimal /test_sisa/SoC/proc0/c0/addr_a
add wave -noupdate -group unidad_control -radix hexadecimal /test_sisa/SoC/proc0/c0/addr_b
add wave -noupdate -group unidad_control -radix hexadecimal /test_sisa/SoC/proc0/c0/addr_d
add wave -noupdate -group unidad_control -radix hexadecimal /test_sisa/SoC/proc0/c0/immed
add wave -noupdate -group unidad_control -radix hexadecimal /test_sisa/SoC/proc0/c0/pc_out
add wave -noupdate -group unidad_control -radix hexadecimal /test_sisa/SoC/proc0/c0/ins_dad
add wave -noupdate -group unidad_control -radix hexadecimal /test_sisa/SoC/proc0/c0/in_d
add wave -noupdate -group unidad_control -radix hexadecimal /test_sisa/SoC/proc0/c0/immed_x2
add wave -noupdate -group unidad_control -radix hexadecimal /test_sisa/SoC/proc0/c0/wr_m
add wave -noupdate -group unidad_control -radix hexadecimal /test_sisa/SoC/proc0/c0/addr_io
add wave -noupdate -group unidad_control -radix hexadecimal /test_sisa/SoC/proc0/c0/rd_in
add wave -noupdate -group unidad_control -radix hexadecimal /test_sisa/SoC/proc0/c0/wr_out
add wave -noupdate -group unidad_control -radix hexadecimal /test_sisa/SoC/proc0/c0/a_sys
add wave -noupdate -group unidad_control -radix hexadecimal /test_sisa/SoC/proc0/c0/d_sys
add wave -noupdate -group unidad_control -radix hexadecimal /test_sisa/SoC/proc0/c0/op_sys
add wave -noupdate -group unidad_control -radix hexadecimal /test_sisa/SoC/proc0/c0/is_acc_m
add wave -noupdate -group unidad_control -radix hexadecimal /test_sisa/SoC/proc0/c0/word_byte
add wave -noupdate -group unidad_control -radix hexadecimal /test_sisa/SoC/proc0/c0/excp_illegal_ir
add wave -noupdate -group excp_ctrl -radix hexadecimal /test_sisa/SoC/proc0/excp_ctrl/excp_div_cero
add wave -noupdate -group excp_ctrl -radix hexadecimal /test_sisa/SoC/proc0/excp_ctrl/excp_mem_align
add wave -noupdate -group excp_ctrl -radix hexadecimal /test_sisa/SoC/proc0/excp_ctrl/excp_illegal_ir
add wave -noupdate -group excp_ctrl -radix hexadecimal /test_sisa/SoC/proc0/excp_ctrl/excp_ir_protect
add wave -noupdate -group excp_ctrl -radix hexadecimal /test_sisa/SoC/proc0/excp_ctrl/excp_mem_protect
add wave -noupdate -group excp_ctrl -radix hexadecimal /test_sisa/SoC/proc0/excp_ctrl/excp_calls
add wave -noupdate -group excp_ctrl -radix hexadecimal /test_sisa/SoC/proc0/excp_ctrl/codigo
add wave -noupdate -group excp_ctrl -radix hexadecimal /test_sisa/SoC/proc0/excp_ctrl/excp
add wave -noupdate -group datapath -radix hexadecimal /test_sisa/SoC/proc0/e0/clk
add wave -noupdate -group datapath -radix hexadecimal /test_sisa/SoC/proc0/e0/op
add wave -noupdate -group datapath -radix hexadecimal /test_sisa/SoC/proc0/e0/wrd
add wave -noupdate -group datapath -radix hexadecimal /test_sisa/SoC/proc0/e0/addr_a
add wave -noupdate -group datapath -radix hexadecimal /test_sisa/SoC/proc0/e0/addr_b
add wave -noupdate -group datapath -radix hexadecimal /test_sisa/SoC/proc0/e0/addr_d
add wave -noupdate -group datapath -radix hexadecimal /test_sisa/SoC/proc0/e0/immed
add wave -noupdate -group datapath -radix hexadecimal /test_sisa/SoC/proc0/e0/immed_x2
add wave -noupdate -group datapath -radix hexadecimal /test_sisa/SoC/proc0/e0/datard_m
add wave -noupdate -group datapath -radix hexadecimal /test_sisa/SoC/proc0/e0/ins_dad
add wave -noupdate -group datapath -radix hexadecimal /test_sisa/SoC/proc0/e0/pc_in
add wave -noupdate -group datapath -radix hexadecimal /test_sisa/SoC/proc0/e0/in_d
add wave -noupdate -group datapath -radix hexadecimal /test_sisa/SoC/proc0/e0/Rb_N
add wave -noupdate -group datapath -radix hexadecimal /test_sisa/SoC/proc0/e0/tknbr
add wave -noupdate -group datapath -radix hexadecimal /test_sisa/SoC/proc0/e0/rd_io
add wave -noupdate -group datapath -radix hexadecimal /test_sisa/SoC/proc0/e0/pc_out
add wave -noupdate -group datapath -radix hexadecimal /test_sisa/SoC/proc0/e0/z
add wave -noupdate -group datapath -radix hexadecimal /test_sisa/SoC/proc0/e0/addr_m
add wave -noupdate -group datapath -radix hexadecimal /test_sisa/SoC/proc0/e0/wr_io
add wave -noupdate -group datapath -radix hexadecimal /test_sisa/SoC/proc0/e0/data_wr
add wave -noupdate -group datapath -group e0_internals -radix hexadecimal /test_sisa/SoC/proc0/e0/atox
add wave -noupdate -group datapath -group e0_internals -radix hexadecimal /test_sisa/SoC/proc0/e0/wtod
add wave -noupdate -group datapath -group e0_internals -radix hexadecimal /test_sisa/SoC/proc0/e0/immed_y
add wave -noupdate -group datapath -group e0_internals -radix hexadecimal /test_sisa/SoC/proc0/e0/reg_d
add wave -noupdate -group datapath -group e0_internals -radix hexadecimal /test_sisa/SoC/proc0/e0/y_i
add wave -noupdate -group datapath -group e0_internals -radix hexadecimal /test_sisa/SoC/proc0/e0/b_o
add wave -noupdate -group datapath -group e0_internals -radix hexadecimal /test_sisa/SoC/proc0/e0/pc_next
add wave -noupdate -group datapath -group Sregfile -radix hexadecimal /test_sisa/SoC/proc0/e0/SBR/wrd
add wave -noupdate -group datapath -group Sregfile -radix hexadecimal /test_sisa/SoC/proc0/e0/SBR/op_d
add wave -noupdate -group datapath -group Sregfile -radix hexadecimal /test_sisa/SoC/proc0/e0/SBR/d
add wave -noupdate -group datapath -group Sregfile -radix hexadecimal /test_sisa/SoC/proc0/e0/SBR/addr_a
add wave -noupdate -group datapath -group Sregfile -radix hexadecimal /test_sisa/SoC/proc0/e0/SBR/addr_d
add wave -noupdate -group datapath -group Sregfile -radix hexadecimal /test_sisa/SoC/proc0/e0/SBR/excp_codigo
add wave -noupdate -group datapath -group Sregfile -radix hexadecimal /test_sisa/SoC/proc0/e0/SBR/excp_dir
add wave -noupdate -group datapath -group Sregfile -radix hexadecimal /test_sisa/SoC/proc0/e0/SBR/int_en
add wave -noupdate -group datapath -group Sregfile -radix hexadecimal /test_sisa/SoC/proc0/e0/SBR/a
add wave -noupdate -group datapath -group Sregfile -radix hexadecimal -childformat {{/test_sisa/SoC/proc0/e0/SBR/BR(0) -radix hexadecimal} {/test_sisa/SoC/proc0/e0/SBR/BR(1) -radix hexadecimal} {/test_sisa/SoC/proc0/e0/SBR/BR(2) -radix hexadecimal} {/test_sisa/SoC/proc0/e0/SBR/BR(3) -radix hexadecimal} {/test_sisa/SoC/proc0/e0/SBR/BR(4) -radix hexadecimal} {/test_sisa/SoC/proc0/e0/SBR/BR(5) -radix hexadecimal} {/test_sisa/SoC/proc0/e0/SBR/BR(6) -radix hexadecimal} {/test_sisa/SoC/proc0/e0/SBR/BR(7) -radix hexadecimal -childformat {{/test_sisa/SoC/proc0/e0/SBR/BR(7)(15) -radix hexadecimal} {/test_sisa/SoC/proc0/e0/SBR/BR(7)(14) -radix hexadecimal} {/test_sisa/SoC/proc0/e0/SBR/BR(7)(13) -radix hexadecimal} {/test_sisa/SoC/proc0/e0/SBR/BR(7)(12) -radix hexadecimal} {/test_sisa/SoC/proc0/e0/SBR/BR(7)(11) -radix hexadecimal} {/test_sisa/SoC/proc0/e0/SBR/BR(7)(10) -radix hexadecimal} {/test_sisa/SoC/proc0/e0/SBR/BR(7)(9) -radix hexadecimal} {/test_sisa/SoC/proc0/e0/SBR/BR(7)(8) -radix hexadecimal} {/test_sisa/SoC/proc0/e0/SBR/BR(7)(7) -radix hexadecimal} {/test_sisa/SoC/proc0/e0/SBR/BR(7)(6) -radix hexadecimal} {/test_sisa/SoC/proc0/e0/SBR/BR(7)(5) -radix hexadecimal} {/test_sisa/SoC/proc0/e0/SBR/BR(7)(4) -radix hexadecimal} {/test_sisa/SoC/proc0/e0/SBR/BR(7)(3) -radix hexadecimal} {/test_sisa/SoC/proc0/e0/SBR/BR(7)(2) -radix hexadecimal} {/test_sisa/SoC/proc0/e0/SBR/BR(7)(1) -radix hexadecimal} {/test_sisa/SoC/proc0/e0/SBR/BR(7)(0) -radix hexadecimal}}}} -expand -subitemconfig {/test_sisa/SoC/proc0/e0/SBR/BR(0) {-height 16 -radix hexadecimal} /test_sisa/SoC/proc0/e0/SBR/BR(1) {-height 16 -radix hexadecimal} /test_sisa/SoC/proc0/e0/SBR/BR(2) {-height 16 -radix hexadecimal} /test_sisa/SoC/proc0/e0/SBR/BR(3) {-height 16 -radix hexadecimal} /test_sisa/SoC/proc0/e0/SBR/BR(4) {-height 16 -radix hexadecimal} /test_sisa/SoC/proc0/e0/SBR/BR(5) {-height 16 -radix hexadecimal} /test_sisa/SoC/proc0/e0/SBR/BR(6) {-height 16 -radix hexadecimal} /test_sisa/SoC/proc0/e0/SBR/BR(7) {-height 16 -radix hexadecimal -childformat {{/test_sisa/SoC/proc0/e0/SBR/BR(7)(15) -radix hexadecimal} {/test_sisa/SoC/proc0/e0/SBR/BR(7)(14) -radix hexadecimal} {/test_sisa/SoC/proc0/e0/SBR/BR(7)(13) -radix hexadecimal} {/test_sisa/SoC/proc0/e0/SBR/BR(7)(12) -radix hexadecimal} {/test_sisa/SoC/proc0/e0/SBR/BR(7)(11) -radix hexadecimal} {/test_sisa/SoC/proc0/e0/SBR/BR(7)(10) -radix hexadecimal} {/test_sisa/SoC/proc0/e0/SBR/BR(7)(9) -radix hexadecimal} {/test_sisa/SoC/proc0/e0/SBR/BR(7)(8) -radix hexadecimal} {/test_sisa/SoC/proc0/e0/SBR/BR(7)(7) -radix hexadecimal} {/test_sisa/SoC/proc0/e0/SBR/BR(7)(6) -radix hexadecimal} {/test_sisa/SoC/proc0/e0/SBR/BR(7)(5) -radix hexadecimal} {/test_sisa/SoC/proc0/e0/SBR/BR(7)(4) -radix hexadecimal} {/test_sisa/SoC/proc0/e0/SBR/BR(7)(3) -radix hexadecimal} {/test_sisa/SoC/proc0/e0/SBR/BR(7)(2) -radix hexadecimal} {/test_sisa/SoC/proc0/e0/SBR/BR(7)(1) -radix hexadecimal} {/test_sisa/SoC/proc0/e0/SBR/BR(7)(0) -radix hexadecimal}}} /test_sisa/SoC/proc0/e0/SBR/BR(7)(15) {-height 16 -radix hexadecimal} /test_sisa/SoC/proc0/e0/SBR/BR(7)(14) {-height 16 -radix hexadecimal} /test_sisa/SoC/proc0/e0/SBR/BR(7)(13) {-height 16 -radix hexadecimal} /test_sisa/SoC/proc0/e0/SBR/BR(7)(12) {-height 16 -radix hexadecimal} /test_sisa/SoC/proc0/e0/SBR/BR(7)(11) {-height 16 -radix hexadecimal} /test_sisa/SoC/proc0/e0/SBR/BR(7)(10) {-height 16 -radix hexadecimal} /test_sisa/SoC/proc0/e0/SBR/BR(7)(9) {-height 16 -radix hexadecimal} /test_sisa/SoC/proc0/e0/SBR/BR(7)(8) {-height 16 -radix hexadecimal} /test_sisa/SoC/proc0/e0/SBR/BR(7)(7) {-height 16 -radix hexadecimal} /test_sisa/SoC/proc0/e0/SBR/BR(7)(6) {-height 16 -radix hexadecimal} /test_sisa/SoC/proc0/e0/SBR/BR(7)(5) {-height 16 -radix hexadecimal} /test_sisa/SoC/proc0/e0/SBR/BR(7)(4) {-height 16 -radix hexadecimal} /test_sisa/SoC/proc0/e0/SBR/BR(7)(3) {-height 16 -radix hexadecimal} /test_sisa/SoC/proc0/e0/SBR/BR(7)(2) {-height 16 -radix hexadecimal} /test_sisa/SoC/proc0/e0/SBR/BR(7)(1) {-height 16 -radix hexadecimal} /test_sisa/SoC/proc0/e0/SBR/BR(7)(0) {-height 16 -radix hexadecimal}} /test_sisa/SoC/proc0/e0/SBR/BR
add wave -noupdate -group datapath -group BR -radix hexadecimal /test_sisa/SoC/proc0/e0/BR/clk
add wave -noupdate -group datapath -group BR -radix hexadecimal /test_sisa/SoC/proc0/e0/BR/wrd
add wave -noupdate -group datapath -group BR -radix hexadecimal /test_sisa/SoC/proc0/e0/BR/d
add wave -noupdate -group datapath -group BR -radix hexadecimal /test_sisa/SoC/proc0/e0/BR/addr_a
add wave -noupdate -group datapath -group BR -radix hexadecimal /test_sisa/SoC/proc0/e0/BR/addr_b
add wave -noupdate -group datapath -group BR -radix hexadecimal /test_sisa/SoC/proc0/e0/BR/addr_d
add wave -noupdate -group datapath -group BR -radix hexadecimal /test_sisa/SoC/proc0/e0/BR/a
add wave -noupdate -group datapath -group BR -radix hexadecimal /test_sisa/SoC/proc0/e0/BR/b
add wave -noupdate -group datapath -group BR -radix hexadecimal /test_sisa/SoC/proc0/e0/BR/BR
add wave -noupdate -group datapath -group ALU -radix hexadecimal /test_sisa/SoC/proc0/e0/ALUop/x
add wave -noupdate -group datapath -group ALU -radix hexadecimal /test_sisa/SoC/proc0/e0/ALUop/y
add wave -noupdate -group datapath -group ALU -radix hexadecimal /test_sisa/SoC/proc0/e0/ALUop/op
add wave -noupdate -group datapath -group ALU -radix hexadecimal /test_sisa/SoC/proc0/e0/ALUop/w
add wave -noupdate -group datapath -group ALU -radix hexadecimal /test_sisa/SoC/proc0/e0/ALUop/z
add wave -noupdate -group datapath -group ALU -group alu_internals -radix hexadecimal /test_sisa/SoC/proc0/e0/ALUop/w_t
add wave -noupdate -group datapath -group ALU -group alu_internals -radix hexadecimal /test_sisa/SoC/proc0/e0/ALUop/resta
add wave -noupdate -group datapath -group ALU -group alu_internals -radix hexadecimal /test_sisa/SoC/proc0/e0/ALUop/div
add wave -noupdate -group datapath -group ALU -group alu_internals -radix hexadecimal /test_sisa/SoC/proc0/e0/ALUop/divu
add wave -noupdate -group datapath -group ALU -group alu_internals -radix hexadecimal /test_sisa/SoC/proc0/e0/ALUop/mul
add wave -noupdate -group datapath -group ALU -group alu_internals -radix hexadecimal /test_sisa/SoC/proc0/e0/ALUop/mulu
add wave -noupdate -group datapath -group ALU -group alu_internals -radix hexadecimal /test_sisa/SoC/proc0/e0/ALUop/eq
add wave -noupdate -group datapath -group ALU -group alu_internals -radix hexadecimal /test_sisa/SoC/proc0/e0/ALUop/cmpltu
add wave -noupdate -group datapath -group ALU -group alu_internals -radix hexadecimal /test_sisa/SoC/proc0/e0/ALUop/sha
add wave -noupdate -group datapath -group ALU -group alu_internals -radix hexadecimal /test_sisa/SoC/proc0/e0/ALUop/shl
add wave -noupdate -group datapath -group ALU -group alu_internals -radix hexadecimal /test_sisa/SoC/proc0/e0/ALUop/shift_y
add wave -noupdate -group mem -radix hexadecimal /test_sisa/SoC/mem0/CLOCK_50
add wave -noupdate -group mem -radix hexadecimal /test_sisa/SoC/mem0/addr
add wave -noupdate -group mem -radix hexadecimal /test_sisa/SoC/mem0/wr_data
add wave -noupdate -group mem -radix hexadecimal /test_sisa/SoC/mem0/rd_data
add wave -noupdate -group mem -radix hexadecimal /test_sisa/SoC/mem0/we
add wave -noupdate -group mem -radix hexadecimal /test_sisa/SoC/mem0/byte_m
add wave -noupdate -group mem -radix hexadecimal /test_sisa/SoC/mem0/SRAM_ADDR
add wave -noupdate -group mem -radix hexadecimal /test_sisa/SoC/mem0/SRAM_DQ
add wave -noupdate -group mem -radix hexadecimal /test_sisa/SoC/mem0/SRAM_UB_N
add wave -noupdate -group mem -radix hexadecimal /test_sisa/SoC/mem0/SRAM_LB_N
add wave -noupdate -group mem -radix hexadecimal /test_sisa/SoC/mem0/SRAM_CE_N
add wave -noupdate -group mem -radix hexadecimal /test_sisa/SoC/mem0/SRAM_OE_N
add wave -noupdate -group mem -radix hexadecimal /test_sisa/SoC/mem0/SRAM_WE_N
add wave -noupdate -group mem -group sram -radix hexadecimal /test_sisa/SoC/mem0/sram/clk
add wave -noupdate -group mem -group sram -radix hexadecimal /test_sisa/SoC/mem0/sram/SRAM_ADDR
add wave -noupdate -group mem -group sram -radix hexadecimal /test_sisa/SoC/mem0/sram/SRAM_DQ
add wave -noupdate -group mem -group sram -radix hexadecimal /test_sisa/SoC/mem0/sram/SRAM_UB_N
add wave -noupdate -group mem -group sram -radix hexadecimal /test_sisa/SoC/mem0/sram/SRAM_LB_N
add wave -noupdate -group mem -group sram -radix hexadecimal /test_sisa/SoC/mem0/sram/SRAM_CE_N
add wave -noupdate -group mem -group sram -radix hexadecimal /test_sisa/SoC/mem0/sram/SRAM_OE_N
add wave -noupdate -group mem -group sram -radix hexadecimal /test_sisa/SoC/mem0/sram/SRAM_WE_N
add wave -noupdate -group mem -group sram -radix hexadecimal /test_sisa/SoC/mem0/sram/address
add wave -noupdate -group mem -group sram -radix hexadecimal /test_sisa/SoC/mem0/sram/dataReaded
add wave -noupdate -group mem -group sram -radix hexadecimal /test_sisa/SoC/mem0/sram/dataToWrite
add wave -noupdate -group mem -group sram -radix hexadecimal /test_sisa/SoC/mem0/sram/WR
add wave -noupdate -group mem -group sram -radix hexadecimal /test_sisa/SoC/mem0/sram/byte_m
add wave -noupdate -group mem -group sram -group sram_internals -radix hexadecimal /test_sisa/SoC/mem0/sram/state
add wave -noupdate -group io -group key_ctrl -radix hexadecimal /test_sisa/SoC/io0/keys_ctr/clk
add wave -noupdate -group io -group key_ctrl -radix hexadecimal /test_sisa/SoC/io0/keys_ctr/boot
add wave -noupdate -group io -group key_ctrl -radix hexadecimal /test_sisa/SoC/io0/keys_ctr/inta
add wave -noupdate -group io -group key_ctrl -radix hexadecimal /test_sisa/SoC/io0/keys_ctr/keys
add wave -noupdate -group io -group key_ctrl -radix hexadecimal /test_sisa/SoC/io0/keys_ctr/intr
add wave -noupdate -group io -group key_ctrl -radix hexadecimal /test_sisa/SoC/io0/keys_ctr/read_key
add wave -noupdate -group io -group key_ctrl -radix hexadecimal /test_sisa/SoC/io0/keys_ctr/state
add wave -noupdate -group io -group key_ctrl -radix hexadecimal /test_sisa/SoC/io0/keys_ctr/keys_d
add wave -noupdate -group io -group key_ctrl -radix hexadecimal /test_sisa/SoC/io0/keys_ctr/keys_q
add wave -noupdate -group io -group key_ctrl -radix hexadecimal /test_sisa/SoC/io0/keys_ctr/clk
add wave -noupdate -group io -group key_ctrl -radix hexadecimal /test_sisa/SoC/io0/keys_ctr/boot
add wave -noupdate -group io -group key_ctrl -radix hexadecimal /test_sisa/SoC/io0/keys_ctr/inta
add wave -noupdate -group io -group key_ctrl -radix hexadecimal /test_sisa/SoC/io0/keys_ctr/keys
add wave -noupdate -group io -group key_ctrl -radix hexadecimal /test_sisa/SoC/io0/keys_ctr/intr
add wave -noupdate -group io -group key_ctrl -radix hexadecimal /test_sisa/SoC/io0/keys_ctr/read_key
add wave -noupdate -group io -group key_ctrl -radix hexadecimal /test_sisa/SoC/io0/keys_ctr/state
add wave -noupdate -group io -group key_ctrl -radix hexadecimal /test_sisa/SoC/io0/keys_ctr/keys_d
add wave -noupdate -group io -group key_ctrl -radix hexadecimal /test_sisa/SoC/io0/keys_ctr/keys_q
add wave -noupdate -group io -group timer_ctrl -radix hexadecimal /test_sisa/SoC/io0/timer_ctr/CLOCK_50
add wave -noupdate -group io -group timer_ctrl -radix hexadecimal /test_sisa/SoC/io0/timer_ctr/boot
add wave -noupdate -group io -group timer_ctrl -radix hexadecimal /test_sisa/SoC/io0/timer_ctr/inta
add wave -noupdate -group io -group timer_ctrl -radix hexadecimal /test_sisa/SoC/io0/timer_ctr/intr
add wave -noupdate -group io -group timer_ctrl -radix hexadecimal /test_sisa/SoC/io0/timer_ctr/state
add wave -noupdate -group io -group timer_ctrl -radix hexadecimal /test_sisa/SoC/io0/timer_ctr/clock_20hz_clk
add wave -noupdate -group io -group timer_ctrl -radix hexadecimal /test_sisa/SoC/io0/timer_ctr/clock_20hz_cnt
add wave -noupdate -group io -group timer_ctrl -radix hexadecimal /test_sisa/SoC/io0/timer_ctr/tick
add wave -noupdate -group io -group timer_ctrl -radix hexadecimal /test_sisa/SoC/io0/timer_ctr/clock_20hz/contador
add wave -noupdate -group io -group timer_ctrl -radix hexadecimal /test_sisa/SoC/io0/timer_ctr/clock_20hz/half_count
add wave -noupdate -group io -group timer_ctrl -radix hexadecimal /test_sisa/SoC/io0/timer_ctr/CLOCK_50
add wave -noupdate -group io -group timer_ctrl -radix hexadecimal /test_sisa/SoC/io0/timer_ctr/boot
add wave -noupdate -group io -group timer_ctrl -radix hexadecimal /test_sisa/SoC/io0/timer_ctr/inta
add wave -noupdate -group io -group timer_ctrl -radix hexadecimal /test_sisa/SoC/io0/timer_ctr/intr
add wave -noupdate -group io -group timer_ctrl -radix hexadecimal /test_sisa/SoC/io0/timer_ctr/state
add wave -noupdate -group io -group timer_ctrl -radix hexadecimal /test_sisa/SoC/io0/timer_ctr/clock_20hz_clk
add wave -noupdate -group io -group timer_ctrl -radix hexadecimal /test_sisa/SoC/io0/timer_ctr/clock_20hz_cnt
add wave -noupdate -group io -group timer_ctrl -radix hexadecimal /test_sisa/SoC/io0/timer_ctr/tick
add wave -noupdate -group io -group timer_ctrl -radix hexadecimal /test_sisa/SoC/io0/timer_ctr/clock_20hz/contador
add wave -noupdate -group io -group timer_ctrl -radix hexadecimal /test_sisa/SoC/io0/timer_ctr/clock_20hz/half_count
add wave -noupdate -group io -group interrupt_controller /test_sisa/SoC/io0/int_ctr/inta
add wave -noupdate -group io -group interrupt_controller /test_sisa/SoC/io0/int_ctr/key_intr
add wave -noupdate -group io -group interrupt_controller /test_sisa/SoC/io0/int_ctr/ps2_intr
add wave -noupdate -group io -group interrupt_controller /test_sisa/SoC/io0/int_ctr/switch_intr
add wave -noupdate -group io -group interrupt_controller /test_sisa/SoC/io0/int_ctr/timer_intr
add wave -noupdate -group io -group interrupt_controller /test_sisa/SoC/io0/int_ctr/intr
add wave -noupdate -group io -group interrupt_controller /test_sisa/SoC/io0/int_ctr/key_inta
add wave -noupdate -group io -group interrupt_controller /test_sisa/SoC/io0/int_ctr/ps2_inta
add wave -noupdate -group io -group interrupt_controller /test_sisa/SoC/io0/int_ctr/switch_inta
add wave -noupdate -group io -group interrupt_controller /test_sisa/SoC/io0/int_ctr/timer_inta
add wave -noupdate -group io -group interrupt_controller /test_sisa/SoC/io0/int_ctr/iid
add wave -noupdate -group io -group io_internals -radix hexadecimal -childformat {{/test_sisa/SoC/io0/mem(0) -radix hexadecimal} {/test_sisa/SoC/io0/mem(1) -radix hexadecimal} {/test_sisa/SoC/io0/mem(2) -radix hexadecimal} {/test_sisa/SoC/io0/mem(3) -radix hexadecimal} {/test_sisa/SoC/io0/mem(4) -radix hexadecimal} {/test_sisa/SoC/io0/mem(5) -radix hexadecimal} {/test_sisa/SoC/io0/mem(6) -radix hexadecimal} {/test_sisa/SoC/io0/mem(7) -radix hexadecimal} {/test_sisa/SoC/io0/mem(8) -radix hexadecimal} {/test_sisa/SoC/io0/mem(9) -radix hexadecimal} {/test_sisa/SoC/io0/mem(10) -radix hexadecimal} {/test_sisa/SoC/io0/mem(11) -radix hexadecimal} {/test_sisa/SoC/io0/mem(12) -radix hexadecimal} {/test_sisa/SoC/io0/mem(13) -radix hexadecimal} {/test_sisa/SoC/io0/mem(14) -radix hexadecimal} {/test_sisa/SoC/io0/mem(15) -radix hexadecimal} {/test_sisa/SoC/io0/mem(16) -radix hexadecimal} {/test_sisa/SoC/io0/mem(17) -radix hexadecimal} {/test_sisa/SoC/io0/mem(18) -radix hexadecimal} {/test_sisa/SoC/io0/mem(19) -radix hexadecimal} {/test_sisa/SoC/io0/mem(20) -radix hexadecimal} {/test_sisa/SoC/io0/mem(21) -radix hexadecimal} {/test_sisa/SoC/io0/mem(22) -radix hexadecimal} {/test_sisa/SoC/io0/mem(23) -radix hexadecimal} {/test_sisa/SoC/io0/mem(24) -radix hexadecimal} {/test_sisa/SoC/io0/mem(25) -radix hexadecimal} {/test_sisa/SoC/io0/mem(26) -radix hexadecimal} {/test_sisa/SoC/io0/mem(27) -radix hexadecimal} {/test_sisa/SoC/io0/mem(28) -radix hexadecimal} {/test_sisa/SoC/io0/mem(29) -radix hexadecimal} {/test_sisa/SoC/io0/mem(30) -radix hexadecimal} {/test_sisa/SoC/io0/mem(31) -radix hexadecimal}} -subitemconfig {/test_sisa/SoC/io0/mem(0) {-height 16 -radix hexadecimal} /test_sisa/SoC/io0/mem(1) {-height 16 -radix hexadecimal} /test_sisa/SoC/io0/mem(2) {-height 16 -radix hexadecimal} /test_sisa/SoC/io0/mem(3) {-height 16 -radix hexadecimal} /test_sisa/SoC/io0/mem(4) {-height 16 -radix hexadecimal} /test_sisa/SoC/io0/mem(5) {-height 16 -radix hexadecimal} /test_sisa/SoC/io0/mem(6) {-height 16 -radix hexadecimal} /test_sisa/SoC/io0/mem(7) {-height 16 -radix hexadecimal} /test_sisa/SoC/io0/mem(8) {-height 16 -radix hexadecimal} /test_sisa/SoC/io0/mem(9) {-height 16 -radix hexadecimal} /test_sisa/SoC/io0/mem(10) {-height 16 -radix hexadecimal} /test_sisa/SoC/io0/mem(11) {-height 16 -radix hexadecimal} /test_sisa/SoC/io0/mem(12) {-height 16 -radix hexadecimal} /test_sisa/SoC/io0/mem(13) {-height 16 -radix hexadecimal} /test_sisa/SoC/io0/mem(14) {-height 16 -radix hexadecimal} /test_sisa/SoC/io0/mem(15) {-height 16 -radix hexadecimal} /test_sisa/SoC/io0/mem(16) {-height 16 -radix hexadecimal} /test_sisa/SoC/io0/mem(17) {-height 16 -radix hexadecimal} /test_sisa/SoC/io0/mem(18) {-height 16 -radix hexadecimal} /test_sisa/SoC/io0/mem(19) {-height 16 -radix hexadecimal} /test_sisa/SoC/io0/mem(20) {-height 16 -radix hexadecimal} /test_sisa/SoC/io0/mem(21) {-height 16 -radix hexadecimal} /test_sisa/SoC/io0/mem(22) {-height 16 -radix hexadecimal} /test_sisa/SoC/io0/mem(23) {-height 16 -radix hexadecimal} /test_sisa/SoC/io0/mem(24) {-height 16 -radix hexadecimal} /test_sisa/SoC/io0/mem(25) {-height 16 -radix hexadecimal} /test_sisa/SoC/io0/mem(26) {-height 16 -radix hexadecimal} /test_sisa/SoC/io0/mem(27) {-height 16 -radix hexadecimal} /test_sisa/SoC/io0/mem(28) {-height 16 -radix hexadecimal} /test_sisa/SoC/io0/mem(29) {-height 16 -radix hexadecimal} /test_sisa/SoC/io0/mem(30) {-height 16 -radix hexadecimal} /test_sisa/SoC/io0/mem(31) {-height 16 -radix hexadecimal}} /test_sisa/SoC/io0/mem
add wave -noupdate -group io -group io_internals -radix hexadecimal /test_sisa/SoC/io0/hex_num
add wave -noupdate -group io -group io_internals -radix hexadecimal /test_sisa/SoC/io0/hex_display_en
add wave -noupdate -group io -group io_internals -radix hexadecimal -childformat {{/test_sisa/SoC/io0/kb_read_char(7) -radix hexadecimal} {/test_sisa/SoC/io0/kb_read_char(6) -radix hexadecimal} {/test_sisa/SoC/io0/kb_read_char(5) -radix hexadecimal} {/test_sisa/SoC/io0/kb_read_char(4) -radix hexadecimal} {/test_sisa/SoC/io0/kb_read_char(3) -radix hexadecimal} {/test_sisa/SoC/io0/kb_read_char(2) -radix hexadecimal} {/test_sisa/SoC/io0/kb_read_char(1) -radix hexadecimal} {/test_sisa/SoC/io0/kb_read_char(0) -radix hexadecimal}} -subitemconfig {/test_sisa/SoC/io0/kb_read_char(7) {-height 16 -radix hexadecimal} /test_sisa/SoC/io0/kb_read_char(6) {-height 16 -radix hexadecimal} /test_sisa/SoC/io0/kb_read_char(5) {-height 16 -radix hexadecimal} /test_sisa/SoC/io0/kb_read_char(4) {-height 16 -radix hexadecimal} /test_sisa/SoC/io0/kb_read_char(3) {-height 16 -radix hexadecimal} /test_sisa/SoC/io0/kb_read_char(2) {-height 16 -radix hexadecimal} /test_sisa/SoC/io0/kb_read_char(1) {-height 16 -radix hexadecimal} /test_sisa/SoC/io0/kb_read_char(0) {-height 16 -radix hexadecimal}} /test_sisa/SoC/io0/kb_read_char
add wave -noupdate -group io -group io_internals -radix hexadecimal /test_sisa/SoC/io0/kb_data_ready
add wave -noupdate -group io -group io_internals -radix hexadecimal /test_sisa/SoC/io0/clear_char
add wave -noupdate -group io -group io_internals -radix hexadecimal /test_sisa/SoC/io0/cont_ciclos
add wave -noupdate -group io -group io_internals -radix hexadecimal /test_sisa/SoC/io0/cont_mili
add wave -noupdate -group io -radix hexadecimal /test_sisa/SoC/io0/boot
add wave -noupdate -group io -radix hexadecimal /test_sisa/SoC/io0/CLOCK_50
add wave -noupdate -group io -radix hexadecimal /test_sisa/SoC/io0/addr_io
add wave -noupdate -group io -radix hexadecimal /test_sisa/SoC/io0/wr_io
add wave -noupdate -group io -radix hexadecimal /test_sisa/SoC/io0/rd_io
add wave -noupdate -group io -radix hexadecimal /test_sisa/SoC/io0/wr_out
add wave -noupdate -group io -radix hexadecimal /test_sisa/SoC/io0/rd_in
add wave -noupdate -group io -radix hexadecimal /test_sisa/SoC/io0/led_verdes
add wave -noupdate -group io -radix hexadecimal /test_sisa/SoC/io0/led_rojos
add wave -noupdate -group io -radix hexadecimal /test_sisa/SoC/io0/PS2_CLK
add wave -noupdate -group io -radix hexadecimal /test_sisa/SoC/io0/PS2_DAT
add wave -noupdate -group io -radix hexadecimal /test_sisa/SoC/io0/KEY
add wave -noupdate -group io -radix hexadecimal /test_sisa/SoC/io0/SW
add wave -noupdate -group io -radix hexadecimal /test_sisa/SoC/io0/HEX0
add wave -noupdate -group io -radix hexadecimal /test_sisa/SoC/io0/HEX1
add wave -noupdate -group io -radix hexadecimal /test_sisa/SoC/io0/HEX2
add wave -noupdate -group io -radix hexadecimal /test_sisa/SoC/io0/HEX3
add wave -noupdate -expand -group core_state /test_sisa/SoC/proc0/boot
add wave -noupdate -expand -group core_state /test_sisa/SoC/proc0/c0/clk
add wave -noupdate -expand -group core_state /test_sisa/SoC/proc0/c0/m0/state
add wave -noupdate -expand -group core_state /test_sisa/SoC/proc0/e0/SBR/mode_sys
add wave -noupdate -expand -group core_state -radix hexadecimal /test_sisa/SoC/proc0/e0/pc_in
add wave -noupdate -expand -group core_state -radix hexadecimal /test_sisa/SoC/proc0/c0/pc_out
add wave -noupdate -expand -group core_state -radix hexadecimal /test_sisa/SoC/proc0/e0/pc_next
add wave -noupdate -expand -group core_state -radix hexadecimal /test_sisa/SoC/proc0/c0/ir_q
add wave -noupdate -expand -group core_state -radix hexadecimal /test_sisa/SoC/proc0/c0/int_en
add wave -noupdate -expand -group core_state -radix hexadecimal /test_sisa/SoC/proc0/c0/intr
add wave -noupdate -expand -group core_state -radix hexadecimal /test_sisa/SoC/proc0/c0/excp
add wave -noupdate -expand -group core_state -radix hexadecimal -childformat {{/test_sisa/SoC/proc0/e0/BR/BR(0) -radix hexadecimal} {/test_sisa/SoC/proc0/e0/BR/BR(1) -radix hexadecimal} {/test_sisa/SoC/proc0/e0/BR/BR(2) -radix hexadecimal} {/test_sisa/SoC/proc0/e0/BR/BR(3) -radix hexadecimal} {/test_sisa/SoC/proc0/e0/BR/BR(4) -radix hexadecimal} {/test_sisa/SoC/proc0/e0/BR/BR(5) -radix hexadecimal} {/test_sisa/SoC/proc0/e0/BR/BR(6) -radix hexadecimal} {/test_sisa/SoC/proc0/e0/BR/BR(7) -radix hexadecimal}} -subitemconfig {/test_sisa/SoC/proc0/e0/BR/BR(0) {-height 16 -radix hexadecimal} /test_sisa/SoC/proc0/e0/BR/BR(1) {-height 16 -radix hexadecimal} /test_sisa/SoC/proc0/e0/BR/BR(2) {-height 16 -radix hexadecimal} /test_sisa/SoC/proc0/e0/BR/BR(3) {-height 16 -radix hexadecimal} /test_sisa/SoC/proc0/e0/BR/BR(4) {-height 16 -radix hexadecimal} /test_sisa/SoC/proc0/e0/BR/BR(5) {-height 16 -radix hexadecimal} /test_sisa/SoC/proc0/e0/BR/BR(6) {-height 16 -radix hexadecimal} /test_sisa/SoC/proc0/e0/BR/BR(7) {-height 16 -radix hexadecimal}} /test_sisa/SoC/proc0/e0/BR/BR
add wave -noupdate -expand -group core_state -radix hexadecimal -childformat {{/test_sisa/SoC/proc0/e0/SBR/BR(0) -radix hexadecimal} {/test_sisa/SoC/proc0/e0/SBR/BR(1) -radix hexadecimal} {/test_sisa/SoC/proc0/e0/SBR/BR(2) -radix hexadecimal} {/test_sisa/SoC/proc0/e0/SBR/BR(3) -radix hexadecimal} {/test_sisa/SoC/proc0/e0/SBR/BR(4) -radix hexadecimal} {/test_sisa/SoC/proc0/e0/SBR/BR(5) -radix hexadecimal} {/test_sisa/SoC/proc0/e0/SBR/BR(6) -radix hexadecimal} {/test_sisa/SoC/proc0/e0/SBR/BR(7) -radix hexadecimal}} -subitemconfig {/test_sisa/SoC/proc0/e0/SBR/BR(0) {-height 16 -radix hexadecimal} /test_sisa/SoC/proc0/e0/SBR/BR(1) {-height 16 -radix hexadecimal} /test_sisa/SoC/proc0/e0/SBR/BR(2) {-height 16 -radix hexadecimal} /test_sisa/SoC/proc0/e0/SBR/BR(3) {-height 16 -radix hexadecimal} /test_sisa/SoC/proc0/e0/SBR/BR(4) {-height 16 -radix hexadecimal} /test_sisa/SoC/proc0/e0/SBR/BR(5) {-height 16 -radix hexadecimal} /test_sisa/SoC/proc0/e0/SBR/BR(6) {-height 16 -radix hexadecimal} /test_sisa/SoC/proc0/e0/SBR/BR(7) {-height 16 -radix hexadecimal}} /test_sisa/SoC/proc0/e0/SBR/BR
add wave -noupdate -group sd_interface -radix hexadecimal /test_sisa/SoC/io0/sd_ctr/sd_drv/addr
add wave -noupdate -group sd_interface -radix hexadecimal /test_sisa/SoC/io0/sd_ctr/sd_drv/rd
add wave -noupdate -group sd_interface -radix hexadecimal /test_sisa/SoC/io0/sd_ctr/sd_drv/busy
add wave -noupdate -group sd_interface -radix hexadecimal /test_sisa/SoC/io0/sd_ctr/sd_drv/dout
add wave -noupdate -group sd_interface -radix hexadecimal /test_sisa/SoC/io0/sd_ctr/sd_drv/dout_avail
add wave -noupdate -group sd_interface -radix hexadecimal /test_sisa/SoC/io0/sd_ctr/sd_drv/dout_taken
add wave -noupdate -group sd_interface -radix hexadecimal /test_sisa/SoC/io0/sd_ctr/sd_drv/rd_out
add wave -noupdate -group sd_interface -radix hexadecimal /test_sisa/SoC/io0/sd_ctr/sd_drv/data
add wave -noupdate -group sd_interface -radix hexadecimal /test_sisa/SoC/io0/sd_ctr/sd_drv/valid
add wave -noupdate -group sd_interface -radix hexadecimal /test_sisa/SoC/io0/sd_ctr/sd_drv/byte_counter
add wave -noupdate -group sd_interface -radix hexadecimal /test_sisa/SoC/io0/sd_ctr/sd_drv/byte_counter_d
add wave -noupdate -group sd_interface -radix hexadecimal /test_sisa/SoC/io0/sd_ctr/sd_drv/offset
add wave -noupdate -group sd_interface /test_sisa/sd0/tx_byte_counter
add wave -noupdate -group sd_interface /test_sisa/sd0/tx_bit_counter
add wave -noupdate -group sd_interface /test_sisa/sd0/cs
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{final reset} {2064850000 ps} 1} {{__OFF_E_SHOFF sd read valid} {2418510000 ps} 1} {{__OFF_E_SHNUM sd read valid} {2592730000 ps} 1} {{__OFF_SH_FLAGS sd first read valid} {2782310000 ps} 1} {{__OFF_SH_FLAGS sd second read valid} {2964210000 ps} 1} {{__OFF_SH_ADDR .text} {3134590000 ps} 1} {{lectura offset .text} {3304970000 ps} 1} {{lectura mida sector .text} {3475350000 ps} 1} {{INICI COPIA CODI SD TO SRAM (.text)} {3612777208 ps} 1} {{FINAL COPIA DE SD TO SRAM (.text)} {3955890000 ps} 1} {{Jump a 0xC000, (execucio del elf)} {5917177208 ps} 1} {{Cursor 13} {5919290681 ps} 0}
quietly wave cursor active 12
configure wave -namecolwidth 357
configure wave -valuecolwidth 132
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {5917071798 ps} {5924308203 ps}
