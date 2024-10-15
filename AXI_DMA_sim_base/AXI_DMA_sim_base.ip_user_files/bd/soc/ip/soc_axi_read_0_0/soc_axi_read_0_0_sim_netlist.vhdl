-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
-- Date        : Tue Oct 15 15:45:07 2024
-- Host        : DESKTOP-I9U844P running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               e:/Desktop/axi_dma/AXI_DMA_sim_base/AXI_DMA_sim_base.srcs/sources_1/bd/soc/ip/soc_axi_read_0_0/soc_axi_read_0_0_sim_netlist.vhdl
-- Design      : soc_axi_read_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity soc_axi_read_0_0_axi_read is
  port (
    o_last_reg_0 : out STD_LOGIC;
    M_RD_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    o_valid_reg_0 : out STD_LOGIC;
    \ar_len_reg[5]_0\ : out STD_LOGIC;
    m_axi_rready : out STD_LOGIC;
    m_axi_arvalid : out STD_LOGIC;
    M_RD_aclk : in STD_LOGIC;
    m_axi_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_RD_tready : in STD_LOGIC;
    m_axi_arready : in STD_LOGIC;
    m_axi_rvalid : in STD_LOGIC;
    i_wr_done : in STD_LOGIC;
    M_RD_aresetn : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of soc_axi_read_0_0_axi_read : entity is "axi_read";
end soc_axi_read_0_0_axi_read;

architecture STRUCTURE of soc_axi_read_0_0_axi_read is
  signal \ar_len[5]_i_1_n_0\ : STD_LOGIC;
  signal \^ar_len_reg[5]_0\ : STD_LOGIC;
  signal ar_size : STD_LOGIC;
  signal ar_valid_i_1_n_0 : STD_LOGIC;
  signal ar_valid_i_3_n_0 : STD_LOGIC;
  signal c_state : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \^m_axi_arvalid\ : STD_LOGIC;
  signal n_state : STD_LOGIC_VECTOR ( 0 to 0 );
  signal n_state3 : STD_LOGIC;
  signal \n_state3_carry__0_i_1_n_0\ : STD_LOGIC;
  signal \n_state3_carry__0_i_2_n_0\ : STD_LOGIC;
  signal \n_state3_carry__0_i_3_n_0\ : STD_LOGIC;
  signal \n_state3_carry__0_i_4_n_0\ : STD_LOGIC;
  signal \n_state3_carry__0_n_0\ : STD_LOGIC;
  signal \n_state3_carry__0_n_1\ : STD_LOGIC;
  signal \n_state3_carry__0_n_2\ : STD_LOGIC;
  signal \n_state3_carry__0_n_3\ : STD_LOGIC;
  signal \n_state3_carry__1_i_1_n_0\ : STD_LOGIC;
  signal \n_state3_carry__1_i_2_n_0\ : STD_LOGIC;
  signal \n_state3_carry__1_i_3_n_0\ : STD_LOGIC;
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
  signal \n_state__0\ : STD_LOGIC_VECTOR ( 2 downto 1 );
  signal \num_rd_cnt[0]_i_1_n_0\ : STD_LOGIC;
  signal \num_rd_cnt[0]_i_3_n_0\ : STD_LOGIC;
  signal \num_rd_cnt[0]_i_4_n_0\ : STD_LOGIC;
  signal \num_rd_cnt[0]_i_5_n_0\ : STD_LOGIC;
  signal \num_rd_cnt[0]_i_6_n_0\ : STD_LOGIC;
  signal \num_rd_cnt[0]_i_7_n_0\ : STD_LOGIC;
  signal \num_rd_cnt[12]_i_2_n_0\ : STD_LOGIC;
  signal \num_rd_cnt[12]_i_3_n_0\ : STD_LOGIC;
  signal \num_rd_cnt[12]_i_4_n_0\ : STD_LOGIC;
  signal \num_rd_cnt[12]_i_5_n_0\ : STD_LOGIC;
  signal \num_rd_cnt[16]_i_2_n_0\ : STD_LOGIC;
  signal \num_rd_cnt[16]_i_3_n_0\ : STD_LOGIC;
  signal \num_rd_cnt[16]_i_4_n_0\ : STD_LOGIC;
  signal \num_rd_cnt[16]_i_5_n_0\ : STD_LOGIC;
  signal \num_rd_cnt[20]_i_2_n_0\ : STD_LOGIC;
  signal \num_rd_cnt[20]_i_3_n_0\ : STD_LOGIC;
  signal \num_rd_cnt[20]_i_4_n_0\ : STD_LOGIC;
  signal \num_rd_cnt[20]_i_5_n_0\ : STD_LOGIC;
  signal \num_rd_cnt[24]_i_2_n_0\ : STD_LOGIC;
  signal \num_rd_cnt[24]_i_3_n_0\ : STD_LOGIC;
  signal \num_rd_cnt[24]_i_4_n_0\ : STD_LOGIC;
  signal \num_rd_cnt[24]_i_5_n_0\ : STD_LOGIC;
  signal \num_rd_cnt[28]_i_2_n_0\ : STD_LOGIC;
  signal \num_rd_cnt[28]_i_3_n_0\ : STD_LOGIC;
  signal \num_rd_cnt[28]_i_4_n_0\ : STD_LOGIC;
  signal \num_rd_cnt[28]_i_5_n_0\ : STD_LOGIC;
  signal \num_rd_cnt[4]_i_2_n_0\ : STD_LOGIC;
  signal \num_rd_cnt[4]_i_3_n_0\ : STD_LOGIC;
  signal \num_rd_cnt[4]_i_4_n_0\ : STD_LOGIC;
  signal \num_rd_cnt[4]_i_5_n_0\ : STD_LOGIC;
  signal \num_rd_cnt[8]_i_2_n_0\ : STD_LOGIC;
  signal \num_rd_cnt[8]_i_3_n_0\ : STD_LOGIC;
  signal \num_rd_cnt[8]_i_4_n_0\ : STD_LOGIC;
  signal \num_rd_cnt[8]_i_5_n_0\ : STD_LOGIC;
  signal num_rd_cnt_reg : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \num_rd_cnt_reg[0]_i_2_n_0\ : STD_LOGIC;
  signal \num_rd_cnt_reg[0]_i_2_n_1\ : STD_LOGIC;
  signal \num_rd_cnt_reg[0]_i_2_n_2\ : STD_LOGIC;
  signal \num_rd_cnt_reg[0]_i_2_n_3\ : STD_LOGIC;
  signal \num_rd_cnt_reg[0]_i_2_n_4\ : STD_LOGIC;
  signal \num_rd_cnt_reg[0]_i_2_n_5\ : STD_LOGIC;
  signal \num_rd_cnt_reg[0]_i_2_n_6\ : STD_LOGIC;
  signal \num_rd_cnt_reg[0]_i_2_n_7\ : STD_LOGIC;
  signal \num_rd_cnt_reg[12]_i_1_n_0\ : STD_LOGIC;
  signal \num_rd_cnt_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \num_rd_cnt_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \num_rd_cnt_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \num_rd_cnt_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \num_rd_cnt_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \num_rd_cnt_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \num_rd_cnt_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \num_rd_cnt_reg[16]_i_1_n_0\ : STD_LOGIC;
  signal \num_rd_cnt_reg[16]_i_1_n_1\ : STD_LOGIC;
  signal \num_rd_cnt_reg[16]_i_1_n_2\ : STD_LOGIC;
  signal \num_rd_cnt_reg[16]_i_1_n_3\ : STD_LOGIC;
  signal \num_rd_cnt_reg[16]_i_1_n_4\ : STD_LOGIC;
  signal \num_rd_cnt_reg[16]_i_1_n_5\ : STD_LOGIC;
  signal \num_rd_cnt_reg[16]_i_1_n_6\ : STD_LOGIC;
  signal \num_rd_cnt_reg[16]_i_1_n_7\ : STD_LOGIC;
  signal \num_rd_cnt_reg[20]_i_1_n_0\ : STD_LOGIC;
  signal \num_rd_cnt_reg[20]_i_1_n_1\ : STD_LOGIC;
  signal \num_rd_cnt_reg[20]_i_1_n_2\ : STD_LOGIC;
  signal \num_rd_cnt_reg[20]_i_1_n_3\ : STD_LOGIC;
  signal \num_rd_cnt_reg[20]_i_1_n_4\ : STD_LOGIC;
  signal \num_rd_cnt_reg[20]_i_1_n_5\ : STD_LOGIC;
  signal \num_rd_cnt_reg[20]_i_1_n_6\ : STD_LOGIC;
  signal \num_rd_cnt_reg[20]_i_1_n_7\ : STD_LOGIC;
  signal \num_rd_cnt_reg[24]_i_1_n_0\ : STD_LOGIC;
  signal \num_rd_cnt_reg[24]_i_1_n_1\ : STD_LOGIC;
  signal \num_rd_cnt_reg[24]_i_1_n_2\ : STD_LOGIC;
  signal \num_rd_cnt_reg[24]_i_1_n_3\ : STD_LOGIC;
  signal \num_rd_cnt_reg[24]_i_1_n_4\ : STD_LOGIC;
  signal \num_rd_cnt_reg[24]_i_1_n_5\ : STD_LOGIC;
  signal \num_rd_cnt_reg[24]_i_1_n_6\ : STD_LOGIC;
  signal \num_rd_cnt_reg[24]_i_1_n_7\ : STD_LOGIC;
  signal \num_rd_cnt_reg[28]_i_1_n_1\ : STD_LOGIC;
  signal \num_rd_cnt_reg[28]_i_1_n_2\ : STD_LOGIC;
  signal \num_rd_cnt_reg[28]_i_1_n_3\ : STD_LOGIC;
  signal \num_rd_cnt_reg[28]_i_1_n_4\ : STD_LOGIC;
  signal \num_rd_cnt_reg[28]_i_1_n_5\ : STD_LOGIC;
  signal \num_rd_cnt_reg[28]_i_1_n_6\ : STD_LOGIC;
  signal \num_rd_cnt_reg[28]_i_1_n_7\ : STD_LOGIC;
  signal \num_rd_cnt_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \num_rd_cnt_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \num_rd_cnt_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \num_rd_cnt_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \num_rd_cnt_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \num_rd_cnt_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \num_rd_cnt_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \num_rd_cnt_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \num_rd_cnt_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \num_rd_cnt_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \num_rd_cnt_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \num_rd_cnt_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \num_rd_cnt_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \num_rd_cnt_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \num_rd_cnt_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \num_rd_cnt_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal \o_data[7]_i_1_n_0\ : STD_LOGIC;
  signal o_last_i_1_n_0 : STD_LOGIC;
  signal o_last_i_2_n_0 : STD_LOGIC;
  signal o_last_i_3_n_0 : STD_LOGIC;
  signal \^o_last_reg_0\ : STD_LOGIC;
  signal o_valid_i_1_n_0 : STD_LOGIC;
  signal o_valid_i_2_n_0 : STD_LOGIC;
  signal o_valid_i_3_n_0 : STD_LOGIC;
  signal \^o_valid_reg_0\ : STD_LOGIC;
  signal NLW_n_state3_carry_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_n_state3_carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_n_state3_carry__1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_n_state3_carry__1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_num_rd_cnt_reg[28]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_sequential_c_state[2]_i_1\ : label is "soft_lutpair1";
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_sequential_c_state_reg[0]\ : label is "WAIT_RD:000,RD_ADDR:001,RD_DATA:010,RD_LAST:011,RD_STOP:100";
  attribute FSM_ENCODED_STATES of \FSM_sequential_c_state_reg[1]\ : label is "WAIT_RD:000,RD_ADDR:001,RD_DATA:010,RD_LAST:011,RD_STOP:100";
  attribute FSM_ENCODED_STATES of \FSM_sequential_c_state_reg[2]\ : label is "WAIT_RD:000,RD_ADDR:001,RD_DATA:010,RD_LAST:011,RD_STOP:100";
  attribute SOFT_HLUTNM of ar_valid_i_2 : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of ar_valid_i_3 : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of m_axi_rready_INST_0 : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of o_valid_i_2 : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of o_valid_i_3 : label is "soft_lutpair0";
begin
  \ar_len_reg[5]_0\ <= \^ar_len_reg[5]_0\;
  m_axi_arvalid <= \^m_axi_arvalid\;
  o_last_reg_0 <= \^o_last_reg_0\;
  o_valid_reg_0 <= \^o_valid_reg_0\;
\FSM_sequential_c_state[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF10222222"
    )
        port map (
      I0 => c_state(0),
      I1 => o_last_i_3_n_0,
      I2 => n_state3,
      I3 => \^o_valid_reg_0\,
      I4 => M_RD_tready,
      I5 => ar_size,
      O => n_state(0)
    );
\FSM_sequential_c_state[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"007F00F0007000F0"
    )
        port map (
      I0 => \^o_valid_reg_0\,
      I1 => M_RD_tready,
      I2 => c_state(1),
      I3 => c_state(2),
      I4 => c_state(0),
      I5 => m_axi_arready,
      O => \n_state__0\(1)
    );
\FSM_sequential_c_state[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00800000"
    )
        port map (
      I0 => \^o_valid_reg_0\,
      I1 => M_RD_tready,
      I2 => c_state(1),
      I3 => c_state(2),
      I4 => c_state(0),
      O => \n_state__0\(2)
    );
\FSM_sequential_c_state_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => M_RD_aclk,
      CE => '1',
      CLR => o_last_i_2_n_0,
      D => n_state(0),
      Q => c_state(0)
    );
