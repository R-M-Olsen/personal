--	Auto LASTE by TAW Lurchian 30Jun2022
--	requires MIST

lasteMenu = {}

lasteMenu.hawgPilots = {}
lasteMenu.addedTo = {}
lasteMenu.currentMap = {}
lasteMenu.currentSave = 1

lasteMenu.recallData = {
						[1] = {[1] = "",[2] = "",[3] = "",[4] = "",[5] = "",[6] = "",[7] = "",["mgrs"] = nil},
						[2] = {[1] = "",[2] = "",[3] = "",[4] = "",[5] = "",[6] = "",[7] = "",["mgrs"] = nil},
						[3] = {[1] = "",[2] = "",[3] = "",[4] = "",[5] = "",[6] = "",[7] = "",["mgrs"] = nil},
						[4] = {[1] = "",[2] = "",[3] = "",[4] = "",[5] = "",[6] = "",[7] = "",["mgrs"] = nil},
						}

function lasteMenu.events(Event)
	local next = next
	local status, error = pcall(function()
		if Event.id == 27 and Event.pos then
			if string.find(Event.text, "-laste") or string.find(Event.text, "-LASTE") then
				local _magVar = mist.utils.toDegree( mist.getNorthCorrection(Event.pos) )
				local mgrs = coord.LLtoMGRS(coord.LOtoLL( Event.pos ))
				
				lasteMenu.buildWindTower(Event.pos, _magVar, lasteMenu.currentSave)
				
				
				for _groupID, _ in pairs(lasteMenu.hawgPilots) do
					trigger.action.outTextForGroup(_groupID, "LASTE for ".. mist.tostringMGRS(mgrs, 4) ..", altitude ".. mist.utils.round(Event.pos.y * 3.28084) .."ft ASL, MagVar ".. mist.utils.round(_magVar) .."° saved in position #".. lasteMenu.currentSave ..".\n\nUse [F10. Other] > [LASTE] > Get saved LASTE #"..lasteMenu.currentSave.." to display/recall." ,15)
				end
				
				lasteMenu.recallData[lasteMenu.currentSave].mgrs = tostring( mist.tostringMGRS(mgrs, 4) ..", alt ".. mist.utils.round(Event.pos.y * 3.28084) .."ft ASL, MagVar: ".. mist.utils.round(_magVar) .."°" )
				
				if lasteMenu.currentSave < 4 then
					lasteMenu.currentSave = lasteMenu.currentSave + 1
				else
					lasteMenu.currentSave = 1
				end
			end
		elseif Event.id == 15 then--or Event.id == 20 then
			if Event.initiator ~= nil then
				local _type = Event.initiator:getTypeName()
				if _type == "A-10C" or _type == "A-10C_2" then
					local _unitID = Event.initiator:getID()
					trigger.action.outTextForUnit(_unitID, "Only you can see this message, it will happen every time you enter the aircraft.\n\nScript based LASTE correction enabled.\n\nInstructions:\n   1. Place an F10 map mark\n   2. Type -laste or -LASTE at the intended AO\n   3. Close the box with the red X\n   4. There will be a confirmation message with the saved position\n   5. To view/recall the correction with [F10. Other] > [LASTE] > Get saved LASTE #\n\nUse the escape menu message history to recall these instuctions.\n\nViewing or recalling the LASTE correction via the F10 menu will be visible to all pilots in your group for 2 minutes and can be recall with the escape menu message history.",15)
					
				end
			end
		end
	end)
	if (not status) then
		env.error(string.format("FOB Builder: Error with event handler: %s", error), false)
	end
end

