----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/16/2024 07:05:49 PM
-- Design Name: 
-- Module Name: convertor_cifra - arh_convertor
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

entity convertor_cifra is
    Port(numar: in std_logic_vector(4 downto 0);
         digit0: out std_logic_vector(3 downto 0);
         digit1: out std_logic_vector(3 downto 0));
end convertor_cifra;

architecture arh_convertor of convertor_cifra is

begin
    process(numar)
    begin
        case numar is
           when "00000" =>
                digit0 <= "0000";
                digit1 <= "0000";
           when "00001" =>
                digit0 <= "0001";
                digit1 <= "0000";
           when "00010" =>
                digit0 <= "0010";
                digit1 <= "0000";
           when "00011" =>
                digit0 <= "0011";
                digit1 <= "0000";
           when "00100" =>
                digit0 <= "0100";
                digit1 <= "0000";
           when "00101" =>
                digit0 <= "0101";
                digit1 <= "0000";
           when "00110" =>
                digit0 <= "0110";
                digit1 <= "0000";
           when "00111" =>
                digit0 <= "0111";
                digit1 <= "0000";
           when "01000" =>
                digit0 <= "1000";
                digit1 <= "0000";
           when "01001" =>
                digit0 <= "1001";
                digit1 <= "0000";
           when "01010" =>
                digit0 <= "0000";
                digit1 <= "0001";
           when "01011" =>
                digit0 <= "0001";
                digit1 <= "0001";
           when "01100" =>
                digit0 <= "0010";
                digit1 <= "0001";
           when "01101" =>
                digit0 <= "0011";
                digit1 <= "0001";
           when "01110" =>
                digit0 <= "0100";
                digit1 <= "0001";
           when "01111" =>
                digit0 <= "0101";
                digit1 <= "0001";
           when "10000" => 
                digit0 <= "0110";
                digit1 <= "0001";
           when "10001" =>
                digit0 <= "0111";
                digit1 <= "0001";
           when "10010" =>
                digit0 <= "1000";
                digit1 <= "0001";
           when "10011" =>
                digit0 <= "1001";
                digit1 <= "0001";
           when "10100" =>
                digit0 <= "0000";
                digit1 <= "0010";
           when "10101" =>
                digit0 <= "0001";
                digit1 <= "0010";
           when "10110" =>
                digit0 <= "0010";
                digit1 <= "0010";
           when "10111" =>
                digit0 <= "0011";
                digit1 <= "0010";
           when "11000" =>
                digit0 <= "0100";
                digit1 <= "0010";
           when "11001" =>
                digit0 <= "0101";
                digit1 <= "0010";
          when "11010" =>
                digit0 <= "0110";
                digit1 <= "0010";
          when "11011" =>
                digit0 <= "0111";
                digit1 <= "0010";
          when "11100" =>
                digit0 <= "1000";
                digit1 <= "0010";
          when "11101" =>
                digit0 <= "1001";
                digit1 <= "0010";
          when "11110" =>
                digit0 <= "0000";
                digit1 <= "0011";
          when "11111" =>
                digit0 <= "0001";
                digit1 <= "0011";
        end case;
    end process;

end arh_convertor;
