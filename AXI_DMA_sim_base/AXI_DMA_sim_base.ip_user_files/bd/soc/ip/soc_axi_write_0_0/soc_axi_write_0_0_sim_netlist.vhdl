-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
-- Date        : Tue Oct 15 15:45:08 2024
-- Host        : DESKTOP-I9U844P running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               E:/Desktop/axi_dma/AXI_DMA_sim_base/AXI_DMA_sim_base.srcs/sources_1/bd/soc/ip/soc_axi_write_0_0/soc_axi_write_0_0_sim_netlist.vhdl
-- Design      : soc_axi_write_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity soc_axi_write_0_0_axi_write is
  port (
    w_last_reg_0 : out STD_LOGIC;
    m_axi_awaddr : out STD_LOGIC_VECTOR ( 21 downto 0 );
    m_axi_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_bready : out STD_LOGIC;
    \aw_len_reg[5]_0\ : out STD_LOGIC;
    w_valid_reg_0 : out STD_LOGIC;
    S_WR_tready : out STD_LOGIC;
    m_axi_awvalid : out STD_LOGIC;
    S_WR_aclk : in STD_LOGIC;
    S_WR_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_wready : in STD_LOGIC;
    S_WR_tvalid : in STD_LOGIC;
    m_axi_awready : in STD_LOGIC;
    S_WR_aresetn : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of soc_axi_write_0_0_axi_write : entity is "axi_write";
end soc_axi_write_0_0_axi_write;

architecture STRUCTURE of soc_axi_write_0_0_axi_write is
  signal \FSM_onehot_c_state[0]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_c_state[1]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_c_state[2]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_c_state[3]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_c_state[4]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_c_state_reg_n_0_[0]\ : STD_LOGIC;
  signal \FSM_onehot_c_state_reg_n_0_[1]\ : STD_LOGIC;
  signal \FSM_onehot_c_state_reg_n_0_[2]\ : STD_LOGIC;
  signal \FSM_onehot_c_state_reg_n_0_[3]\ : STD_LOGIC;
  signal \FSM_onehot_c_state_reg_n_0_[4]\ : STD_LOGIC;
  signal S_WR_tready_INST_0_i_1_n_0 : STD_LOGIC;
  signal S_WR_tready_INST_0_i_2_n_0 : STD_LOGIC;
  signal S_WR_tready_INST_0_i_3_n_0 : STD_LOGIC;
  signal \aw_addr[28]_i_2_n_0\ : STD_LOGIC;
  signal aw_addr_cnt : STD_LOGIC_VECTOR ( 28 downto 7 );
  signal aw_addr_cnt0 : STD_LOGIC_VECTOR ( 28 downto 7 );
  signal \aw_addr_cnt0_carry__0_n_0\ : STD_LOGIC;
  signal \aw_addr_cnt0_carry__0_n_1\ : STD_LOGIC;
  signal \aw_addr_cnt0_carry__0_n_2\ : STD_LOGIC;
  signal \aw_addr_cnt0_carry__0_n_3\ : STD_LOGIC;
  signal \aw_addr_cnt0_carry__1_n_0\ : STD_LOGIC;
  signal \aw_addr_cnt0_carry__1_n_1\ : STD_LOGIC;
  signal \aw_addr_cnt0_carry__1_n_2\ : STD_LOGIC;
  signal \aw_addr_cnt0_carry__1_n_3\ : STD_LOGIC;
  signal \aw_addr_cnt0_carry__2_n_0\ : STD_LOGIC;
  signal \aw_addr_cnt0_carry__2_n_1\ : STD_LOGIC;
  signal \aw_addr_cnt0_carry__2_n_2\ : STD_LOGIC;
  signal \aw_addr_cnt0_carry__2_n_3\ : STD_LOGIC;
  signal \aw_addr_cnt0_carry__3_n_0\ : STD_LOGIC;
  signal \aw_addr_cnt0_carry__3_n_1\ : STD_LOGIC;
  signal \aw_addr_cnt0_carry__3_n_2\ : STD_LOGIC;
  signal \aw_addr_cnt0_carry__3_n_3\ : STD_LOGIC;
  signal \aw_addr_cnt0_carry__4_n_3\ : STD_LOGIC;
  signal aw_addr_cnt0_carry_i_1_n_0 : STD_LOGIC;
  signal aw_addr_cnt0_carry_n_0 : STD_LOGIC;
  signal aw_addr_cnt0_carry_n_1 : STD_LOGIC;
  signal aw_addr_cnt0_carry_n_2 : STD_LOGIC;
  signal aw_addr_cnt0_carry_n_3 : STD_LOGIC;
  signal aw_addr_cnt1 : STD_LOGIC;
  signal \aw_addr_cnt[10]_i_1_n_0\ : STD_LOGIC;
  signal \aw_addr_cnt[11]_i_1_n_0\ : STD_LOGIC;
  signal \aw_addr_cnt[12]_i_1_n_0\ : STD_LOGIC;
  signal \aw_addr_cnt[13]_i_1_n_0\ : STD_LOGIC;
  signal \aw_addr_cnt[14]_i_1_n_0\ : STD_LOGIC;
  signal \aw_addr_cnt[15]_i_1_n_0\ : STD_LOGIC;
  signal \aw_addr_cnt[16]_i_1_n_0\ : STD_LOGIC;
  signal \aw_addr_cnt[17]_i_1_n_0\ : STD_LOGIC;
  signal \aw_addr_cnt[18]_i_1_n_0\ : STD_LOGIC;
  signal \aw_addr_cnt[19]_i_1_n_0\ : STD_LOGIC;
  signal \aw_addr_cnt[20]_i_1_n_0\ : STD_LOGIC;
  signal \aw_addr_cnt[21]_i_1_n_0\ : STD_LOGIC;
  signal \aw_addr_cnt[22]_i_1_n_0\ : STD_LOGIC;
  signal \aw_addr_cnt[23]_i_1_n_0\ : STD_LOGIC;
  signal \aw_addr_cnt[24]_i_1_n_0\ : STD_LOGIC;
  signal \aw_addr_cnt[25]_i_1_n_0\ : STD_LOGIC;
  signal \aw_addr_cnt[26]_i_1_n_0\ : STD_LOGIC;
  signal \aw_addr_cnt[27]_i_1_n_0\ : STD_LOGIC;
  signal \aw_addr_cnt[28]_i_1_n_0\ : STD_LOGIC;
  signal \aw_addr_cnt[28]_i_4_n_0\ : STD_LOGIC;
  signal \aw_addr_cnt[28]_i_5_n_0\ : STD_LOGIC;
  signal \aw_addr_cnt[28]_i_6_n_0\ : STD_LOGIC;
  signal \aw_addr_cnt[28]_i_7_n_0\ : STD_LOGIC;
  signal \aw_addr_cnt[28]_i_8_n_0\ : STD_LOGIC;
  signal \aw_addr_cnt[7]_i_1_n_0\ : STD_LOGIC;
  signal \aw_addr_cnt[8]_i_1_n_0\ : STD_LOGIC;
  signal \aw_addr_cnt[9]_i_1_n_0\ : STD_LOGIC;
  signal aw_burst : STD_LOGIC;
  signal \^aw_len_reg[5]_0\ : STD_LOGIC;
  signal aw_valid_i_1_n_0 : STD_LOGIC;
  signal \^m_axi_awvalid\ : STD_LOGIC;
  signal n_state3 : STD_LOGIC;
  signal \n_state3_carry__0_n_0\ : STD_LOGIC;
  signal \n_state3_carry__0_n_1\ : STD_LOGIC;
  signal \n_state3_carry__0_n_2\ : STD_LOGIC;
  signal \n_state3_carry__0_n_3\ : STD_LOGIC;
  signal \n_state3_carry__1_n_2\ : STD_LOGIC;
  signal \n_state3_carry__1_n_3\ : STD_LOGIC;
  signal n_state3_carry_i_1_n_0 : STD_LOGIC;
  signal n_state3_carry_i_2_n_0 : STD_LOGIC;
  signal n_state3_carry_i_3_n_0 : STD_LOGIC;
  signal n_state3_carry_i_4_n_0 : STD_LOGIC;
  signal n_state3_carry_n_0 : STD_LOGIC;
  signal n_state3_carry_n_1 : STD_LOGIC;
  signal n_state3_carry_n_2 : STD_LOGIC;
  signal n_state3_carry_n_3 : STD_LOGIC;
  signal \number_cnt[0]_i_1_n_0\ : STD_LOGIC;
  signal \number_cnt[0]_i_3_n_0\ : STD_LOGIC;
  signal \number_cnt[0]_i_4_n_0\ : STD_LOGIC;
  signal \number_cnt[0]_i_5_n_0\ : STD_LOGIC;
  signal \number_cnt[0]_i_6_n_0\ : STD_LOGIC;
  signal \number_cnt[0]_i_7_n_0\ : STD_LOGIC;
  signal \number_cnt[4]_i_2_n_0\ : STD_LOGIC;
  signal \number_cnt[4]_i_3_n_0\ : STD_LOGIC;
  signal \number_cnt[4]_i_4_n_0\ : STD_LOGIC;
  signal \number_cnt[4]_i_5_n_0\ : STD_LOGIC;
  signal \number_cnt[8]_i_2_n_0\ : STD_LOGIC;
  signal \number_cnt[8]_i_3_n_0\ : STD_LOGIC;
  signal \number_cnt[8]_i_4_n_0\ : STD_LOGIC;
  signal \number_cnt[8]_i_5_n_0\ : STD_LOGIC;
  signal number_cnt_reg : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal \number_cnt_reg[0]_i_2_n_0\ : STD_LOGIC;
  signal \number_cnt_reg[0]_i_2_n_1\ : STD_LOGIC;
  signal \number_cnt_reg[0]_i_2_n_2\ : STD_LOGIC;
  signal \number_cnt_reg[0]_i_2_n_3\ : STD_LOGIC;
  signal \number_cnt_reg[0]_i_2_n_4\ : STD_LOGIC;
  signal \number_cnt_reg[0]_i_2_n_5\ : STD_LOGIC;
  signal \number_cnt_reg[0]_i_2_n_6\ : STD_LOGIC;
  signal \number_cnt_reg[0]_i_2_n_7\ : STD_LOGIC;
  signal \number_cnt_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \number_cnt_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \number_cnt_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \number_cnt_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \number_cnt_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \number_cnt_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \number_cnt_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \number_cnt_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \number_cnt_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \number_cnt_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \number_cnt_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \number_cnt_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \number_cnt_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \number_cnt_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \number_cnt_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal p_1_in : STD_LOGIC_VECTOR ( 28 to 28 );
  signal p_1_in_0 : STD_LOGIC;
  signal \w_data[31]_i_1_n_0\ : STD_LOGIC;
  signal w_last_i_1_n_0 : STD_LOGIC;
  signal \^w_last_reg_0\ : STD_LOGIC;
  signal w_valid_i_1_n_0 : STD_LOGIC;
  signal \^w_valid_reg_0\ : STD_LOGIC;
  signal \NLW_aw_addr_cnt0_carry__4_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_aw_addr_cnt0_carry__4_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal NLW_n_state3_carry_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_n_state3_carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_n_state3_carry__1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_n_state3_carry__1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_number_cnt_reg[8]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_onehot_c_state_reg[0]\ : label is "WR_IDLE:00001,WR_ADDR:00010,WR_DATA:00100,WR_LAST:01000,WR_STOP:10000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_c_state_reg[1]\ : label is "WR_IDLE:00001,WR_ADDR:00010,WR_DATA:00100,WR_LAST:01000,WR_STOP:10000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_c_state_reg[2]\ : label is "WR_IDLE:00001,WR_ADDR:00010,WR_DATA:00100,WR_LAST:01000,WR_STOP:10000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_c_state_reg[3]\ : label is "WR_IDLE:00001,WR_ADDR:00010,WR_DATA:00100,WR_LAST:01000,WR_STOP:10000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_c_state_reg[4]\ : label is "WR_IDLE:00001,WR_ADDR:00010,WR_DATA:00100,WR_LAST:01000,WR_STOP:10000";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of S_WR_tready_INST_0 : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of S_WR_tready_INST_0_i_2 : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of S_WR_tready_INST_0_i_4 : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \aw_addr_cnt[10]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \aw_addr_cnt[11]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \aw_addr_cnt[12]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \aw_addr_cnt[13]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \aw_addr_cnt[14]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \aw_addr_cnt[15]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \aw_addr_cnt[16]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \aw_addr_cnt[17]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \aw_addr_cnt[18]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \aw_addr_cnt[19]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \aw_addr_cnt[20]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \aw_addr_cnt[21]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \aw_addr_cnt[22]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \aw_addr_cnt[23]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \aw_addr_cnt[24]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \aw_addr_cnt[25]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \aw_addr_cnt[26]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \aw_addr_cnt[27]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \aw_addr_cnt[8]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \aw_addr_cnt[9]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of aw_valid_i_1 : label is "soft_lutpair1";
begin
  \aw_len_reg[5]_0\ <= \^aw_len_reg[5]_0\;
  m_axi_awvalid <= \^m_axi_awvalid\;
  w_last_reg_0 <= \^w_last_reg_0\;
  w_valid_reg_0 <= \^w_valid_reg_0\;
\FSM_onehot_c_state[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"BA"
    )
        port map (
      I0 => \FSM_onehot_c_state_reg_n_0_[4]\,
      I1 => S_WR_tvalid,
      I2 => \FSM_onehot_c_state_reg_n_0_[0]\,
      O => \FSM_onehot_c_state[0]_i_1_n_0\
    );
\FSM_onehot_c_state[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8F88"
    )
        port map (
      I0 => S_WR_tvalid,
      I1 => \FSM_onehot_c_state_reg_n_0_[0]\,
      I2 => m_axi_awready,
      I3 => \FSM_onehot_c_state_reg_n_0_[1]\,
      O => \FSM_onehot_c_state[1]_i_1_n_0\
    );
\FSM_onehot_c_state[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8FFFFFFF88888888"
    )
        port map (
      I0 => m_axi_awready,
      I1 => \FSM_onehot_c_state_reg_n_0_[1]\,
      I2 => m_axi_wready,
      I3 => \^w_valid_reg_0\,
      I4 => n_state3,
      I5 => \FSM_onehot_c_state_reg_n_0_[2]\,
      O => \FSM_onehot_c_state[2]_i_1_n_0\
    );
\FSM_onehot_c_state[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8FFFFFFF88000000"
    )
        port map (
      I0 => n_state3,
      I1 => \FSM_onehot_c_state_reg_n_0_[2]\,
      I2 => \^w_last_reg_0\,
      I3 => m_axi_wready,
      I4 => \^w_valid_reg_0\,
      I5 => \FSM_onehot_c_state_reg_n_0_[3]\,
      O => \FSM_onehot_c_state[3]_i_1_n_0\
    );
\FSM_onehot_c_state[4]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => \FSM_onehot_c_state_reg_n_0_[3]\,
      I1 => \^w_valid_reg_0\,
      I2 => m_axi_wready,
      I3 => \^w_last_reg_0\,
      O => \FSM_onehot_c_state[4]_i_1_n_0\
    );
