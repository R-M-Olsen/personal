--	Coalition Switch script by TAW Lurchian 24May2022
--[[
	-	The script will switch the specified group, country, or entire coalition to the specified coalition to add uncertainty to missions, as a consequence for ROE violation, etc.
	-	Get creative but it won't do any good if the players know it will happen
	-	The script will not switch static objects, airbases and FARPs occupied by one coalition will switch sides if all of the units on it switch
	-	Do not use on player coalition, country, or group
]]

coalSwitch = {}

coalSwitch._ver = "0.3"

--	This script uses MIST, if mist is not loaded it with cause a pop up
assert(mist ~= nil, "\n\n** HEY MISSION-DESIGNER! **\n\nMiST has not been loaded!\n\nMake sure MiST 4.5.106 or higher is running\n*before* running this script!\n")

if mist ~= nil then
	local mistVersion = tonumber(mist.majorVersion..mist.minorVersion..mist.build)
	local oldVersion = true
	if mistVersion < 45106 then
		oldVersion = false
	end
	assert(oldVersion == true, "\n\n** HEY MISSION-DESIGNER! **\n\nThis script requires MiST 4.5.106 or higher\n\nCurrent MIST version is "..mist.majorVersion.."."..mist.minorVersion.."."..mist.build.."\n")
end

function coalSwitch.switchCoalition(_from, _to)
	local status, error = pcall(function()
	local _groups = {}
	local _units = mist.makeUnitTable({'['.._from..']'}, 'static')
	for i = 1, #_units do
		_grpName = Unit.getByName( _units[i] ):getGroup():getName()
		if _groups[_grpName] == nil then
			_groups[_grpName] = true
			coalSwitch.switchGroup(_grpName, _to)
		end
	end
	end)
	if (not status) then
		env.error(string.format("Coalition Switch: Error in coalSwitch.switchCoalition: %s", error), false)
	end
end

function coalSwitch.switchCountry(_from, _to)
	local status, error = pcall(function()
	local _groups = {}
	local _units = mist.makeUnitTable({'[c]'.._from}, 'static')
	for i = 1, #_units do
		_grpName = Unit.getByName( _units[i] ):getGroup():getName()
		if _groups[_grpName] == nil then
			_groups[_grpName] = true
			coalSwitch.switchGroup(_grpName, _to)
		end
	end
	end)
	if (not status) then
		env.error(string.format("Coalition Switch: Error in coalSwitch.switchCountry: %s", error), false)
	end
end

function coalSwitch.switchMultiGroup(_table, _to)
	local status, error = pcall(function()
	for i = 1, #_table do
		coalSwitch.switchGroup(_table[i], _to)
	end
	end)
	if (not status) then
		env.error(string.format("Coalition Switch: Error in coalSwitch.switchMultiGroup: %s", error), false)
	end
end

function coalSwitch.switchGroup(_grpName, _to)
	local _country
	local _coalition
	
	if _to == "blue" then
		_country = "CJTF_BLUE"
		_coalition = 2
	elseif _to == "red" then
		_country = "CJTF_RED"
		_coalition = 1
	elseif _to == "neutral" then
		_country = "UN_PEACEKEEPERS"
		_coalition = 0
	end
	
	if Group.getByName( _grpName ) ~= nil then
		local status, error = pcall(function()
			local _grp = Group.getByName( _grpName )
			local _origCoal = _grp:getCoalition()
			local _groupData
			local _category
			if _origCoal ~= _coalition then
				local _active = _grp:getUnit(1):isActive()
				_groupData = mist.getCurrentGroupData( _grpName )
				_category = _grp:getCategory()
				_groupData.country = _country
				_groupData.category = _category
				mist.dynAdd(_groupData)
				env.info("Coalition Switch: ".._grpName.." switched sides")
				if _active == true then
					_grp:activate()
				end
			else
				env.info("Coalition Switch: Switch failed: ".._grpName.." is already that coalition")
			end
		end)
		if (not status) then
		env.error(string.format("Coalition Switch: Error switching coalition: %s", error), false)
		end
	else
		env.info("Coalition Switch: Switch failed: ".._grpName.." does not exist")
	end
end

env.info("Coalition Switch v".. coalSwitch._ver .." loaded!")