#PCIe rstn
set_property PACKAGE_PIN AD20    [get_ports pcie_rst_n]
set_property IOSTANDARD LVCMOS33 [get_ports pcie_rst_n]
set_property PULLUP true         [get_ports pcie_rst_n]
set_false_path -from             [get_ports pcie_rst_n]
 
# PCI Express reference clock 100MHz
set_property PACKAGE_PIN N8 [get_ports pcie_clk_clk_p]
set_property PACKAGE_PIN N7 [get_ports pcie_clk_clk_n]

# MGT locations
set_property PACKAGE_PIN P6  [get_ports {pcie_rxp[0]}]
set_property PACKAGE_PIN T6  [get_ports {pcie_rxp[1]}]
set_property PACKAGE_PIN U4  [get_ports {pcie_rxp[2]}]
set_property PACKAGE_PIN V6  [get_ports {pcie_rxp[3]}]
set_property PACKAGE_PIN AA4 [get_ports {pcie_rxp[4]}]
set_property PACKAGE_PIN Y6  [get_ports {pcie_rxp[5]}]
set_property PACKAGE_PIN AB6 [get_ports {pcie_rxp[6]}]
set_property PACKAGE_PIN AC4 [get_ports {pcie_rxp[7]}]
 
set_property PACKAGE_PIN N4  [get_ports {pcie_txp[0]}]
set_property PACKAGE_PIN P2  [get_ports {pcie_txp[1]}] 
set_property PACKAGE_PIN R4  [get_ports {pcie_txp[2]}]
set_property PACKAGE_PIN T2  [get_ports {pcie_txp[3]}] 
set_property PACKAGE_PIN V2  [get_ports {pcie_txp[4]}]
set_property PACKAGE_PIN W4  [get_ports {pcie_txp[5]}] 
set_property PACKAGE_PIN Y2  [get_ports {pcie_txp[6]}]
set_property PACKAGE_PIN AB2 [get_ports {pcie_txp[7]}] 
