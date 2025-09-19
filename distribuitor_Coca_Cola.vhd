----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/02/2024 06:26:19 PM
-- Design Name: 
-- Module Name: distribuitor_Coca_Cola - arh_distribuitor
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

entity distribuitor_Coca_Cola is
    Port(este_cola: in std_logic; -- daca este Coca-Cola in distribuitor
         buy_button : in std_logic; -- utilizatorul vrea sa cumpere Cola (buton)
         F0: in std_logic; -- 5 bani (buton)
         F1: in std_logic; -- 10 bani (buton)
         F2: in std_logic; -- 50 bani (buton)
         corp_strain: in std_logic; -- alta moneda sau corp strain (buton)
         CLK : in std_logic; -- clock
         final: in std_logic; -- utilizatorul a primit rest si Coca-Cola
         returnare_monede: out std_logic;
         returnare_rest: out std_logic;
         eliberare_cola: out std_logic;
         F3: out std_logic; -- respingere moneda sau corp strain
         F4: out std_logic; -- acceptare moneda
         cat: out std_logic_vector(6 downto 0); -- catozi 7 segment display
         an: out std_logic_vector(7 downto 0)); -- anozi 7 segment display
         
end distribuitor_Coca_Cola;

architecture arh_distribuitor of distribuitor_Coca_Cola is

component numarator_monede is
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
end component numarator_monede;

component Comparator is -- comparator pentru suma introdusa
    Port(X: in std_logic_vector(4 downto 0);
         mai_mic: out std_logic;
         egal: out std_logic;
         mai_mare: out std_logic);
end component;

component sistem_eliberare_cola_rest is
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
end component sistem_eliberare_cola_rest;

component numarator_17_biti is -- numarator pe 17 biti (bucla 000...0 -> 111...1) pentru
    Port(CLK: in std_logic;    -- afisarea pe 7 segment display
         num: out std_logic_vector(16 downto 0));
end component;

component convertor_cifra is -- convertor de la total si rest la cifrele corespunzatoare
    Port(numar: in std_logic_vector(4 downto 0); -- pentru afisare 7 segment display
         digit0: out std_logic_vector(3 downto 0);
         digit1: out std_logic_vector(3 downto 0));
end component;

component mux_8_la_1 is -- multiplexor pentru afisare cifre pe 7 segment display
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
end component;

component convertor_cifra_7segm is -- convertor cifra pe 7 segment display
    Port(cifra: in std_logic_vector(3 downto 0);
         cat: out std_logic_vector(6 downto 0));        
end component;

component mux_8_la_1_pe_8_biti is -- multiplexor pentru anozii 7 segment display
    Port(mux0: in std_logic_vector(7 downto 0);
         mux1: in std_logic_vector(7 downto 0);
         mux2: in std_logic_vector(7 downto 0);
         mux3: in std_logic_vector(7 downto 0);
         mux4: in std_logic_vector(7 downto 0);
         mux5: in std_logic_vector(7 downto 0);
         mux6: in std_logic_vector(7 downto 0);
         mux7: in std_logic_vector(7 downto 0);
         sel: in std_logic_vector(2 downto 0);
         an: out std_logic_vector(7 downto 0));
end component;

component MPG is -- MPG pentru butoane
    Port ( btn : in STD_LOGIC;
           clk : in STD_LOGIC;
           en : out STD_LOGIC);
end component;

-- semnale
signal total: std_logic_vector(4 downto 0) := "00000";
signal rest: std_logic_vector (4 downto 0) := "00000";
signal mai_mare, mai_mic, egal : std_logic;

signal sF0, sF1, sF2, sCorp_strain, sBuy : std_logic; -- semnale pentru MPG

signal count: std_logic_vector(16 downto 0) := (others => '0'); -- semnal pentru numarator

signal digit0, digit1, digit2, digit3 : std_logic_vector(3 downto 0); -- cifrele de afisat 
                                                                      -- pe 7 segment display
signal cifra: std_logic_vector(3 downto 0);

-- constante 
constant zero: std_logic_vector(3 downto 0) := "0000";

constant constant0: std_logic_vector(7 downto 0) := "11111110";
constant constant1: std_logic_vector(7 downto 0) := "11111101";
constant constant2: std_logic_vector(7 downto 0) := "11111011";
constant constant3: std_logic_vector(7 downto 0) := "11110111";
constant constant4: std_logic_vector(7 downto 0) := "11111111";
constant constant5: std_logic_vector(7 downto 0) := "11111111";
constant constant6: std_logic_vector(7 downto 0) := "11111111";
constant constant7: std_logic_vector(7 downto 0) := "11111111";

begin
    C1: MPG port map (F0, CLK, sF0);
    C2: MPG port map (F1, CLK, sF1);
    C3: MPG port map (F2, CLK, sF2);
    C4: MPG port map (corp_strain, CLK, sCorp_strain);
    C5: MPG port map(buy_button, CLK, sBuy);
    
    C6: numarator_monede port map (F0 => sF0,                     
                                   F1 => sF1, 
                                   F2 => sF2, 
                                   corp_strain => sCorp_strain, 
                                   CLK => CLK,
                                   final => final,
                                   este_cola => este_cola,
                                   total => total,
                                   F3 => F3,
                                   F4 => F4);
    
    C7: comparator port map (X => total,
                             mai_mic => mai_mic,
                             egal => egal,
                             mai_mare => mai_mare);
                             
   C8: sistem_eliberare_cola_rest port map ( final => final,
                                             CLK => CLK,
                                             este_cola => este_cola,
                                             mai_mic => mai_mic,
                                             egal => egal,
                                             mai_mare => mai_mare,
                                             buy => sBuy,
                                             total => total,
                                             rest => rest,
                                             eliberare_cola => eliberare_cola,
                                             returnare_monede => returnare_monede,
                                             returnare_rest => returnare_rest);
                                             
    C9: numarator_17_biti port map ( CLK => CLK, num => count);
    
    C10: convertor_cifra port map( numar => total,
                                   digit0 => digit0,
                                   digit1 => digit1);
                                   
    C11: convertor_cifra port map( numar => rest,
                                   digit0 => digit2,
                                   digit1 => digit3);
                                  
    C12: mux_8_la_1 port map( mux0 => digit0,
                              mux1 => digit1,
                              mux2 => digit2,
                              mux3 => digit3,
                              mux4 => zero,
                              mux5 => zero,
                              mux6 => zero,
                              mux7 => zero,
                              sel => count(16 downto 14),
                              cifra => cifra);
                              
    C13: convertor_cifra_7segm port map(cifra => cifra, cat => cat);
                            
    C14: mux_8_la_1_pe_8_biti port map(mux0 => constant0,
                                       mux1 => constant1,                                                                  
                                       mux2 => constant2,                                                                  
                                       mux3 => constant3,                                                                  
                                       mux4 => constant4,                                                                  
                                       mux5 => constant5,                                                                  
                                       mux6 => constant6,                                                                  
                                       mux7 => constant7, 
                                       sel => count(16 downto 14),
                                       an => an);                                                                 

end arh_distribuitor;
