----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/16/2024 06:43:21 PM
-- Design Name: 
-- Module Name: mux_8_la_1 - arh_mux
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

entity mux_8_la_1 is
    Port(mux0: in std_logic_vector(3 downto 0);
         mux1: in std_logic_vector(3 downto 0);
         mux2: in std_logic_vector(3 downto 0);
         mux3: in std_logic_vector(3 downto 0);
         mux4: in std_logic_vector(3 downto 0);
         mux5: in std_logic_vector(3 downto 0);
         mux6: in std_logic_vector(3 downto 0);
         mux7: in std_logic_vector(3 downto 0);
         sel: in std_logic_vector(2 downto 0);
         cifra: out std_logic_vector(3 downto 0));
    
end mux_8_la_1;

architecture arh_mux of mux_8_la_1 is

begin
    process(mux0, mux1, mux2, mux3, mux4, mux5, mux6, mux7, sel)
    begin
        case sel is
            when "000" => cifra <= mux0;
            when "001" => cifra <= mux1;
            when "010" => cifra <= mux2;
            when "011" => cifra <= mux3;
            when "100" => cifra <= mux4;
            when "101" => cifra <= mux5;
            when "110" => cifra <= mux6;
            when "111" => cifra <= mux7;
        end case;
     end process;

end arh_mux;
