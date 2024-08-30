onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib xdma_ddr_opt

do {wave.do}

view wave
view structure
view signals

do {xdma_ddr.udo}

run -all

quit -force
