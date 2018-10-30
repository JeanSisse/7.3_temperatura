
--------------------------------------------------------------------------
-- package com tipos basicos
--------------------------------------------------------------------------
library IEEE;
use IEEE.Std_Logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;

package HeMPS_PKG is

--------------------------------------------------------
-- HEMPS CONSTANTS
--------------------------------------------------------
	-- paging definitions
	constant PAGE_SIZE_H_INDEX		: integer := 15;
	constant PAGE_NUMBER_H_INDEX	: integer := 17;

	-- Hemps top definitions
	constant NUMBER_PROCESSORS_X	: integer := 6; 
	constant NUMBER_PROCESSORS_Y	: integer := 6; 

	constant TAM_BUFFER		: integer := 8;

	constant MASTER_ADDRESS			: integer := 0;
	constant NUMBER_PROCESSORS		: integer := NUMBER_PROCESSORS_Y*NUMBER_PROCESSORS_X;

	subtype core_str is string(1 to 6);
	subtype kernel_str is string(1 to 3);
	type core_type_type is array(0 to NUMBER_PROCESSORS-1) of core_str;
	constant core_type : core_type_type := ("plasma","plasma","plasma","plasma","plasma","plasma","plasma","plasma","plasma","plasma","plasma","plasma","plasma","plasma","plasma","plasma","plasma","plasma","plasma","plasma","plasma","plasma","plasma","plasma","plasma","plasma","plasma","plasma","plasma","plasma","plasma","plasma","plasma","plasma","plasma","plasma");
	type kernel_type_type is array(0 to NUMBER_PROCESSORS-1) of kernel_str;
	constant kernel_type : kernel_type_type := ("mas","sla","sla","sla","sla","sla","sla","sla","sla","sla","sla","sla","sla","sla","sla","sla","sla","sla","sla","sla","sla","sla","sla","sla","sla","sla","sla","sla","sla","sla","sla","sla","sla","sla","sla","sla");
end HeMPS_PKG;