\FSM_sequential_c_state_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => M_RD_aclk,
      CE => '1',
      CLR => o_last_i_2_n_0,
      D => \n_state__0\(1),
      Q => c_state(1)
    );
\FSM_sequential_c_state_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => M_RD_aclk,
      CE => '1',
      CLR => o_last_i_2_n_0,
      D => \n_state__0\(2),
      Q => c_state(2)
    );
\ar_len[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF00000074"
    )
        port map (
      I0 => m_axi_arready,
      I1 => c_state(0),
      I2 => i_wr_done,
      I3 => c_state(1),
      I4 => c_state(2),
      I5 => \^ar_len_reg[5]_0\,
      O => \ar_len[5]_i_1_n_0\
    );
\ar_len_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => M_RD_aclk,
      CE => '1',
      CLR => o_last_i_2_n_0,
      D => \ar_len[5]_i_1_n_0\,
      Q => \^ar_len_reg[5]_0\
    );
ar_valid_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAEFEEAAAA2022"
    )
        port map (
      I0 => ar_size,
      I1 => c_state(0),
      I2 => ar_valid_i_3_n_0,
      I3 => n_state3,
      I4 => o_last_i_3_n_0,
      I5 => \^m_axi_arvalid\,
      O => ar_valid_i_1_n_0
    );
ar_valid_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00101110"
    )
        port map (
      I0 => c_state(2),
      I1 => c_state(1),
      I2 => i_wr_done,
      I3 => c_state(0),
      I4 => m_axi_arready,
      O => ar_size
    );
ar_valid_i_3: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => \^o_valid_reg_0\,
      I1 => M_RD_tready,
      O => ar_valid_i_3_n_0
    );
ar_valid_reg: unisim.vcomponents.FDCE
     port map (
      C => M_RD_aclk,
      CE => '1',
      CLR => o_last_i_2_n_0,
      D => ar_valid_i_1_n_0,
      Q => \^m_axi_arvalid\
    );
m_axi_rready_INST_0: unisim.vcomponents.LUT5
    generic map(
      INIT => X"54440000"
    )
        port map (
      I0 => c_state(2),
      I1 => c_state(1),
      I2 => m_axi_arready,
      I3 => c_state(0),
      I4 => M_RD_tready,
      O => m_axi_rready
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
      S(3) => \n_state3_carry__0_i_1_n_0\,
      S(2) => \n_state3_carry__0_i_2_n_0\,
      S(1) => \n_state3_carry__0_i_3_n_0\,
      S(0) => \n_state3_carry__0_i_4_n_0\
    );
\n_state3_carry__0_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0810"
    )
        port map (
      I0 => num_rd_cnt_reg(22),
      I1 => num_rd_cnt_reg(23),
      I2 => \^ar_len_reg[5]_0\,
      I3 => num_rd_cnt_reg(21),
      O => \n_state3_carry__0_i_1_n_0\
    );
