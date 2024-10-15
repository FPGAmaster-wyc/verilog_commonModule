-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
-- Date        : Tue Oct 15 15:45:07 2024
-- Host        : DESKTOP-I9U844P running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               E:/Desktop/axi_dma/AXI_DMA_sim_base/AXI_DMA_sim_base.srcs/sources_1/bd/soc/ip/soc_gen_data_0_0/soc_gen_data_0_0_sim_netlist.vhdl
-- Design      : soc_gen_data_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity soc_gen_data_0_0_gen_data is
  port (
    tdata : out STD_LOGIC_VECTOR ( 11 downto 0 );
    tlast : out STD_LOGIC;
    tvalid : out STD_LOGIC;
    clk : in STD_LOGIC;
    rst_n : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of soc_gen_data_0_0_gen_data : entity is "gen_data";
end soc_gen_data_0_0_gen_data;

architecture STRUCTURE of soc_gen_data_0_0_gen_data is
  signal data_cnt : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal \data_cnt0_carry__0_n_0\ : STD_LOGIC;
  signal \data_cnt0_carry__0_n_1\ : STD_LOGIC;
  signal \data_cnt0_carry__0_n_2\ : STD_LOGIC;
  signal \data_cnt0_carry__0_n_3\ : STD_LOGIC;
  signal \data_cnt0_carry__0_n_4\ : STD_LOGIC;
  signal \data_cnt0_carry__0_n_5\ : STD_LOGIC;
  signal \data_cnt0_carry__0_n_6\ : STD_LOGIC;
  signal \data_cnt0_carry__0_n_7\ : STD_LOGIC;
  signal \data_cnt0_carry__1_n_2\ : STD_LOGIC;
  signal \data_cnt0_carry__1_n_3\ : STD_LOGIC;
  signal \data_cnt0_carry__1_n_5\ : STD_LOGIC;
  signal \data_cnt0_carry__1_n_6\ : STD_LOGIC;
  signal \data_cnt0_carry__1_n_7\ : STD_LOGIC;
  signal data_cnt0_carry_n_0 : STD_LOGIC;
  signal data_cnt0_carry_n_1 : STD_LOGIC;
  signal data_cnt0_carry_n_2 : STD_LOGIC;
  signal data_cnt0_carry_n_3 : STD_LOGIC;
  signal data_cnt0_carry_n_4 : STD_LOGIC;
  signal data_cnt0_carry_n_5 : STD_LOGIC;
  signal data_cnt0_carry_n_6 : STD_LOGIC;
  signal data_cnt0_carry_n_7 : STD_LOGIC;
  signal \data_cnt[0]_i_1_n_0\ : STD_LOGIC;
  signal \data_cnt[11]_i_2_n_0\ : STD_LOGIC;
  signal \data_cnt[11]_i_3_n_0\ : STD_LOGIC;
  signal \data_cnt[11]_i_4_n_0\ : STD_LOGIC;
  signal data_cnt_1 : STD_LOGIC_VECTOR ( 11 downto 1 );
  signal delay_cnt : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \delay_cnt[0]_i_1_n_0\ : STD_LOGIC;
  signal \delay_cnt[1]_i_1_n_0\ : STD_LOGIC;
  signal \delay_cnt[2]_i_1_n_0\ : STD_LOGIC;
  signal \delay_cnt[3]_i_1_n_0\ : STD_LOGIC;
  signal \delay_cnt[4]_i_1_n_0\ : STD_LOGIC;
  signal last_cnt : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal \last_cnt[0]_i_1_n_0\ : STD_LOGIC;
  signal last_cnt_0 : STD_LOGIC_VECTOR ( 5 downto 1 );
  signal sending : STD_LOGIC;
  signal sending_i_1_n_0 : STD_LOGIC;
  signal \tdata[11]_i_1_n_0\ : STD_LOGIC;
  signal \tdata[11]_i_2_n_0\ : STD_LOGIC;
  signal \^tvalid\ : STD_LOGIC;
  signal tvalid_i_1_n_0 : STD_LOGIC;
  signal waiting : STD_LOGIC;
  signal waiting_i_1_n_0 : STD_LOGIC;
  signal waiting_i_2_n_0 : STD_LOGIC;
  signal waiting_reg_n_0 : STD_LOGIC;
  signal \NLW_data_cnt0_carry__1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_data_cnt0_carry__1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \data_cnt[0]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \data_cnt[10]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \data_cnt[11]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \data_cnt[1]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \data_cnt[2]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \data_cnt[3]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \data_cnt[4]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \data_cnt[5]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \data_cnt[6]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \data_cnt[7]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \data_cnt[8]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \data_cnt[9]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \delay_cnt[0]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \delay_cnt[1]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \delay_cnt[2]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \delay_cnt[3]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \delay_cnt[4]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \last_cnt[1]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \last_cnt[2]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \last_cnt[3]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \last_cnt[4]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of sending_i_1 : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of tvalid_i_1 : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of waiting_i_2 : label is "soft_lutpair1";
begin
  tvalid <= \^tvalid\;
data_cnt0_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => data_cnt0_carry_n_0,
      CO(2) => data_cnt0_carry_n_1,
      CO(1) => data_cnt0_carry_n_2,
      CO(0) => data_cnt0_carry_n_3,
      CYINIT => data_cnt(0),
      DI(3 downto 0) => B"0000",
      O(3) => data_cnt0_carry_n_4,
      O(2) => data_cnt0_carry_n_5,
      O(1) => data_cnt0_carry_n_6,
      O(0) => data_cnt0_carry_n_7,
      S(3 downto 0) => data_cnt(4 downto 1)
    );
