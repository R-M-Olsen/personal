   boatGraph = {}

boatGraph.validPilots = {}
boatGraph.validBoats = {}
boatGraph.trackedPilots = {}
boatGraph.dataNum = {}
boatGraph.trackDistance = 2889.12	-- meters, equivalent to 1.5 nautical miles
boatGraph.recordCeiling = 137.16	-- meters, equivalent to 450 feet
boatGraph.halfConeAngle = 20		-- this is half the cone behind the carrier that the landing aircraft has to be in, 20 would be a 40 degree cone behind the carrier
boatGraph.boatOffsets = {
					["Forrestal"]	=	{ ["x"] = 60.096, ["y"] = 18.46120453, ["z"] = 5.969 },
					["CVN_71"]		=	{ ["x"] = 68.917, ["y"] = 20.14983368, ["z"] = 5.856 },
					["CVN_72"]		=	{ ["x"] = 68.917, ["y"] = 20.14983368, ["z"] = 5.856 },
					["CVN_73"]		=	{ ["x"] = 68.917, ["y"] = 20.14983368, ["z"] = 5.856 },
					["CVN_74"]		=	{ ["x"] = 68.917, ["y"] = 20.14983368, ["z"] = 5.856 },
					["Stennis"]		=	{ ["x"] = 68.932, ["y"] = 19.06433678, ["z"] = 5.969 },
					["VINSON"]		=	{ ["x"] = 68.848, ["y"] = 19.55233765, ["z"] = 6.188 },
					}

boatGraph.planeOffsets = {
							["FA-18C_hornet"]	= 1.8550071716309,
							["F-14A-135-GR"]	= 1.8086585998535,
							["F-14B"]			= 1.8086585998535,
							}

function boatGraph.eventHandler(Event)
	local status, error = pcall(function()
	if Event.id == 36 then
		if Event.initiator then	
			local _plane = Event.initiator:getName()
			if boatGraph.trackedPilots[_plane] ~= nil then
				boatGraph.trackedPilots[_plane].score = tostring(Event.comment)
				timer.scheduleFunction(	boatGraph.writeCSV, _plane, timer.getTime() + 5)
			end
		end		
	end
	end)
	if (not status) then
		env.error(string.format("Error with event handler: %s", error), false)
    end
end

function boatGraph.updatePilots()
	timer.scheduleFunction(boatGraph.updatePilots, nil, timer.getTime() + 60)
	env.info("boatGraph: update pilots")
	local activePilots = mist.makeUnitTable({"[blue][plane]"})

	for i = 1, #activePilots do
		if boatGraph.validPilots[activePilots[i]] == nil then
			if Unit.getByName(activePilots[i]) ~= nil then
				local _unit =  Unit.getByName(activePilots[i])
				local _unitType = _unit:getTypeName()
				local _unitName = _unit:getName()
				if _unit:isActive() == true then
--					if boatGraph.validPilots[_unitName] == nil then
						if _unitType == "FA-18C_hornet" or _unitType == "F-14A-135-GR" or _unitType == "F-14B" then
							--if _unit:getPlayerName() ~= nil then
							boatGraph.validPilots[activePilots[i]] = _unit
							env.info("boatGraph: added "..activePilots[i].." to valid pilots.")
							--end
						end
--					end
				end
			end
		end
	end
	env.info("boatGraph: pilot update complete")
end

function boatGraph.updateBoats()
	env.info("boatGraph: update boats")
	
	local _boats = mist.makeUnitTable({"[blue][ship]"})

	for i = 1, #_boats do
		if boatGraph.validBoats[_boats[i]] == nil then
			if Unit.getByName(_boats[i]) ~= nil then
				local _unit =  Unit.getByName(_boats[i])
				local _unitType = _unit:getTypeName()
				local _unitName = _unit:getName()
				if _unit:isActive() == true then
					if _unitType == "Forrestal" or _unitType == "VINSON" or _unitType == "Stennis" or _unitType == "CVN_71" or _unitType == "CVN_72" or _unitType == "CVN_73" or _unitType == "CVN_75" then
						boatGraph.validBoats[_boats[i]] = _unit
						env.info("boatGraph: added ".._boats[i].." to valid boats.")
					end
				end
			end
		end
	end
	env.info("boatGraph: boat update complete")
end