\FSM_onehot_c_state_reg[0]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => S_WR_aclk,
      CE => '1',
      D => \FSM_onehot_c_state[0]_i_1_n_0\,
      PRE => \aw_addr[28]_i_2_n_0\,
      Q => \FSM_onehot_c_state_reg_n_0_[0]\
    );
\FSM_onehot_c_state_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => S_WR_aclk,
      CE => '1',
      CLR => \aw_addr[28]_i_2_n_0\,
      D => \FSM_onehot_c_state[1]_i_1_n_0\,
      Q => \FSM_onehot_c_state_reg_n_0_[1]\
    );
\FSM_onehot_c_state_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => S_WR_aclk,
      CE => '1',
      CLR => \aw_addr[28]_i_2_n_0\,
      D => \FSM_onehot_c_state[2]_i_1_n_0\,
      Q => \FSM_onehot_c_state_reg_n_0_[2]\
    );
\FSM_onehot_c_state_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => S_WR_aclk,
      CE => '1',
      CLR => \aw_addr[28]_i_2_n_0\,
      D => \FSM_onehot_c_state[3]_i_1_n_0\,
      Q => \FSM_onehot_c_state_reg_n_0_[3]\
    );
\FSM_onehot_c_state_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => S_WR_aclk,
      CE => '1',
      CLR => \aw_addr[28]_i_2_n_0\,
      D => \FSM_onehot_c_state[4]_i_1_n_0\,
      Q => \FSM_onehot_c_state_reg_n_0_[4]\
    );
S_WR_tready_INST_0: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0820"
    )
        port map (
      I0 => m_axi_wready,
      I1 => S_WR_tready_INST_0_i_1_n_0,
      I2 => S_WR_tready_INST_0_i_2_n_0,
      I3 => S_WR_tready_INST_0_i_3_n_0,
      O => S_WR_tready
    );
S_WR_tready_INST_0_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFAEEEAEEEAEEE"
    )
        port map (
      I0 => \FSM_onehot_c_state_reg_n_0_[1]\,
      I1 => \FSM_onehot_c_state_reg_n_0_[2]\,
      I2 => n_state3,
      I3 => p_1_in_0,
      I4 => \FSM_onehot_c_state_reg_n_0_[0]\,
      I5 => S_WR_tvalid,
      O => S_WR_tready_INST_0_i_1_n_0
    );
S_WR_tready_INST_0_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EAAAAAAA"
    )
        port map (
      I0 => \FSM_onehot_c_state_reg_n_0_[3]\,
      I1 => m_axi_wready,
      I2 => \^w_valid_reg_0\,
      I3 => n_state3,
      I4 => \FSM_onehot_c_state_reg_n_0_[2]\,
      O => S_WR_tready_INST_0_i_2_n_0
    );
S_WR_tready_INST_0_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFF707070"
    )
        port map (
      I0 => p_1_in_0,
      I1 => n_state3,
      I2 => \FSM_onehot_c_state_reg_n_0_[2]\,
      I3 => \FSM_onehot_c_state_reg_n_0_[1]\,
      I4 => m_axi_awready,
      I5 => \FSM_onehot_c_state[4]_i_1_n_0\,
      O => S_WR_tready_INST_0_i_3_n_0
    );
S_WR_tready_INST_0_i_4: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^w_valid_reg_0\,
      I1 => m_axi_wready,
      O => p_1_in_0
    );
\aw_addr[28]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => S_WR_tready_INST_0_i_1_n_0,
      I1 => S_WR_tready_INST_0_i_2_n_0,
      I2 => S_WR_tready_INST_0_i_3_n_0,
      O => aw_burst
    );
