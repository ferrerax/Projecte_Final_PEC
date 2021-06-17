onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -group SD_DRIVER_internal /testbench_sd_driver/sd_drv/offset
add wave -noupdate -group SD_DRIVER_internal /testbench_sd_driver/sd_drv/byte_counter
add wave -noupdate -group SD_DRIVER_ports -radix hexadecimal /testbench_sd_driver/sd_drv/dout_avail
add wave -noupdate -group SD_DRIVER_ports -radix hexadecimal /testbench_sd_driver/sd_drv/dout_taken
add wave -noupdate -group SD_DRIVER_ports -radix hexadecimal /testbench_sd_driver/sd_drv/busy
add wave -noupdate -group SD_DRIVER_ports -radix hexadecimal /testbench_sd_driver/sd_drv/dout
add wave -noupdate -group SD_DRIVER_ports -radix hexadecimal /testbench_sd_driver/sd_drv/data
add wave -noupdate -group SD_DRIVER_ports -radix hexadecimal /testbench_sd_driver/sd_drv/rd
add wave -noupdate -group SD_DRIVER_ports -radix hexadecimal /testbench_sd_driver/sd_drv/valid
add wave -noupdate -group SD_DRIVER_ports -radix hexadecimal /testbench_sd_driver/sd_drv/addr
add wave -noupdate -expand -group UUT /testbench_sd_driver/uut/sd_busy
add wave -noupdate -expand -group UUT /testbench_sd_driver/uut/dout_avail
add wave -noupdate -expand -group UUT /testbench_sd_driver/uut/byte_counter
add wave -noupdate -expand -group UUT /testbench_sd_driver/uut/new_address
add wave -noupdate -expand -group UUT /testbench_sd_driver/uut/address
add wave -noupdate -expand -group UUT /testbench_sd_driver/uut/data_out
add wave -noupdate /testbench_sd_driver/uut/sd_error
add wave -noupdate -radix hexadecimal /testbench_sd_driver/uut/cs
add wave -noupdate -radix hexadecimal /testbench_sd_driver/uut/mosi
add wave -noupdate -radix hexadecimal /testbench_sd_driver/uut/miso
add wave -noupdate -radix hexadecimal /testbench_sd_driver/uut/sclk
add wave -noupdate -radix hexadecimal /testbench_sd_driver/uut/card_present
add wave -noupdate -radix hexadecimal /testbench_sd_driver/uut/card_write_prot
add wave -noupdate -radix hexadecimal /testbench_sd_driver/uut/rd
add wave -noupdate -radix hexadecimal /testbench_sd_driver/uut/rd_multiple
add wave -noupdate -radix hexadecimal /testbench_sd_driver/uut/dout
add wave -noupdate -radix hexadecimal /testbench_sd_driver/uut/dout_avail
add wave -noupdate -radix hexadecimal /testbench_sd_driver/uut/dout_taken
add wave -noupdate -radix hexadecimal /testbench_sd_driver/uut/wr
add wave -noupdate -radix hexadecimal /testbench_sd_driver/uut/wr_multiple
add wave -noupdate -radix hexadecimal /testbench_sd_driver/uut/din
add wave -noupdate -radix hexadecimal /testbench_sd_driver/uut/din_valid
add wave -noupdate -radix hexadecimal /testbench_sd_driver/uut/din_taken
add wave -noupdate -radix hexadecimal /testbench_sd_driver/uut/addr
add wave -noupdate -radix hexadecimal /testbench_sd_driver/uut/erase_count
add wave -noupdate -radix hexadecimal /testbench_sd_driver/uut/sd_error
add wave -noupdate -radix hexadecimal /testbench_sd_driver/uut/sd_busy
add wave -noupdate -radix hexadecimal /testbench_sd_driver/uut/sd_error_code
add wave -noupdate -radix hexadecimal /testbench_sd_driver/uut/reset
add wave -noupdate -radix hexadecimal /testbench_sd_driver/uut/clk
add wave -noupdate -radix hexadecimal /testbench_sd_driver/uut/sd_type
add wave -noupdate -radix hexadecimal /testbench_sd_driver/uut/sd_fsm
add wave -noupdate -radix hexadecimal /testbench_sd_driver/uut/state
add wave -noupdate -radix hexadecimal /testbench_sd_driver/uut/new_state
add wave -noupdate -radix hexadecimal /testbench_sd_driver/uut/return_state
add wave -noupdate -radix hexadecimal /testbench_sd_driver/uut/new_return_state
add wave -noupdate -radix hexadecimal /testbench_sd_driver/uut/sr_return_state
add wave -noupdate -radix hexadecimal /testbench_sd_driver/uut/new_sr_return_state
add wave -noupdate -radix hexadecimal /testbench_sd_driver/uut/set_return_state
add wave -noupdate -radix hexadecimal /testbench_sd_driver/uut/set_sr_return_state
add wave -noupdate -radix hexadecimal /testbench_sd_driver/uut/new_sclk
add wave -noupdate -radix hexadecimal /testbench_sd_driver/uut/sCs
add wave -noupdate -radix hexadecimal /testbench_sd_driver/uut/new_cs
add wave -noupdate -radix hexadecimal /testbench_sd_driver/uut/set_davail
add wave -noupdate -radix hexadecimal /testbench_sd_driver/uut/sDavail
add wave -noupdate -radix hexadecimal /testbench_sd_driver/uut/transfer_data_out
add wave -noupdate -radix hexadecimal /testbench_sd_driver/uut/new_transfer_data_out
add wave -noupdate -radix hexadecimal /testbench_sd_driver/uut/card_type
add wave -noupdate -radix hexadecimal /testbench_sd_driver/uut/new_card_type
add wave -noupdate -radix hexadecimal /testbench_sd_driver/uut/error
add wave -noupdate -radix hexadecimal /testbench_sd_driver/uut/new_error
add wave -noupdate -radix hexadecimal /testbench_sd_driver/uut/error_code
add wave -noupdate -radix hexadecimal /testbench_sd_driver/uut/new_error_code
add wave -noupdate -radix hexadecimal /testbench_sd_driver/uut/new_busy
add wave -noupdate -radix hexadecimal /testbench_sd_driver/uut/sDin_taken
add wave -noupdate -radix hexadecimal /testbench_sd_driver/uut/new_din_taken
add wave -noupdate -radix hexadecimal /testbench_sd_driver/uut/cmd_out
add wave -noupdate -radix hexadecimal /testbench_sd_driver/uut/new_cmd_out
add wave -noupdate -radix hexadecimal /testbench_sd_driver/uut/set_cmd_out
add wave -noupdate -radix hexadecimal /testbench_sd_driver/uut/data_in
add wave -noupdate -radix hexadecimal /testbench_sd_driver/uut/new_data_in
add wave -noupdate -radix hexadecimal /testbench_sd_driver/uut/new_crc7
add wave -noupdate -radix hexadecimal /testbench_sd_driver/uut/crc7
add wave -noupdate -radix hexadecimal /testbench_sd_driver/uut/new_in_crc16
add wave -noupdate -radix hexadecimal /testbench_sd_driver/uut/in_crc16
add wave -noupdate -radix hexadecimal /testbench_sd_driver/uut/new_out_crc16
add wave -noupdate -radix hexadecimal /testbench_sd_driver/uut/out_crc16
add wave -noupdate -radix hexadecimal /testbench_sd_driver/uut/new_crcLow
add wave -noupdate -radix hexadecimal /testbench_sd_driver/uut/crcLow
add wave -noupdate -radix hexadecimal /testbench_sd_driver/uut/data_out
add wave -noupdate -radix hexadecimal /testbench_sd_driver/uut/new_data_out
add wave -noupdate -radix hexadecimal /testbench_sd_driver/uut/address
add wave -noupdate -radix hexadecimal /testbench_sd_driver/uut/new_address
add wave -noupdate -radix hexadecimal /testbench_sd_driver/uut/wr_erase_count
add wave -noupdate -radix hexadecimal /testbench_sd_driver/uut/new_wr_erase_count
add wave -noupdate -radix hexadecimal /testbench_sd_driver/uut/set_address
add wave -noupdate -radix hexadecimal /testbench_sd_driver/uut/byte_counter
add wave -noupdate -radix hexadecimal /testbench_sd_driver/uut/new_byte_counter
add wave -noupdate -radix hexadecimal /testbench_sd_driver/uut/set_byte_counter
add wave -noupdate -radix hexadecimal /testbench_sd_driver/uut/bit_counter
add wave -noupdate -radix hexadecimal /testbench_sd_driver/uut/new_bit_counter
add wave -noupdate -radix hexadecimal /testbench_sd_driver/uut/slow_clock
add wave -noupdate -radix hexadecimal /testbench_sd_driver/uut/new_slow_clock
add wave -noupdate -radix hexadecimal /testbench_sd_driver/uut/clock_divider
add wave -noupdate -radix hexadecimal /testbench_sd_driver/uut/new_clock_divider
add wave -noupdate -radix hexadecimal /testbench_sd_driver/uut/multiple
add wave -noupdate -radix hexadecimal /testbench_sd_driver/uut/new_multiple
add wave -noupdate -radix hexadecimal /testbench_sd_driver/uut/skipFirstR1Byte
add wave -noupdate -radix hexadecimal /testbench_sd_driver/uut/new_skipFirstR1Byte
add wave -noupdate -radix hexadecimal /testbench_sd_driver/uut/din_latch
add wave -noupdate -radix hexadecimal /testbench_sd_driver/uut/last_din_valid
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {2095010000 ps} 1} {{Cursor 2} {2099850000 ps} 1} {{Cursor 3} {2264610000 ps} 1} {{Cursor 4} {2272610000 ps} 1} {{Cursor 5} {94994903683 ps} 0}
quietly wave cursor active 5
configure wave -namecolwidth 240
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
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
WaveRestoreZoom {94993627746 ps} {95004661698 ps}
