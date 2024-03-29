onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group top_placa -radix hexadecimal /tb_top_placa/tb/CLOCK_50
add wave -noupdate -expand -group top_placa -radix hexadecimal /tb_top_placa/tb/SD_CLK
add wave -noupdate -expand -group top_placa -radix hexadecimal /tb_top_placa/tb/SD_CMD
add wave -noupdate -expand -group top_placa -radix hexadecimal /tb_top_placa/tb/SD_DAT
add wave -noupdate -expand -group top_placa -radix hexadecimal /tb_top_placa/tb/SD_DAT3
add wave -noupdate -expand -group top_placa -radix hexadecimal /tb_top_placa/tb/SW
add wave -noupdate -expand -group top_placa -radix hexadecimal /tb_top_placa/tb/KEY
add wave -noupdate -expand -group top_placa -radix hexadecimal -childformat {{/tb_top_placa/tb/LEDR(4) -radix hexadecimal} {/tb_top_placa/tb/LEDR(3) -radix hexadecimal} {/tb_top_placa/tb/LEDR(2) -radix hexadecimal} {/tb_top_placa/tb/LEDR(1) -radix hexadecimal} {/tb_top_placa/tb/LEDR(0) -radix hexadecimal}} -subitemconfig {/tb_top_placa/tb/LEDR(4) {-height 16 -radix hexadecimal} /tb_top_placa/tb/LEDR(3) {-height 16 -radix hexadecimal} /tb_top_placa/tb/LEDR(2) {-height 16 -radix hexadecimal} /tb_top_placa/tb/LEDR(1) {-height 16 -radix hexadecimal} /tb_top_placa/tb/LEDR(0) {-height 16 -radix hexadecimal}} /tb_top_placa/tb/LEDR
add wave -noupdate -expand -group top_placa -radix hexadecimal /tb_top_placa/tb/HEX0
add wave -noupdate -expand -group top_placa -radix hexadecimal /tb_top_placa/tb/HEX1
add wave -noupdate -expand -group top_placa -radix hexadecimal /tb_top_placa/tb/HEX2
add wave -noupdate -expand -group top_placa -radix hexadecimal /tb_top_placa/tb/HEX3
add wave -noupdate -expand -group top_placa /tb_top_placa/rd
add wave -noupdate -expand -group sd_driver -radix hexadecimal /tb_top_placa/tb/sd_drv/addr
add wave -noupdate -expand -group sd_driver -radix hexadecimal /tb_top_placa/tb/sd_drv/rd
add wave -noupdate -expand -group sd_driver -radix hexadecimal /tb_top_placa/tb/sd_drv/busy
add wave -noupdate -expand -group sd_driver -radix hexadecimal /tb_top_placa/tb/sd_drv/dout
add wave -noupdate -expand -group sd_driver -radix hexadecimal /tb_top_placa/tb/sd_drv/dout_avail
add wave -noupdate -expand -group sd_driver -radix hexadecimal /tb_top_placa/tb/sd_drv/dout_taken
add wave -noupdate -expand -group sd_driver -radix hexadecimal /tb_top_placa/tb/sd_drv/data
add wave -noupdate -expand -group sd_driver -radix hexadecimal /tb_top_placa/tb/sd_drv/valid
add wave -noupdate -expand -group sd_driver -radix hexadecimal /tb_top_placa/tb/sd_drv/byte_counter
add wave -noupdate -expand -group sd_driver /tb_top_placa/tb/sd_drv/byte_counter_d
add wave -noupdate -expand -group sd_driver -radix hexadecimal /tb_top_placa/tb/sd_drv/offset
add wave -noupdate -expand -group sd_controller -radix hexadecimal /tb_top_placa/tb/uut/clockRate
add wave -noupdate -expand -group sd_controller -radix hexadecimal /tb_top_placa/tb/uut/slowClockDivider
add wave -noupdate -expand -group sd_controller -radix hexadecimal /tb_top_placa/tb/uut/R1_TIMEOUT
add wave -noupdate -expand -group sd_controller -radix hexadecimal /tb_top_placa/tb/uut/WRITE_TIMEOUT
add wave -noupdate -expand -group sd_controller -radix hexadecimal /tb_top_placa/tb/uut/cs
add wave -noupdate -expand -group sd_controller -radix hexadecimal /tb_top_placa/tb/uut/mosi
add wave -noupdate -expand -group sd_controller -radix hexadecimal /tb_top_placa/tb/uut/miso
add wave -noupdate -expand -group sd_controller -radix hexadecimal /tb_top_placa/tb/uut/sclk
add wave -noupdate -expand -group sd_controller -radix hexadecimal /tb_top_placa/tb/uut/card_present
add wave -noupdate -expand -group sd_controller -radix hexadecimal /tb_top_placa/tb/uut/card_write_prot
add wave -noupdate -expand -group sd_controller -radix hexadecimal /tb_top_placa/tb/uut/rd
add wave -noupdate -expand -group sd_controller -radix hexadecimal /tb_top_placa/tb/uut/rd_multiple
add wave -noupdate -expand -group sd_controller -radix hexadecimal /tb_top_placa/tb/uut/dout
add wave -noupdate -expand -group sd_controller -radix hexadecimal /tb_top_placa/tb/uut/dout_avail
add wave -noupdate -expand -group sd_controller -radix hexadecimal /tb_top_placa/tb/uut/dout_taken
add wave -noupdate -expand -group sd_controller -radix hexadecimal /tb_top_placa/tb/uut/wr
add wave -noupdate -expand -group sd_controller -radix hexadecimal /tb_top_placa/tb/uut/wr_multiple
add wave -noupdate -expand -group sd_controller -radix hexadecimal /tb_top_placa/tb/uut/din
add wave -noupdate -expand -group sd_controller -radix hexadecimal /tb_top_placa/tb/uut/din_valid
add wave -noupdate -expand -group sd_controller -radix hexadecimal /tb_top_placa/tb/uut/din_taken
add wave -noupdate -expand -group sd_controller -radix hexadecimal /tb_top_placa/tb/uut/addr
add wave -noupdate -expand -group sd_controller -radix hexadecimal /tb_top_placa/tb/uut/erase_count
add wave -noupdate -expand -group sd_controller -radix hexadecimal /tb_top_placa/tb/uut/sd_error
add wave -noupdate -expand -group sd_controller -radix hexadecimal /tb_top_placa/tb/uut/sd_busy
add wave -noupdate -expand -group sd_controller -radix hexadecimal /tb_top_placa/tb/uut/sd_error_code
add wave -noupdate -expand -group sd_controller -radix hexadecimal /tb_top_placa/tb/uut/reset
add wave -noupdate -expand -group sd_controller -radix hexadecimal /tb_top_placa/tb/uut/clk
add wave -noupdate -expand -group sd_controller /tb_top_placa/tb/uut/state
add wave -noupdate -expand -group sd_controller /tb_top_placa/tb/uut/new_state
add wave -noupdate -expand -group sd_controller -radix hexadecimal /tb_top_placa/tb/uut/sd_type
add wave -noupdate -expand -group sd_controller -radix hexadecimal /tb_top_placa/tb/uut/sd_fsm
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{ini primera lec.} {30030100000 ps} 1}
quietly wave cursor active 1
configure wave -namecolwidth 323
configure wave -valuecolwidth 100
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
WaveRestoreZoom {29992193972 ps} {30244900788 ps}