\data_cnt0_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => data_cnt0_carry_n_0,
      CO(3) => \data_cnt0_carry__0_n_0\,
      CO(2) => \data_cnt0_carry__0_n_1\,
      CO(1) => \data_cnt0_carry__0_n_2\,
      CO(0) => \data_cnt0_carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \data_cnt0_carry__0_n_4\,
      O(2) => \data_cnt0_carry__0_n_5\,
      O(1) => \data_cnt0_carry__0_n_6\,
      O(0) => \data_cnt0_carry__0_n_7\,
      S(3 downto 0) => data_cnt(8 downto 5)
    );
\data_cnt0_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \data_cnt0_carry__0_n_0\,
      CO(3 downto 2) => \NLW_data_cnt0_carry__1_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \data_cnt0_carry__1_n_2\,
      CO(0) => \data_cnt0_carry__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \NLW_data_cnt0_carry__1_O_UNCONNECTED\(3),
      O(2) => \data_cnt0_carry__1_n_5\,
      O(1) => \data_cnt0_carry__1_n_6\,
      O(0) => \data_cnt0_carry__1_n_7\,
      S(3) => '0',
      S(2 downto 0) => data_cnt(11 downto 9)
    );
\data_cnt[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \data_cnt[11]_i_2_n_0\,
      I1 => data_cnt(0),
      O => \data_cnt[0]_i_1_n_0\
    );
\data_cnt[10]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \data_cnt0_carry__1_n_6\,
      I1 => \data_cnt[11]_i_2_n_0\,
      O => data_cnt_1(10)
    );
\data_cnt[11]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \data_cnt0_carry__1_n_5\,
      I1 => \data_cnt[11]_i_2_n_0\,
      O => data_cnt_1(11)
    );
\data_cnt[11]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFF7FFF"
    )
        port map (
      I0 => data_cnt(9),
      I1 => data_cnt(8),
      I2 => data_cnt(10),
      I3 => data_cnt(0),
      I4 => \data_cnt[11]_i_3_n_0\,
      I5 => \data_cnt[11]_i_4_n_0\,
      O => \data_cnt[11]_i_2_n_0\
    );
\data_cnt[11]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF7F"
    )
        port map (
      I0 => data_cnt(2),
      I1 => data_cnt(3),
      I2 => data_cnt(1),
      I3 => data_cnt(11),
      O => \data_cnt[11]_i_3_n_0\
    );
