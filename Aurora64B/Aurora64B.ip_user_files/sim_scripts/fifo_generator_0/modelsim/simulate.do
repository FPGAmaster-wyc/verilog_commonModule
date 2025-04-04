onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc" -t 1ps -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -L xpm -lib xil_defaultlib xil_defaultlib.fifo_generator_0 xil_defaultlib.glbl

do {wave.do}

view wave
view structure
view signals

do {fifo_generator_0.udo}

run -all

quit -force
