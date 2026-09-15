LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity ALU3 is -- ALU unit includes Reg. 3
    port (
        clk : in std_logic;
        A, B : in unsigned(7 downto 0); -- 8-bit inputs A & B from Reg. 1 & Reg. 2
        opcode : in unsigned(15 downto 0); -- 16-bit opcode from Decoder
        studentidin : in unsigned(3 downto 0); -- 4-bit student_id signal
        R1 : out unsigned(3 downto 0) -- Output result
    );
end ALU3;

architecture calculation of ALU3 is
    signal reg1, reg2 : unsigned(7 downto 0);
begin
    reg1 <= A; -- Assign input A to reg1
    reg2 <= B; -- Assign input B to reg2

    process (clk,opcode)
    begin
        if rising_edge(clk) then
            case opcode is
                when "0000000000000001" =>
                    if (reg1(7 downto 4) > studentidin or reg1(3 downto 0) > studentidin) then
                        R1 <= "1111";  -- One of the digits is greater than student_id
                    else
                        R1 <= "0000";  -- Neither digit is greater than student_id
                    end if;

                when "0000000000000010" =>
                    if (reg1(7 downto 4) > studentidin or reg1(3 downto 0) > studentidin) then
                        R1 <= "1111";
                    else
                        R1 <= "0000";
                    end if;

                when "0000000000000100" =>
                    if (reg1(7 downto 4) > studentidin or reg1(3 downto 0) > studentidin) then
                        R1 <= "1111";
                    else
                        R1 <= "0000";
                    end if;

                when "0000000000001000" =>
                    if (reg1(7 downto 4) > studentidin or reg1(3 downto 0) > studentidin) then
                        R1 <= "1111";
                    else
                        R1 <= "0000";
                    end if;

                when "0000000000010000" =>
                    if (reg1(7 downto 4) > studentidin or reg1(3 downto 0) > studentidin) then
                        R1 <= "1111";
                    else
                        R1 <= "0000";
                    end if;

                when "0000000000100000" =>
                    if (reg1(7 downto 4) > studentidin or reg1(3 downto 0) > studentidin) then
                        R1 <= "1111";
                    else
                        R1 <= "0000";
                    end if;

                when "0000000001000000" =>
                    if (reg1(7 downto 4) > studentidin or reg1(3 downto 0) > studentidin) then
                        R1 <= "1111";
                    else
                        R1 <= "0000";
                    end if;

                when "0000000010000000" =>
                    if (reg1(7 downto 4) > studentidin or reg1(3 downto 0) > studentidin) then
                        R1 <= "1111";
                    else
                        R1 <= "0000";
                    end if;

                when "0000000100000000" =>
                    if (reg1(7 downto 4) > studentidin or reg1(3 downto 0) > studentidin) then
                        R1 <= "1111";
                    else
                        R1 <= "0000";
                    end if;

                when others =>
                    R1 <= "0000";  -- Default case for unspecified operations
            end case;
        end if;
    end process;
end calculation;


