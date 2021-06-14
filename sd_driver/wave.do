onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group SD_DRIVER_internal /testbench_sd_driver/sd_drv/offset
add wave -noupdate -expand -group SD_DRIVER_internal /testbench_sd_driver/sd_drv/byte_counter
add wave -noupdate -expand -group SD_DRIVER_ports /testbench_sd_driver/sd_drv/dout_avail
add wave -noupdate -expand -group SD_DRIVER_ports /testbench_sd_driver/sd_drv/dout_taken
add wave -noupdate -expand -group SD_DRIVER_ports /testbench_sd_driver/sd_drv/busy
add wave -noupdate -expand -group SD_DRIVER_ports /testbench_sd_driver/sd_drv/dout
add wave -noupdate -expand -group SD_DRIVER_ports /testbench_sd_driver/sd_drv/data
add wave -noupdate -expand -group SD_DRIVER_ports /testbench_sd_driver/sd_drv/rd
add wave -noupdate -expand -group SD_DRIVER_ports /testbench_sd_driver/sd_drv/valid
add wave -noupdate -expand -group SD_DRIVER_ports /testbench_sd_driver/sd_drv/addr
add wave -noupdate -group UUT /testbench_sd_driver/uut/sd_busy
add wave -noupdate -group UUT /testbench_sd_driver/uut/dout_avail
add wave -noupdate -group UUT /testbench_sd_driver/uut/byte_counter
add wave -noupdate -group UUT /testbench_sd_driver/uut/new_address
add wave -noupdate -group UUT /testbench_sd_driver/uut/address
add wave -noupdate -group UUT /testbench_sd_driver/uut/data_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {2151068187 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 240
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
WaveRestoreZoom {0 ps} {11677227302 ps}
