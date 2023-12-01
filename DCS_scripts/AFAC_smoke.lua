afacSmoke = {}

function afacSmoke.events(Event)
	local status, error = pcall(function()
	if Event.id == 27 and Event.pos and Event.text then
		if string.find(Event.text, "-smk") then
			afacSmoke.smokeArea(Event.text, Event.pos)
		end
	end

	end)
	if (not status) then
		env.error(string.format("afacSmoke: Error with event handler: %s", error), false)
	end
end

function afacSmoke.smokeArea(_txt, _pos)
	local _opt = string.sub(_txt,-1)
	local _color
	local word = ""
	if _opt == "g" then
		_color = 0
		word = "Green"
	elseif _opt == "r" then
		_color = 1
		word = "Red"
	elseif _opt == "o" then
		_color = 3
		word = "Orange"
	elseif _opt == "b" then
		_color = 4
		word = "Blue"
	else
		_color = 2
		word = "White"
	end
	local _pos = { x = _pos.x, y = _pos.y + 3, z = _pos.z }

	local mgrs = coord.LLtoMGRS(coord.LOtoLL( _pos ))
	trigger.action.outText(word.." smoke deployed at ".. mist.tostringMGRS(mgrs, 5) .." altitude ".. mist.utils.round(mist.utils.metersToFeet( _pos.y )).."ft."  ,10)

	trigger.action.smoke( _pos,tonumber(_color) )
	
end

mist.addEventHandler(afacSmoke.events)