\aw_addr[28]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => S_WR_aresetn,
      O => \aw_addr[28]_i_2_n_0\
    );
aw_addr_cnt0_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => aw_addr_cnt0_carry_n_0,
      CO(2) => aw_addr_cnt0_carry_n_1,
      CO(1) => aw_addr_cnt0_carry_n_2,
      CO(0) => aw_addr_cnt0_carry_n_3,
      CYINIT => '0',
      DI(3 downto 2) => B"00",
      DI(1) => aw_addr_cnt(8),
      DI(0) => '0',
      O(3 downto 0) => aw_addr_cnt0(10 downto 7),
      S(3 downto 2) => aw_addr_cnt(10 downto 9),
      S(1) => aw_addr_cnt0_carry_i_1_n_0,
      S(0) => aw_addr_cnt(7)
    );
\aw_addr_cnt0_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => aw_addr_cnt0_carry_n_0,
      CO(3) => \aw_addr_cnt0_carry__0_n_0\,
      CO(2) => \aw_addr_cnt0_carry__0_n_1\,
      CO(1) => \aw_addr_cnt0_carry__0_n_2\,
      CO(0) => \aw_addr_cnt0_carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => aw_addr_cnt0(14 downto 11),
      S(3 downto 0) => aw_addr_cnt(14 downto 11)
    );
\aw_addr_cnt0_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \aw_addr_cnt0_carry__0_n_0\,
      CO(3) => \aw_addr_cnt0_carry__1_n_0\,
      CO(2) => \aw_addr_cnt0_carry__1_n_1\,
      CO(1) => \aw_addr_cnt0_carry__1_n_2\,
      CO(0) => \aw_addr_cnt0_carry__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => aw_addr_cnt0(18 downto 15),
      S(3 downto 0) => aw_addr_cnt(18 downto 15)
    );
\aw_addr_cnt0_carry__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \aw_addr_cnt0_carry__1_n_0\,
      CO(3) => \aw_addr_cnt0_carry__2_n_0\,
      CO(2) => \aw_addr_cnt0_carry__2_n_1\,
      CO(1) => \aw_addr_cnt0_carry__2_n_2\,
      CO(0) => \aw_addr_cnt0_carry__2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => aw_addr_cnt0(22 downto 19),
      S(3 downto 0) => aw_addr_cnt(22 downto 19)
    );
\aw_addr_cnt0_carry__3\: unisim.vcomponents.CARRY4
     port map (
      CI => \aw_addr_cnt0_carry__2_n_0\,
      CO(3) => \aw_addr_cnt0_carry__3_n_0\,
      CO(2) => \aw_addr_cnt0_carry__3_n_1\,
      CO(1) => \aw_addr_cnt0_carry__3_n_2\,
      CO(0) => \aw_addr_cnt0_carry__3_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => aw_addr_cnt0(26 downto 23),
      S(3 downto 0) => aw_addr_cnt(26 downto 23)
    );
\aw_addr_cnt0_carry__4\: unisim.vcomponents.CARRY4
     port map (
      CI => \aw_addr_cnt0_carry__3_n_0\,
      CO(3 downto 1) => \NLW_aw_addr_cnt0_carry__4_CO_UNCONNECTED\(3 downto 1),
      CO(0) => \aw_addr_cnt0_carry__4_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 2) => \NLW_aw_addr_cnt0_carry__4_O_UNCONNECTED\(3 downto 2),
      O(1 downto 0) => aw_addr_cnt0(28 downto 27),
      S(3 downto 2) => B"00",
      S(1 downto 0) => aw_addr_cnt(28 downto 27)
    );
aw_addr_cnt0_carry_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => aw_addr_cnt(8),
      O => aw_addr_cnt0_carry_i_1_n_0
    );
\aw_addr_cnt[10]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => aw_addr_cnt1,
      I1 => aw_addr_cnt0(10),
      O => \aw_addr_cnt[10]_i_1_n_0\
    );
\aw_addr_cnt[11]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => aw_addr_cnt1,
      I1 => aw_addr_cnt0(11),
      O => \aw_addr_cnt[11]_i_1_n_0\
    );
\aw_addr_cnt[12]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => aw_addr_cnt1,
      I1 => aw_addr_cnt0(12),
      O => \aw_addr_cnt[12]_i_1_n_0\
    );
\aw_addr_cnt[13]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => aw_addr_cnt1,
      I1 => aw_addr_cnt0(13),
      O => \aw_addr_cnt[13]_i_1_n_0\
    );
\aw_addr_cnt[14]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => aw_addr_cnt1,
      I1 => aw_addr_cnt0(14),
      O => \aw_addr_cnt[14]_i_1_n_0\
    );
\aw_addr_cnt[15]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => aw_addr_cnt1,
      I1 => aw_addr_cnt0(15),
      O => \aw_addr_cnt[15]_i_1_n_0\
    );
\aw_addr_cnt[16]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => aw_addr_cnt1,
      I1 => aw_addr_cnt0(16),
      O => \aw_addr_cnt[16]_i_1_n_0\
    );
\aw_addr_cnt[17]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => aw_addr_cnt1,
      I1 => aw_addr_cnt0(17),
      O => \aw_addr_cnt[17]_i_1_n_0\
    );
\aw_addr_cnt[18]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => aw_addr_cnt1,
      I1 => aw_addr_cnt0(18),
      O => \aw_addr_cnt[18]_i_1_n_0\
    );
\aw_addr_cnt[19]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => aw_addr_cnt1,
      I1 => aw_addr_cnt0(19),
      O => \aw_addr_cnt[19]_i_1_n_0\
    );
\aw_addr_cnt[20]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => aw_addr_cnt1,
      I1 => aw_addr_cnt0(20),
      O => \aw_addr_cnt[20]_i_1_n_0\
    );
\aw_addr_cnt[21]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => aw_addr_cnt1,
      I1 => aw_addr_cnt0(21),
      O => \aw_addr_cnt[21]_i_1_n_0\
    );
\aw_addr_cnt[22]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => aw_addr_cnt1,
      I1 => aw_addr_cnt0(22),
      O => \aw_addr_cnt[22]_i_1_n_0\
    );
\aw_addr_cnt[23]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => aw_addr_cnt1,
      I1 => aw_addr_cnt0(23),
      O => \aw_addr_cnt[23]_i_1_n_0\
    );
\aw_addr_cnt[24]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => aw_addr_cnt1,
      I1 => aw_addr_cnt0(24),
      O => \aw_addr_cnt[24]_i_1_n_0\
    );
\aw_addr_cnt[25]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => aw_addr_cnt1,
      I1 => aw_addr_cnt0(25),
      O => \aw_addr_cnt[25]_i_1_n_0\
    );
\aw_addr_cnt[26]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => aw_addr_cnt1,
      I1 => aw_addr_cnt0(26),
      O => \aw_addr_cnt[26]_i_1_n_0\
    );
\aw_addr_cnt[27]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => aw_addr_cnt1,
      I1 => aw_addr_cnt0(27),
      O => \aw_addr_cnt[27]_i_1_n_0\
    );
\aw_addr_cnt[28]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => S_WR_tready_INST_0_i_1_n_0,
      I1 => S_WR_tready_INST_0_i_3_n_0,
      I2 => S_WR_tready_INST_0_i_2_n_0,
      O => \aw_addr_cnt[28]_i_1_n_0\
    );
\aw_addr_cnt[28]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => aw_addr_cnt0(28),
      I1 => aw_addr_cnt1,
      O => p_1_in(28)
    );
\aw_addr_cnt[28]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000001FFFFFFFF"
    )
        port map (
      I0 => \aw_addr_cnt[28]_i_4_n_0\,
      I1 => \aw_addr_cnt[28]_i_5_n_0\,
      I2 => \aw_addr_cnt[28]_i_6_n_0\,
      I3 => \aw_addr_cnt[28]_i_7_n_0\,
      I4 => \aw_addr_cnt[28]_i_8_n_0\,
      I5 => aw_addr_cnt(28),
      O => aw_addr_cnt1
    );
\aw_addr_cnt[28]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => aw_addr_cnt(8),
      I1 => aw_addr_cnt(11),
      I2 => aw_addr_cnt(12),
      I3 => aw_addr_cnt(9),
      I4 => aw_addr_cnt(10),
      O => \aw_addr_cnt[28]_i_4_n_0\
    );
\aw_addr_cnt[28]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => aw_addr_cnt(17),
      I1 => aw_addr_cnt(16),
      I2 => aw_addr_cnt(19),
      I3 => aw_addr_cnt(18),
      O => \aw_addr_cnt[28]_i_5_n_0\
    );
\aw_addr_cnt[28]_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => aw_addr_cnt(13),
      I1 => aw_addr_cnt(15),
      I2 => aw_addr_cnt(14),
      O => \aw_addr_cnt[28]_i_6_n_0\
    );
\aw_addr_cnt[28]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => aw_addr_cnt(25),
      I1 => aw_addr_cnt(24),
      I2 => aw_addr_cnt(27),
      I3 => aw_addr_cnt(26),
      O => \aw_addr_cnt[28]_i_7_n_0\
    );
\aw_addr_cnt[28]_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => aw_addr_cnt(21),
      I1 => aw_addr_cnt(20),
      I2 => aw_addr_cnt(23),
      I3 => aw_addr_cnt(22),
      O => \aw_addr_cnt[28]_i_8_n_0\
    );