\data_cnt[11]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => data_cnt(6),
      I1 => data_cnt(7),
      I2 => data_cnt(4),
      I3 => data_cnt(5),
      O => \data_cnt[11]_i_4_n_0\
    );
\data_cnt[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => data_cnt0_carry_n_7,
      I1 => \data_cnt[11]_i_2_n_0\,
      O => data_cnt_1(1)
    );
\data_cnt[2]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => data_cnt0_carry_n_6,
      I1 => \data_cnt[11]_i_2_n_0\,
      O => data_cnt_1(2)
    );
\data_cnt[3]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => data_cnt0_carry_n_5,
      I1 => \data_cnt[11]_i_2_n_0\,
      O => data_cnt_1(3)
    );
\data_cnt[4]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => data_cnt0_carry_n_4,
      I1 => \data_cnt[11]_i_2_n_0\,
      O => data_cnt_1(4)
    );
\data_cnt[5]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \data_cnt0_carry__0_n_7\,
      I1 => \data_cnt[11]_i_2_n_0\,
      O => data_cnt_1(5)
    );
\data_cnt[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \data_cnt0_carry__0_n_6\,
      I1 => \data_cnt[11]_i_2_n_0\,
      O => data_cnt_1(6)
    );
\data_cnt[7]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \data_cnt0_carry__0_n_5\,
      I1 => \data_cnt[11]_i_2_n_0\,
      O => data_cnt_1(7)
    );
\data_cnt[8]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \data_cnt0_carry__0_n_4\,
      I1 => \data_cnt[11]_i_2_n_0\,
      O => data_cnt_1(8)
    );
\data_cnt[9]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \data_cnt0_carry__1_n_7\,
      I1 => \data_cnt[11]_i_2_n_0\,
      O => data_cnt_1(9)
    );
\data_cnt_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \tdata[11]_i_1_n_0\,
      CLR => \tdata[11]_i_2_n_0\,
      D => \data_cnt[0]_i_1_n_0\,
      Q => data_cnt(0)
    );
\data_cnt_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \tdata[11]_i_1_n_0\,
      CLR => \tdata[11]_i_2_n_0\,
      D => data_cnt_1(10),
      Q => data_cnt(10)
    );
\data_cnt_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \tdata[11]_i_1_n_0\,
      CLR => \tdata[11]_i_2_n_0\,
      D => data_cnt_1(11),
      Q => data_cnt(11)
    );
\data_cnt_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \tdata[11]_i_1_n_0\,
      CLR => \tdata[11]_i_2_n_0\,
      D => data_cnt_1(1),
      Q => data_cnt(1)
    );
\data_cnt_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \tdata[11]_i_1_n_0\,
      CLR => \tdata[11]_i_2_n_0\,
      D => data_cnt_1(2),
      Q => data_cnt(2)
    );
\data_cnt_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \tdata[11]_i_1_n_0\,
      CLR => \tdata[11]_i_2_n_0\,
      D => data_cnt_1(3),
      Q => data_cnt(3)
    );
\data_cnt_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \tdata[11]_i_1_n_0\,
      CLR => \tdata[11]_i_2_n_0\,
      D => data_cnt_1(4),
      Q => data_cnt(4)
    );
\data_cnt_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \tdata[11]_i_1_n_0\,
      CLR => \tdata[11]_i_2_n_0\,
      D => data_cnt_1(5),
      Q => data_cnt(5)
    );
\data_cnt_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \tdata[11]_i_1_n_0\,
      CLR => \tdata[11]_i_2_n_0\,
      D => data_cnt_1(6),
      Q => data_cnt(6)
    );
\data_cnt_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \tdata[11]_i_1_n_0\,
      CLR => \tdata[11]_i_2_n_0\,
      D => data_cnt_1(7),
      Q => data_cnt(7)
    );
\data_cnt_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \tdata[11]_i_1_n_0\,
      CLR => \tdata[11]_i_2_n_0\,
      D => data_cnt_1(8),
      Q => data_cnt(8)
    );
