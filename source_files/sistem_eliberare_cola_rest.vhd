----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/16/2024 05:19:01 PM
-- Design Name: 
-- Module Name: sistem_eliberare_cola_rest - arh_sistem
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

entity sistem_eliberare_cola_rest is
    Port(final: in std_logic;
         CLK: in std_logic;
         este_cola: in std_logic;
         mai_mic, egal, mai_mare : in std_logic;
         buy: in std_logic;
         total: in std_logic_vector(4 downto 0);
         rest: out std_logic_vector(4 downto 0);
         eliberare_cola: out std_logic;
         returnare_monede: out std_logic;
         returnare_rest: out std_logic);
end sistem_eliberare_cola_rest;

architecture arh_sistem of sistem_eliberare_cola_rest is

constant pret_cola : std_logic_vector := "10100"; -- pretul unei doze

begin
    process(final, mai_mic, egal, mai_mare, buy, este_cola, total)
    begin
        if final = '1' then
            rest <= "00000";
            eliberare_cola <= '0';
            returnare_monede <= '0';
            returnare_rest <= '0';
        elsif buy = '1' and rising_edge(CLK) then
            if este_cola = '1' then
                if mai_mare = '1' then
                    rest <= total - pret_cola;
                    eliberare_cola <= '1';
                    returnare_monede <= '0';
                    returnare_rest <= '1';
                elsif mai_mic = '1' then
                    rest <= "00000";
                    eliberare_cola <= '0';
                    returnare_monede <= '1';
                    returnare_rest <= '0';
                elsif egal = '1' then
                    rest <= "00000";
                    eliberare_cola <= '1';
                    returnare_monede <= '0';
                    returnare_rest <= '0';
                end if;  
          end if;
    end if;
   end process; 

end arh_sistem;