\aw_addr_cnt[7]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => aw_addr_cnt1,
      I1 => aw_addr_cnt0(7),
      O => \aw_addr_cnt[7]_i_1_n_0\
    );
\aw_addr_cnt[8]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => aw_addr_cnt1,
      I1 => aw_addr_cnt0(8),
      O => \aw_addr_cnt[8]_i_1_n_0\
    );
\aw_addr_cnt[9]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => aw_addr_cnt1,
      I1 => aw_addr_cnt0(9),
      O => \aw_addr_cnt[9]_i_1_n_0\
    );
\aw_addr_cnt_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => S_WR_aclk,
      CE => \aw_addr_cnt[28]_i_1_n_0\,
      CLR => \aw_addr[28]_i_2_n_0\,
      D => \aw_addr_cnt[10]_i_1_n_0\,
      Q => aw_addr_cnt(10)
    );
\aw_addr_cnt_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => S_WR_aclk,
      CE => \aw_addr_cnt[28]_i_1_n_0\,
      CLR => \aw_addr[28]_i_2_n_0\,
      D => \aw_addr_cnt[11]_i_1_n_0\,
      Q => aw_addr_cnt(11)
    );
\aw_addr_cnt_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => S_WR_aclk,
      CE => \aw_addr_cnt[28]_i_1_n_0\,
      CLR => \aw_addr[28]_i_2_n_0\,
      D => \aw_addr_cnt[12]_i_1_n_0\,
      Q => aw_addr_cnt(12)
    );
\aw_addr_cnt_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => S_WR_aclk,
      CE => \aw_addr_cnt[28]_i_1_n_0\,
      CLR => \aw_addr[28]_i_2_n_0\,
      D => \aw_addr_cnt[13]_i_1_n_0\,
      Q => aw_addr_cnt(13)
    );
\aw_addr_cnt_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => S_WR_aclk,
      CE => \aw_addr_cnt[28]_i_1_n_0\,
      CLR => \aw_addr[28]_i_2_n_0\,
      D => \aw_addr_cnt[14]_i_1_n_0\,
      Q => aw_addr_cnt(14)
    );
\aw_addr_cnt_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => S_WR_aclk,
      CE => \aw_addr_cnt[28]_i_1_n_0\,
      CLR => \aw_addr[28]_i_2_n_0\,
      D => \aw_addr_cnt[15]_i_1_n_0\,
      Q => aw_addr_cnt(15)
    );
\aw_addr_cnt_reg[16]\: unisim.vcomponents.FDCE
     port map (
      C => S_WR_aclk,
      CE => \aw_addr_cnt[28]_i_1_n_0\,
      CLR => \aw_addr[28]_i_2_n_0\,
      D => \aw_addr_cnt[16]_i_1_n_0\,
      Q => aw_addr_cnt(16)
    );
\aw_addr_cnt_reg[17]\: unisim.vcomponents.FDCE
     port map (
      C => S_WR_aclk,
      CE => \aw_addr_cnt[28]_i_1_n_0\,
      CLR => \aw_addr[28]_i_2_n_0\,
      D => \aw_addr_cnt[17]_i_1_n_0\,
      Q => aw_addr_cnt(17)
    );
\aw_addr_cnt_reg[18]\: unisim.vcomponents.FDCE
     port map (
      C => S_WR_aclk,
      CE => \aw_addr_cnt[28]_i_1_n_0\,
      CLR => \aw_addr[28]_i_2_n_0\,
      D => \aw_addr_cnt[18]_i_1_n_0\,
      Q => aw_addr_cnt(18)
    );
\aw_addr_cnt_reg[19]\: unisim.vcomponents.FDCE
     port map (
      C => S_WR_aclk,
      CE => \aw_addr_cnt[28]_i_1_n_0\,
      CLR => \aw_addr[28]_i_2_n_0\,
      D => \aw_addr_cnt[19]_i_1_n_0\,
      Q => aw_addr_cnt(19)
    );
\aw_addr_cnt_reg[20]\: unisim.vcomponents.FDCE
     port map (
      C => S_WR_aclk,
      CE => \aw_addr_cnt[28]_i_1_n_0\,
      CLR => \aw_addr[28]_i_2_n_0\,
      D => \aw_addr_cnt[20]_i_1_n_0\,
      Q => aw_addr_cnt(20)
    );
\aw_addr_cnt_reg[21]\: unisim.vcomponents.FDCE
     port map (
      C => S_WR_aclk,
      CE => \aw_addr_cnt[28]_i_1_n_0\,
      CLR => \aw_addr[28]_i_2_n_0\,
      D => \aw_addr_cnt[21]_i_1_n_0\,
      Q => aw_addr_cnt(21)
    );
\aw_addr_cnt_reg[22]\: unisim.vcomponents.FDCE
     port map (
      C => S_WR_aclk,
      CE => \aw_addr_cnt[28]_i_1_n_0\,
      CLR => \aw_addr[28]_i_2_n_0\,
      D => \aw_addr_cnt[22]_i_1_n_0\,
      Q => aw_addr_cnt(22)
    );
\aw_addr_cnt_reg[23]\: unisim.vcomponents.FDCE
     port map (
      C => S_WR_aclk,
      CE => \aw_addr_cnt[28]_i_1_n_0\,
      CLR => \aw_addr[28]_i_2_n_0\,
      D => \aw_addr_cnt[23]_i_1_n_0\,
      Q => aw_addr_cnt(23)
    );
\aw_addr_cnt_reg[24]\: unisim.vcomponents.FDCE
     port map (
      C => S_WR_aclk,
      CE => \aw_addr_cnt[28]_i_1_n_0\,
      CLR => \aw_addr[28]_i_2_n_0\,
      D => \aw_addr_cnt[24]_i_1_n_0\,
      Q => aw_addr_cnt(24)
    );
\aw_addr_cnt_reg[25]\: unisim.vcomponents.FDCE
     port map (
      C => S_WR_aclk,
      CE => \aw_addr_cnt[28]_i_1_n_0\,
      CLR => \aw_addr[28]_i_2_n_0\,
      D => \aw_addr_cnt[25]_i_1_n_0\,
      Q => aw_addr_cnt(25)
    );
\aw_addr_cnt_reg[26]\: unisim.vcomponents.FDCE
     port map (
      C => S_WR_aclk,
      CE => \aw_addr_cnt[28]_i_1_n_0\,
      CLR => \aw_addr[28]_i_2_n_0\,
      D => \aw_addr_cnt[26]_i_1_n_0\,
      Q => aw_addr_cnt(26)
    );
\aw_addr_cnt_reg[27]\: unisim.vcomponents.FDCE
     port map (
      C => S_WR_aclk,
      CE => \aw_addr_cnt[28]_i_1_n_0\,
      CLR => \aw_addr[28]_i_2_n_0\,
      D => \aw_addr_cnt[27]_i_1_n_0\,
      Q => aw_addr_cnt(27)
    );
\aw_addr_cnt_reg[28]\: unisim.vcomponents.FDPE
     port map (
      C => S_WR_aclk,
      CE => \aw_addr_cnt[28]_i_1_n_0\,
      D => p_1_in(28),
      PRE => \aw_addr[28]_i_2_n_0\,
      Q => aw_addr_cnt(28)
    );
\aw_addr_cnt_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => S_WR_aclk,
      CE => \aw_addr_cnt[28]_i_1_n_0\,
      CLR => \aw_addr[28]_i_2_n_0\,
      D => \aw_addr_cnt[7]_i_1_n_0\,
      Q => aw_addr_cnt(7)
    );
\aw_addr_cnt_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => S_WR_aclk,
      CE => \aw_addr_cnt[28]_i_1_n_0\,
      CLR => \aw_addr[28]_i_2_n_0\,
      D => \aw_addr_cnt[8]_i_1_n_0\,
      Q => aw_addr_cnt(8)
    );
\aw_addr_cnt_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => S_WR_aclk,
      CE => \aw_addr_cnt[28]_i_1_n_0\,
      CLR => \aw_addr[28]_i_2_n_0\,
      D => \aw_addr_cnt[9]_i_1_n_0\,
      Q => aw_addr_cnt(9)
    );
\aw_addr_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => S_WR_aclk,
      CE => aw_burst,
      CLR => \aw_addr[28]_i_2_n_0\,
      D => aw_addr_cnt(10),
      Q => m_axi_awaddr(3)
    );
\aw_addr_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => S_WR_aclk,
      CE => aw_burst,
      CLR => \aw_addr[28]_i_2_n_0\,
      D => aw_addr_cnt(11),
      Q => m_axi_awaddr(4)
    );
\aw_addr_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => S_WR_aclk,
      CE => aw_burst,
      CLR => \aw_addr[28]_i_2_n_0\,
      D => aw_addr_cnt(12),
      Q => m_axi_awaddr(5)
    );
\aw_addr_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => S_WR_aclk,
      CE => aw_burst,
      CLR => \aw_addr[28]_i_2_n_0\,
      D => aw_addr_cnt(13),
      Q => m_axi_awaddr(6)
    );
\aw_addr_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => S_WR_aclk,
      CE => aw_burst,
      CLR => \aw_addr[28]_i_2_n_0\,
      D => aw_addr_cnt(14),
      Q => m_axi_awaddr(7)
    );
\aw_addr_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => S_WR_aclk,
      CE => aw_burst,
      CLR => \aw_addr[28]_i_2_n_0\,
      D => aw_addr_cnt(15),
      Q => m_axi_awaddr(8)
    );
