----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/16/2024 06:19:43 PM
-- Design Name: 
-- Module Name: numarator_17_biti - arh_num
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity numarator_17_biti is
    Port(CLK: in std_logic;
         num: out std_logic_vector(16 downto 0));
end numarator_17_biti;

architecture arh_num of numarator_17_biti is

signal count: std_logic_vector(16 downto 0) := (others => '0');

begin
    process(CLK)
    begin
        if CLK = '1' and CLK'event then
            count <= count + 1;
        end if;
        
        num <= count;
    end process;

end arh_num;