\n_state3_carry__0_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0810"
    )
        port map (
      I0 => num_rd_cnt_reg(19),
      I1 => num_rd_cnt_reg(20),
      I2 => \^ar_len_reg[5]_0\,
      I3 => num_rd_cnt_reg(18),
      O => \n_state3_carry__0_i_2_n_0\
    );
\n_state3_carry__0_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0810"
    )
        port map (
      I0 => num_rd_cnt_reg(16),
      I1 => num_rd_cnt_reg(17),
      I2 => \^ar_len_reg[5]_0\,
      I3 => num_rd_cnt_reg(15),
      O => \n_state3_carry__0_i_3_n_0\
    );
\n_state3_carry__0_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0810"
    )
        port map (
      I0 => num_rd_cnt_reg(13),
      I1 => num_rd_cnt_reg(14),
      I2 => \^ar_len_reg[5]_0\,
      I3 => num_rd_cnt_reg(12),
      O => \n_state3_carry__0_i_4_n_0\
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
      S(2) => \n_state3_carry__1_i_1_n_0\,
      S(1) => \n_state3_carry__1_i_2_n_0\,
      S(0) => \n_state3_carry__1_i_3_n_0\
    );
\n_state3_carry__1_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"42"
    )
        port map (
      I0 => \^ar_len_reg[5]_0\,
      I1 => num_rd_cnt_reg(30),
      I2 => num_rd_cnt_reg(31),
      O => \n_state3_carry__1_i_1_n_0\
    );
\n_state3_carry__1_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0810"
    )
        port map (
      I0 => num_rd_cnt_reg(28),
      I1 => num_rd_cnt_reg(29),
      I2 => \^ar_len_reg[5]_0\,
      I3 => num_rd_cnt_reg(27),
      O => \n_state3_carry__1_i_2_n_0\
    );
\n_state3_carry__1_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0810"
    )
        port map (
      I0 => num_rd_cnt_reg(25),
      I1 => num_rd_cnt_reg(26),
      I2 => \^ar_len_reg[5]_0\,
      I3 => num_rd_cnt_reg(24),
      O => \n_state3_carry__1_i_3_n_0\
    );
n_state3_carry_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0810"
    )
        port map (
      I0 => num_rd_cnt_reg(10),
      I1 => num_rd_cnt_reg(11),
      I2 => \^ar_len_reg[5]_0\,
      I3 => num_rd_cnt_reg(9),
      O => n_state3_carry_i_1_n_0
    );
n_state3_carry_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0810"
    )
        port map (
      I0 => num_rd_cnt_reg(7),
      I1 => num_rd_cnt_reg(8),
      I2 => \^ar_len_reg[5]_0\,
      I3 => num_rd_cnt_reg(6),
      O => n_state3_carry_i_2_n_0
    );
n_state3_carry_i_3: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => num_rd_cnt_reg(5),
      I1 => num_rd_cnt_reg(4),
      I2 => num_rd_cnt_reg(3),
      O => n_state3_carry_i_3_n_0
    );
n_state3_carry_i_4: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0880"
    )
        port map (
      I0 => num_rd_cnt_reg(2),
      I1 => num_rd_cnt_reg(1),
      I2 => num_rd_cnt_reg(0),
      I3 => \^ar_len_reg[5]_0\,
      O => n_state3_carry_i_4_n_0
    );
\num_rd_cnt[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"EA"
    )
        port map (
      I0 => \^o_last_reg_0\,
      I1 => M_RD_tready,
      I2 => \^o_valid_reg_0\,
      O => \num_rd_cnt[0]_i_1_n_0\
    );
\num_rd_cnt[0]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^o_last_reg_0\,
      O => \num_rd_cnt[0]_i_3_n_0\
    );
\num_rd_cnt[0]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => num_rd_cnt_reg(3),
      I1 => \^o_last_reg_0\,
      O => \num_rd_cnt[0]_i_4_n_0\
    );
\num_rd_cnt[0]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => num_rd_cnt_reg(2),
      I1 => \^o_last_reg_0\,
      O => \num_rd_cnt[0]_i_5_n_0\
    );
\num_rd_cnt[0]_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => num_rd_cnt_reg(1),
      I1 => \^o_last_reg_0\,
      O => \num_rd_cnt[0]_i_6_n_0\
    );
\num_rd_cnt[0]_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => num_rd_cnt_reg(0),
      I1 => \^o_last_reg_0\,
      O => \num_rd_cnt[0]_i_7_n_0\
    );
\num_rd_cnt[12]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => num_rd_cnt_reg(15),
      I1 => \^o_last_reg_0\,
      O => \num_rd_cnt[12]_i_2_n_0\
    );
\num_rd_cnt[12]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => num_rd_cnt_reg(14),
      I1 => \^o_last_reg_0\,
      O => \num_rd_cnt[12]_i_3_n_0\
    );
\num_rd_cnt[12]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => num_rd_cnt_reg(13),
      I1 => \^o_last_reg_0\,
      O => \num_rd_cnt[12]_i_4_n_0\
    );
\num_rd_cnt[12]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => num_rd_cnt_reg(12),
      I1 => \^o_last_reg_0\,
      O => \num_rd_cnt[12]_i_5_n_0\
    );
\num_rd_cnt[16]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => num_rd_cnt_reg(19),
      I1 => \^o_last_reg_0\,
      O => \num_rd_cnt[16]_i_2_n_0\
    );
\num_rd_cnt[16]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => num_rd_cnt_reg(18),
      I1 => \^o_last_reg_0\,
      O => \num_rd_cnt[16]_i_3_n_0\
    );
\num_rd_cnt[16]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => num_rd_cnt_reg(17),
      I1 => \^o_last_reg_0\,
      O => \num_rd_cnt[16]_i_4_n_0\
    );
\num_rd_cnt[16]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => num_rd_cnt_reg(16),
      I1 => \^o_last_reg_0\,
      O => \num_rd_cnt[16]_i_5_n_0\
    );
\num_rd_cnt[20]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => num_rd_cnt_reg(23),
      I1 => \^o_last_reg_0\,
      O => \num_rd_cnt[20]_i_2_n_0\
    );
\num_rd_cnt[20]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => num_rd_cnt_reg(22),
      I1 => \^o_last_reg_0\,
      O => \num_rd_cnt[20]_i_3_n_0\
    );
\num_rd_cnt[20]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => num_rd_cnt_reg(21),
      I1 => \^o_last_reg_0\,
      O => \num_rd_cnt[20]_i_4_n_0\
    );
\num_rd_cnt[20]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => num_rd_cnt_reg(20),
      I1 => \^o_last_reg_0\,
      O => \num_rd_cnt[20]_i_5_n_0\
    );
\num_rd_cnt[24]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => num_rd_cnt_reg(27),
      I1 => \^o_last_reg_0\,
      O => \num_rd_cnt[24]_i_2_n_0\
    );
\num_rd_cnt[24]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => num_rd_cnt_reg(26),
      I1 => \^o_last_reg_0\,
      O => \num_rd_cnt[24]_i_3_n_0\
    );
\num_rd_cnt[24]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => num_rd_cnt_reg(25),
      I1 => \^o_last_reg_0\,
      O => \num_rd_cnt[24]_i_4_n_0\
    );
\num_rd_cnt[24]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => num_rd_cnt_reg(24),
      I1 => \^o_last_reg_0\,
      O => \num_rd_cnt[24]_i_5_n_0\
    );
\num_rd_cnt[28]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => num_rd_cnt_reg(31),
      I1 => \^o_last_reg_0\,
      O => \num_rd_cnt[28]_i_2_n_0\
    );
\num_rd_cnt[28]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => num_rd_cnt_reg(30),
      I1 => \^o_last_reg_0\,
      O => \num_rd_cnt[28]_i_3_n_0\
    );
\num_rd_cnt[28]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => num_rd_cnt_reg(29),
      I1 => \^o_last_reg_0\,
      O => \num_rd_cnt[28]_i_4_n_0\
    );
\num_rd_cnt[28]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => num_rd_cnt_reg(28),
      I1 => \^o_last_reg_0\,
      O => \num_rd_cnt[28]_i_5_n_0\
    );