\aw_addr_reg[16]\: unisim.vcomponents.FDCE
     port map (
      C => S_WR_aclk,
      CE => aw_burst,
      CLR => \aw_addr[28]_i_2_n_0\,
      D => aw_addr_cnt(16),
      Q => m_axi_awaddr(9)
    );
\aw_addr_reg[17]\: unisim.vcomponents.FDCE
     port map (
      C => S_WR_aclk,
      CE => aw_burst,
      CLR => \aw_addr[28]_i_2_n_0\,
      D => aw_addr_cnt(17),
      Q => m_axi_awaddr(10)
    );
\aw_addr_reg[18]\: unisim.vcomponents.FDCE
     port map (
      C => S_WR_aclk,
      CE => aw_burst,
      CLR => \aw_addr[28]_i_2_n_0\,
      D => aw_addr_cnt(18),
      Q => m_axi_awaddr(11)
    );
\aw_addr_reg[19]\: unisim.vcomponents.FDCE
     port map (
      C => S_WR_aclk,
      CE => aw_burst,
      CLR => \aw_addr[28]_i_2_n_0\,
      D => aw_addr_cnt(19),
      Q => m_axi_awaddr(12)
    );
\aw_addr_reg[20]\: unisim.vcomponents.FDCE
     port map (
      C => S_WR_aclk,
      CE => aw_burst,
      CLR => \aw_addr[28]_i_2_n_0\,
      D => aw_addr_cnt(20),
      Q => m_axi_awaddr(13)
    );
\aw_addr_reg[21]\: unisim.vcomponents.FDCE
     port map (
      C => S_WR_aclk,
      CE => aw_burst,
      CLR => \aw_addr[28]_i_2_n_0\,
      D => aw_addr_cnt(21),
      Q => m_axi_awaddr(14)
    );
\aw_addr_reg[22]\: unisim.vcomponents.FDCE
     port map (
      C => S_WR_aclk,
      CE => aw_burst,
      CLR => \aw_addr[28]_i_2_n_0\,
      D => aw_addr_cnt(22),
      Q => m_axi_awaddr(15)
    );
\aw_addr_reg[23]\: unisim.vcomponents.FDCE
     port map (
      C => S_WR_aclk,
      CE => aw_burst,
      CLR => \aw_addr[28]_i_2_n_0\,
      D => aw_addr_cnt(23),
      Q => m_axi_awaddr(16)
    );
\aw_addr_reg[24]\: unisim.vcomponents.FDCE
     port map (
      C => S_WR_aclk,
      CE => aw_burst,
      CLR => \aw_addr[28]_i_2_n_0\,
      D => aw_addr_cnt(24),
      Q => m_axi_awaddr(17)
    );
\aw_addr_reg[25]\: unisim.vcomponents.FDCE
     port map (
      C => S_WR_aclk,
      CE => aw_burst,
      CLR => \aw_addr[28]_i_2_n_0\,
      D => aw_addr_cnt(25),
      Q => m_axi_awaddr(18)
    );
\aw_addr_reg[26]\: unisim.vcomponents.FDCE
     port map (
      C => S_WR_aclk,
      CE => aw_burst,
      CLR => \aw_addr[28]_i_2_n_0\,
      D => aw_addr_cnt(26),
      Q => m_axi_awaddr(19)
    );
\aw_addr_reg[27]\: unisim.vcomponents.FDCE
     port map (
      C => S_WR_aclk,
      CE => aw_burst,
      CLR => \aw_addr[28]_i_2_n_0\,
      D => aw_addr_cnt(27),
      Q => m_axi_awaddr(20)
    );
\aw_addr_reg[28]\: unisim.vcomponents.FDCE
     port map (
      C => S_WR_aclk,
      CE => aw_burst,
      CLR => \aw_addr[28]_i_2_n_0\,
      D => aw_addr_cnt(28),
      Q => m_axi_awaddr(21)
    );
\aw_addr_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => S_WR_aclk,
      CE => aw_burst,
      CLR => \aw_addr[28]_i_2_n_0\,
      D => aw_addr_cnt(7),
      Q => m_axi_awaddr(0)
    );
\aw_addr_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => S_WR_aclk,
      CE => aw_burst,
      CLR => \aw_addr[28]_i_2_n_0\,
      D => aw_addr_cnt(8),
      Q => m_axi_awaddr(1)
    );
\aw_addr_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => S_WR_aclk,
      CE => aw_burst,
      CLR => \aw_addr[28]_i_2_n_0\,
      D => aw_addr_cnt(9),
      Q => m_axi_awaddr(2)
    );
\aw_len_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => S_WR_aclk,
      CE => aw_burst,
      CLR => \aw_addr[28]_i_2_n_0\,
      D => '1',
      Q => \^aw_len_reg[5]_0\
    );
aw_valid_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F704"
    )
        port map (
      I0 => S_WR_tready_INST_0_i_3_n_0,
      I1 => S_WR_tready_INST_0_i_1_n_0,
      I2 => S_WR_tready_INST_0_i_2_n_0,
      I3 => \^m_axi_awvalid\,
      O => aw_valid_i_1_n_0
    );
aw_valid_reg: unisim.vcomponents.FDCE
     port map (
      C => S_WR_aclk,
      CE => '1',
      CLR => \aw_addr[28]_i_2_n_0\,
      D => aw_valid_i_1_n_0,
      Q => \^m_axi_awvalid\
    );
b_ready_reg: unisim.vcomponents.FDCE
     port map (
      C => S_WR_aclk,
      CE => '1',
      CLR => \aw_addr[28]_i_2_n_0\,
      D => '1',
      Q => m_axi_bready
    );
n_state3_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => n_state3_carry_n_0,
      CO(2) => n_state3_carry_n_1,
      CO(1) => n_state3_carry_n_2,
      CO(0) => n_state3_carry_n_3,
      CYINIT => '1',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => NLW_n_state3_carry_O_UNCONNECTED(3 downto 0),
      S(3) => n_state3_carry_i_1_n_0,
      S(2) => n_state3_carry_i_2_n_0,
      S(1) => n_state3_carry_i_3_n_0,
      S(0) => n_state3_carry_i_4_n_0
    );
\n_state3_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => n_state3_carry_n_0,
      CO(3) => \n_state3_carry__0_n_0\,
      CO(2) => \n_state3_carry__0_n_1\,
      CO(1) => \n_state3_carry__0_n_2\,
      CO(0) => \n_state3_carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_n_state3_carry__0_O_UNCONNECTED\(3 downto 0),
      S(3) => \^aw_len_reg[5]_0\,
      S(2) => \^aw_len_reg[5]_0\,
      S(1) => \^aw_len_reg[5]_0\,
      S(0) => \^aw_len_reg[5]_0\
    );
\n_state3_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \n_state3_carry__0_n_0\,
      CO(3) => \NLW_n_state3_carry__1_CO_UNCONNECTED\(3),
      CO(2) => n_state3,
      CO(1) => \n_state3_carry__1_n_2\,
      CO(0) => \n_state3_carry__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_n_state3_carry__1_O_UNCONNECTED\(3 downto 0),
      S(3) => '0',
      S(2) => \^aw_len_reg[5]_0\,
      S(1) => \^aw_len_reg[5]_0\,
      S(0) => \^aw_len_reg[5]_0\
    );
n_state3_carry_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2004"
    )
        port map (
      I0 => number_cnt_reg(9),
      I1 => \^aw_len_reg[5]_0\,
      I2 => number_cnt_reg(11),
      I3 => number_cnt_reg(10),
      O => n_state3_carry_i_1_n_0
    );
n_state3_carry_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2004"
    )
        port map (
      I0 => number_cnt_reg(6),
      I1 => \^aw_len_reg[5]_0\,
      I2 => number_cnt_reg(8),
      I3 => number_cnt_reg(7),
      O => n_state3_carry_i_2_n_0
    );
n_state3_carry_i_3: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => number_cnt_reg(3),
      I1 => number_cnt_reg(5),
      I2 => number_cnt_reg(4),
      O => n_state3_carry_i_3_n_0
    );
n_state3_carry_i_4: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6000"
    )
        port map (
      I0 => number_cnt_reg(0),
      I1 => \^aw_len_reg[5]_0\,
      I2 => number_cnt_reg(2),
      I3 => number_cnt_reg(1),
      O => n_state3_carry_i_4_n_0
    );
\number_cnt[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"EA"
    )
        port map (
      I0 => \^w_last_reg_0\,
      I1 => m_axi_wready,
      I2 => \^w_valid_reg_0\,
      O => \number_cnt[0]_i_1_n_0\
    );
\number_cnt[0]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => number_cnt_reg(0),
      I1 => \^w_last_reg_0\,
      O => \number_cnt[0]_i_3_n_0\
    );
\number_cnt[0]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => number_cnt_reg(3),
      I1 => \^w_last_reg_0\,
      O => \number_cnt[0]_i_4_n_0\
    );
\number_cnt[0]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => number_cnt_reg(2),
      I1 => \^w_last_reg_0\,
      O => \number_cnt[0]_i_5_n_0\
    );
\number_cnt[0]_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => number_cnt_reg(1),
      I1 => \^w_last_reg_0\,
      O => \number_cnt[0]_i_6_n_0\
    );
\number_cnt[0]_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => number_cnt_reg(0),
      I1 => \^w_last_reg_0\,
      O => \number_cnt[0]_i_7_n_0\
    );
