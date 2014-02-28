----------------------------------------------------------
-- Debug Tools
-- useful things for debugging during addon development
--
-- @classmod DebugTools
-- @author Pawkette (pawkette.heals@gmail.com)
-- @copyright © 2014 Pawkette
----------------------------------------------------------

--- 
-- @table LogLevel
LogLevel = 
{
    NONE    = 1, -- don't log anything
    INFO    = 2, -- log info messages
    WARNING = 3, -- log warnings and below
    ERROR   = 4, -- log errors and below
    DEBUG   = 5  -- log everything
}

--- DebugTools
--
DebugTools = { }
DebugTools.log_level = LogLevel.WARNING -- default log level

---
-- @local
local stringified = 
{
    "", -- exists just to keep array index properly
    "INF",
    "WRN",
    "ERR",
    "DBG"
}

--- Create a new instance of this class
-- @tparam LogLevel severity if you want to set a different log level at construction
function DebugTools:New( severity )
    local self = {}
    setmetatable( self, { __index = DebugTools } )

    if ( severity ~= nil ) then
        self:SetLogLevel( severity )
    end

    return self
end

--- Logging will fail silently if format isn't a string
-- @tparam LogLevel severity 
-- @tparam string format
-- @param ...
function DebugTools:Log( severity, format, ... )
    if ( self.log_level < severity or self.log_level == LogLevel.NONE ) then 
        return 
    end

    if ( type( format ) ~= "string" ) then
        return
    end

    print( "[" .. os.date("%H:%M:%S") .. "][" .. stringified[ severity ] .. "]: " .. format:format( ... )  )
end

--- Set log level, anything below this will not be logged
-- @tparam LogLevel log_level
function DebugTools:SetLogLevel( log_level )
    self.log_level = log_level
end

--- Helper function to log info 
-- @tparam string format
-- @param ...
function DebugTools:LogInfo( format, ... )
    self:Log( LogLevel.INFO, format, ... )
end

--- Helper function to log warning
-- @tparam string format
-- @param ...
function DebugTools:LogWarning( format, ... )
    self:Log( LogLevel.WARNING, format, ... )
end

--- Helper function to log errors
-- @tparam string format
-- @param ...
function DebugTools:LogError( format, ... )
    self:Log( LogLevel.ERROR, format, ... )
end

--- Helper function to log debug information
-- @tparam string format
-- @param ...
function DebugTools:LogDebug( format, ... )
    self:Log( LogLevel.DEBUG, format, ... )
end