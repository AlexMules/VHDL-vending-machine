----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/02/2024 06:27:55 PM
-- Design Name: 
-- Module Name: numarator_monede - arh_numarator
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity numarator_monede is
    Port(F0: in std_logic;
         F1: in std_logic;
         F2: in std_logic;
         corp_strain: in std_logic;
         CLK: in std_logic;
         final: in std_logic;
         este_cola: in std_logic;
         total: out std_logic_vector(4 downto 0);
         F3: out std_logic; -- respingere moneda sau corp strain
         F4: out std_logic); -- acceptare moneda
         
-- 5 bani -> unitatea de masura
    -- 5 bani -> 1 unitate
    -- 10 bani -> 2 unitati
    -- 50 bani -> 10 unitati
    -- 20 unitati -> 1 cola         
end numarator_monede;

architecture arh_numarator of numarator_monede is

signal count: std_logic_vector(4 downto 0) := "00000";

begin
    process(final, CLK, F0, F1, F2, corp_strain, este_cola)
    begin
        if final = '1' then
            count <= "00000";
            F3 <= '0';
            F4 <= '0';
        elsif este_cola = '1' then
            if CLK = '1' and CLK'event then
                if F0 = '1' then
                    count <= count + "1"; -- moneda de 5 bani introdusa
                    F4 <= '1';
                    F3 <= '0';
                elsif F1 = '1' then
                    count <= count + "10"; -- moneda de 10 bani introdusa
                    F4 <= '1';
                    F3 <= '0';
                elsif F2 = '1' then
                    count <= count + "1010"; -- moneda de 50 bani introdusa
                    F4 <= '1';
                    F3 <= '0';
                elsif corp_strain = '1' then -- corp strain introdus
                    F4 <= '0';
                    F3 <= '1';
                end if;
            end if;
        end if;
        total <= count;
   end process;  

end arh_numarator;