\num_rd_cnt[4]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => num_rd_cnt_reg(7),
      I1 => \^o_last_reg_0\,
      O => \num_rd_cnt[4]_i_2_n_0\
    );
\num_rd_cnt[4]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => num_rd_cnt_reg(6),
      I1 => \^o_last_reg_0\,
      O => \num_rd_cnt[4]_i_3_n_0\
    );
\num_rd_cnt[4]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => num_rd_cnt_reg(5),
      I1 => \^o_last_reg_0\,
      O => \num_rd_cnt[4]_i_4_n_0\
    );
\num_rd_cnt[4]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => num_rd_cnt_reg(4),
      I1 => \^o_last_reg_0\,
      O => \num_rd_cnt[4]_i_5_n_0\
    );
\num_rd_cnt[8]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => num_rd_cnt_reg(11),
      I1 => \^o_last_reg_0\,
      O => \num_rd_cnt[8]_i_2_n_0\
    );
\num_rd_cnt[8]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => num_rd_cnt_reg(10),
      I1 => \^o_last_reg_0\,
      O => \num_rd_cnt[8]_i_3_n_0\
    );
\num_rd_cnt[8]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => num_rd_cnt_reg(9),
      I1 => \^o_last_reg_0\,
      O => \num_rd_cnt[8]_i_4_n_0\
    );
\num_rd_cnt[8]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => num_rd_cnt_reg(8),
      I1 => \^o_last_reg_0\,
      O => \num_rd_cnt[8]_i_5_n_0\
    );
\num_rd_cnt_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => M_RD_aclk,
      CE => \num_rd_cnt[0]_i_1_n_0\,
      CLR => o_last_i_2_n_0,
      D => \num_rd_cnt_reg[0]_i_2_n_7\,
      Q => num_rd_cnt_reg(0)
    );
\num_rd_cnt_reg[0]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \num_rd_cnt_reg[0]_i_2_n_0\,
      CO(2) => \num_rd_cnt_reg[0]_i_2_n_1\,
      CO(1) => \num_rd_cnt_reg[0]_i_2_n_2\,
      CO(0) => \num_rd_cnt_reg[0]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 1) => B"000",
      DI(0) => \num_rd_cnt[0]_i_3_n_0\,
      O(3) => \num_rd_cnt_reg[0]_i_2_n_4\,
      O(2) => \num_rd_cnt_reg[0]_i_2_n_5\,
      O(1) => \num_rd_cnt_reg[0]_i_2_n_6\,
      O(0) => \num_rd_cnt_reg[0]_i_2_n_7\,
      S(3) => \num_rd_cnt[0]_i_4_n_0\,
      S(2) => \num_rd_cnt[0]_i_5_n_0\,
      S(1) => \num_rd_cnt[0]_i_6_n_0\,
      S(0) => \num_rd_cnt[0]_i_7_n_0\
    );
\num_rd_cnt_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => M_RD_aclk,
      CE => \num_rd_cnt[0]_i_1_n_0\,
      CLR => o_last_i_2_n_0,
      D => \num_rd_cnt_reg[8]_i_1_n_5\,
      Q => num_rd_cnt_reg(10)
    );
\num_rd_cnt_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => M_RD_aclk,
      CE => \num_rd_cnt[0]_i_1_n_0\,
      CLR => o_last_i_2_n_0,
      D => \num_rd_cnt_reg[8]_i_1_n_4\,
      Q => num_rd_cnt_reg(11)
    );
\num_rd_cnt_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => M_RD_aclk,
      CE => \num_rd_cnt[0]_i_1_n_0\,
      CLR => o_last_i_2_n_0,
      D => \num_rd_cnt_reg[12]_i_1_n_7\,
      Q => num_rd_cnt_reg(12)
    );
\num_rd_cnt_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \num_rd_cnt_reg[8]_i_1_n_0\,
      CO(3) => \num_rd_cnt_reg[12]_i_1_n_0\,
      CO(2) => \num_rd_cnt_reg[12]_i_1_n_1\,
      CO(1) => \num_rd_cnt_reg[12]_i_1_n_2\,
      CO(0) => \num_rd_cnt_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \num_rd_cnt_reg[12]_i_1_n_4\,
      O(2) => \num_rd_cnt_reg[12]_i_1_n_5\,
      O(1) => \num_rd_cnt_reg[12]_i_1_n_6\,
      O(0) => \num_rd_cnt_reg[12]_i_1_n_7\,
      S(3) => \num_rd_cnt[12]_i_2_n_0\,
      S(2) => \num_rd_cnt[12]_i_3_n_0\,
      S(1) => \num_rd_cnt[12]_i_4_n_0\,
      S(0) => \num_rd_cnt[12]_i_5_n_0\
    );
\num_rd_cnt_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => M_RD_aclk,
      CE => \num_rd_cnt[0]_i_1_n_0\,
      CLR => o_last_i_2_n_0,
      D => \num_rd_cnt_reg[12]_i_1_n_6\,
      Q => num_rd_cnt_reg(13)
    );
\num_rd_cnt_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => M_RD_aclk,
      CE => \num_rd_cnt[0]_i_1_n_0\,
      CLR => o_last_i_2_n_0,
      D => \num_rd_cnt_reg[12]_i_1_n_5\,
      Q => num_rd_cnt_reg(14)
    );
\num_rd_cnt_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => M_RD_aclk,
      CE => \num_rd_cnt[0]_i_1_n_0\,
      CLR => o_last_i_2_n_0,
      D => \num_rd_cnt_reg[12]_i_1_n_4\,
      Q => num_rd_cnt_reg(15)
    );
\num_rd_cnt_reg[16]\: unisim.vcomponents.FDCE
     port map (
      C => M_RD_aclk,
      CE => \num_rd_cnt[0]_i_1_n_0\,
      CLR => o_last_i_2_n_0,
      D => \num_rd_cnt_reg[16]_i_1_n_7\,
      Q => num_rd_cnt_reg(16)
    );
\num_rd_cnt_reg[16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \num_rd_cnt_reg[12]_i_1_n_0\,
      CO(3) => \num_rd_cnt_reg[16]_i_1_n_0\,
      CO(2) => \num_rd_cnt_reg[16]_i_1_n_1\,
      CO(1) => \num_rd_cnt_reg[16]_i_1_n_2\,
      CO(0) => \num_rd_cnt_reg[16]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \num_rd_cnt_reg[16]_i_1_n_4\,
      O(2) => \num_rd_cnt_reg[16]_i_1_n_5\,
      O(1) => \num_rd_cnt_reg[16]_i_1_n_6\,
      O(0) => \num_rd_cnt_reg[16]_i_1_n_7\,
      S(3) => \num_rd_cnt[16]_i_2_n_0\,
      S(2) => \num_rd_cnt[16]_i_3_n_0\,
      S(1) => \num_rd_cnt[16]_i_4_n_0\,
      S(0) => \num_rd_cnt[16]_i_5_n_0\
    );
\num_rd_cnt_reg[17]\: unisim.vcomponents.FDCE
     port map (
      C => M_RD_aclk,
      CE => \num_rd_cnt[0]_i_1_n_0\,
      CLR => o_last_i_2_n_0,
      D => \num_rd_cnt_reg[16]_i_1_n_6\,
      Q => num_rd_cnt_reg(17)
    );
\num_rd_cnt_reg[18]\: unisim.vcomponents.FDCE
     port map (
      C => M_RD_aclk,
      CE => \num_rd_cnt[0]_i_1_n_0\,
      CLR => o_last_i_2_n_0,
      D => \num_rd_cnt_reg[16]_i_1_n_5\,
      Q => num_rd_cnt_reg(18)
    );
\num_rd_cnt_reg[19]\: unisim.vcomponents.FDCE
     port map (
      C => M_RD_aclk,
      CE => \num_rd_cnt[0]_i_1_n_0\,
      CLR => o_last_i_2_n_0,
      D => \num_rd_cnt_reg[16]_i_1_n_4\,
      Q => num_rd_cnt_reg(19)
    );
\num_rd_cnt_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => M_RD_aclk,
      CE => \num_rd_cnt[0]_i_1_n_0\,
      CLR => o_last_i_2_n_0,
      D => \num_rd_cnt_reg[0]_i_2_n_6\,
      Q => num_rd_cnt_reg(1)
    );