\data_cnt_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \tdata[11]_i_1_n_0\,
      CLR => \tdata[11]_i_2_n_0\,
      D => data_cnt_1(9),
      Q => data_cnt(9)
    );
\delay_cnt[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000FDFF"
    )
        port map (
      I0 => delay_cnt(4),
      I1 => delay_cnt(3),
      I2 => delay_cnt(1),
      I3 => delay_cnt(2),
      I4 => delay_cnt(0),
      O => \delay_cnt[0]_i_1_n_0\
    );
\delay_cnt[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => delay_cnt(0),
      I1 => delay_cnt(1),
      O => \delay_cnt[1]_i_1_n_0\
    );
\delay_cnt[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0FFDF000"
    )
        port map (
      I0 => delay_cnt(4),
      I1 => delay_cnt(3),
      I2 => delay_cnt(0),
      I3 => delay_cnt(1),
      I4 => delay_cnt(2),
      O => \delay_cnt[2]_i_1_n_0\
    );
\delay_cnt[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
        port map (
      I0 => delay_cnt(3),
      I1 => delay_cnt(0),
      I2 => delay_cnt(1),
      I3 => delay_cnt(2),
      O => \delay_cnt[3]_i_1_n_0\
    );
\delay_cnt[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AA8AAAA"
    )
        port map (
      I0 => delay_cnt(4),
      I1 => delay_cnt(3),
      I2 => delay_cnt(0),
      I3 => delay_cnt(1),
      I4 => delay_cnt(2),
      O => \delay_cnt[4]_i_1_n_0\
    );
\delay_cnt_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => waiting_reg_n_0,
      CLR => \tdata[11]_i_2_n_0\,
      D => \delay_cnt[0]_i_1_n_0\,
      Q => delay_cnt(0)
    );
\delay_cnt_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => waiting_reg_n_0,
      CLR => \tdata[11]_i_2_n_0\,
      D => \delay_cnt[1]_i_1_n_0\,
      Q => delay_cnt(1)
    );
\delay_cnt_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => waiting_reg_n_0,
      CLR => \tdata[11]_i_2_n_0\,
      D => \delay_cnt[2]_i_1_n_0\,
      Q => delay_cnt(2)
    );
\delay_cnt_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => waiting_reg_n_0,
      CLR => \tdata[11]_i_2_n_0\,
      D => \delay_cnt[3]_i_1_n_0\,
      Q => delay_cnt(3)
    );
\delay_cnt_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => waiting_reg_n_0,
      CLR => \tdata[11]_i_2_n_0\,
      D => \delay_cnt[4]_i_1_n_0\,
      Q => delay_cnt(4)
    );
\last_cnt[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => last_cnt(0),
      O => \last_cnt[0]_i_1_n_0\
    );
\last_cnt[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => last_cnt(0),
      I1 => last_cnt(1),
      O => last_cnt_0(1)
    );
\last_cnt[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => last_cnt(2),
      I1 => last_cnt(0),
      I2 => last_cnt(1),
      O => last_cnt_0(2)
    );
\last_cnt[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6CCC"
    )
        port map (
      I0 => last_cnt(2),
      I1 => last_cnt(3),
      I2 => last_cnt(0),
      I3 => last_cnt(1),
      O => last_cnt_0(3)
    );
\last_cnt[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => last_cnt(2),
      I1 => last_cnt(3),
      I2 => last_cnt(0),
      I3 => last_cnt(1),
      I4 => last_cnt(4),
      O => last_cnt_0(4)
    );
\last_cnt[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => last_cnt(2),
      I1 => last_cnt(3),
      I2 => last_cnt(0),
      I3 => last_cnt(1),
      I4 => last_cnt(4),
      I5 => last_cnt(5),
      O => last_cnt_0(5)
    );
\last_cnt_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \tdata[11]_i_1_n_0\,
      CLR => \tdata[11]_i_2_n_0\,
      D => \last_cnt[0]_i_1_n_0\,
      Q => last_cnt(0)
    );