function lasteMenu.buildWindTower(_pos,_magVar,_savPos)
	local _posX = _pos.x
	local _posZ = _pos.z
	local _chkAlt
	
	if _pos.y <= 0 then
		_chkAlt = 1
	else
		_chkAlt = _pos.y + 1
	end
	
	for i = 1, 7 do
		local _offset = 0
		
		if i == 1 then
			_offset = 0	
		elseif i == 2 then
			_offset = 304.799902	--1000ft
		elseif i == 3 then
			_offset = 609.5999805	--2000ft
		elseif i == 4 then
			_offset = 1219.199961	--4000ft
		elseif i == 5 then
			_offset = 2133.599932	--7000ft
		elseif i == 6 then
			_offset = 4571.999854	--15000ft
		end
		
		local _fixAlt = math.floor( ((_chkAlt + _offset) * 3.28084) / 1000  ) * 1000
		
		if i == 7 then
			_fixAlt = 26000
		end
		
		local _dispAlt
		if _fixAlt < 10000 then
			_dispAlt = "0"..string.sub(tostring(_fixAlt),1,1)
		else
			_dispAlt = string.sub(tostring(_fixAlt),1,2)
		end
		
		if _chkAlt > _fixAlt / 3.28084 then
			_fixAlt = _chkAlt * 3.28084
		end

		local _corHdg, _corWsp, _corTemp

		local _wind = atmosphere.getWind({ x = _posX, y = _fixAlt / 3.28084, z = _posZ })
		local _gndTemp, _gndPress = atmosphere.getTemperatureAndPressure( { x = _posX, y = _fixAlt / 3.28084, z = _posZ } )
		
		local _intDir = mist.utils.round( mist.utils.toDegree( math.pi + math.atan(_wind.z/_wind.x)) + _magVar)
		local _intVel = mist.utils.round( math.sqrt(_wind.x^2 + _wind.z^2) * 1.944 )
		_corTemp = mist.utils.round( _gndTemp - 273.15 )
		
		if _intDir >= 0 and _intDir <= 9 then
			_corHdg = "00".._intDir
		elseif _intDir >= 10 and _intDir <= 99 then
			_corHdg = "0".._intDir
		elseif _intDir >= 100 and _intDir <= 360 then
			_corHdg = _intDir
		end
		
		if _intVel >= 0 and _intVel <= 9 then
			_corWsp = "0".._intVel
		elseif _intVel >= 10 then
			_corWsp = _intVel
		end		
		lasteMenu.recallData[_savPos][i] =  tostring(" ".. _dispAlt .."      ".. _corHdg .. _corWsp .."     ".. _corTemp )
	end
end

function lasteMenu.diplayCorrection(args)
	local _groupID = args[1]
	local _save = args[2]
	if lasteMenu.recallData[_save].mgrs ~= nil then
		trigger.action.outTextForGroup(_groupID, "LASTE save #".._save.."  ("..lasteMenu.recallData[_save].mgrs..")\nALT     WIND     TEMP".."\n"..lasteMenu.recallData[_save][1].."\n"..lasteMenu.recallData[_save][2].."\n"..lasteMenu.recallData[_save][3].."\n"..lasteMenu.recallData[_save][4].."\n"..lasteMenu.recallData[_save][5].."\n"..lasteMenu.recallData[_save][6].."\n"..lasteMenu.recallData[_save][7],120)
		trigger.action.outTextForGroup(_groupID, "\n\nThis correction can be recalled via the escape menu message history to not spam the group.",5)
	else
		trigger.action.outTextForGroup(_groupID, "There is no LASTE correction saved in position #".._save,5)
	end
end

function lasteMenu.getPlayers()
	local next = next
	local activePilots = mist.makeUnitTable({"[blue][plane]"})
	
	for i = 1, #activePilots do
		local _unit =  Unit.getByName(activePilots[i])
		if _unit ~= nil then
			local _type = _unit:getTypeName()
			
			if _type == "A-10C" or _type == "A-10C_2" then
			local _grp = _unit:getGroup()
				if _grp ~= nil then
					local _groupID = _grp:getID()
					env.info(_groupID)
					if lasteMenu.hawgPilots[_groupID] ~= true then
						lasteMenu.hawgPilots[_groupID] = true
						env.info("lasteMenu: Added ".. _grp:getName() )
					end
				end
			end
		end
	end
	
	timer.scheduleFunction(lasteMenu.getPlayers, nil, timer.getTime() + 30)
	
end

function lasteMenu.addMenu()
	for _groupID,_ in pairs(lasteMenu.hawgPilots) do
		if lasteMenu.addedTo[_groupID] ~= true then
			missionCommands.addSubMenuForGroup(_groupID, "LASTE")
			missionCommands.addCommandForGroup(_groupID, "Get saved LASTE #1", {"LASTE"}, lasteMenu.diplayCorrection, {_groupID,1})
			missionCommands.addCommandForGroup(_groupID, "Get saved LASTE #2", {"LASTE"}, lasteMenu.diplayCorrection, {_groupID,2})
			missionCommands.addCommandForGroup(_groupID, "Get saved LASTE #3", {"LASTE"}, lasteMenu.diplayCorrection, {_groupID,3})
			missionCommands.addCommandForGroup(_groupID, "Get saved LASTE #4", {"LASTE"}, lasteMenu.diplayCorrection, {_groupID,4})
			trigger.action.outTextForGroup(_groupID, "LASTE F10 menu added to your group.",5)
			lasteMenu.addedTo[_groupID] = true
		end
	end
	timer.scheduleFunction(lasteMenu.addMenu, nil, timer.getTime() + 10)
end

function lasteMenu.start()
	lasteMenu.getPlayers()
	timer.scheduleFunction(lasteMenu.addMenu, nil, timer.getTime() + 5)
end

mist.addEventHandler(lasteMenu.events)
lasteMenu.start()

--dofile("C:\\scripts\\LasteMenu.lua")

