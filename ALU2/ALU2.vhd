LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.all;

entity ALU2 is -- ALU unit includes Reg. 3
    port (
        clk : in std_logic;
        A,B : in unsigned(7 downto 0); -- 8-bit inputs A & B from Reg. 1 & Reg. 2
        opcode : in unsigned(15 downto 0); -- 8-bit opcode from Decoder
        R1 : out unsigned(3 downto 0);
		  R2 : out unsigned(3 downto 0);
		  Sign2 : OUT STD_LOGIC;
		  Sign1 : OUT STD_LOGIC
    );
end ALU2;

architecture calculation of ALU2 is
	SIGNAL reg1 , reg2, Result : unsigned(7 downto 0);
begin
reg1 <= A;
reg2 <= B;
process (clk, opcode)
    begin
    if(rising_edge(clk)) THEN
            case opcode is
                -- 1. Replace odd bits of A with odd bits of B
                when "0000000000000001" =>
                    Result(7) <= Reg2(7);  -- odd bit of Reg2
                    Result(6) <= Reg1(6);  -- odd bit of Reg1
                    Result(5) <= Reg2(5);  -- odd bit of Reg2
                    Result(4) <= Reg1(4);  -- odd bit of Reg1
                    Result(3) <= Reg2(3);  -- odd bit of Reg2
                    Result(2) <= Reg1(2);  -- odd bit of Reg1
                    Result(1) <= Reg2(1);  -- odd bit of Reg2
                    Result(0) <= Reg1(0);  -- odd bit of Reg1
                
                -- 2. Produce the result of NANDing A and B
                when "0000000000000010" =>
                    Result <= not (Reg1 and Reg2); -- NAND operation
                
                -- 3. Calculate the summation of A and B and decrease it by 5
                when "0000000000000100" =>
                    Result <= (Reg1 + Reg2) - 5; -- Sum A and B, then subtract 5
                
                -- 4. Produce the 2’s complement of B
                when "0000000000001000" =>
                    Result <= not(Reg2) + 1; -- 2’s complement of B
                
                -- 5. Invert the even bits of B
                when "0000000000010000" =>
                    Result(7) <= Reg2(7);
                    Result(6) <= not Reg2(6);  -- Invert even bit (bit 6)
                    Result(5) <= Reg2(5);
                    Result(4) <= not Reg2(4);  -- Invert even bit (bit 4)
                    Result(3) <= Reg2(3);
                    Result(2) <= not Reg2(2);  -- Invert even bit (bit 2)
                    Result(1) <= Reg2(1);
                    Result(0) <= not Reg2(0);  -- Invert even bit (bit 0)
                
                -- 6. Shift A to left by 2 bits, input bit = 1 (SHL)
                when "0000000000100000" =>
                    Result(7 downto 2) <= reg1(5 downto 0);
                       Result(1) <= '1';
                         Result(0) <= '1';
                -- 7. Produce null on the output
                when "0000000001000000" =>
                    Result <= "--------"; -- undefined, no output
                
                -- 8. Produce the 2’s complement of A
                when "0000000010000000" =>
                    Result <= not(Reg1) + 1; -- 2’s complement of A
                
                when others =>
					 Result <="--------"; 
                    -- Don't care, do nothing
            end case;
             end if;
				 end process;
		  		R1<= Result(3 downto 0);
				R2<=Result(7 downto 4);
				Sign2<=Result(7);
				Sign1<=Result(3);
    end calculation;