\number_cnt[4]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => number_cnt_reg(7),
      I1 => \^w_last_reg_0\,
      O => \number_cnt[4]_i_2_n_0\
    );
\number_cnt[4]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => number_cnt_reg(6),
      I1 => \^w_last_reg_0\,
      O => \number_cnt[4]_i_3_n_0\
    );
\number_cnt[4]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => number_cnt_reg(5),
      I1 => \^w_last_reg_0\,
      O => \number_cnt[4]_i_4_n_0\
    );
\number_cnt[4]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => number_cnt_reg(4),
      I1 => \^w_last_reg_0\,
      O => \number_cnt[4]_i_5_n_0\
    );
\number_cnt[8]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => number_cnt_reg(11),
      I1 => \^w_last_reg_0\,
      O => \number_cnt[8]_i_2_n_0\
    );
\number_cnt[8]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => number_cnt_reg(10),
      I1 => \^w_last_reg_0\,
      O => \number_cnt[8]_i_3_n_0\
    );
\number_cnt[8]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => number_cnt_reg(9),
      I1 => \^w_last_reg_0\,
      O => \number_cnt[8]_i_4_n_0\
    );
\number_cnt[8]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => number_cnt_reg(8),
      I1 => \^w_last_reg_0\,
      O => \number_cnt[8]_i_5_n_0\
    );
\number_cnt_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => S_WR_aclk,
      CE => \number_cnt[0]_i_1_n_0\,
      CLR => \aw_addr[28]_i_2_n_0\,
      D => \number_cnt_reg[0]_i_2_n_7\,
      Q => number_cnt_reg(0)
    );
\number_cnt_reg[0]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \number_cnt_reg[0]_i_2_n_0\,
      CO(2) => \number_cnt_reg[0]_i_2_n_1\,
      CO(1) => \number_cnt_reg[0]_i_2_n_2\,
      CO(0) => \number_cnt_reg[0]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 1) => B"000",
      DI(0) => \number_cnt[0]_i_3_n_0\,
      O(3) => \number_cnt_reg[0]_i_2_n_4\,
      O(2) => \number_cnt_reg[0]_i_2_n_5\,
      O(1) => \number_cnt_reg[0]_i_2_n_6\,
      O(0) => \number_cnt_reg[0]_i_2_n_7\,
      S(3) => \number_cnt[0]_i_4_n_0\,
      S(2) => \number_cnt[0]_i_5_n_0\,
      S(1) => \number_cnt[0]_i_6_n_0\,
      S(0) => \number_cnt[0]_i_7_n_0\
    );
\number_cnt_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => S_WR_aclk,
      CE => \number_cnt[0]_i_1_n_0\,
      CLR => \aw_addr[28]_i_2_n_0\,
      D => \number_cnt_reg[8]_i_1_n_5\,
      Q => number_cnt_reg(10)
    );
\number_cnt_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => S_WR_aclk,
      CE => \number_cnt[0]_i_1_n_0\,
      CLR => \aw_addr[28]_i_2_n_0\,
      D => \number_cnt_reg[8]_i_1_n_4\,
      Q => number_cnt_reg(11)
    );
\number_cnt_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => S_WR_aclk,
      CE => \number_cnt[0]_i_1_n_0\,
      CLR => \aw_addr[28]_i_2_n_0\,
      D => \number_cnt_reg[0]_i_2_n_6\,
      Q => number_cnt_reg(1)
    );
\number_cnt_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => S_WR_aclk,
      CE => \number_cnt[0]_i_1_n_0\,
      CLR => \aw_addr[28]_i_2_n_0\,
      D => \number_cnt_reg[0]_i_2_n_5\,
      Q => number_cnt_reg(2)
    );
\number_cnt_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => S_WR_aclk,
      CE => \number_cnt[0]_i_1_n_0\,
      CLR => \aw_addr[28]_i_2_n_0\,
      D => \number_cnt_reg[0]_i_2_n_4\,
      Q => number_cnt_reg(3)
    );
\number_cnt_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => S_WR_aclk,
      CE => \number_cnt[0]_i_1_n_0\,
      CLR => \aw_addr[28]_i_2_n_0\,
      D => \number_cnt_reg[4]_i_1_n_7\,
      Q => number_cnt_reg(4)
    );
\number_cnt_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \number_cnt_reg[0]_i_2_n_0\,
      CO(3) => \number_cnt_reg[4]_i_1_n_0\,
      CO(2) => \number_cnt_reg[4]_i_1_n_1\,
      CO(1) => \number_cnt_reg[4]_i_1_n_2\,
      CO(0) => \number_cnt_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \number_cnt_reg[4]_i_1_n_4\,
      O(2) => \number_cnt_reg[4]_i_1_n_5\,
      O(1) => \number_cnt_reg[4]_i_1_n_6\,
      O(0) => \number_cnt_reg[4]_i_1_n_7\,
      S(3) => \number_cnt[4]_i_2_n_0\,
      S(2) => \number_cnt[4]_i_3_n_0\,
      S(1) => \number_cnt[4]_i_4_n_0\,
      S(0) => \number_cnt[4]_i_5_n_0\
    );
\number_cnt_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => S_WR_aclk,
      CE => \number_cnt[0]_i_1_n_0\,
      CLR => \aw_addr[28]_i_2_n_0\,
      D => \number_cnt_reg[4]_i_1_n_6\,
      Q => number_cnt_reg(5)
    );
\number_cnt_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => S_WR_aclk,
      CE => \number_cnt[0]_i_1_n_0\,
      CLR => \aw_addr[28]_i_2_n_0\,
      D => \number_cnt_reg[4]_i_1_n_5\,
      Q => number_cnt_reg(6)
    );
\number_cnt_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => S_WR_aclk,
      CE => \number_cnt[0]_i_1_n_0\,
      CLR => \aw_addr[28]_i_2_n_0\,
      D => \number_cnt_reg[4]_i_1_n_4\,
      Q => number_cnt_reg(7)
    );
\number_cnt_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => S_WR_aclk,
      CE => \number_cnt[0]_i_1_n_0\,
      CLR => \aw_addr[28]_i_2_n_0\,
      D => \number_cnt_reg[8]_i_1_n_7\,
      Q => number_cnt_reg(8)
    );
\number_cnt_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \number_cnt_reg[4]_i_1_n_0\,
      CO(3) => \NLW_number_cnt_reg[8]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \number_cnt_reg[8]_i_1_n_1\,
      CO(1) => \number_cnt_reg[8]_i_1_n_2\,
      CO(0) => \number_cnt_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \number_cnt_reg[8]_i_1_n_4\,
      O(2) => \number_cnt_reg[8]_i_1_n_5\,
      O(1) => \number_cnt_reg[8]_i_1_n_6\,
      O(0) => \number_cnt_reg[8]_i_1_n_7\,
      S(3) => \number_cnt[8]_i_2_n_0\,
      S(2) => \number_cnt[8]_i_3_n_0\,
      S(1) => \number_cnt[8]_i_4_n_0\,
      S(0) => \number_cnt[8]_i_5_n_0\
    );
\number_cnt_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => S_WR_aclk,
      CE => \number_cnt[0]_i_1_n_0\,
      CLR => \aw_addr[28]_i_2_n_0\,
      D => \number_cnt_reg[8]_i_1_n_6\,
      Q => number_cnt_reg(9)
    );
\w_data[31]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"03008000"
    )
        port map (
      I0 => m_axi_wready,
      I1 => S_WR_tready_INST_0_i_3_n_0,
      I2 => S_WR_tready_INST_0_i_1_n_0,
      I3 => S_WR_tvalid,
      I4 => S_WR_tready_INST_0_i_2_n_0,
      O => \w_data[31]_i_1_n_0\
    );
\w_data_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => S_WR_aclk,
      CE => \w_data[31]_i_1_n_0\,
      CLR => \aw_addr[28]_i_2_n_0\,
      D => S_WR_tdata(0),
      Q => m_axi_wdata(0)
    );
\w_data_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => S_WR_aclk,
      CE => \w_data[31]_i_1_n_0\,
      CLR => \aw_addr[28]_i_2_n_0\,
      D => S_WR_tdata(10),
      Q => m_axi_wdata(10)
    );
\w_data_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => S_WR_aclk,
      CE => \w_data[31]_i_1_n_0\,
      CLR => \aw_addr[28]_i_2_n_0\,
      D => S_WR_tdata(11),
      Q => m_axi_wdata(11)
    );
\w_data_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => S_WR_aclk,
      CE => \w_data[31]_i_1_n_0\,
      CLR => \aw_addr[28]_i_2_n_0\,
      D => S_WR_tdata(12),
      Q => m_axi_wdata(12)
    );
\w_data_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => S_WR_aclk,
      CE => \w_data[31]_i_1_n_0\,
      CLR => \aw_addr[28]_i_2_n_0\,
      D => S_WR_tdata(13),
      Q => m_axi_wdata(13)
    );
\w_data_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => S_WR_aclk,
      CE => \w_data[31]_i_1_n_0\,
      CLR => \aw_addr[28]_i_2_n_0\,
      D => S_WR_tdata(14),
      Q => m_axi_wdata(14)
    );
\w_data_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => S_WR_aclk,
      CE => \w_data[31]_i_1_n_0\,
      CLR => \aw_addr[28]_i_2_n_0\,
      D => S_WR_tdata(15),
      Q => m_axi_wdata(15)
    );