\num_rd_cnt_reg[20]\: unisim.vcomponents.FDCE
     port map (
      C => M_RD_aclk,
      CE => \num_rd_cnt[0]_i_1_n_0\,
      CLR => o_last_i_2_n_0,
      D => \num_rd_cnt_reg[20]_i_1_n_7\,
      Q => num_rd_cnt_reg(20)
    );
\num_rd_cnt_reg[20]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \num_rd_cnt_reg[16]_i_1_n_0\,
      CO(3) => \num_rd_cnt_reg[20]_i_1_n_0\,
      CO(2) => \num_rd_cnt_reg[20]_i_1_n_1\,
      CO(1) => \num_rd_cnt_reg[20]_i_1_n_2\,
      CO(0) => \num_rd_cnt_reg[20]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \num_rd_cnt_reg[20]_i_1_n_4\,
      O(2) => \num_rd_cnt_reg[20]_i_1_n_5\,
      O(1) => \num_rd_cnt_reg[20]_i_1_n_6\,
      O(0) => \num_rd_cnt_reg[20]_i_1_n_7\,
      S(3) => \num_rd_cnt[20]_i_2_n_0\,
      S(2) => \num_rd_cnt[20]_i_3_n_0\,
      S(1) => \num_rd_cnt[20]_i_4_n_0\,
      S(0) => \num_rd_cnt[20]_i_5_n_0\
    );
\num_rd_cnt_reg[21]\: unisim.vcomponents.FDCE
     port map (
      C => M_RD_aclk,
      CE => \num_rd_cnt[0]_i_1_n_0\,
      CLR => o_last_i_2_n_0,
      D => \num_rd_cnt_reg[20]_i_1_n_6\,
      Q => num_rd_cnt_reg(21)
    );
\num_rd_cnt_reg[22]\: unisim.vcomponents.FDCE
     port map (
      C => M_RD_aclk,
      CE => \num_rd_cnt[0]_i_1_n_0\,
      CLR => o_last_i_2_n_0,
      D => \num_rd_cnt_reg[20]_i_1_n_5\,
      Q => num_rd_cnt_reg(22)
    );
\num_rd_cnt_reg[23]\: unisim.vcomponents.FDCE
     port map (
      C => M_RD_aclk,
      CE => \num_rd_cnt[0]_i_1_n_0\,
      CLR => o_last_i_2_n_0,
      D => \num_rd_cnt_reg[20]_i_1_n_4\,
      Q => num_rd_cnt_reg(23)
    );
\num_rd_cnt_reg[24]\: unisim.vcomponents.FDCE
     port map (
      C => M_RD_aclk,
      CE => \num_rd_cnt[0]_i_1_n_0\,
      CLR => o_last_i_2_n_0,
      D => \num_rd_cnt_reg[24]_i_1_n_7\,
      Q => num_rd_cnt_reg(24)
    );
\num_rd_cnt_reg[24]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \num_rd_cnt_reg[20]_i_1_n_0\,
      CO(3) => \num_rd_cnt_reg[24]_i_1_n_0\,
      CO(2) => \num_rd_cnt_reg[24]_i_1_n_1\,
      CO(1) => \num_rd_cnt_reg[24]_i_1_n_2\,
      CO(0) => \num_rd_cnt_reg[24]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \num_rd_cnt_reg[24]_i_1_n_4\,
      O(2) => \num_rd_cnt_reg[24]_i_1_n_5\,
      O(1) => \num_rd_cnt_reg[24]_i_1_n_6\,
      O(0) => \num_rd_cnt_reg[24]_i_1_n_7\,
      S(3) => \num_rd_cnt[24]_i_2_n_0\,
      S(2) => \num_rd_cnt[24]_i_3_n_0\,
      S(1) => \num_rd_cnt[24]_i_4_n_0\,
      S(0) => \num_rd_cnt[24]_i_5_n_0\
    );
\num_rd_cnt_reg[25]\: unisim.vcomponents.FDCE
     port map (
      C => M_RD_aclk,
      CE => \num_rd_cnt[0]_i_1_n_0\,
      CLR => o_last_i_2_n_0,
      D => \num_rd_cnt_reg[24]_i_1_n_6\,
      Q => num_rd_cnt_reg(25)
    );
\num_rd_cnt_reg[26]\: unisim.vcomponents.FDCE
     port map (
      C => M_RD_aclk,
      CE => \num_rd_cnt[0]_i_1_n_0\,
      CLR => o_last_i_2_n_0,
      D => \num_rd_cnt_reg[24]_i_1_n_5\,
      Q => num_rd_cnt_reg(26)
    );
\num_rd_cnt_reg[27]\: unisim.vcomponents.FDCE
     port map (
      C => M_RD_aclk,
      CE => \num_rd_cnt[0]_i_1_n_0\,
      CLR => o_last_i_2_n_0,
      D => \num_rd_cnt_reg[24]_i_1_n_4\,
      Q => num_rd_cnt_reg(27)
    );
\num_rd_cnt_reg[28]\: unisim.vcomponents.FDCE
     port map (
      C => M_RD_aclk,
      CE => \num_rd_cnt[0]_i_1_n_0\,
      CLR => o_last_i_2_n_0,
      D => \num_rd_cnt_reg[28]_i_1_n_7\,
      Q => num_rd_cnt_reg(28)
    );
\num_rd_cnt_reg[28]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \num_rd_cnt_reg[24]_i_1_n_0\,
      CO(3) => \NLW_num_rd_cnt_reg[28]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \num_rd_cnt_reg[28]_i_1_n_1\,
      CO(1) => \num_rd_cnt_reg[28]_i_1_n_2\,
      CO(0) => \num_rd_cnt_reg[28]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \num_rd_cnt_reg[28]_i_1_n_4\,
      O(2) => \num_rd_cnt_reg[28]_i_1_n_5\,
      O(1) => \num_rd_cnt_reg[28]_i_1_n_6\,
      O(0) => \num_rd_cnt_reg[28]_i_1_n_7\,
      S(3) => \num_rd_cnt[28]_i_2_n_0\,
      S(2) => \num_rd_cnt[28]_i_3_n_0\,
      S(1) => \num_rd_cnt[28]_i_4_n_0\,
      S(0) => \num_rd_cnt[28]_i_5_n_0\
    );
\num_rd_cnt_reg[29]\: unisim.vcomponents.FDCE
     port map (
      C => M_RD_aclk,
      CE => \num_rd_cnt[0]_i_1_n_0\,
      CLR => o_last_i_2_n_0,
      D => \num_rd_cnt_reg[28]_i_1_n_6\,
      Q => num_rd_cnt_reg(29)
    );
\num_rd_cnt_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => M_RD_aclk,
      CE => \num_rd_cnt[0]_i_1_n_0\,
      CLR => o_last_i_2_n_0,
      D => \num_rd_cnt_reg[0]_i_2_n_5\,
      Q => num_rd_cnt_reg(2)
    );
\num_rd_cnt_reg[30]\: unisim.vcomponents.FDCE
     port map (
      C => M_RD_aclk,
      CE => \num_rd_cnt[0]_i_1_n_0\,
      CLR => o_last_i_2_n_0,
      D => \num_rd_cnt_reg[28]_i_1_n_5\,
      Q => num_rd_cnt_reg(30)
    );
\num_rd_cnt_reg[31]\: unisim.vcomponents.FDCE
     port map (
      C => M_RD_aclk,
      CE => \num_rd_cnt[0]_i_1_n_0\,
      CLR => o_last_i_2_n_0,
      D => \num_rd_cnt_reg[28]_i_1_n_4\,
      Q => num_rd_cnt_reg(31)
    );
\num_rd_cnt_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => M_RD_aclk,
      CE => \num_rd_cnt[0]_i_1_n_0\,
      CLR => o_last_i_2_n_0,
      D => \num_rd_cnt_reg[0]_i_2_n_4\,
      Q => num_rd_cnt_reg(3)
    );
\num_rd_cnt_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => M_RD_aclk,
      CE => \num_rd_cnt[0]_i_1_n_0\,
      CLR => o_last_i_2_n_0,
      D => \num_rd_cnt_reg[4]_i_1_n_7\,
      Q => num_rd_cnt_reg(4)
    );