function boatGraph.pilotOnApproach()
	local status, error = pcall(function()
	timer.scheduleFunction(boatGraph.pilotOnApproach, nil, timer.getTime() + 1)
	for _boat, _boatUnit in pairs(boatGraph.validBoats) do
--		env.info("boatGraph: boats check ".._boat)
		local _BRChdg
		local _boatHdg = mist.utils.round(mist.getHeading(_boatUnit) * 180 / math.pi)
			if _boatHdg < 9 then
				_BRChdg = 360 + (_boatHdg - 9)
			else 
				_BRChdg = _boatHdg - 9
			end
		for _plane, _planeUnit in pairs(boatGraph.validPilots) do
			if boatGraph.trackedPilots[_plane] == nil and _planeUnit:isExist() then
				local _boatPoint = _boatUnit:getPoint()
				local _planePoint = _planeUnit:getPoint()
				if boatGraph.isOnApproach( _BRChdg,_boatPoint,_planePoint,"check" ) == true then	
					local _playerName = _plane
						if _planeUnit:getPlayerName() ~= nil then
							_playerName = _planeUnit:getPlayerName()
						end
					local _planeType = _planeUnit:getTypeName()
						boatGraph.trackedPilots[_plane] = {
															["planeName"] = _playerName,
															["planeType"] = _planeType,
															["boatName"] = _boat,
															["score"] = nil,
															["trackingData"] = {},
															}
						boatGraph.dataNum[_plane] = 0
						env.info("boatGraph: aircraft on approach")
						boatGraph.recordTracking({_boat,_boatUnit,_plane,_planeUnit})
				end
			end
		end
	end
	end)
	if (not status) then
		env.error(string.format("Error with event handler: %s", error), false)-- this is needed because its an issue with EDs event handler when things without attributes die https://forums.eagle.ru/topic/199689-help-with-script-event_dead-eventhandler-that-fails/
    end
end

function boatGraph.recordTracking(_args)--_boat,_boatUnit,_plane,_planeUnit)
	local status, error = pcall(function()
	local _boat = _args[1]
	local _boatUnit = _args[2]
	local _plane = _args[3]
	local _planeUnit = _args[4]
	if not _planeUnit:isExist() then
		boatGraph.trackedPilots[_plane].score = "Crash"
		timer.scheduleFunction(	boatGraph.writeCSV, _plane, timer.getTime() + 5)
	else
		if boatGraph.trackedPilots[_plane].score == nil then
			boatGraph.dataNum[_plane] = boatGraph.dataNum[_plane] + 1
			local _curTime = timer.getTime()
			local _Btype = _boatUnit:getTypeName()
			local _Ptype = _planeUnit:getTypeName()
			local _boatPoint = _boatUnit:getPoint()
			local _BRChdgRad = mist.getHeading(_boatUnit)
			local _offsetBoatPoint = boatGraph.getOffset(_boatPoint,_BRChdgRad,_Btype)
			local _planePoint = _planeUnit:getPoint()
			local _planeOffset = boatGraph.planeOffsets[_Ptype]
			_planePoint.y = _planePoint.y - _planeOffset
			local _BRChdgRad = mist.getHeading(_boatUnit)
			local _curTime = timer.getTime()
			local _aboveBoat = _planePoint.y - _offsetBoatPoint.y
			local _distance = mist.utils.get2DDist(_offsetBoatPoint, _planePoint)
			local _BRChdg
			local _boatHdg = mist.getHeading(_boatUnit) * 180 / math.pi
				if _boatHdg < 9 then
					_BRChdg = 360 + (_boatHdg - 9)
				else 
					_BRChdg = _boatHdg - 9
				end
			local _offset = boatGraph.isOnApproach( _BRChdg,_offsetBoatPoint,_planePoint,"record" )
			local _offsetAngle = _offset[1]
			local _side = _offset[2]
			local _offsetDist = math.abs( _distance * math.sin(_offsetAngle) )
			local _perpDist = _distance * math.cos(_offsetAngle)
			if _side == "L" then
				_offsetDist = -1 *_offsetDist 
			end
			--AOA number
			local _AOA = mist.utils.round( mist.getAoA(_planeUnit)  * 180 / math.pi, 2 )
			local _pVec = _planeUnit:getVelocity()
			--descent rate
			local _sinkRate =  mist.utils.round( mist.utils.metersToFeet( _pVec.y ) * 60, 2)
			--speed
			local _speed = mist.utils.round( mist.utils.mpsToKnots( math.sqrt( (_pVec.x^2) + (_pVec.z^2) + (_pVec.y^2) ) ) ,2 )
			boatGraph.trackedPilots[_plane].trackingData[tonumber(boatGraph.dataNum[_plane])] = {_curTime,									-- 1
																								 mist.utils.metersToFeet( _perpDist ),      -- 2
																								 mist.utils.metersToFeet( _aboveBoat),      -- 3
																								 mist.utils.metersToFeet( _offsetDist),     -- 4
																								 _speed,                                    -- 5
																								 _AOA,                                      -- 6
																								 _sinkRate}                                 -- 7
--			env.info("boatGraph: recording data ".._curTime)
			if _perpDist < -152.4 or _distance > 2890 or _aboveBoat > 152 then
				boatGraph.trackedPilots[_plane].score = "Bolter"
				timer.scheduleFunction(	boatGraph.writeCSV, _plane, timer.getTime() + 5)
			end
			timer.scheduleFunction(boatGraph.recordTracking, {_boat,_boatUnit,_plane,_planeUnit}, timer.getTime() + 0.5)
		end
	end
	end)
	if (not status) then
		env.error(string.format("Error with data recording: %s", error), false)
    end
