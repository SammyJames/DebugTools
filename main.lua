----------------------------------------------------------
-- Example Usage
-- useful things for debugging during addon development
--
-- @script main
-- @author Pawkette (pawkette.heals@gmail.com)
-- @copyright © 2014 Pawkette
----------------------------------------------------------
require( 'DebugTools' )

--- Instantiate DebugTools
-- @see DebugTools:New
-- @table dbg
local dbg = DebugTools:New( LogLevel.ERROR )

local function initialize()
    dbg:LogInfo( "Starting Up At %s", "NOW!" )
end

local function finalize()
    for i = 10,1,-1 do
        dbg:LogInfo( "Shutting down in ... %d", i )
    end
end 


initialize()
finalize()