\num_rd_cnt_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \num_rd_cnt_reg[0]_i_2_n_0\,
      CO(3) => \num_rd_cnt_reg[4]_i_1_n_0\,
      CO(2) => \num_rd_cnt_reg[4]_i_1_n_1\,
      CO(1) => \num_rd_cnt_reg[4]_i_1_n_2\,
      CO(0) => \num_rd_cnt_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \num_rd_cnt_reg[4]_i_1_n_4\,
      O(2) => \num_rd_cnt_reg[4]_i_1_n_5\,
      O(1) => \num_rd_cnt_reg[4]_i_1_n_6\,
      O(0) => \num_rd_cnt_reg[4]_i_1_n_7\,
      S(3) => \num_rd_cnt[4]_i_2_n_0\,
      S(2) => \num_rd_cnt[4]_i_3_n_0\,
      S(1) => \num_rd_cnt[4]_i_4_n_0\,
      S(0) => \num_rd_cnt[4]_i_5_n_0\
    );
\num_rd_cnt_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => M_RD_aclk,
      CE => \num_rd_cnt[0]_i_1_n_0\,
      CLR => o_last_i_2_n_0,
      D => \num_rd_cnt_reg[4]_i_1_n_6\,
      Q => num_rd_cnt_reg(5)
    );
\num_rd_cnt_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => M_RD_aclk,
      CE => \num_rd_cnt[0]_i_1_n_0\,
      CLR => o_last_i_2_n_0,
      D => \num_rd_cnt_reg[4]_i_1_n_5\,
      Q => num_rd_cnt_reg(6)
    );
\num_rd_cnt_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => M_RD_aclk,
      CE => \num_rd_cnt[0]_i_1_n_0\,
      CLR => o_last_i_2_n_0,
      D => \num_rd_cnt_reg[4]_i_1_n_4\,
      Q => num_rd_cnt_reg(7)
    );
\num_rd_cnt_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => M_RD_aclk,
      CE => \num_rd_cnt[0]_i_1_n_0\,
      CLR => o_last_i_2_n_0,
      D => \num_rd_cnt_reg[8]_i_1_n_7\,
      Q => num_rd_cnt_reg(8)
    );
\num_rd_cnt_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \num_rd_cnt_reg[4]_i_1_n_0\,
      CO(3) => \num_rd_cnt_reg[8]_i_1_n_0\,
      CO(2) => \num_rd_cnt_reg[8]_i_1_n_1\,
      CO(1) => \num_rd_cnt_reg[8]_i_1_n_2\,
      CO(0) => \num_rd_cnt_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \num_rd_cnt_reg[8]_i_1_n_4\,
      O(2) => \num_rd_cnt_reg[8]_i_1_n_5\,
      O(1) => \num_rd_cnt_reg[8]_i_1_n_6\,
      O(0) => \num_rd_cnt_reg[8]_i_1_n_7\,
      S(3) => \num_rd_cnt[8]_i_2_n_0\,
      S(2) => \num_rd_cnt[8]_i_3_n_0\,
      S(1) => \num_rd_cnt[8]_i_4_n_0\,
      S(0) => \num_rd_cnt[8]_i_5_n_0\
    );
\num_rd_cnt_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => M_RD_aclk,
      CE => \num_rd_cnt[0]_i_1_n_0\,
      CLR => o_last_i_2_n_0,
      D => \num_rd_cnt_reg[8]_i_1_n_6\,
      Q => num_rd_cnt_reg(9)
    );
\o_data[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8080808080808880"
    )
        port map (
      I0 => m_axi_rvalid,
      I1 => M_RD_tready,
      I2 => o_valid_i_2_n_0,
      I3 => c_state(1),
      I4 => c_state(2),
      I5 => \^o_valid_reg_0\,
      O => \o_data[7]_i_1_n_0\
    );
\o_data_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => M_RD_aclk,
      CE => \o_data[7]_i_1_n_0\,
      CLR => o_last_i_2_n_0,
      D => m_axi_rdata(0),
      Q => M_RD_tdata(24)
    );
\o_data_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => M_RD_aclk,
      CE => \o_data[7]_i_1_n_0\,
      CLR => o_last_i_2_n_0,
      D => m_axi_rdata(10),
      Q => M_RD_tdata(18)
    );
\o_data_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => M_RD_aclk,
      CE => \o_data[7]_i_1_n_0\,
      CLR => o_last_i_2_n_0,
      D => m_axi_rdata(11),
      Q => M_RD_tdata(19)
    );
\o_data_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => M_RD_aclk,
      CE => \o_data[7]_i_1_n_0\,
      CLR => o_last_i_2_n_0,
      D => m_axi_rdata(12),
      Q => M_RD_tdata(20)
    );
\o_data_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => M_RD_aclk,
      CE => \o_data[7]_i_1_n_0\,
      CLR => o_last_i_2_n_0,
      D => m_axi_rdata(13),
      Q => M_RD_tdata(21)
    );
\o_data_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => M_RD_aclk,
      CE => \o_data[7]_i_1_n_0\,
      CLR => o_last_i_2_n_0,
      D => m_axi_rdata(14),
      Q => M_RD_tdata(22)
    );
\o_data_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => M_RD_aclk,
      CE => \o_data[7]_i_1_n_0\,
      CLR => o_last_i_2_n_0,
      D => m_axi_rdata(15),
      Q => M_RD_tdata(23)
    );
\o_data_reg[16]\: unisim.vcomponents.FDCE
     port map (
      C => M_RD_aclk,
      CE => \o_data[7]_i_1_n_0\,
      CLR => o_last_i_2_n_0,
      D => m_axi_rdata(16),
      Q => M_RD_tdata(8)
    );
\o_data_reg[17]\: unisim.vcomponents.FDCE
     port map (
      C => M_RD_aclk,
      CE => \o_data[7]_i_1_n_0\,
      CLR => o_last_i_2_n_0,
      D => m_axi_rdata(17),
      Q => M_RD_tdata(9)
    );
\o_data_reg[18]\: unisim.vcomponents.FDCE
     port map (
      C => M_RD_aclk,
      CE => \o_data[7]_i_1_n_0\,
      CLR => o_last_i_2_n_0,
      D => m_axi_rdata(18),
      Q => M_RD_tdata(10)
    );
\o_data_reg[19]\: unisim.vcomponents.FDCE
     port map (
      C => M_RD_aclk,
      CE => \o_data[7]_i_1_n_0\,
      CLR => o_last_i_2_n_0,
      D => m_axi_rdata(19),
      Q => M_RD_tdata(11)
    );
\o_data_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => M_RD_aclk,
      CE => \o_data[7]_i_1_n_0\,
      CLR => o_last_i_2_n_0,
      D => m_axi_rdata(1),
      Q => M_RD_tdata(25)
    );
\o_data_reg[20]\: unisim.vcomponents.FDCE
     port map (
      C => M_RD_aclk,
      CE => \o_data[7]_i_1_n_0\,
      CLR => o_last_i_2_n_0,
      D => m_axi_rdata(20),
      Q => M_RD_tdata(12)
    );
\o_data_reg[21]\: unisim.vcomponents.FDCE
     port map (
      C => M_RD_aclk,
      CE => \o_data[7]_i_1_n_0\,
      CLR => o_last_i_2_n_0,
      D => m_axi_rdata(21),
      Q => M_RD_tdata(13)
    );
\o_data_reg[22]\: unisim.vcomponents.FDCE
     port map (
      C => M_RD_aclk,
      CE => \o_data[7]_i_1_n_0\,
      CLR => o_last_i_2_n_0,
      D => m_axi_rdata(22),
      Q => M_RD_tdata(14)
    );
\o_data_reg[23]\: unisim.vcomponents.FDCE
     port map (
      C => M_RD_aclk,
      CE => \o_data[7]_i_1_n_0\,
      CLR => o_last_i_2_n_0,
      D => m_axi_rdata(23),
      Q => M_RD_tdata(15)
    );
\o_data_reg[24]\: unisim.vcomponents.FDCE
     port map (
      C => M_RD_aclk,
      CE => \o_data[7]_i_1_n_0\,
      CLR => o_last_i_2_n_0,
      D => m_axi_rdata(24),
      Q => M_RD_tdata(0)
    );
