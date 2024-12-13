
	#set_global_assignment -name FAMILY "Cyclone IV"
	#set_global_assignment -name DEVICE ep4ce10f17c8n

set_location_assignment PIN_E1    -to    clk 	
set_location_assignment PIN_K1    -to    rst_n 	
  
# SEG7 x 8 �߶�������
set_location_assignment PIN_L6    -to   sel[2]
set_location_assignment PIN_N6    -to   sel[1]
set_location_assignment PIN_M7    -to   sel[0] 
set_location_assignment PIN_T11   -to   seg[0]     
set_location_assignment PIN_T10   -to   seg[1]    
set_location_assignment PIN_T9    -to   seg[2]     
set_location_assignment PIN_T8    -to   seg[3]     
set_location_assignment PIN_T7    -to   seg[4]     
set_location_assignment PIN_T6    -to   seg[5]     
set_location_assignment PIN_T5    -to   seg[6]     
set_location_assignment PIN_T4    -to   seg[7] 
   

# KEY_BORD
set_location_assignment PIN_L15   -to col[0] 
set_location_assignment PIN_N15   -to col[1] 
set_location_assignment PIN_P15   -to col[2] 
set_location_assignment PIN_T15   -to col[3] 
set_location_assignment PIN_R14   -to row[0]  
set_location_assignment PIN_R16   -to row[1]
set_location_assignment PIN_P16   -to row[2]
set_location_assignment PIN_N16   -to row[3]

