----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/17/2024 02:20:31 PM
-- Design Name: 
-- Module Name: convertor_cifra_7segm - arh_conv_7segm
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity convertor_cifra_7segm is
    Port(cifra: in std_logic_vector(3 downto 0);
         cat: out std_logic_vector(6 downto 0));
         
end convertor_cifra_7segm;

architecture arh_conv_7segm of convertor_cifra_7segm is

begin
    cat <=  "1000000" when cifra="0000" else
            "1111001" when cifra="0001" else
            "0100100" when cifra="0010" else
            "0110000" when cifra="0011" else
            "0011001" when cifra="0100" else
            "0010010" when cifra="0101" else
            "0000010" when cifra="0110" else
            "1111000" when cifra="0111" else
            "0000000" when cifra="1000" else
            "0010000" when cifra="1001" else
            "1111111";
    
end arh_conv_7segm;
