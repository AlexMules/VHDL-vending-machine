----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/02/2024 06:59:14 PM
-- Design Name: 
-- Module Name: Comparator - arh_comp
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

entity Comparator is
    Port(X: in std_logic_vector(4 downto 0);
         mai_mic: out std_logic;
         egal: out std_logic;
         mai_mare: out std_logic);
end Comparator;

architecture arh_comp of Comparator is

constant pret_cola : std_logic_vector := "10100"; -- pretul unei doze (1 leu)

begin
    mai_mic <= '1' when (X < pret_cola) else '0';
    egal <= '1' when (X = pret_cola) else '0';
    mai_mare <= '1' when (X > pret_cola) else '0';

end arh_comp;