\w_data_reg[16]\: unisim.vcomponents.FDCE
     port map (
      C => S_WR_aclk,
      CE => \w_data[31]_i_1_n_0\,
      CLR => \aw_addr[28]_i_2_n_0\,
      D => S_WR_tdata(16),
      Q => m_axi_wdata(16)
    );
\w_data_reg[17]\: unisim.vcomponents.FDCE
     port map (
      C => S_WR_aclk,
      CE => \w_data[31]_i_1_n_0\,
      CLR => \aw_addr[28]_i_2_n_0\,
      D => S_WR_tdata(17),
      Q => m_axi_wdata(17)
    );
\w_data_reg[18]\: unisim.vcomponents.FDCE
     port map (
      C => S_WR_aclk,
      CE => \w_data[31]_i_1_n_0\,
      CLR => \aw_addr[28]_i_2_n_0\,
      D => S_WR_tdata(18),
      Q => m_axi_wdata(18)
    );
\w_data_reg[19]\: unisim.vcomponents.FDCE
     port map (
      C => S_WR_aclk,
      CE => \w_data[31]_i_1_n_0\,
      CLR => \aw_addr[28]_i_2_n_0\,
      D => S_WR_tdata(19),
      Q => m_axi_wdata(19)
    );
\w_data_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => S_WR_aclk,
      CE => \w_data[31]_i_1_n_0\,
      CLR => \aw_addr[28]_i_2_n_0\,
      D => S_WR_tdata(1),
      Q => m_axi_wdata(1)
    );
\w_data_reg[20]\: unisim.vcomponents.FDCE
     port map (
      C => S_WR_aclk,
      CE => \w_data[31]_i_1_n_0\,
      CLR => \aw_addr[28]_i_2_n_0\,
      D => S_WR_tdata(20),
      Q => m_axi_wdata(20)
    );
\w_data_reg[21]\: unisim.vcomponents.FDCE
     port map (
      C => S_WR_aclk,
      CE => \w_data[31]_i_1_n_0\,
      CLR => \aw_addr[28]_i_2_n_0\,
      D => S_WR_tdata(21),
      Q => m_axi_wdata(21)
    );
\w_data_reg[22]\: unisim.vcomponents.FDCE
     port map (
      C => S_WR_aclk,
      CE => \w_data[31]_i_1_n_0\,
      CLR => \aw_addr[28]_i_2_n_0\,
      D => S_WR_tdata(22),
      Q => m_axi_wdata(22)
    );
\w_data_reg[23]\: unisim.vcomponents.FDCE
     port map (
      C => S_WR_aclk,
      CE => \w_data[31]_i_1_n_0\,
      CLR => \aw_addr[28]_i_2_n_0\,
      D => S_WR_tdata(23),
      Q => m_axi_wdata(23)
    );
\w_data_reg[24]\: unisim.vcomponents.FDCE
     port map (
      C => S_WR_aclk,
      CE => \w_data[31]_i_1_n_0\,
      CLR => \aw_addr[28]_i_2_n_0\,
      D => S_WR_tdata(24),
      Q => m_axi_wdata(24)
    );
\w_data_reg[25]\: unisim.vcomponents.FDCE
     port map (
      C => S_WR_aclk,
      CE => \w_data[31]_i_1_n_0\,
      CLR => \aw_addr[28]_i_2_n_0\,
      D => S_WR_tdata(25),
      Q => m_axi_wdata(25)
    );
\w_data_reg[26]\: unisim.vcomponents.FDCE
     port map (
      C => S_WR_aclk,
      CE => \w_data[31]_i_1_n_0\,
      CLR => \aw_addr[28]_i_2_n_0\,
      D => S_WR_tdata(26),
      Q => m_axi_wdata(26)
    );
\w_data_reg[27]\: unisim.vcomponents.FDCE
     port map (
      C => S_WR_aclk,
      CE => \w_data[31]_i_1_n_0\,
      CLR => \aw_addr[28]_i_2_n_0\,
      D => S_WR_tdata(27),
      Q => m_axi_wdata(27)
    );
\w_data_reg[28]\: unisim.vcomponents.FDCE
     port map (
      C => S_WR_aclk,
      CE => \w_data[31]_i_1_n_0\,
      CLR => \aw_addr[28]_i_2_n_0\,
      D => S_WR_tdata(28),
      Q => m_axi_wdata(28)
    );
\w_data_reg[29]\: unisim.vcomponents.FDCE
     port map (
      C => S_WR_aclk,
      CE => \w_data[31]_i_1_n_0\,
      CLR => \aw_addr[28]_i_2_n_0\,
      D => S_WR_tdata(29),
      Q => m_axi_wdata(29)
    );
\w_data_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => S_WR_aclk,
      CE => \w_data[31]_i_1_n_0\,
      CLR => \aw_addr[28]_i_2_n_0\,
      D => S_WR_tdata(2),
      Q => m_axi_wdata(2)
    );
\w_data_reg[30]\: unisim.vcomponents.FDCE
     port map (
      C => S_WR_aclk,
      CE => \w_data[31]_i_1_n_0\,
      CLR => \aw_addr[28]_i_2_n_0\,
      D => S_WR_tdata(30),
      Q => m_axi_wdata(30)
    );
\w_data_reg[31]\: unisim.vcomponents.FDCE
     port map (
      C => S_WR_aclk,
      CE => \w_data[31]_i_1_n_0\,
      CLR => \aw_addr[28]_i_2_n_0\,
      D => S_WR_tdata(31),
      Q => m_axi_wdata(31)
    );
\w_data_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => S_WR_aclk,
      CE => \w_data[31]_i_1_n_0\,
      CLR => \aw_addr[28]_i_2_n_0\,
      D => S_WR_tdata(3),
      Q => m_axi_wdata(3)
    );
\w_data_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => S_WR_aclk,
      CE => \w_data[31]_i_1_n_0\,
      CLR => \aw_addr[28]_i_2_n_0\,
      D => S_WR_tdata(4),
      Q => m_axi_wdata(4)
    );
\w_data_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => S_WR_aclk,
      CE => \w_data[31]_i_1_n_0\,
      CLR => \aw_addr[28]_i_2_n_0\,
      D => S_WR_tdata(5),
      Q => m_axi_wdata(5)
    );
\w_data_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => S_WR_aclk,
      CE => \w_data[31]_i_1_n_0\,
      CLR => \aw_addr[28]_i_2_n_0\,
      D => S_WR_tdata(6),
      Q => m_axi_wdata(6)
    );
\w_data_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => S_WR_aclk,
      CE => \w_data[31]_i_1_n_0\,
      CLR => \aw_addr[28]_i_2_n_0\,
      D => S_WR_tdata(7),
      Q => m_axi_wdata(7)
    );
\w_data_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => S_WR_aclk,
      CE => \w_data[31]_i_1_n_0\,
      CLR => \aw_addr[28]_i_2_n_0\,
      D => S_WR_tdata(8),
      Q => m_axi_wdata(8)
    );
\w_data_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => S_WR_aclk,
      CE => \w_data[31]_i_1_n_0\,
      CLR => \aw_addr[28]_i_2_n_0\,
      D => S_WR_tdata(9),
      Q => m_axi_wdata(9)
    );
w_last_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BBFF1000"
    )
        port map (
      I0 => S_WR_tready_INST_0_i_1_n_0,
      I1 => S_WR_tready_INST_0_i_3_n_0,
      I2 => S_WR_tvalid,
      I3 => S_WR_tready_INST_0_i_2_n_0,
      I4 => \^w_last_reg_0\,
      O => w_last_i_1_n_0
    );
w_last_reg: unisim.vcomponents.FDCE
     port map (
      C => S_WR_aclk,
      CE => '1',
      CLR => \aw_addr[28]_i_2_n_0\,
      D => w_last_i_1_n_0,
      Q => \^w_last_reg_0\
    );
w_valid_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF50F5FF00508000"
    )
        port map (
      I0 => S_WR_tready_INST_0_i_3_n_0,
      I1 => m_axi_wready,
      I2 => S_WR_tvalid,
      I3 => S_WR_tready_INST_0_i_1_n_0,
      I4 => S_WR_tready_INST_0_i_2_n_0,
      I5 => \^w_valid_reg_0\,
      O => w_valid_i_1_n_0
    );