\last_cnt_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \tdata[11]_i_1_n_0\,
      CLR => \tdata[11]_i_2_n_0\,
      D => last_cnt_0(1),
      Q => last_cnt(1)
    );
\last_cnt_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \tdata[11]_i_1_n_0\,
      CLR => \tdata[11]_i_2_n_0\,
      D => last_cnt_0(2),
      Q => last_cnt(2)
    );
\last_cnt_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \tdata[11]_i_1_n_0\,
      CLR => \tdata[11]_i_2_n_0\,
      D => last_cnt_0(3),
      Q => last_cnt(3)
    );
\last_cnt_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \tdata[11]_i_1_n_0\,
      CLR => \tdata[11]_i_2_n_0\,
      D => last_cnt_0(4),
      Q => last_cnt(4)
    );
\last_cnt_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \tdata[11]_i_1_n_0\,
      CLR => \tdata[11]_i_2_n_0\,
      D => last_cnt_0(5),
      Q => last_cnt(5)
    );
sending_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"C8F8"
    )
        port map (
      I0 => waiting_i_2_n_0,
      I1 => waiting_reg_n_0,
      I2 => sending,
      I3 => waiting,
      O => sending_i_1_n_0
    );
sending_reg: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \tdata[11]_i_2_n_0\,
      D => sending_i_1_n_0,
      Q => sending
    );
\tdata[11]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => sending,
      I1 => waiting_reg_n_0,
      O => \tdata[11]_i_1_n_0\
    );
\tdata[11]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => rst_n,
      O => \tdata[11]_i_2_n_0\
    );
\tdata_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \tdata[11]_i_1_n_0\,
      CLR => \tdata[11]_i_2_n_0\,
      D => data_cnt(0),
      Q => tdata(0)
    );
\tdata_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \tdata[11]_i_1_n_0\,
      CLR => \tdata[11]_i_2_n_0\,
      D => data_cnt(10),
      Q => tdata(10)
    );
\tdata_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \tdata[11]_i_1_n_0\,
      CLR => \tdata[11]_i_2_n_0\,
      D => data_cnt(11),
      Q => tdata(11)
    );
\tdata_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \tdata[11]_i_1_n_0\,
      CLR => \tdata[11]_i_2_n_0\,
      D => data_cnt(1),
      Q => tdata(1)
    );
\tdata_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \tdata[11]_i_1_n_0\,
      CLR => \tdata[11]_i_2_n_0\,
      D => data_cnt(2),
      Q => tdata(2)
    );
\tdata_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \tdata[11]_i_1_n_0\,
      CLR => \tdata[11]_i_2_n_0\,
      D => data_cnt(3),
      Q => tdata(3)
    );
\tdata_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \tdata[11]_i_1_n_0\,
      CLR => \tdata[11]_i_2_n_0\,
      D => data_cnt(4),
      Q => tdata(4)
    );
\tdata_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \tdata[11]_i_1_n_0\,
      CLR => \tdata[11]_i_2_n_0\,
      D => data_cnt(5),
      Q => tdata(5)
    );
\tdata_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \tdata[11]_i_1_n_0\,
      CLR => \tdata[11]_i_2_n_0\,
      D => data_cnt(6),
      Q => tdata(6)
    );
\tdata_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \tdata[11]_i_1_n_0\,
      CLR => \tdata[11]_i_2_n_0\,
      D => data_cnt(7),
      Q => tdata(7)
    );
\tdata_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \tdata[11]_i_1_n_0\,
      CLR => \tdata[11]_i_2_n_0\,
      D => data_cnt(8),
      Q => tdata(8)
    );
\tdata_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \tdata[11]_i_1_n_0\,
      CLR => \tdata[11]_i_2_n_0\,
      D => data_cnt(9),
      Q => tdata(9)
    );
tlast_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => last_cnt(3),
      I1 => last_cnt(5),
      I2 => last_cnt(4),
      I3 => last_cnt(2),
      I4 => last_cnt(0),
      I5 => last_cnt(1),
      O => waiting
    );
