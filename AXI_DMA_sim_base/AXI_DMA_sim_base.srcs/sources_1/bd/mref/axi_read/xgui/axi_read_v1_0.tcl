# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "RD_ADDR_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "RD_DATA_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "RD_FLIP_BYTE" -parent ${Page_0}
  ipgui::add_param $IPINST -name "RD_LIN" -parent ${Page_0}


}

proc update_PARAM_VALUE.RD_ADDR_WIDTH { PARAM_VALUE.RD_ADDR_WIDTH } {
	# Procedure called to update RD_ADDR_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.RD_ADDR_WIDTH { PARAM_VALUE.RD_ADDR_WIDTH } {
	# Procedure called to validate RD_ADDR_WIDTH
	return true
}

proc update_PARAM_VALUE.RD_DATA_WIDTH { PARAM_VALUE.RD_DATA_WIDTH } {
	# Procedure called to update RD_DATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.RD_DATA_WIDTH { PARAM_VALUE.RD_DATA_WIDTH } {
	# Procedure called to validate RD_DATA_WIDTH
	return true
}

proc update_PARAM_VALUE.RD_FLIP_BYTE { PARAM_VALUE.RD_FLIP_BYTE } {
	# Procedure called to update RD_FLIP_BYTE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.RD_FLIP_BYTE { PARAM_VALUE.RD_FLIP_BYTE } {
	# Procedure called to validate RD_FLIP_BYTE
	return true
}

proc update_PARAM_VALUE.RD_LIN { PARAM_VALUE.RD_LIN } {
	# Procedure called to update RD_LIN when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.RD_LIN { PARAM_VALUE.RD_LIN } {
	# Procedure called to validate RD_LIN
	return true
}


proc update_MODELPARAM_VALUE.RD_FLIP_BYTE { MODELPARAM_VALUE.RD_FLIP_BYTE PARAM_VALUE.RD_FLIP_BYTE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.RD_FLIP_BYTE}] ${MODELPARAM_VALUE.RD_FLIP_BYTE}
}

proc update_MODELPARAM_VALUE.RD_ADDR_WIDTH { MODELPARAM_VALUE.RD_ADDR_WIDTH PARAM_VALUE.RD_ADDR_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.RD_ADDR_WIDTH}] ${MODELPARAM_VALUE.RD_ADDR_WIDTH}
}

proc update_MODELPARAM_VALUE.RD_DATA_WIDTH { MODELPARAM_VALUE.RD_DATA_WIDTH PARAM_VALUE.RD_DATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.RD_DATA_WIDTH}] ${MODELPARAM_VALUE.RD_DATA_WIDTH}
}

proc update_MODELPARAM_VALUE.RD_LIN { MODELPARAM_VALUE.RD_LIN PARAM_VALUE.RD_LIN } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.RD_LIN}] ${MODELPARAM_VALUE.RD_LIN}
}