w_valid_reg: unisim.vcomponents.FDCE
     port map (
      C => S_WR_aclk,
      CE => '1',
      CLR => \aw_addr[28]_i_2_n_0\,
      D => w_valid_i_1_n_0,
      Q => \^w_valid_reg_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity soc_axi_write_0_0 is
  port (
    S_WR_aclk : in STD_LOGIC;
    S_WR_aresetn : in STD_LOGIC;
    S_WR_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_WR_tvalid : in STD_LOGIC;
    S_WR_tlast : in STD_LOGIC;
    S_WR_tready : out STD_LOGIC;
    m_axi_aclk : in STD_LOGIC;
    m_axi_aresetn : in STD_LOGIC;
    m_axi_awid : out STD_LOGIC;
    m_axi_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_awlock : out STD_LOGIC;
    m_axi_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awvalid : out STD_LOGIC;
    m_axi_awready : in STD_LOGIC;
    m_axi_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_wlast : out STD_LOGIC;
    m_axi_wvalid : out STD_LOGIC;
    m_axi_wready : in STD_LOGIC;
    m_axi_bid : in STD_LOGIC;
    m_axi_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_bvalid : in STD_LOGIC;
    m_axi_bready : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of soc_axi_write_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of soc_axi_write_0_0 : entity is "soc_axi_write_0_0,axi_write,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of soc_axi_write_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of soc_axi_write_0_0 : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of soc_axi_write_0_0 : entity is "axi_write,Vivado 2019.2";
end soc_axi_write_0_0;

architecture STRUCTURE of soc_axi_write_0_0 is
  signal \<const0>\ : STD_LOGIC;
  signal \<const1>\ : STD_LOGIC;
  signal \^m_axi_awaddr\ : STD_LOGIC_VECTOR ( 28 downto 7 );
  signal \^m_axi_awlen\ : STD_LOGIC_VECTOR ( 5 to 5 );
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of S_WR_aclk : signal is "xilinx.com:signal:clock:1.0 S_WR_aclk CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of S_WR_aclk : signal is "XIL_INTERFACENAME S_WR_aclk, ASSOCIATED_BUSIF S_WR, ASSOCIATED_RESET S_WR_aresetn, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN soc_clk_100M, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of S_WR_aresetn : signal is "xilinx.com:signal:reset:1.0 S_WR_aresetn RST";
  attribute X_INTERFACE_PARAMETER of S_WR_aresetn : signal is "XIL_INTERFACENAME S_WR_aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of S_WR_tlast : signal is "xilinx.com:interface:axis:1.0 S_WR TLAST";
  attribute X_INTERFACE_INFO of S_WR_tready : signal is "xilinx.com:interface:axis:1.0 S_WR TREADY";
  attribute X_INTERFACE_PARAMETER of S_WR_tready : signal is "XIL_INTERFACENAME S_WR, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN soc_clk_100M, LAYERED_METADATA undef, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of S_WR_tvalid : signal is "xilinx.com:interface:axis:1.0 S_WR TVALID";
  attribute X_INTERFACE_INFO of m_axi_aclk : signal is "xilinx.com:signal:clock:1.0 m_axi_aclk CLK";
  attribute X_INTERFACE_PARAMETER of m_axi_aclk : signal is "XIL_INTERFACENAME m_axi_aclk, ASSOCIATED_BUSIF m_axi, ASSOCIATED_RESET m_axi_aresetn, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN soc_clk_100M, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of m_axi_aresetn : signal is "xilinx.com:signal:reset:1.0 m_axi_aresetn RST";
  attribute X_INTERFACE_PARAMETER of m_axi_aresetn : signal is "XIL_INTERFACENAME m_axi_aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of m_axi_awid : signal is "xilinx.com:interface:aximm:1.0 m_axi AWID";
  attribute X_INTERFACE_INFO of m_axi_awlock : signal is "xilinx.com:interface:aximm:1.0 m_axi AWLOCK";
  attribute X_INTERFACE_INFO of m_axi_awready : signal is "xilinx.com:interface:aximm:1.0 m_axi AWREADY";
  attribute X_INTERFACE_INFO of m_axi_awvalid : signal is "xilinx.com:interface:aximm:1.0 m_axi AWVALID";
  attribute X_INTERFACE_INFO of m_axi_bid : signal is "xilinx.com:interface:aximm:1.0 m_axi BID";
  attribute X_INTERFACE_INFO of m_axi_bready : signal is "xilinx.com:interface:aximm:1.0 m_axi BREADY";
  attribute X_INTERFACE_PARAMETER of m_axi_bready : signal is "XIL_INTERFACENAME m_axi, DATA_WIDTH 32, PROTOCOL AXI4, FREQ_HZ 100000000, ID_WIDTH 1, ADDR_WIDTH 32, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE WRITE_ONLY, HAS_BURST 1, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 0, SUPPORTS_NARROW_BURST 1, NUM_READ_OUTSTANDING 2, NUM_WRITE_OUTSTANDING 2, MAX_BURST_LENGTH 256, PHASE 0.000, CLK_DOMAIN soc_clk_100M, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of m_axi_bvalid : signal is "xilinx.com:interface:aximm:1.0 m_axi BVALID";
  attribute X_INTERFACE_INFO of m_axi_wlast : signal is "xilinx.com:interface:aximm:1.0 m_axi WLAST";
  attribute X_INTERFACE_INFO of m_axi_wready : signal is "xilinx.com:interface:aximm:1.0 m_axi WREADY";
  attribute X_INTERFACE_INFO of m_axi_wvalid : signal is "xilinx.com:interface:aximm:1.0 m_axi WVALID";
  attribute X_INTERFACE_INFO of S_WR_tdata : signal is "xilinx.com:interface:axis:1.0 S_WR TDATA";
  attribute X_INTERFACE_INFO of m_axi_awaddr : signal is "xilinx.com:interface:aximm:1.0 m_axi AWADDR";
  attribute X_INTERFACE_INFO of m_axi_awburst : signal is "xilinx.com:interface:aximm:1.0 m_axi AWBURST";
  attribute X_INTERFACE_INFO of m_axi_awcache : signal is "xilinx.com:interface:aximm:1.0 m_axi AWCACHE";
  attribute X_INTERFACE_INFO of m_axi_awlen : signal is "xilinx.com:interface:aximm:1.0 m_axi AWLEN";
  attribute X_INTERFACE_INFO of m_axi_awprot : signal is "xilinx.com:interface:aximm:1.0 m_axi AWPROT";
  attribute X_INTERFACE_INFO of m_axi_awqos : signal is "xilinx.com:interface:aximm:1.0 m_axi AWQOS";
  attribute X_INTERFACE_INFO of m_axi_awsize : signal is "xilinx.com:interface:aximm:1.0 m_axi AWSIZE";
  attribute X_INTERFACE_INFO of m_axi_bresp : signal is "xilinx.com:interface:aximm:1.0 m_axi BRESP";
  attribute X_INTERFACE_INFO of m_axi_wdata : signal is "xilinx.com:interface:aximm:1.0 m_axi WDATA";
  attribute X_INTERFACE_INFO of m_axi_wstrb : signal is "xilinx.com:interface:aximm:1.0 m_axi WSTRB";
begin
  m_axi_awaddr(31) <= \<const0>\;
  m_axi_awaddr(30) <= \<const0>\;
  m_axi_awaddr(29) <= \<const0>\;
  m_axi_awaddr(28 downto 7) <= \^m_axi_awaddr\(28 downto 7);
  m_axi_awaddr(6) <= \<const0>\;
  m_axi_awaddr(5) <= \<const0>\;
  m_axi_awaddr(4) <= \<const0>\;
  m_axi_awaddr(3) <= \<const0>\;
  m_axi_awaddr(2) <= \<const0>\;
  m_axi_awaddr(1) <= \<const0>\;
  m_axi_awaddr(0) <= \<const0>\;
  m_axi_awburst(1) <= \<const0>\;
  m_axi_awburst(0) <= \^m_axi_awlen\(5);
  m_axi_awcache(3) <= \<const0>\;
  m_axi_awcache(2) <= \<const0>\;
  m_axi_awcache(1) <= \<const1>\;
  m_axi_awcache(0) <= \<const1>\;
  m_axi_awid <= \<const0>\;
  m_axi_awlen(7) <= \<const0>\;
  m_axi_awlen(6) <= \<const0>\;
  m_axi_awlen(5) <= \^m_axi_awlen\(5);
  m_axi_awlen(4) <= \^m_axi_awlen\(5);
  m_axi_awlen(3) <= \^m_axi_awlen\(5);
  m_axi_awlen(2) <= \^m_axi_awlen\(5);
  m_axi_awlen(1) <= \^m_axi_awlen\(5);
  m_axi_awlen(0) <= \^m_axi_awlen\(5);
  m_axi_awlock <= \<const0>\;
  m_axi_awprot(2) <= \<const0>\;
  m_axi_awprot(1) <= \<const0>\;
  m_axi_awprot(0) <= \<const0>\;
  m_axi_awqos(3) <= \<const0>\;
  m_axi_awqos(2) <= \<const0>\;
  m_axi_awqos(1) <= \<const0>\;
  m_axi_awqos(0) <= \<const0>\;
  m_axi_awsize(2) <= \<const0>\;
  m_axi_awsize(1) <= \^m_axi_awlen\(5);
  m_axi_awsize(0) <= \<const0>\;
  m_axi_wstrb(3) <= \^m_axi_awlen\(5);
  m_axi_wstrb(2) <= \^m_axi_awlen\(5);
  m_axi_wstrb(1) <= \^m_axi_awlen\(5);
  m_axi_wstrb(0) <= \^m_axi_awlen\(5);
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
VCC: unisim.vcomponents.VCC
     port map (
      P => \<const1>\
    );
inst: entity work.soc_axi_write_0_0_axi_write
     port map (
      S_WR_aclk => S_WR_aclk,
      S_WR_aresetn => S_WR_aresetn,
      S_WR_tdata(31 downto 0) => S_WR_tdata(31 downto 0),
      S_WR_tready => S_WR_tready,
      S_WR_tvalid => S_WR_tvalid,
      \aw_len_reg[5]_0\ => \^m_axi_awlen\(5),
      m_axi_awaddr(21 downto 0) => \^m_axi_awaddr\(28 downto 7),
      m_axi_awready => m_axi_awready,
      m_axi_awvalid => m_axi_awvalid,
      m_axi_bready => m_axi_bready,
      m_axi_wdata(31 downto 0) => m_axi_wdata(31 downto 0),
      m_axi_wready => m_axi_wready,
      w_last_reg_0 => m_axi_wlast,
      w_valid_reg_0 => m_axi_wvalid
    );
end STRUCTURE;