tlast_reg: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \tdata[11]_i_1_n_0\,
      CLR => \tdata[11]_i_2_n_0\,
      D => waiting,
      Q => tlast
    );
tvalid_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"54"
    )
        port map (
      I0 => waiting_reg_n_0,
      I1 => sending,
      I2 => \^tvalid\,
      O => tvalid_i_1_n_0
    );
tvalid_reg: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \tdata[11]_i_2_n_0\,
      D => tvalid_i_1_n_0,
      Q => \^tvalid\
    );
waiting_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7444"
    )
        port map (
      I0 => waiting_i_2_n_0,
      I1 => waiting_reg_n_0,
      I2 => sending,
      I3 => waiting,
      O => waiting_i_1_n_0
    );
waiting_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000020"
    )
        port map (
      I0 => delay_cnt(2),
      I1 => delay_cnt(0),
      I2 => delay_cnt(4),
      I3 => delay_cnt(3),
      I4 => delay_cnt(1),
      O => waiting_i_2_n_0
    );
waiting_reg: unisim.vcomponents.FDPE
     port map (
      C => clk,
      CE => '1',
      D => waiting_i_1_n_0,
      PRE => \tdata[11]_i_2_n_0\,
      Q => waiting_reg_n_0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity soc_gen_data_0_0 is
  port (
    clk : in STD_LOGIC;
    rst_n : in STD_LOGIC;
    tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    tvalid : out STD_LOGIC;
    tlast : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of soc_gen_data_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of soc_gen_data_0_0 : entity is "soc_gen_data_0_0,gen_data,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of soc_gen_data_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of soc_gen_data_0_0 : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of soc_gen_data_0_0 : entity is "gen_data,Vivado 2019.2";
end soc_gen_data_0_0;

architecture STRUCTURE of soc_gen_data_0_0 is
  signal \<const0>\ : STD_LOGIC;
  signal \^tdata\ : STD_LOGIC_VECTOR ( 11 downto 0 );
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clk : signal is "XIL_INTERFACENAME clk, ASSOCIATED_BUSIF interface_axis, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN soc_clk_100M, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of rst_n : signal is "xilinx.com:signal:reset:1.0 rst_n RST";
  attribute X_INTERFACE_PARAMETER of rst_n : signal is "XIL_INTERFACENAME rst_n, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of tlast : signal is "xilinx.com:interface:axis:1.0 interface_axis TLAST";
  attribute X_INTERFACE_PARAMETER of tlast : signal is "XIL_INTERFACENAME interface_axis, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 0, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN soc_clk_100M, LAYERED_METADATA undef, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of tvalid : signal is "xilinx.com:interface:axis:1.0 interface_axis TVALID";
  attribute X_INTERFACE_INFO of tdata : signal is "xilinx.com:interface:axis:1.0 interface_axis TDATA";
begin
  tdata(31) <= \<const0>\;
  tdata(30) <= \<const0>\;
  tdata(29) <= \<const0>\;
  tdata(28) <= \<const0>\;
  tdata(27) <= \<const0>\;
  tdata(26) <= \<const0>\;
  tdata(25) <= \<const0>\;
  tdata(24) <= \<const0>\;
  tdata(23) <= \<const0>\;
  tdata(22) <= \<const0>\;
  tdata(21) <= \<const0>\;
  tdata(20) <= \<const0>\;
  tdata(19) <= \<const0>\;
  tdata(18) <= \<const0>\;
  tdata(17) <= \<const0>\;
  tdata(16) <= \<const0>\;
  tdata(15) <= \<const0>\;
  tdata(14) <= \<const0>\;
  tdata(13) <= \<const0>\;
  tdata(12) <= \<const0>\;
  tdata(11 downto 0) <= \^tdata\(11 downto 0);
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
inst: entity work.soc_gen_data_0_0_gen_data
     port map (
      clk => clk,
      rst_n => rst_n,
      tdata(11 downto 0) => \^tdata\(11 downto 0),
      tlast => tlast,
      tvalid => tvalid
    );
end STRUCTURE;