\o_data_reg[25]\: unisim.vcomponents.FDCE
     port map (
      C => M_RD_aclk,
      CE => \o_data[7]_i_1_n_0\,
      CLR => o_last_i_2_n_0,
      D => m_axi_rdata(25),
      Q => M_RD_tdata(1)
    );
\o_data_reg[26]\: unisim.vcomponents.FDCE
     port map (
      C => M_RD_aclk,
      CE => \o_data[7]_i_1_n_0\,
      CLR => o_last_i_2_n_0,
      D => m_axi_rdata(26),
      Q => M_RD_tdata(2)
    );
\o_data_reg[27]\: unisim.vcomponents.FDCE
     port map (
      C => M_RD_aclk,
      CE => \o_data[7]_i_1_n_0\,
      CLR => o_last_i_2_n_0,
      D => m_axi_rdata(27),
      Q => M_RD_tdata(3)
    );
\o_data_reg[28]\: unisim.vcomponents.FDCE
     port map (
      C => M_RD_aclk,
      CE => \o_data[7]_i_1_n_0\,
      CLR => o_last_i_2_n_0,
      D => m_axi_rdata(28),
      Q => M_RD_tdata(4)
    );
\o_data_reg[29]\: unisim.vcomponents.FDCE
     port map (
      C => M_RD_aclk,
      CE => \o_data[7]_i_1_n_0\,
      CLR => o_last_i_2_n_0,
      D => m_axi_rdata(29),
      Q => M_RD_tdata(5)
    );
\o_data_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => M_RD_aclk,
      CE => \o_data[7]_i_1_n_0\,
      CLR => o_last_i_2_n_0,
      D => m_axi_rdata(2),
      Q => M_RD_tdata(26)
    );
\o_data_reg[30]\: unisim.vcomponents.FDCE
     port map (
      C => M_RD_aclk,
      CE => \o_data[7]_i_1_n_0\,
      CLR => o_last_i_2_n_0,
      D => m_axi_rdata(30),
      Q => M_RD_tdata(6)
    );
\o_data_reg[31]\: unisim.vcomponents.FDCE
     port map (
      C => M_RD_aclk,
      CE => \o_data[7]_i_1_n_0\,
      CLR => o_last_i_2_n_0,
      D => m_axi_rdata(31),
      Q => M_RD_tdata(7)
    );
\o_data_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => M_RD_aclk,
      CE => \o_data[7]_i_1_n_0\,
      CLR => o_last_i_2_n_0,
      D => m_axi_rdata(3),
      Q => M_RD_tdata(27)
    );
\o_data_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => M_RD_aclk,
      CE => \o_data[7]_i_1_n_0\,
      CLR => o_last_i_2_n_0,
      D => m_axi_rdata(4),
      Q => M_RD_tdata(28)
    );
\o_data_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => M_RD_aclk,
      CE => \o_data[7]_i_1_n_0\,
      CLR => o_last_i_2_n_0,
      D => m_axi_rdata(5),
      Q => M_RD_tdata(29)
    );
\o_data_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => M_RD_aclk,
      CE => \o_data[7]_i_1_n_0\,
      CLR => o_last_i_2_n_0,
      D => m_axi_rdata(6),
      Q => M_RD_tdata(30)
    );
\o_data_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => M_RD_aclk,
      CE => \o_data[7]_i_1_n_0\,
      CLR => o_last_i_2_n_0,
      D => m_axi_rdata(7),
      Q => M_RD_tdata(31)
    );
\o_data_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => M_RD_aclk,
      CE => \o_data[7]_i_1_n_0\,
      CLR => o_last_i_2_n_0,
      D => m_axi_rdata(8),
      Q => M_RD_tdata(16)
    );
\o_data_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => M_RD_aclk,
      CE => \o_data[7]_i_1_n_0\,
      CLR => o_last_i_2_n_0,
      D => m_axi_rdata(9),
      Q => M_RD_tdata(17)
    );
o_last_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF77FF00007780"
    )
        port map (
      I0 => M_RD_tready,
      I1 => \^o_valid_reg_0\,
      I2 => n_state3,
      I3 => c_state(0),
      I4 => o_last_i_3_n_0,
      I5 => \^o_last_reg_0\,
      O => o_last_i_1_n_0
    );
o_last_i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => M_RD_aresetn,
      O => o_last_i_2_n_0
    );
o_last_i_3: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => c_state(2),
      I1 => c_state(1),
      O => o_last_i_3_n_0
    );
o_last_reg: unisim.vcomponents.FDCE
     port map (
      C => M_RD_aclk,
      CE => '1',
      CLR => o_last_i_2_n_0,
      D => o_last_i_1_n_0,
      Q => \^o_last_reg_0\
    );
o_valid_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AA00FFFFBA000000"
    )
        port map (
      I0 => o_valid_i_2_n_0,
      I1 => o_last_i_3_n_0,
      I2 => M_RD_tready,
      I3 => m_axi_rvalid,
      I4 => o_valid_i_3_n_0,
      I5 => \^o_valid_reg_0\,
      O => o_valid_i_1_n_0
    );
o_valid_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0308"
    )
        port map (
      I0 => m_axi_arready,
      I1 => c_state(0),
      I2 => c_state(2),
      I3 => c_state(1),
      O => o_valid_i_2_n_0
    );
o_valid_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00F8"
    )
        port map (
      I0 => c_state(0),
      I1 => m_axi_arready,
      I2 => c_state(1),
      I3 => c_state(2),
      O => o_valid_i_3_n_0
    );