end

function boatGraph.isOnApproach(_refHeading,_point1, _point2,_state )
	local tgtBearing
    local xUnit = _point1.x
    local yUnit = _point1.z
    local xZone = _point2.x
    local yZone = _point2.z
    
    local xDiff = xUnit - xZone
    local yDiff = yUnit - yZone
    
    local tgtAngle = math.deg(math.atan(yDiff/xDiff))
    
    if xDiff > 0 then 
    tgtBearing = 180 + tgtAngle 
    end
    
    if xDiff < 0 and tgtAngle > 0 then
		tgtBearing = tgtAngle 
    end
    
    if xDiff < 0 and tgtAngle < 0 then
		tgtBearing = 360 + tgtAngle
    end   
	
	tgtBearing = tgtBearing - _refHeading
	if tgtBearing > 360 then
		tgtBearing = tgtBearing - 360
	end
	if tgtBearing < 0 then
		tgtBearing =  360 + tgtBearing 
	end
	if _state == "check" then
		if _point2.y >= 25 and _point2.y <= boatGraph.recordCeiling then
			if mist.utils.get2DDist(_point1, _point2) <= boatGraph.trackDistance then
				if tgtBearing >= ( 180 - boatGraph.halfConeAngle ) and tgtBearing <= ( 180 + boatGraph.halfConeAngle ) then
					return true
				end
			end
		end
	elseif _state == "record" then
		local _side
		local _diff = 180 - tgtBearing
		if _diff >= 0 then 
			_side = "R"
		else
			_side = "L"
		end
		local _diffRad = _diff * math.pi/180
		return { _diffRad, _side }
	end
end
--add this funtion to tracking
function boatGraph.getOffset(_boatPoint,_offsetAngle,_type)
	local _offsetTable = boatGraph.boatOffsets[_type]
	local _xOffset = _boatPoint.x - _offsetTable.x
	local _yOffset = _boatPoint.y + _offsetTable.y
	local _zOffset = _boatPoint.z - _offsetTable.z
	local point = {["x"] = _xOffset, ["y"] = _yOffset,["z"] = _zOffset}
	local rotatedX = math.cos(_offsetAngle) * (point.x - _boatPoint.x) - math.sin(_offsetAngle) * (point.z - _boatPoint.z) + _boatPoint.x
	local rotatedY = math.sin(_offsetAngle) * (point.x - _boatPoint.x) + math.cos(_offsetAngle) * (point.z - _boatPoint.z) + _boatPoint.z
	local newPoint = {["x"] = rotatedX, ["y"] = _yOffset,["z"] = rotatedY}
	return newPoint
end

