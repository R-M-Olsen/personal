--  Randomize Unit Headings v2 script by TAW lurchian, May 2022
--[[
	This will randomize ground unit headings
	
	Units with 'lock' anywhere in the name will not have their heading randomized ex: 'lock_RED_tanks_1-1', 'RED_tanks_2-4_lock, 'REDtankslock 1-1' will not have randomized headings
	
	This script requires Mist
	
	Only works for ground groups
	
	The script will keep whichever activation status the group has when the function runs, so if it is active when the script ran it will stay active, if it is not active it will remain inactive until activated by a script or trigger
	
	Triggers will still work for the randomized groups
	
	Advanced waypoint actions DO transfer
	
	groups can be either individually randomized with randHdg.randomizeGroupHeading("groupName"), or by adding the group names to the list.
]]
randHdg = {}

randHdg.groups = {
--				"groupName",
				}

function randHdg.randomizeHeading()
	local next = next
	if next(randHdg.groups) ~= nil then
		for i = 1, #randHdg.groups do
			randHdg.randomizeGroupHeading(randHdg.groups[i])
		end
	end
end

function randHdg.randomizeGroupHeading(_groupName)
	if Group.getByName( _groupName ) ~= nil then
		if Group.getByName( _groupName ):getCategory() == 2 then
			local _active = Group.getByName( _groupName ):getUnit(1):isActive()
			local _groupData = mist.getGroupTable( _groupName )
			_groupData.country = country.name[ Group.getByName( _groupName ):getUnit(1):getCountry() ]
			_groupData.category = 2
			local _size = #_groupData.units
			for j = 1, _size do
				local _name = _groupData.units[j].name
				--env.info(_groupData.units[j].name)
				if string.find(_name, "lock", 1) == nil then
					_groupData.units[j].heading = math.rad( mist.random(35999) / 100 )
				end
			end	
			mist.dynAdd(_groupData)
			if _active == true then
				 Group.getByName( _groupName ):activate()
			end
		end
	end
end

timer.scheduleFunction(randHdg.randomizeHeading, nil, timer.getTime() + 5)