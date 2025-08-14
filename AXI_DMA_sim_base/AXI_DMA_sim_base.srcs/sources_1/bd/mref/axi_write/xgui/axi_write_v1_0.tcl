# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "WR_ADDR_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "WR_DATA_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "WR_FLIP_BYTE" -parent ${Page_0}
  ipgui::add_param $IPINST -name "WR_LIN" -parent ${Page_0}


}

proc update_PARAM_VALUE.WR_ADDR_WIDTH { PARAM_VALUE.WR_ADDR_WIDTH } {
	# Procedure called to update WR_ADDR_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.WR_ADDR_WIDTH { PARAM_VALUE.WR_ADDR_WIDTH } {
	# Procedure called to validate WR_ADDR_WIDTH
	return true
}

proc update_PARAM_VALUE.WR_DATA_WIDTH { PARAM_VALUE.WR_DATA_WIDTH } {
	# Procedure called to update WR_DATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.WR_DATA_WIDTH { PARAM_VALUE.WR_DATA_WIDTH } {
	# Procedure called to validate WR_DATA_WIDTH
	return true
}

proc update_PARAM_VALUE.WR_FLIP_BYTE { PARAM_VALUE.WR_FLIP_BYTE } {
	# Procedure called to update WR_FLIP_BYTE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.WR_FLIP_BYTE { PARAM_VALUE.WR_FLIP_BYTE } {
	# Procedure called to validate WR_FLIP_BYTE
	return true
}

proc update_PARAM_VALUE.WR_LIN { PARAM_VALUE.WR_LIN } {
	# Procedure called to update WR_LIN when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.WR_LIN { PARAM_VALUE.WR_LIN } {
	# Procedure called to validate WR_LIN
	return true
}


proc update_MODELPARAM_VALUE.WR_FLIP_BYTE { MODELPARAM_VALUE.WR_FLIP_BYTE PARAM_VALUE.WR_FLIP_BYTE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.WR_FLIP_BYTE}] ${MODELPARAM_VALUE.WR_FLIP_BYTE}
}

proc update_MODELPARAM_VALUE.WR_ADDR_WIDTH { MODELPARAM_VALUE.WR_ADDR_WIDTH PARAM_VALUE.WR_ADDR_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.WR_ADDR_WIDTH}] ${MODELPARAM_VALUE.WR_ADDR_WIDTH}
}

proc update_MODELPARAM_VALUE.WR_DATA_WIDTH { MODELPARAM_VALUE.WR_DATA_WIDTH PARAM_VALUE.WR_DATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.WR_DATA_WIDTH}] ${MODELPARAM_VALUE.WR_DATA_WIDTH}
}

proc update_MODELPARAM_VALUE.WR_LIN { MODELPARAM_VALUE.WR_LIN PARAM_VALUE.WR_LIN } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.WR_LIN}] ${MODELPARAM_VALUE.WR_LIN}
}