function boatGraph.textExclude(_test)
	local badChars = {[[\]],[[/]],[[:]],[[*]],[[?]],[["]],[[<]],[[>]],[[|]]}
	local excludeStrings = {[[TAW ]],[[taw ]],[[TAW_]],[[taw_]]}
	local badCharNum = nil
	
	local _name = _test
	
	if string.find(_name, [[/\/\]]) ~= nil then
		_name = string.gsub(_name, [[/\/\]],"M")
	end
	
	if string.find(_name, [[|\|]]) ~= nil then
		_name = string.gsub(_name, [[|\|]],"N")
	end
	
	if string.find(_name, [[/\/]]) ~= nil then
		_name = string.gsub(_name, [[/\/]],"N")
	end
	
	if string.find(_name, [[/\]]) ~= nil then
		_name = string.gsub(_name, [[/\]],"A")
	end
	
	if string.find(_name, [[\/]]) ~= nil then
		_name = string.gsub(_name, [[\/]],"V")
	end
	
	if string.find(_name, [[><]]) ~= nil then
		_name = string.gsub(_name, [[><]],"X")
	end
	
	if string.find(_name, [[|<]]) ~= nil then
		_name = string.gsub(_name, [[|<]],"K")
	end
	
	for k = 1, string.len(_name) do
		for i = 1, #badChars do
			if string.find(_name, badChars[i]) ~= nil then
				if badCharNum == nil then
					badCharNum = string.find(_name, badChars[i]) + 1
				elseif string.find(_name, badChars[i]) > badCharNum then
					badCharNum = string.find(_name, badChars[i]) + 1
				end
			end
		end
		
		for j = 1, #excludeStrings do
			local _eA, _eB = string.find(_name, excludeStrings[j])
			if _eB ~= nil then
				if badCharNum == nil then
					badCharNum = _eB
				elseif _eB > badCharNum then
					badCharNum = _eB
				end
			end
		end
	end
	
	if badCharNum ~= nil then
		return string.sub(_name, badCharNum + 1 )
	else
		return _name
	end
end

function boatGraph.writeCSV(_plane)
	local status, error = pcall(function()
	env.info("Stat write started for "..boatGraph.trackedPilots[_plane].planeName.." in "..boatGraph.trackedPilots[_plane].planeType)
	local _boatType = Unit.getByName(tostring(boatGraph.trackedPilots[_plane].boatName)):getTypeName()
	local timeTable = os.date("*t", os.time())
	local _pilotFileName = boatGraph.textExclude(boatGraph.trackedPilots[_plane].planeName)
	local fdir = lfs.writedir() .. [[Logs\Save_stat\]] .. _pilotFileName .. "_" .. boatGraph.trackedPilots[_plane].planeType .. "_" .. tostring(timeTable.day) ..".".. tostring(timeTable.month) ..".".. tostring(timeTable.year) .. "_" .. tostring(timeTable.hour) ..".".. tostring(timeTable.min) ..".".. tostring(timeTable.sec) .. ".csv"
	
	local f,err = io.open(fdir,"w")
		if not f then
			local errmsg = 'Error: Need to create new folder in the Logs folder with the name' .. 'Save_stat . sample: C:\Users\yourname\Saved Games\DCS\Logs\Save_stat' 
			trigger.action.outText(errmsg, 10)
			return print(err)
		end
	
	f:write("Pilot Name" .. ",".. boatGraph.trackedPilots[_plane].planeName ..",".."\n"..
			"Aircraft Type" .. ",".. boatGraph.trackedPilots[_plane].planeType ..",".."\n"..
			"Boat Type" .. ",".. _boatType ..",".."\n"..
			"DCS LSO Score" .. ",".. boatGraph.trackedPilots[_plane].score ..",".."\n".."\n"..
			"time"..",".."Distance (ft)"..",".."Alt Above Deck (ft)"..",".."Offset (ft)"..",".."Speed (kts)"..",".."AoA (deg)"..",".."Vertical Speed (fpm)".."\n")
	for _num, _data in ipairs(boatGraph.trackedPilots[_plane].trackingData) do
		f:write(_data[1]..",".._data[2]..",".._data[3]..",".._data[4]..",".._data[5]..",".._data[6]..",".._data[7].."\n")
	end
	f:close()
	env.info("Stats written for ".. boatGraph.trackedPilots[_plane].planeName .." in "..boatGraph.trackedPilots[_plane].planeType)
	boatGraph.trackedPilots[_plane] = nil
	end)
	if (not status) then
		env.error(string.format("Error with lfs: %s", error), false)
    end
end

boatGraph.pilotOnApproach()
boatGraph.updateBoats()
boatGraph.updatePilots()
mist.addEventHandler(boatGraph.eventHandler)

--dofile("C:\\Users\\Ryan\\Saved Games\\DCS\\Missions\\boat graph\\boatGraph.lua")