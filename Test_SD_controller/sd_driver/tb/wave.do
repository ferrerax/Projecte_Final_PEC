onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -group SD_DRIVER_internal -radix hexadecimal /tb_sd_driver/sd_drv/byte_counter
add wave -noupdate -group SD_DRIVER_internal -radix hexadecimal /tb_sd_driver/sd_drv/offset
add wave -noupdate -expand -group SD_DRIVER_ports -radix hexadecimal /tb_sd_driver/sd_drv/addr
add wave -noupdate -expand -group SD_DRIVER_ports -radix hexadecimal /tb_sd_driver/sd_drv/rd
add wave -noupdate -expand -group SD_DRIVER_ports -radix hexadecimal /tb_sd_driver/sd_drv/busy
add wave -noupdate -expand -group SD_DRIVER_ports -radix hexadecimal /tb_sd_driver/sd_drv/dout
add wave -noupdate -expand -group SD_DRIVER_ports -radix hexadecimal /tb_sd_driver/sd_drv/dout_avail
add wave -noupdate -expand -group SD_DRIVER_ports -radix hexadecimal /tb_sd_driver/sd_drv/dout_taken
add wave -noupdate -expand -group SD_DRIVER_ports -radix hexadecimal /tb_sd_driver/sd_drv/data
add wave -noupdate -expand -group SD_DRIVER_ports -radix hexadecimal /tb_sd_driver/sd_drv/valid
add wave -noupdate -group UUT -radix hexadecimal /tb_sd_driver/uut/clockRate
add wave -noupdate -group UUT -radix hexadecimal /tb_sd_driver/uut/slowClockDivider
add wave -noupdate -group UUT -radix hexadecimal /tb_sd_driver/uut/R1_TIMEOUT
add wave -noupdate -group UUT -radix hexadecimal /tb_sd_driver/uut/WRITE_TIMEOUT
add wave -noupdate -group UUT -radix hexadecimal /tb_sd_driver/uut/cs
add wave -noupdate -group UUT -radix hexadecimal /tb_sd_driver/uut/mosi
add wave -noupdate -group UUT -radix hexadecimal /tb_sd_driver/uut/miso
add wave -noupdate -group UUT -radix hexadecimal /tb_sd_driver/uut/sclk
add wave -noupdate -group UUT -radix hexadecimal /tb_sd_driver/uut/card_present
add wave -noupdate -group UUT -radix hexadecimal /tb_sd_driver/uut/card_write_prot
add wave -noupdate -group UUT -radix hexadecimal /tb_sd_driver/uut/rd
add wave -noupdate -group UUT -radix hexadecimal /tb_sd_driver/uut/rd_multiple
add wave -noupdate -group UUT -radix hexadecimal /tb_sd_driver/uut/dout
add wave -noupdate -group UUT -radix hexadecimal /tb_sd_driver/uut/dout_avail
add wave -noupdate -group UUT -radix hexadecimal /tb_sd_driver/uut/dout_taken
add wave -noupdate -group UUT -radix hexadecimal /tb_sd_driver/uut/wr
add wave -noupdate -group UUT -radix hexadecimal /tb_sd_driver/uut/wr_multiple
add wave -noupdate -group UUT -radix hexadecimal /tb_sd_driver/uut/din
add wave -noupdate -group UUT -radix hexadecimal /tb_sd_driver/uut/din_valid
add wave -noupdate -group UUT -radix hexadecimal /tb_sd_driver/uut/din_taken
add wave -noupdate -group UUT -radix hexadecimal /tb_sd_driver/uut/addr
add wave -noupdate -group UUT -radix hexadecimal /tb_sd_driver/uut/erase_count
add wave -noupdate -group UUT -radix hexadecimal /tb_sd_driver/uut/sd_error
add wave -noupdate -group UUT -radix hexadecimal /tb_sd_driver/uut/sd_busy
add wave -noupdate -group UUT -radix hexadecimal /tb_sd_driver/uut/sd_error_code
add wave -noupdate -group UUT -radix hexadecimal /tb_sd_driver/uut/reset
add wave -noupdate -group UUT -radix hexadecimal /tb_sd_driver/uut/clk
add wave -noupdate -group UUT -radix hexadecimal /tb_sd_driver/uut/sd_type
add wave -noupdate -group UUT -radix hexadecimal /tb_sd_driver/uut/sd_fsm
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {2095010000 ps} 1} {{Cursor 2} {2099850000 ps} 1} {{Cursor 3} {2264610000 ps} 1} {{Cursor 4} {2272610000 ps} 1} {{Cursor 5} {94995682245 ps} 0}
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
