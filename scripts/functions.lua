--Adds a mod tag to a name for identification
function nindycore.core.add_mod_tag(name)
    if name and type(name) == "string" then
        return nindycore.core.constants.CORE_MOD_TAG .. name
    end
    return name
end

--Calls a funtion and returns false if something went wrong
function nindycore.core.safeCall(fName, ...)
	-- Dont use pcall() if the game is in Instrument mode --
	if script.active_mods["debugadapter"] then
		fName(...)
		return
	end
	-- Secure call the Function --
	local result, error = pcall(fName, ...)

	-- Check if the Function was correctly executed --
	if result == false then
		-- Display the Error to all Player --
		game.print(error)
		return false
	end
end

--Get's player from player id
function nindycore.core.get_player(id)
    return game.players[id]
end

--Replaces chars with a modifier
function nindycore.core.gsub(name, char, modifier)
	local n, p = string.gsub(name, char, modifier)
	return n
end

--Returns table length
function nindycore.core.get_table_length(array, non_nil)
	local l = 0
	for _, a in pairs(array) do
		if non_nil and (a.valid or a ~= nil) then
			l = l + 1
		elseif not non_nil then
			l = l + 1
		end
	end
	return l
end