o_valid_reg: unisim.vcomponents.FDCE
     port map (
      C => M_RD_aclk,
      CE => '1',
      CLR => o_last_i_2_n_0,
      D => o_valid_i_1_n_0,
      Q => \^o_valid_reg_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity soc_axi_read_0_0 is
  port (
    i_wr_done : in STD_LOGIC;
    M_RD_aclk : in STD_LOGIC;
    M_RD_aresetn : in STD_LOGIC;
    M_RD_tlast : out STD_LOGIC;
    M_RD_tvalid : out STD_LOGIC;
    M_RD_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_RD_tready : in STD_LOGIC;
    m_axi_aclk : in STD_LOGIC;
    m_axi_aresetn : in STD_LOGIC;
    m_axi_arid : out STD_LOGIC;
    m_axi_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_arlock : out STD_LOGIC;
    m_axi_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_arvalid : out STD_LOGIC;
    m_axi_arready : in STD_LOGIC;
    m_axi_rid : in STD_LOGIC;
    m_axi_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_rlast : in STD_LOGIC;
    m_axi_rvalid : in STD_LOGIC;
    m_axi_rready : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of soc_axi_read_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of soc_axi_read_0_0 : entity is "soc_axi_read_0_0,axi_read,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of soc_axi_read_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of soc_axi_read_0_0 : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of soc_axi_read_0_0 : entity is "axi_read,Vivado 2019.2";
end soc_axi_read_0_0;

architecture STRUCTURE of soc_axi_read_0_0 is
  signal \<const0>\ : STD_LOGIC;
  signal \<const1>\ : STD_LOGIC;
  signal \^m_axi_arlen\ : STD_LOGIC_VECTOR ( 5 to 5 );
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of M_RD_aclk : signal is "xilinx.com:signal:clock:1.0 M_RD_aclk CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of M_RD_aclk : signal is "XIL_INTERFACENAME M_RD_aclk, ASSOCIATED_BUSIF M_RD, ASSOCIATED_RESET M_RD_aresetn, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN soc_clk_100M, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of M_RD_aresetn : signal is "xilinx.com:signal:reset:1.0 M_RD_aresetn RST";
  attribute X_INTERFACE_PARAMETER of M_RD_aresetn : signal is "XIL_INTERFACENAME M_RD_aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of M_RD_tlast : signal is "xilinx.com:interface:axis:1.0 M_RD TLAST";
  attribute X_INTERFACE_INFO of M_RD_tready : signal is "xilinx.com:interface:axis:1.0 M_RD TREADY";
  attribute X_INTERFACE_PARAMETER of M_RD_tready : signal is "XIL_INTERFACENAME M_RD, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN soc_clk_100M, LAYERED_METADATA undef, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of M_RD_tvalid : signal is "xilinx.com:interface:axis:1.0 M_RD TVALID";
  attribute X_INTERFACE_INFO of m_axi_aclk : signal is "xilinx.com:signal:clock:1.0 m_axi_aclk CLK";
  attribute X_INTERFACE_PARAMETER of m_axi_aclk : signal is "XIL_INTERFACENAME m_axi_aclk, ASSOCIATED_BUSIF m_axi, ASSOCIATED_RESET m_axi_aresetn, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN soc_clk_100M, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of m_axi_aresetn : signal is "xilinx.com:signal:reset:1.0 m_axi_aresetn RST";
  attribute X_INTERFACE_PARAMETER of m_axi_aresetn : signal is "XIL_INTERFACENAME m_axi_aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of m_axi_arid : signal is "xilinx.com:interface:aximm:1.0 m_axi ARID";
  attribute X_INTERFACE_INFO of m_axi_arlock : signal is "xilinx.com:interface:aximm:1.0 m_axi ARLOCK";
  attribute X_INTERFACE_INFO of m_axi_arready : signal is "xilinx.com:interface:aximm:1.0 m_axi ARREADY";
  attribute X_INTERFACE_INFO of m_axi_arvalid : signal is "xilinx.com:interface:aximm:1.0 m_axi ARVALID";
  attribute X_INTERFACE_INFO of m_axi_rid : signal is "xilinx.com:interface:aximm:1.0 m_axi RID";
  attribute X_INTERFACE_INFO of m_axi_rlast : signal is "xilinx.com:interface:aximm:1.0 m_axi RLAST";
  attribute X_INTERFACE_INFO of m_axi_rready : signal is "xilinx.com:interface:aximm:1.0 m_axi RREADY";
  attribute X_INTERFACE_PARAMETER of m_axi_rready : signal is "XIL_INTERFACENAME m_axi, DATA_WIDTH 32, PROTOCOL AXI4, FREQ_HZ 100000000, ID_WIDTH 1, ADDR_WIDTH 32, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_ONLY, HAS_BURST 1, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 0, HAS_WSTRB 0, HAS_BRESP 0, HAS_RRESP 1, SUPPORTS_NARROW_BURST 1, NUM_READ_OUTSTANDING 2, NUM_WRITE_OUTSTANDING 2, MAX_BURST_LENGTH 256, PHASE 0.000, CLK_DOMAIN soc_clk_100M, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of m_axi_rvalid : signal is "xilinx.com:interface:aximm:1.0 m_axi RVALID";
  attribute X_INTERFACE_INFO of M_RD_tdata : signal is "xilinx.com:interface:axis:1.0 M_RD TDATA";
  attribute X_INTERFACE_INFO of m_axi_araddr : signal is "xilinx.com:interface:aximm:1.0 m_axi ARADDR";
  attribute X_INTERFACE_INFO of m_axi_arburst : signal is "xilinx.com:interface:aximm:1.0 m_axi ARBURST";
  attribute X_INTERFACE_INFO of m_axi_arcache : signal is "xilinx.com:interface:aximm:1.0 m_axi ARCACHE";
  attribute X_INTERFACE_INFO of m_axi_arlen : signal is "xilinx.com:interface:aximm:1.0 m_axi ARLEN";
  attribute X_INTERFACE_INFO of m_axi_arprot : signal is "xilinx.com:interface:aximm:1.0 m_axi ARPROT";
  attribute X_INTERFACE_INFO of m_axi_arqos : signal is "xilinx.com:interface:aximm:1.0 m_axi ARQOS";
  attribute X_INTERFACE_INFO of m_axi_arsize : signal is "xilinx.com:interface:aximm:1.0 m_axi ARSIZE";
  attribute X_INTERFACE_INFO of m_axi_rdata : signal is "xilinx.com:interface:aximm:1.0 m_axi RDATA";
  attribute X_INTERFACE_INFO of m_axi_rresp : signal is "xilinx.com:interface:aximm:1.0 m_axi RRESP";
begin
  m_axi_araddr(31) <= \<const0>\;
  m_axi_araddr(30) <= \<const0>\;
  m_axi_araddr(29) <= \<const0>\;
  m_axi_araddr(28) <= \<const0>\;
  m_axi_araddr(27) <= \<const0>\;
  m_axi_araddr(26) <= \<const0>\;
  m_axi_araddr(25) <= \<const0>\;
  m_axi_araddr(24) <= \<const0>\;
  m_axi_araddr(23) <= \<const0>\;
  m_axi_araddr(22) <= \<const0>\;
  m_axi_araddr(21) <= \<const0>\;
  m_axi_araddr(20) <= \<const0>\;
  m_axi_araddr(19) <= \<const0>\;
  m_axi_araddr(18) <= \<const0>\;
  m_axi_araddr(17) <= \<const0>\;
  m_axi_araddr(16) <= \<const0>\;
  m_axi_araddr(15) <= \<const0>\;
  m_axi_araddr(14) <= \<const0>\;
  m_axi_araddr(13) <= \<const0>\;
  m_axi_araddr(12) <= \<const0>\;
  m_axi_araddr(11) <= \<const0>\;
  m_axi_araddr(10) <= \<const0>\;
  m_axi_araddr(9) <= \<const0>\;
  m_axi_araddr(8) <= \<const0>\;
  m_axi_araddr(7) <= \<const0>\;
  m_axi_araddr(6) <= \<const0>\;
  m_axi_araddr(5) <= \<const0>\;
  m_axi_araddr(4) <= \<const0>\;
  m_axi_araddr(3) <= \<const0>\;
  m_axi_araddr(2) <= \<const0>\;
  m_axi_araddr(1) <= \<const0>\;
  m_axi_araddr(0) <= \<const0>\;
  m_axi_arburst(1) <= \<const0>\;
  m_axi_arburst(0) <= \^m_axi_arlen\(5);
  m_axi_arcache(3) <= \<const0>\;
  m_axi_arcache(2) <= \<const0>\;
  m_axi_arcache(1) <= \<const1>\;
  m_axi_arcache(0) <= \<const1>\;
  m_axi_arid <= \<const0>\;
  m_axi_arlen(7) <= \<const0>\;
  m_axi_arlen(6) <= \<const0>\;
  m_axi_arlen(5) <= \^m_axi_arlen\(5);
  m_axi_arlen(4) <= \^m_axi_arlen\(5);
  m_axi_arlen(3) <= \^m_axi_arlen\(5);
  m_axi_arlen(2) <= \^m_axi_arlen\(5);
  m_axi_arlen(1) <= \^m_axi_arlen\(5);
  m_axi_arlen(0) <= \^m_axi_arlen\(5);
  m_axi_arlock <= \<const0>\;
  m_axi_arprot(2) <= \<const0>\;
  m_axi_arprot(1) <= \<const0>\;
  m_axi_arprot(0) <= \<const0>\;
  m_axi_arqos(3) <= \<const0>\;
  m_axi_arqos(2) <= \<const0>\;
  m_axi_arqos(1) <= \<const0>\;
  m_axi_arqos(0) <= \<const0>\;
  m_axi_arsize(2) <= \<const0>\;
  m_axi_arsize(1) <= \^m_axi_arlen\(5);
  m_axi_arsize(0) <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
VCC: unisim.vcomponents.VCC
     port map (
      P => \<const1>\
    );
inst: entity work.soc_axi_read_0_0_axi_read
     port map (
      M_RD_aclk => M_RD_aclk,
      M_RD_aresetn => M_RD_aresetn,
      M_RD_tdata(31 downto 0) => M_RD_tdata(31 downto 0),
      M_RD_tready => M_RD_tready,
      \ar_len_reg[5]_0\ => \^m_axi_arlen\(5),
      i_wr_done => i_wr_done,
      m_axi_arready => m_axi_arready,
      m_axi_arvalid => m_axi_arvalid,
      m_axi_rdata(31 downto 0) => m_axi_rdata(31 downto 0),
      m_axi_rready => m_axi_rready,
      m_axi_rvalid => m_axi_rvalid,
      o_last_reg_0 => M_RD_tlast,
      o_valid_reg_0 => M_RD_tvalid
    );
end STRUCTURE;
