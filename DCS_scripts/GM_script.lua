------------------------------------------------------------------------------------------
--	    ______                       ______ __  ___   _____              _         __ 	--
--	   / ____/____ _ _____ __  __   / ____//  |/  /  / ___/ _____ _____ (_)____   / /_	--
--	  / __/  / __ `// ___// / / /  / / __ / /|_/ /   \__ \ / ___// ___// // __ \ / __/	--
--	 / /___ / /_/ /(__  )/ /_/ /  / /_/ // /  / /   ___/ // /__ / /   / // /_/ // /_  	--
--	/_____/ \__,_//____/ \__, /   \____//_/  /_/   /____/ \___//_/   /_// .___/ \__/  	--
--	                    /____/                                         /_/            	--
--								by TAW Lurchian, Aug 2022								--
------------------------------------------------------------------------------------------
eGMs = {}


eGMs.allow_insurgents = true
eGMs.allow_modern_red = true
eGMs.allow_BLUFOR = true
eGMs.allow_mods = true
eGMs.allow_SAMs = true
eGMs.allow_ships = true
eGMs.restrict_to_GM = true

eGMs.redGroupCount = 0
eGMs.bluGroupCount = 0
eGMs.civGroupCount = 0

eGMs.version = "0.1"

function eGMs.setup()
	
end

--function eGMs.eventHandler(Event)
function eGMs:onEvent(Event)
    local status, error = pcall(function()
        if Event.id == 27 and Event.pos and Event.text then
			if string.find(Event.text, "``") then
				if eGMs.restrict_to_GM == true then
					if Event.initiator == nil then
						eGMs.spawnInsurgent(Event.text, Event.pos)
					elseif Event.initiator ~= nil then
						trigger.action.outText("Only GMs can spawn units.",5)	
					end
				elseif eGMs.restrict_to_GM == false then
					eGMs.spawnInsurgent(Event.text, Event.pos)
				end
			end
        end
    end)
    if (not status) then
        env.error(string.format("Error with event handler: %s", error), false)
    end
end

--	start spawnable group functions
function eGMs.spawnInsurgent(_text,_pos)
	local status, error = pcall(function()
		local _type = string.sub(_text,3,6)
		local _ihdg = string.sub(_text,-3)
		local _hdg
		if tonumber(_ihdg) ~= nil and tonumber(_ihdg) >= 0 and tonumber(_ihdg) <= 360 then
			_hdg = math.rad( tonumber(_ihdg) )
		else
			_hdg = math.rad( math.random(360) )
		end
--	Insurgents		
		if eGMs.allow_insurgents == true then
			if _type == "ic01" then 
				eGMs.redGroupCount = eGMs.redGroupCount + 1
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-1",
													["type"] = "HL_DSHK",
													["y"] = _pos.z,
													["x"] = _pos.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },
											[2] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-2",
													["type"] = "MAZ-6303",
													["y"] = _pos.z - (15 * math.sin(_hdg)),
													["x"] = _pos.x - (15 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[3] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-3",
													["type"] = "MAZ-6303",
													["y"] = _pos.z - (30 * math.sin(_hdg)),
													["x"] = _pos.x - (30 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[4] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-4",
													["type"] = "MAZ-6303",
													["y"] = _pos.z - (45 * math.sin(_hdg)),
													["x"] = _pos.x - (45 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[5] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-5",
													["type"] = "HL_DSHK",
													["y"] = _pos.z - (60 * math.sin(_hdg)),
													["x"] = _pos.x - (60 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
												  
											},
								["name"] = "dynamic_insurgents_"..eGMs.redGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(81, Group.Category.GROUND, spawn_group)
			elseif _type == "ic02" then
				eGMs.redGroupCount = eGMs.redGroupCount + 1
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-1",
													["type"] = "HL_DSHK",
													["y"] = _pos.z,
													["x"] = _pos.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },
											[2] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-2",
													["type"] = "MAZ-6303",
													["y"] = _pos.z - (15 * math.sin(_hdg)),
													["x"] = _pos.x - (15 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[3] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-3",
													["type"] = "MAZ-6303",
													["y"] = _pos.z - (30 * math.sin(_hdg)),
													["x"] = _pos.x - (30 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[4] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-4",
													["type"] = "HL_ZU-23",
													["y"] = _pos.z - (45 * math.sin(_hdg)),
													["x"] = _pos.x - (45 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											[5] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-5",
													["type"] = "MAZ-6303",
													["y"] = _pos.z - (60 * math.sin(_hdg)),
													["x"] = _pos.x - (60 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[6] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-6",
													["type"] = "MAZ-6303",
													["y"] = _pos.z - (75 * math.sin(_hdg)),
													["x"] = _pos.x - (75 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											[7] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-7",
													["type"] = "HL_DSHK",
													["y"] = _pos.z - (90 * math.sin(_hdg)),
													["x"] = _pos.x - (90 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
												  
											},
								["name"] = "dynamic_insurgents_"..eGMs.redGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(81, Group.Category.GROUND, spawn_group)
			elseif _type == "ic03" then
				eGMs.redGroupCount = eGMs.redGroupCount + 1
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-1",
													["type"] = "HL_DSHK",
													["y"] = _pos.z,
													["x"] = _pos.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },
											[2] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-2",
													["type"] = "GAZ-3307",
													["y"] = _pos.z - (15 * math.sin(_hdg)),
													["x"] = _pos.x - (15 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[3] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-3",
													["type"] = "GAZ-3307",
													["y"] = _pos.z - (30 * math.sin(_hdg)),
													["x"] = _pos.x - (30 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[4] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-4",
													["type"] = "HL_ZU-23",
													["y"] = _pos.z - (45 * math.sin(_hdg)),
													["x"] = _pos.x - (45 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											[5] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-5",
													["type"] = "ATZ-10",
													["y"] = _pos.z - (60 * math.sin(_hdg)),
													["x"] = _pos.x - (60 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[6] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-6",
													["type"] = "ATZ-10",
													["y"] = _pos.z - (75 * math.sin(_hdg)),
													["x"] = _pos.x - (75 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											[7] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-7",
													["type"] = "ATZ-10",
													["y"] = _pos.z - (90 * math.sin(_hdg)),
													["x"] = _pos.x - (90 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											[8] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-8",
													["type"] = "HL_ZU-23",
													["y"] = _pos.z - (105 * math.sin(_hdg)),
													["x"] = _pos.x - (105 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											[9] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-9",
													["type"] = "MAZ-6303",
													["y"] = _pos.z - (120 * math.sin(_hdg)),
													["x"] = _pos.x - (120 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											[10] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-10",
													["type"] = "MAZ-6303",
													["y"] = _pos.z - (135 * math.sin(_hdg)),
													["x"] = _pos.x - (135 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											[11] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-11",
													["type"] = "MAZ-6303",
													["y"] = _pos.z - (150 * math.sin(_hdg)),
													["x"] = _pos.x - (150 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											[12] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-12",
													["type"] = "MAZ-6303",
													["y"] = _pos.z - (165 * math.sin(_hdg)),
													["x"] = _pos.x - (165 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											[13] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-13",
													["type"] = "HL_DSHK",
													["y"] = _pos.z - (180 * math.sin(_hdg)),
													["x"] = _pos.x - (180 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
												  
											},
								["name"] = "dynamic_insurgents_"..eGMs.redGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(81, Group.Category.GROUND, spawn_group)
			elseif _type == "it01" then
				eGMs.redGroupCount = eGMs.redGroupCount + 1
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-1",
													["type"] = "BTR-80",
													["y"] = _pos.z,
													["x"] = _pos.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },
											[2] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-2",
													["type"] = "BTR-80",
													["y"] = _pos.z - (15 * math.sin(_hdg)),
													["x"] = _pos.x - (15 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[3] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-3",
													["type"] = "HL_ZU-23",
													["y"] = _pos.z - (30 * math.sin(_hdg)),
													["x"] = _pos.x - (30 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[4] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-4",
													["type"] = "HL_DSHK",
													["y"] = _pos.z - (45 * math.sin(_hdg)),
													["x"] = _pos.x - (45 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											},
								["name"] = "dynamic_insurgents_"..eGMs.redGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(81, Group.Category.GROUND, spawn_group)
			elseif _type == "it02" then
				eGMs.redGroupCount = eGMs.redGroupCount + 1
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-1",
													["type"] = "HL_DSHK",
													["y"] = _pos.z,
													["x"] = _pos.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },
											[2] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-2",
													["type"] = "T-55",
													["y"] = _pos.z - (15 * math.sin(_hdg)),
													["x"] = _pos.x - (15 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[3] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-3",
													["type"] = "HL_ZU-23",
													["y"] = _pos.z - (30 * math.sin(_hdg)),
													["x"] = _pos.x - (30 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  	  
											},
								["name"] = "dynamic_insurgents_"..eGMs.redGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(81, Group.Category.GROUND, spawn_group)
			elseif _type == "ip01" then
				eGMs.redGroupCount = eGMs.redGroupCount + 1
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-1",
													["type"] = "HL_DSHK",
													["y"] = _pos.z,
													["x"] = _pos.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },
											[2] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-2",
													["type"] = "HL_DSHK",
													["y"] = _pos.z - (15 * math.sin(_hdg)),
													["x"] = _pos.x - (15 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[3] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-3",
													["type"] = "HL_DSHK",
													["y"] = _pos.z - (30 * math.sin(_hdg)),
													["x"] = _pos.x - (30 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  	  
											},
								["name"] = "dynamic_insurgents_"..eGMs.redGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(81, Group.Category.GROUND, spawn_group)
			elseif _type == "ip02" then
				eGMs.redGroupCount = eGMs.redGroupCount + 1
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-1",
													["type"] = "HL_DSHK",
													["y"] = _pos.z,
													["x"] = _pos.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },
											[2] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-2",
													["type"] = "HL_ZU-23",
													["y"] = _pos.z - (15 * math.sin(_hdg)),
													["x"] = _pos.x - (15 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[3] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-3",
													["type"] = "HL_DSHK",
													["y"] = _pos.z - (30 * math.sin(_hdg)),
													["x"] = _pos.x - (30 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  	  
											},
								["name"] = "dynamic_insurgents_"..eGMs.redGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(81, Group.Category.GROUND, spawn_group)
			elseif _type == "ii01" then
				eGMs.redGroupCount = eGMs.redGroupCount + 1
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-1",
													["type"] = "Soldier AK",
													["y"] = _pos.z,
													["x"] = _pos.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },
											[2] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-2",
													["type"] = "Soldier AK",
													["y"] = _pos.z - (5 * math.sin(_hdg)),
													["x"] = _pos.x - (5 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[3] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-3",
													["type"] = "Soldier AK",
													["y"] = _pos.z - (10 * math.sin(_hdg)),
													["x"] = _pos.x - (10 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  	  
											[4] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-4",
													["type"] = "Soldier AK",
													["y"] = _pos.z - (15 * math.sin(_hdg)),
													["x"] = _pos.x - (15 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  	  
											[5] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-5",
													["type"] = "Soldier AK",
													["y"] = _pos.z - (20 * math.sin(_hdg)),
													["x"] = _pos.x - (20 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  	  
											[6] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-6",
													["type"] = "Soldier AK",
													["y"] = _pos.z - (25 * math.sin(_hdg)),
													["x"] = _pos.x - (25  * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  	  
											[7] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-7",
													["type"] = "Soldier AK",
													["y"] = _pos.z - (30 * math.sin(_hdg)),
													["x"] = _pos.x - (30 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  	  
											},
								["name"] = "dynamic_insurgents_"..eGMs.redGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(81, Group.Category.GROUND, spawn_group)
			elseif _type == "ii02" then
				eGMs.redGroupCount = eGMs.redGroupCount + 1
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-1",
													["type"] = "Soldier AK",
													["y"] = _pos.z,
													["x"] = _pos.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },
											[2] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-2",
													["type"] = "Soldier AK",
													["y"] = _pos.z - (5 * math.sin(_hdg)),
													["x"] = _pos.x - (5 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[3] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-3",
													["type"] = "Soldier RPG",
													["y"] = _pos.z - (10 * math.sin(_hdg)),
													["x"] = _pos.x - (10 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  	  
											[4] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-4",
													["type"] = "Soldier AK",
													["y"] = _pos.z - (15 * math.sin(_hdg)),
													["x"] = _pos.x - (15 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  	  
											[5] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-5",
													["type"] = "Soldier AK",
													["y"] = _pos.z - (20 * math.sin(_hdg)),
													["x"] = _pos.x - (20 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  	  
											[6] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-6",
													["type"] = "Soldier RPG",
													["y"] = _pos.z - (25 * math.sin(_hdg)),
													["x"] = _pos.x - (25  * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  	  
											[7] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-7",
													["type"] = "Soldier AK",
													["y"] = _pos.z - (30 * math.sin(_hdg)),
													["x"] = _pos.x - (30 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  	  
											},
								["name"] = "dynamic_insurgents_"..eGMs.redGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(81, Group.Category.GROUND, spawn_group)
			elseif _type == "ii03" then
				eGMs.redGroupCount = eGMs.redGroupCount + 1
				spawn_group = {
							["hidden"] = false,
							["units"] = {
										[1] = {
												["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-1",
												["type"] = "SA-18 Igla manpad",
												["y"] = _pos.z,
												["x"] = _pos.x,
												["heading"] =_hdg,
											  },	  	  
										},
							["name"] = "dynamic_insurgents_"..eGMs.redGroupCount,
							["task"] = "Ground Nothing",		
							}
			coalition.addGroup(81, Group.Category.GROUND, spawn_group)
			elseif _type == "ia01" then
				eGMs.redGroupCount = eGMs.redGroupCount + 1
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-1",
													["type"] = "HL_B8M1",
													["y"] = _pos.z,
													["x"] = _pos.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },	  	  
											},
								["name"] = "dynamic_insurgents_"..eGMs.redGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(81, Group.Category.GROUND, spawn_group)
			elseif _type == "ia02" then
				eGMs.redGroupCount = eGMs.redGroupCount + 1
				local _u2 = eGMs.rotateVec2({x = -3.7812484099995, y = 11.15625}, _hdg)
				local _u3 = eGMs.rotateVec2({x = -8.5937484099995, y = -1.810546875}, _hdg)
				local _u4 = eGMs.rotateVec2({x = -4.6875, y = -3.7792761550008}, _hdg)
				local _u5 = eGMs.rotateVec2({x = -4.78125, y = 4.6875207199992}, _hdg)
				local _u6 = eGMs.rotateVec2({x = 2.421875, y = 7.4043175949992}, _hdg)
				local _u7 = eGMs.rotateVec2({x = 1.75, y = -6.2773230300008}, _hdg)
				local _u8 = eGMs.rotateVec2({x = 8.09375, y = -2.7929480300008}, _hdg)
				local _u9 = eGMs.rotateVec2({x = 4.484375, y = 1.3379113449992}, _hdg)
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-1",
													["type"] = "2B11 mortar",
													["y"] = _pos.z,
													["x"] = _pos.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },
											[2] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-2",
													["type"] = "HL_DSHK",
													["y"] = _pos.z - _u2.y,
													["x"] = _pos.x - _u2.x,
													["heading"] =_hdg + 5.4628806038141,
												  },
											[3] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-3",
													["type"] = "Land_Rover_101_FC",
													["y"] = _pos.z - _u3.y,
													["x"] = _pos.x - _u3.x,
													["heading"] =_hdg + 0.24434609719495,
												  },
											[4] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-4",
													["type"] = "Infantry AK Ins",
													["y"] = _pos.z - _u4.y,
													["x"] = _pos.x - _u4.x,
													["heading"] =_hdg + 1.7627825782064,
												  },
											[5] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-5",
													["type"] = "Infantry AK Ins",
													["y"] = _pos.z - _u5.y,
													["x"] = _pos.x - _u5.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,	  	  
													},
											[6] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-6",
													["type"] = "Infantry AK Ins",
													["y"] = _pos.z - _u6.y,
													["x"] = _pos.x - _u6.x,
													["heading"] =_hdg + 4.1364302550589,
												  },
											[7] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-7",
													["type"] = "Infantry AK Ins",
													["y"] = _pos.z - _u7.y,
													["x"] = _pos.x - _u7.x,
													["heading"] =_hdg + 1.9373154585323,
												  },
											[8] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-8",
													["type"] = "Infantry AK Ins",
													["y"] = _pos.z - _u8.y,
													["x"] = _pos.x - _u8.x,
													["heading"] =_hdg + 2.5830872059587,
												  },
											[9] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-9",
													["type"] = "Infantry AK Ins",
													["y"] = _pos.z - _u9.y,
													["x"] = _pos.x - _u9.x,
													["heading"] =_hdg + 3.8048176458287,
												  },
											},
								["name"] = "dynamic_insurgents_"..eGMs.redGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(81, Group.Category.GROUND, spawn_group)
			elseif _type == "ia03" then
				eGMs.redGroupCount = eGMs.redGroupCount + 1
				local _u2 = eGMs.rotateVec2({x = -3.7812484099995, y = 11.15625}, _hdg)
				local _u3 = eGMs.rotateVec2({x = -8.5937484099995, y = -1.810546875}, _hdg)
				local _u4 = eGMs.rotateVec2({x = -4.6875, y = -3.7792761550008}, _hdg)
				local _u5 = eGMs.rotateVec2({x = -4.78125, y = 4.6875207199992}, _hdg)
				local _u6 = eGMs.rotateVec2({x = 2.421875, y = 7.4043175949992}, _hdg)
				local _u7 = eGMs.rotateVec2({x = 1.75, y = -6.2773230300008}, _hdg)
				local _u8 = eGMs.rotateVec2({x = 8.09375, y = -2.7929480300008}, _hdg)
				local _u9 = eGMs.rotateVec2({x = 4.484375, y = 1.3379113449992}, _hdg)
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-1",
													["type"] = "2B11 mortar",
													["y"] = _pos.z,
													["x"] = _pos.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },
											[2] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-2",
													["type"] = "HL_DSHK",
													["y"] = _pos.z - _u2.y,
													["x"] = _pos.x - _u2.x,
													["heading"] =_hdg + 5.4628806038141,
												  },
											[3] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-3",
													["type"] = "Land_Rover_101_FC",
													["y"] = _pos.z - _u3.y,
													["x"] = _pos.x - _u3.x,
													["heading"] =_hdg + 0.24434609719495,
												  },
											[4] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-4",
													["type"] = "Infantry AK Ins",
													["y"] = _pos.z - _u4.y,
													["x"] = _pos.x - _u4.x,
													["heading"] =_hdg + 1.7627825782064,
												  },
											[5] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-5",
													["type"] = "Infantry AK Ins",
													["y"] = _pos.z - _u5.y,
													["x"] = _pos.x - _u5.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,	  	  
													},
											[6] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-6",
													["type"] = "SA-18 Igla manpad",
													["y"] = _pos.z - _u6.y,
													["x"] = _pos.x - _u6.x,
													["heading"] =_hdg + 4.1364302550589,
												  },
											[7] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-7",
													["type"] = "Infantry AK Ins",
													["y"] = _pos.z - _u7.y,
													["x"] = _pos.x - _u7.x,
													["heading"] =_hdg + 1.9373154585323,
												  },
											[8] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-8",
													["type"] = "Infantry AK Ins",
													["y"] = _pos.z - _u8.y,
													["x"] = _pos.x - _u8.x,
													["heading"] =_hdg + 2.5830872059587,
												  },
											[9] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-9",
													["type"] = "Infantry AK Ins",
													["y"] = _pos.z - _u9.y,
													["x"] = _pos.x - _u9.x,
													["heading"] =_hdg + 3.8048176458287,
												  },
											},
								["name"] = "dynamic_insurgents_"..eGMs.redGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(81, Group.Category.GROUND, spawn_group)
			elseif _type == "ia04" then
				eGMs.redGroupCount = eGMs.redGroupCount + 1
				local _u2 = eGMs.rotateVec2({x = -3.7812484099995, y = 11.15625}, _hdg)
				local _u3 = eGMs.rotateVec2({x = -8.5937484099995, y = -1.810546875}, _hdg)
				local _u4 = eGMs.rotateVec2({x = -4.6875, y = -3.7792761550008}, _hdg)
				local _u5 = eGMs.rotateVec2({x = -4.78125, y = 4.6875207199992}, _hdg)
				local _u6 = eGMs.rotateVec2({x = 2.421875, y = 7.4043175949992}, _hdg)
				local _u7 = eGMs.rotateVec2({x = 1.75, y = -6.2773230300008}, _hdg)
				local _u8 = eGMs.rotateVec2({x = 8.09375, y = -2.7929480300008}, _hdg)
				local _u9 = eGMs.rotateVec2({x = 4.484375, y = 1.3379113449992}, _hdg)
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-1",
													["type"] = "2B11 mortar",
													["y"] = _pos.z,
													["x"] = _pos.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },
											[2] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-2",
													["type"] = "HL_DSHK",
													["y"] = _pos.z - _u2.y,
													["x"] = _pos.x - _u2.x,
													["heading"] =_hdg + 5.4628806038141,
												  },
											[3] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-3",
													["type"] = "Land_Rover_101_FC",
													["y"] = _pos.z - _u3.y,
													["x"] = _pos.x - _u3.x,
													["heading"] =_hdg + 0.24434609719495,
												  },
											[4] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-4",
													["type"] = "Infantry AK Ins",
													["y"] = _pos.z - _u4.y,
													["x"] = _pos.x - _u4.x,
													["heading"] =_hdg + 1.7627825782064,
												  },
											[5] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-5",
													["type"] = "Infantry AK Ins",
													["y"] = _pos.z - _u5.y,
													["x"] = _pos.x - _u5.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,	  	  
													},
											[6] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-6",
													["type"] = "2B11 mortar",
													["y"] = _pos.z - _u6.y,
													["x"] = _pos.x - _u6.x,
													["heading"] =_hdg,
												  },
											[7] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-7",
													["type"] = "Infantry AK Ins",
													["y"] = _pos.z - _u7.y,
													["x"] = _pos.x - _u7.x,
													["heading"] =_hdg + 1.9373154585323,
												  },
											[8] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-8",
													["type"] = "2B11 mortar",
													["y"] = _pos.z - _u8.y,
													["x"] = _pos.x - _u8.x,
													["heading"] =_hdg,
												  },
											[9] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-9",
													["type"] = "SA-18 Igla manpad",
													["y"] = _pos.z - _u9.y,
													["x"] = _pos.x - _u9.x,
													["heading"] =_hdg + 3.8048176458287,
												  },
											},
								["name"] = "dynamic_insurgents_"..eGMs.redGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(81, Group.Category.GROUND, spawn_group)
			elseif _type == "isc1" and eGMs.allow_mods == true then
				eGMs.redGroupCount = eGMs.redGroupCount + 1
				local _u2 = eGMs.rotateVec2({x = 0.015625, y = -7.71484375}, _hdg)
				local _u3 = eGMs.rotateVec2({x = 0, y = -15.4296875}, _hdg)
				local _u4 = eGMs.rotateVec2({x = 3.4531254843459, y = -19.69335721443}, _hdg)
				local _u5 = eGMs.rotateVec2({x = 11.171875484346, y = -19.68945096443}, _hdg)
				local _u6 = eGMs.rotateVec2({x = 18.890625484346, y = -19.68359158943}, _hdg)
				local _u7 = eGMs.rotateVec2({x = 23.15625, y = -16.23828125}, _hdg)
				local _u8 = eGMs.rotateVec2({x = 23.15625, y = -8.513671875}, _hdg)
				local _u9 = eGMs.rotateVec2({x = 23.15625, y = -0.80078125}, _hdg)
				local _u10 = eGMs.rotateVec2({x = 23.140625, y = 6.9140625}, _hdg)
				local _u11 = eGMs.rotateVec2({x = 18.890625484346, y = 10.35547091057}, _hdg)
				local _u12 = eGMs.rotateVec2({x = 11.171875484346, y = 10.35547091057}, _hdg)
				local _u13 = eGMs.rotateVec2({x = 3.4531254843459, y = 10.33398653557}, _hdg)
				local _u14 = eGMs.rotateVec2({x = 4.2812504843459, y = 3.4609396605701}, _hdg)
				local _u15 = eGMs.rotateVec2({x = 16.843750484346, y = -13.02734158943}, _hdg)
				local _u16 = eGMs.rotateVec2({x = 4.703125, y = -10.271484375}, _hdg)
				local _u17 = eGMs.rotateVec2({x = 1.7812504843459, y = 1.6777365355701}, _hdg)
				local _u18 = eGMs.rotateVec2({x = 11.359375484346, y = -10.525390624691}, _hdg)
				local _u19 = eGMs.rotateVec2({x = 12.656250484375, y = -0.26367187509095}, _hdg)
				local _u20 = eGMs.rotateVec2({x = 19.953125484317, y = -1.9296874998872}, _hdg)
				local _u21 = eGMs.rotateVec2({x = 20.890625, y = -15.65429471443}, _hdg)
				local _u22 = eGMs.rotateVec2({x = 4.90625, y = -0.54491971442985}, _hdg)
				local _u23 = eGMs.rotateVec2({x = 11.515625, y = -15.92773221443}, _hdg)
				local _u24 = eGMs.rotateVec2({x = 10.78125, y = -5.2207009644299}, _hdg)
				local _u25 = eGMs.rotateVec2({x = 16.1875, y = -7.3574197144299}, _hdg)
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-1",
													["type"] = "HESCO10_pile",
													["y"] = _pos.z,
													["x"] = _pos.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },
											[2] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-2",
													["type"] = "HESCO10_pile",
													["y"] = _pos.z - _u2.y,
													["x"] = _pos.x - _u2.x,
													["heading"] =_hdg,
												  },
											[3] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-3",
													["type"] = "HESCO10_pile",
													["y"] = _pos.z - _u3.y,
													["x"] = _pos.x - _u3.x,
													["heading"] =_hdg,
												  },
											[4] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-4",
													["type"] = "HESCO10_pile",
													["y"] = _pos.z - _u4.y,
													["x"] = _pos.x - _u4.x,
													["heading"] =_hdg + 1.5707963705063,
												  },
											[5] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-5",
													["type"] = "HESCO10_pile",
													["y"] = _pos.z - _u5.y,
													["x"] = _pos.x - _u5.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg + 1.5707963705063,	  	  
													},
											[6] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-6",
													["type"] = "HESCO10_pile",
													["y"] = _pos.z - _u6.y,
													["x"] = _pos.x - _u6.x,
													["heading"] =_hdg + 1.5707963705063,
												  },
											[7] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-7",
													["type"] = "HESCO10_pile",
													["y"] = _pos.z - _u7.y,
													["x"] = _pos.x - _u7.x,
													["heading"] =_hdg + 3.1415927410126,
												  },
											[8] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-8",
													["type"] = "HESCO10_pile",
													["y"] = _pos.z - _u8.y,
													["x"] = _pos.x - _u8.x,
													["heading"] =_hdg + 3.1415927410126,
												  },
											[9] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-9",
													["type"] = "HESCO10_pile",
													["y"] = _pos.z - _u9.y,
													["x"] = _pos.x - _u9.x,
													["heading"] =_hdg + 3.1415927410126,
												  },
											[10] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-10",
													["type"] = "HESCO10_pile",
													["y"] = _pos.z - _u10.y,
													["x"] = _pos.x - _u10.x,
													["heading"] =_hdg + 3.1415927410126,
												  },
											[11] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-11",
													["type"] = "HESCO10_pile",
													["y"] = _pos.z - _u11.y,
													["x"] = _pos.x - _u11.x,
													["heading"] =_hdg + 4.7123889923096,
												  },
											[12] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-12",
													["type"] = "HESCO10_pile",
													["y"] = _pos.z - _u12.y,
													["x"] = _pos.x - _u12.x,
													["heading"] =_hdg + 4.7123889923096,
												  },
											[13] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-13",
													["type"] = "HESCO10_pile",
													["y"] = _pos.z - _u13.y,
													["x"] = _pos.x - _u13.x,
													["heading"] =_hdg + 4.7123889923096,
												  },
											[14] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-14",
													["type"] = "HESCO10_pile",
													["y"] = _pos.z - _u14.y,
													["x"] = _pos.x - _u14.x,
													["heading"] =_hdg + 4.7123889923096,
												  },
											[15] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-15",
													["type"] = "ZU-23 Insurgent",
													["y"] = _pos.z - _u15.y,
													["x"] = _pos.x - _u15.x,
													["heading"] =_hdg + 4.7123889923096,
												  },
											[16] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-16",
													["type"] = "tente_desert",
													["y"] = _pos.z - _u16.y,
													["x"] = _pos.x - _u16.x,
													["heading"] =_hdg,
												  },
											[17] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-17",
													["type"] = "house2arm",
													["y"] = _pos.z - _u17.y,
													["x"] = _pos.x - _u17.x,
													["heading"] =_hdg + 4.7123889923096,
												  },
											[18] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-18",
													["type"] = "HL_DSHK",
													["y"] = _pos.z - _u18.y,
													["x"] = _pos.x - _u18.x,
													["heading"] =_hdg + 1.5707963705053,
												  },
											[19] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-19",
													["type"] = "HL_DSHK",
													["y"] = _pos.z - _u19.y,
													["x"] = _pos.x - _u19.x,
													["heading"] =_hdg + 1.9547687697117,
												  },
											[20] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-20",
													["type"] = "Ural-375",
													["y"] = _pos.z - _u20.y,
													["x"] = _pos.x - _u20.x,
													["heading"] =_hdg + 1.8151424117854,
												  },
											[21] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-21",
													["type"] = "Infantry AK Ins",
													["y"] = _pos.z -_u21.y,
													["x"] = _pos.x -_u21.x,
													["heading"] =_hdg + 4.4156827965486,
												  },
											[22] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-22",
													["type"] = "Infantry AK Ins",
													["y"] = _pos.z -_u22.y,
													["x"] = _pos.x -_u22.x,
													["heading"] =_hdg + 4.4854960567514,
												  },
											[23] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-23",
													["type"] = "Infantry AK Ins",
													["y"] = _pos.z - _u23.y,
													["x"] = _pos.x - _u23.x,
													["heading"] =_hdg + 2.2165682313928,
												  },
											[24] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-24",
													["type"] = "Infantry AK Ins",
													["y"] = _pos.z - _u24.y,
													["x"] = _pos.x - _u24.x,
													["heading"] =_hdg + 3.2288591827361,
												  },
											[25] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-25",
													["type"] = "SA-18 Igla manpad",
													["y"] = _pos.z - _u25.y,
													["x"] = _pos.x - _u25.x,
													["heading"] =_hdg + 3.2288591827361,
												  },
											},
								["name"] = "dynamic_insurgents_"..eGMs.redGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(81, Group.Category.GROUND, spawn_group)
			elseif _type == "irb1" and eGMs.allow_mods == true then
				eGMs.redGroupCount = eGMs.redGroupCount + 1
				local _u2 = eGMs.rotateVec2({x = -5.1250000002328, y = -11.863281249356}, _hdg)
				local _u3 = eGMs.rotateVec2({x = -7.4843749996508, y = 12.64648437528}, _hdg)
				local _u4 = eGMs.rotateVec2({x = -4.9062441856659, y = 2.5898437502838}, _hdg)
				local _u5 = eGMs.rotateVec2({x = -4.9374941856659, y = -1.8105468747162}, _hdg)
				local _u6 = eGMs.rotateVec2({x = 6.3749999995052, y = -0.89062499942884}, _hdg)
				local _u7 = eGMs.rotateVec2({x = -10.187494185666, y = -10.619150338247}, _hdg)
				local _u8 = eGMs.rotateVec2({x = -10.984369185666, y = 10.052724661753}, _hdg)
				local _u9 = eGMs.rotateVec2({x = -8.1249941856659, y = -9.722665963247}, _hdg)
				local _u10 = eGMs.rotateVec2({x = -6.3437441856659, y = 9.146474661753}, _hdg)
				local _u11 = eGMs.rotateVec2({x = -5.3437441856659, y = -8.011728463247}, _hdg)
				local _u12 = eGMs.rotateVec2({x = -4.9374941856659, y = 0.36913091175302}, _hdg)
				local _u13 = eGMs.rotateVec2({x = -4.8749941856659, y = -5.804697213247}, _hdg)
				local _u14 = eGMs.rotateVec2({x = -4.7656191856659, y = 6.822255911753}, _hdg)
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-1",
													["type"] = "HL_DSHK",
													["y"] = _pos.z,
													["x"] = _pos.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg + 0.4886922434507,
												  },
											[2] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-2",
													["type"] = "HL_DSHK",
													["y"] = _pos.z - _u2.y,
													["x"] = _pos.x - _u2.x,
													["heading"] =_hdg + 5.4105205652791,
												  },
											[3] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-3",
													["type"] = "HL_DSHK",
													["y"] = _pos.z - _u3.y,
													["x"] = _pos.x - _u3.x,
													["heading"] =_hdg + 0.94247783864084,
												  },
											[4] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-4",
													["type"] = "barriere",
													["y"] = _pos.z - _u4.y,
													["x"] = _pos.x - _u4.x,
													["heading"] =_hdg,
												  },
											[5] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-5",
													["type"] = "barriere",
													["y"] = _pos.z - _u5.y,
													["x"] = _pos.x - _u5.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,	  	  
													},
											[6] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-6",
													["type"] = "Land_Rover_101_FC",
													["y"] = _pos.z - _u6.y,
													["x"] = _pos.x - _u6.x,
													["heading"] =_hdg + 5.724679902225,
												  },
											[7] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-7",
													["type"] = "Infantry AK Ins",
													["y"] = _pos.z - _u7.y,
													["x"] = _pos.x - _u7.x,
													["heading"] =_hdg + 5.7246799416817,
												  },
											[8] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-8",
													["type"] = "Infantry AK Ins",
													["y"] = _pos.z - _u8.y,
													["x"] = _pos.x - _u8.x,
													["heading"] =_hdg + 1.0122909612971,
												  },
											[9] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-9",
													["type"] = "Infantry AK Ins",
													["y"] = _pos.z - _u9.y,
													["x"] = _pos.x - _u9.x,
													["heading"] =_hdg + 5.2359876565238,
												  },
											[10] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-10",
													["type"] = "Infantry AK Ins",
													["y"] = _pos.z - _u10.y,
													["x"] = _pos.x - _u10.x,
													["heading"] =_hdg + 0.90757116722526,
												  },
											[11] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-11",
													["type"] = "Infantry AK Ins",
													["y"] = _pos.z - _u11.y,
													["x"] = _pos.x - _u11.x,
													["heading"] =_hdg + 6.2133722312965,
												  },
											[12] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-12",
													["type"] = "Infantry AK Ins",
													["y"] = _pos.z - _u12.y,
													["x"] = _pos.x - _u12.x,
													["heading"] =_hdg,
												  },
											[13] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-13",
													["type"] = "Infantry AK Ins",
													["y"] = _pos.z - _u13.y,
													["x"] = _pos.x - _u13.x,
													["heading"] =_hdg + 5.9690260980311,
												  },
											[14] = {
													["name"] = "dynamic_insurgents_"..eGMs.redGroupCount.."-14",
													["type"] = "Infantry AK Ins",
													["y"] = _pos.z - _u14.y,
													["x"] = _pos.x - _u14.x,
													["heading"] =_hdg + 0.31415926583585,
												  },
											},
								["name"] = "dynamic_insurgents_"..eGMs.redGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(81, Group.Category.GROUND, spawn_group)
			end
		end

----------------------------------------------------------------			
--[[		elseif _type == "j1" then
		spawn_group = {
							["hidden"] = false,
							["units"] = {
										[1] = {
												["name"] = "JTAC 1-1",
												["type"] = "Stinger manpad GRG",
												["y"] = _pos.z,
												["x"] = _pos.x,
												["playerCanDrive"] = true,
												["heading"] =_hdg,
											  },	  	  
										},
							["name"] = "JTAC 1",
							["task"] = "Ground Nothing",		
							}
			coalition.addGroup(82, Group.Category.GROUND, spawn_group)
		elseif _type == "j2" then
			spawn_group = {
							["hidden"] = false,
							["units"] = {
										[1] = {
												["name"] = "JTAC 2-1",
												["type"] = "Stinger manpad GRG",
												["y"] = _pos.z,
												["x"] = _pos.x,
												["playerCanDrive"] = true,
												["heading"] =_hdg,
											  },	  	  
										},
							["name"] = "JTAC 2",
							["task"] = "Ground Nothing",		
							}
			coalition.addGroup(82, Group.Category.GROUND, spawn_group)
----------------------------------------------------------------]]			

--	BLUFOR			
		if eGMs.allow_BLUFOR == true then
			if _type == "bc01" then
			eGMs.bluGroupCount = eGMs.bluGroupCount + 1
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-1",
													["type"] = "M1043 HMMWV Armament",
													["y"] = _pos.z,
													["x"] = _pos.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },
											[2] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-2",
													["type"] = "M1043 HMMWV Armament",
													["y"] = _pos.z - (15 * math.sin(_hdg)),
													["x"] = _pos.x - (15 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[3] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-3",
													["type"] = "M 818",
													["y"] = _pos.z - (30 * math.sin(_hdg)),
													["x"] = _pos.x - (30 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[4] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-4",
													["type"] = "M 818",
													["y"] = _pos.z - (45 * math.sin(_hdg)),
													["x"] = _pos.x - (45 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											[5] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-5",
													["type"] = "M 818",
													["y"] = _pos.z - (60 * math.sin(_hdg)),
													["x"] = _pos.x - (60 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[6] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-6",
													["type"] = "M 818",
													["y"] = _pos.z - (75 * math.sin(_hdg)),
													["x"] = _pos.x - (75 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											[7] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-7",
													["type"] = "M1043 HMMWV Armament",
													["y"] = _pos.z - (90 * math.sin(_hdg)),
													["x"] = _pos.x - (90 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											[8] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-8",
													["type"] = "M1043 HMMWV Armament",
													["y"] = _pos.z - (105 * math.sin(_hdg)),
													["x"] = _pos.x - (105 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											},
								["name"] = "dynamic_NATO_"..eGMs.bluGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(80, Group.Category.GROUND, spawn_group)
			elseif _type == "bc02" and eGMs.allow_modern_red == true then
				eGMs.bluGroupCount = eGMs.bluGroupCount + 1
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-1",
													["type"] = "M1126 Stryker ICV",
													["y"] = _pos.z,
													["x"] = _pos.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },
											[2] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-2",
													["type"] = "M1126 Stryker ICV",
													["y"] = _pos.z - (15 * math.sin(_hdg)),
													["x"] = _pos.x - (15 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[3] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-3",
													["type"] = "M 818",
													["y"] = _pos.z - (30 * math.sin(_hdg)),
													["x"] = _pos.x - (30 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[4] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-4",
													["type"] = "M 818",
													["y"] = _pos.z - (45 * math.sin(_hdg)),
													["x"] = _pos.x - (45 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											[5] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-5",
													["type"] = "M 818",
													["y"] = _pos.z - (60 * math.sin(_hdg)),
													["x"] = _pos.x - (60 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[6] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-6",
													["type"] = "M 818",
													["y"] = _pos.z - (75 * math.sin(_hdg)),
													["x"] = _pos.x - (75 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											[7] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-7",
													["type"] = "M1126 Stryker ICV",
													["y"] = _pos.z - (90 * math.sin(_hdg)),
													["x"] = _pos.x - (90 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											[8] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-8",
													["type"] = "M1126 Stryker ICV",
													["y"] = _pos.z - (105 * math.sin(_hdg)),
													["x"] = _pos.x - (105 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											},
								["name"] = "dynamic_NATO_"..eGMs.bluGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(80, Group.Category.GROUND, spawn_group)
			elseif _type == "bc03" and eGMs.allow_modern_red == true then
				eGMs.bluGroupCount = eGMs.bluGroupCount + 1
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-1",
													["type"] = "M1043 HMMWV Armament",
													["y"] = _pos.z,
													["x"] = _pos.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },
											[2] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-2",
													["type"] = "M1043 HMMWV Armament",
													["y"] = _pos.z - (15 * math.sin(_hdg)),
													["x"] = _pos.x - (15 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[3] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-3",
													["type"] = "M 818",
													["y"] = _pos.z - (30 * math.sin(_hdg)),
													["x"] = _pos.x - (30 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[4] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-4",
													["type"] = "M 818",
													["y"] = _pos.z - (45 * math.sin(_hdg)),
													["x"] = _pos.x - (45 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											[5] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-5",
													["type"] = "M 818",
													["y"] = _pos.z - (60 * math.sin(_hdg)),
													["x"] = _pos.x - (60 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[6] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-6",
													["type"] = "M 818",
													["y"] = _pos.z - (75 * math.sin(_hdg)),
													["x"] = _pos.x - (75 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											[7] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-7",
													["type"] = "M1097 Avenger",
													["y"] = _pos.z - (90 * math.sin(_hdg)),
													["x"] = _pos.x - (90 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											[8] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-8",
													["type"] = "M 818",
													["y"] = _pos.z - (105 * math.sin(_hdg)),
													["x"] = _pos.x - (105 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											[9] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-9",
													["type"] = "M 818",
													["y"] = _pos.z - (120 * math.sin(_hdg)),
													["x"] = _pos.x - (120 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											[10] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-10",
													["type"] = "M 818",
													["y"] = _pos.z - (135 * math.sin(_hdg)),
													["x"] = _pos.x - (135 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											[11] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-11",
													["type"] = "M978 HEMTT Tanker",
													["y"] = _pos.z - (150 * math.sin(_hdg)),
													["x"] = _pos.x - (150 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											[12] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-12",
													["type"] = "M978 HEMTT Tanker",
													["y"] = _pos.z - (165 * math.sin(_hdg)),
													["x"] = _pos.x - (165 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											[13] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-13",
													["type"] = "M978 HEMTT Tanker",
													["y"] = _pos.z - (180 * math.sin(_hdg)),
													["x"] = _pos.x - (180 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											[14] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-14",
													["type"] = "M1043 HMMWV Armament",
													["y"] = _pos.z - (195 * math.sin(_hdg)),
													["x"] = _pos.x - (195 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											[15] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-15",
													["type"] = "M1043 HMMWV Armament",
													["y"] = _pos.z - (205 * math.sin(_hdg)),
													["x"] = _pos.x - (205 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											},
								["name"] = "dynamic_NATO_"..eGMs.bluGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(80, Group.Category.GROUND, spawn_group)
			elseif _type == "bc04" and eGMs.allow_modern_red == true then
				eGMs.bluGroupCount = eGMs.bluGroupCount + 1
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-1",
													["type"] = "M1126 Stryker ICV",
													["y"] = _pos.z,
													["x"] = _pos.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },
											[2] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-2",
													["type"] = "M1043 HMMWV Armament",
													["y"] = _pos.z - (15 * math.sin(_hdg)),
													["x"] = _pos.x - (15 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[3] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-3",
													["type"] = "M 818",
													["y"] = _pos.z - (30 * math.sin(_hdg)),
													["x"] = _pos.x - (30 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[4] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-4",
													["type"] = "M 818",
													["y"] = _pos.z - (45 * math.sin(_hdg)),
													["x"] = _pos.x - (45 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											[5] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-5",
													["type"] = "M 818",
													["y"] = _pos.z - (60 * math.sin(_hdg)),
													["x"] = _pos.x - (60 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[6] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-6",
													["type"] = "M 818",
													["y"] = _pos.z - (75 * math.sin(_hdg)),
													["x"] = _pos.x - (75 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											[7] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-7",
													["type"] = "M1097 Avenger",
													["y"] = _pos.z - (90 * math.sin(_hdg)),
													["x"] = _pos.x - (90 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											[8] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-8",
													["type"] = "M 818",
													["y"] = _pos.z - (105 * math.sin(_hdg)),
													["x"] = _pos.x - (105 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											[9] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-9",
													["type"] = "M 818",
													["y"] = _pos.z - (120 * math.sin(_hdg)),
													["x"] = _pos.x - (120 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											[10] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-10",
													["type"] = "M 818",
													["y"] = _pos.z - (135 * math.sin(_hdg)),
													["x"] = _pos.x - (135 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											[11] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-11",
													["type"] = "M978 HEMTT Tanker",
													["y"] = _pos.z - (150 * math.sin(_hdg)),
													["x"] = _pos.x - (150 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											[12] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-12",
													["type"] = "M978 HEMTT Tanker",
													["y"] = _pos.z - (165 * math.sin(_hdg)),
													["x"] = _pos.x - (165 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											[13] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-13",
													["type"] = "M978 HEMTT Tanker",
													["y"] = _pos.z - (180 * math.sin(_hdg)),
													["x"] = _pos.x - (180 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											[14] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-14",
													["type"] = "M1126 Stryker ICV",
													["y"] = _pos.z - (195 * math.sin(_hdg)),
													["x"] = _pos.x - (195 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											[15] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-15",
													["type"] = "M1126 Stryker ICV",
													["y"] = _pos.z - (205 * math.sin(_hdg)),
													["x"] = _pos.x - (205 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											},
								["name"] = "dynamic_NATO_"..eGMs.bluGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(80, Group.Category.GROUND, spawn_group)
			elseif _type == "bc05" and eGMs.allow_modern_red == true then
				eGMs.bluGroupCount = eGMs.bluGroupCount + 1
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-1",
													["type"] = "M1043 HMMWV Armament",
													["y"] = _pos.z,
													["x"] = _pos.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },
											[2] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-2",
													["type"] = "M1043 HMMWV Armament",
													["y"] = _pos.z - (15 * math.sin(_hdg)),
													["x"] = _pos.x - (15 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[3] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-3",
													["type"] = "M 818",
													["y"] = _pos.z - (30 * math.sin(_hdg)),
													["x"] = _pos.x - (30 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[4] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-4",
													["type"] = "M 818",
													["y"] = _pos.z - (45 * math.sin(_hdg)),
													["x"] = _pos.x - (45 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											[5] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-5",
													["type"] = "M 818",
													["y"] = _pos.z - (60 * math.sin(_hdg)),
													["x"] = _pos.x - (60 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[6] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-6",
													["type"] = "M 818",
													["y"] = _pos.z - (75 * math.sin(_hdg)),
													["x"] = _pos.x - (75 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											[7] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-7",
													["type"] = "M48 Chaparral",
													["y"] = _pos.z - (90 * math.sin(_hdg)),
													["x"] = _pos.x - (90 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											[8] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-8",
													["type"] = "M 818",
													["y"] = _pos.z - (105 * math.sin(_hdg)),
													["x"] = _pos.x - (105 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											[9] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-9",
													["type"] = "M 818",
													["y"] = _pos.z - (120 * math.sin(_hdg)),
													["x"] = _pos.x - (120 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											[10] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-10",
													["type"] = "M 818",
													["y"] = _pos.z - (135 * math.sin(_hdg)),
													["x"] = _pos.x - (135 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											[11] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-11",
													["type"] = "M 818",
													["y"] = _pos.z - (150 * math.sin(_hdg)),
													["x"] = _pos.x - (150 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											[12] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-12",
													["type"] = "M 818",
													["y"] = _pos.z - (165 * math.sin(_hdg)),
													["x"] = _pos.x - (165 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											[13] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-13",
													["type"] = "M 818",
													["y"] = _pos.z - (180 * math.sin(_hdg)),
													["x"] = _pos.x - (180 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											[14] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-14",
													["type"] = "M1043 HMMWV Armament",
													["y"] = _pos.z - (195 * math.sin(_hdg)),
													["x"] = _pos.x - (195 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											[15] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-15",
													["type"] = "M1043 HMMWV Armament",
													["y"] = _pos.z - (205 * math.sin(_hdg)),
													["x"] = _pos.x - (205 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											},
								["name"] = "dynamic_NATO_"..eGMs.bluGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(80, Group.Category.GROUND, spawn_group)
			elseif _type == "bc06" and eGMs.allow_modern_red == true then
				eGMs.bluGroupCount = eGMs.bluGroupCount + 1
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-1",
													["type"] = "M-113",
													["y"] = _pos.z,
													["x"] = _pos.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },
											[2] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-2",
													["type"] = "M-113",
													["y"] = _pos.z - (15 * math.sin(_hdg)),
													["x"] = _pos.x - (15 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[3] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-3",
													["type"] = "M 818",
													["y"] = _pos.z - (30 * math.sin(_hdg)),
													["x"] = _pos.x - (30 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[4] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-4",
													["type"] = "M 818",
													["y"] = _pos.z - (45 * math.sin(_hdg)),
													["x"] = _pos.x - (45 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											[5] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-5",
													["type"] = "M 818",
													["y"] = _pos.z - (60 * math.sin(_hdg)),
													["x"] = _pos.x - (60 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[6] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-6",
													["type"] = "M 818",
													["y"] = _pos.z - (75 * math.sin(_hdg)),
													["x"] = _pos.x - (75 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											[7] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-7",
													["type"] = "M48 Chaparral",
													["y"] = _pos.z - (90 * math.sin(_hdg)),
													["x"] = _pos.x - (90 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											[8] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-8",
													["type"] = "M 818",
													["y"] = _pos.z - (105 * math.sin(_hdg)),
													["x"] = _pos.x - (105 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											[9] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-9",
													["type"] = "M 818",
													["y"] = _pos.z - (120 * math.sin(_hdg)),
													["x"] = _pos.x - (120 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											[10] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-10",
													["type"] = "M 818",
													["y"] = _pos.z - (135 * math.sin(_hdg)),
													["x"] = _pos.x - (135 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											[11] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-11",
													["type"] = "M 818",
													["y"] = _pos.z - (150 * math.sin(_hdg)),
													["x"] = _pos.x - (150 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											[12] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-12",
													["type"] = "M 818",
													["y"] = _pos.z - (165 * math.sin(_hdg)),
													["x"] = _pos.x - (165 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											[13] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-13",
													["type"] = "M 818",
													["y"] = _pos.z - (180 * math.sin(_hdg)),
													["x"] = _pos.x - (180 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											[14] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-14",
													["type"] = "M-113",
													["y"] = _pos.z - (195 * math.sin(_hdg)),
													["x"] = _pos.x - (195 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											[15] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-15",
													["type"] = "M-113",
													["y"] = _pos.z - (205 * math.sin(_hdg)),
													["x"] = _pos.x - (205 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											},
								["name"] = "dynamic_NATO_"..eGMs.bluGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(80, Group.Category.GROUND, spawn_group)	
			elseif _type == "bc07" and eGMs.allow_modern_red == true then
				eGMs.bluGroupCount = eGMs.bluGroupCount + 1
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-1",
													["type"] = "M1043 HMMWV Armament",
													["y"] = _pos.z,
													["x"] = _pos.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },
											[2] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-2",
													["type"] = "M1043 HMMWV Armament",
													["y"] = _pos.z - (15 * math.sin(_hdg)),
													["x"] = _pos.x - (15 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[3] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-3",
													["type"] = "M 818",
													["y"] = _pos.z - (30 * math.sin(_hdg)),
													["x"] = _pos.x - (30 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[4] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-4",
													["type"] = "M 818",
													["y"] = _pos.z - (45 * math.sin(_hdg)),
													["x"] = _pos.x - (45 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											[5] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-5",
													["type"] = "M 818",
													["y"] = _pos.z - (60 * math.sin(_hdg)),
													["x"] = _pos.x - (60 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[6] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-6",
													["type"] = "M 818",
													["y"] = _pos.z - (75 * math.sin(_hdg)),
													["x"] = _pos.x - (75 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											[7] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-7",
													["type"] = "Vulcan",
													["y"] = _pos.z - (90 * math.sin(_hdg)),
													["x"] = _pos.x - (90 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											[8] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-8",
													["type"] = "M 818",
													["y"] = _pos.z - (105 * math.sin(_hdg)),
													["x"] = _pos.x - (105 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											[9] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-9",
													["type"] = "M 818",
													["y"] = _pos.z - (120 * math.sin(_hdg)),
													["x"] = _pos.x - (120 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											[10] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-10",
													["type"] = "M 818",
													["y"] = _pos.z - (135 * math.sin(_hdg)),
													["x"] = _pos.x - (135 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											[11] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-11",
													["type"] = "M 818",
													["y"] = _pos.z - (150 * math.sin(_hdg)),
													["x"] = _pos.x - (150 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											[12] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-12",
													["type"] = "M 818",
													["y"] = _pos.z - (165 * math.sin(_hdg)),
													["x"] = _pos.x - (165 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											[13] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-13",
													["type"] = "M 818",
													["y"] = _pos.z - (180 * math.sin(_hdg)),
													["x"] = _pos.x - (180 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											[14] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-14",
													["type"] = "M1043 HMMWV Armament",
													["y"] = _pos.z - (195 * math.sin(_hdg)),
													["x"] = _pos.x - (195 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											[15] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-15",
													["type"] = "M1043 HMMWV Armament",
													["y"] = _pos.z - (205 * math.sin(_hdg)),
													["x"] = _pos.x - (205 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											},
								["name"] = "dynamic_NATO_"..eGMs.bluGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(80, Group.Category.GROUND, spawn_group)
			elseif _type == "bc08" and eGMs.allow_modern_red == true then
				eGMs.bluGroupCount = eGMs.bluGroupCount + 1
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-1",
													["type"] = "M-113",
													["y"] = _pos.z,
													["x"] = _pos.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },
											[2] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-2",
													["type"] = "M-113",
													["y"] = _pos.z - (15 * math.sin(_hdg)),
													["x"] = _pos.x - (15 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[3] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-3",
													["type"] = "M 818",
													["y"] = _pos.z - (30 * math.sin(_hdg)),
													["x"] = _pos.x - (30 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[4] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-4",
													["type"] = "M 818",
													["y"] = _pos.z - (45 * math.sin(_hdg)),
													["x"] = _pos.x - (45 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											[5] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-5",
													["type"] = "M 818",
													["y"] = _pos.z - (60 * math.sin(_hdg)),
													["x"] = _pos.x - (60 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[6] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-6",
													["type"] = "M 818",
													["y"] = _pos.z - (75 * math.sin(_hdg)),
													["x"] = _pos.x - (75 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											[7] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-7",
													["type"] = "Vulcan",
													["y"] = _pos.z - (90 * math.sin(_hdg)),
													["x"] = _pos.x - (90 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											[8] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-8",
													["type"] = "M 818",
													["y"] = _pos.z - (105 * math.sin(_hdg)),
													["x"] = _pos.x - (105 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											[9] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-9",
													["type"] = "M 818",
													["y"] = _pos.z - (120 * math.sin(_hdg)),
													["x"] = _pos.x - (120 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											[10] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-10",
													["type"] = "M 818",
													["y"] = _pos.z - (135 * math.sin(_hdg)),
													["x"] = _pos.x - (135 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											[11] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-11",
													["type"] = "M 818",
													["y"] = _pos.z - (150 * math.sin(_hdg)),
													["x"] = _pos.x - (150 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											[12] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-12",
													["type"] = "M 818",
													["y"] = _pos.z - (165 * math.sin(_hdg)),
													["x"] = _pos.x - (165 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											[13] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-13",
													["type"] = "M 818",
													["y"] = _pos.z - (180 * math.sin(_hdg)),
													["x"] = _pos.x - (180 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											[14] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-14",
													["type"] = "M-113",
													["y"] = _pos.z - (195 * math.sin(_hdg)),
													["x"] = _pos.x - (195 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											[15] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-15",
													["type"] = "M-113",
													["y"] = _pos.z - (205 * math.sin(_hdg)),
													["x"] = _pos.x - (205 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											},
								["name"] = "dynamic_NATO_"..eGMs.bluGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(80, Group.Category.GROUND, spawn_group)
			elseif _type == "bp01" then
				eGMs.bluGroupCount = eGMs.bluGroupCount + 1
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-1",
													["type"] = "M1043 HMMWV Armament",
													["y"] = _pos.z,
													["x"] = _pos.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },
											[2] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-2",
													["type"] = "M1043 HMMWV Armament",
													["y"] = _pos.z - (15 * math.sin(_hdg)),
													["x"] = _pos.x - (15 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[3] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-3",
													["type"] = "M1043 HMMWV Armament",
													["y"] = _pos.z - (30 * math.sin(_hdg)),
													["x"] = _pos.x - (30 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[4] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-4",
													["type"] = "M1043 HMMWV Armament",
													["y"] = _pos.z - (45 * math.sin(_hdg)),
													["x"] = _pos.x - (45 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											},
								["name"] = "dynamic_NATO_"..eGMs.bluGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(80, Group.Category.GROUND, spawn_group)
			elseif _type == "bp02" and eGMs.allow_modern_red == true then
				eGMs.bluGroupCount = eGMs.bluGroupCount + 1
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-1",
													["type"] = "M1126 Stryker ICV",
													["y"] = _pos.z,
													["x"] = _pos.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },
											[2] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-2",
													["type"] = "M1126 Stryker ICV",
													["y"] = _pos.z - (15 * math.sin(_hdg)),
													["x"] = _pos.x - (15 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[3] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-3",
													["type"] = "M1126 Stryker ICV",
													["y"] = _pos.z - (30 * math.sin(_hdg)),
													["x"] = _pos.x - (30 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[4] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-4",
													["type"] = "M1126 Stryker ICV",
													["y"] = _pos.z - (45 * math.sin(_hdg)),
													["x"] = _pos.x - (45 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											},
								["name"] = "dynamic_NATO_"..eGMs.bluGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(80, Group.Category.GROUND, spawn_group)
			elseif _type == "bp03" and eGMs.allow_modern_red == true then
				eGMs.bluGroupCount = eGMs.bluGroupCount + 1
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-1",
													["type"] = "M1126 Stryker ICV",
													["y"] = _pos.z,
													["x"] = _pos.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },
											[2] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-2",
													["type"] = "M1126 Stryker ICV",
													["y"] = _pos.z - (15 * math.sin(_hdg)),
													["x"] = _pos.x - (15 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[3] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-3",
													["type"] = "M1128 Stryker MGS",
													["y"] = _pos.z - (30 * math.sin(_hdg)),
													["x"] = _pos.x - (30 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[4] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-4",
													["type"] = "M1126 Stryker ICV",
													["y"] = _pos.z - (45 * math.sin(_hdg)),
													["x"] = _pos.x - (45 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											},
								["name"] = "dynamic_NATO_"..eGMs.bluGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(80, Group.Category.GROUND, spawn_group)
			elseif _type == "bp04" and eGMs.allow_modern_red == true then
				eGMs.bluGroupCount = eGMs.bluGroupCount + 1
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-1",
													["type"] = "M1126 Stryker ICV",
													["y"] = _pos.z,
													["x"] = _pos.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },
											[2] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-2",
													["type"] = "M1126 Stryker ICV",
													["y"] = _pos.z - (15 * math.sin(_hdg)),
													["x"] = _pos.x - (15 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[3] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-3",
													["type"] = "M1134 Stryker ATGM",
													["y"] = _pos.z - (30 * math.sin(_hdg)),
													["x"] = _pos.x - (30 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[4] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-4",
													["type"] = "M1126 Stryker ICV",
													["y"] = _pos.z - (45 * math.sin(_hdg)),
													["x"] = _pos.x - (45 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											},
								["name"] = "dynamic_NATO_"..eGMs.bluGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(80, Group.Category.GROUND, spawn_group)
			elseif _type == "bp05" and eGMs.allow_modern_red == true then
				eGMs.bluGroupCount = eGMs.bluGroupCount + 1
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-1",
													["type"] = "M-113",
													["y"] = _pos.z,
													["x"] = _pos.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },
											[2] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-2",
													["type"] = "M-113",
													["y"] = _pos.z - (15 * math.sin(_hdg)),
													["x"] = _pos.x - (15 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[3] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-3",
													["type"] = "M-113",
													["y"] = _pos.z - (30 * math.sin(_hdg)),
													["x"] = _pos.x - (30 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[4] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-4",
													["type"] = "M-113",
													["y"] = _pos.z - (45 * math.sin(_hdg)),
													["x"] = _pos.x - (45 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											},
								["name"] = "dynamic_NATO_"..eGMs.bluGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(80, Group.Category.GROUND, spawn_group)	
			elseif _type == "bp06" and eGMs.allow_modern_red == true then
				eGMs.bluGroupCount = eGMs.bluGroupCount + 1
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-1",
													["type"] = "M-113",
													["y"] = _pos.z,
													["x"] = _pos.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },
											[2] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-2",
													["type"] = "M-113",
													["y"] = _pos.z - (15 * math.sin(_hdg)),
													["x"] = _pos.x - (15 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[3] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-3",
													["type"] = "Vulcan",
													["y"] = _pos.z - (30 * math.sin(_hdg)),
													["x"] = _pos.x - (30 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[4] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-4",
													["type"] = "M-113",
													["y"] = _pos.z - (45 * math.sin(_hdg)),
													["x"] = _pos.x - (45 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											[5] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-5",
													["type"] = "M-113",
													["y"] = _pos.z - (60 * math.sin(_hdg)),
													["x"] = _pos.x - (60 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											},
								["name"] = "dynamic_NATO_"..eGMs.bluGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(80, Group.Category.GROUND, spawn_group)
			elseif _type == "bp07" and eGMs.allow_modern_red == true then
				eGMs.bluGroupCount = eGMs.bluGroupCount + 1
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-1",
													["type"] = "M-113",
													["y"] = _pos.z,
													["x"] = _pos.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },
											[2] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-2",
													["type"] = "M-113",
													["y"] = _pos.z - (15 * math.sin(_hdg)),
													["x"] = _pos.x - (15 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[3] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-3",
													["type"] = "M48 Chaparral",
													["y"] = _pos.z - (30 * math.sin(_hdg)),
													["x"] = _pos.x - (30 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[4] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-4",
													["type"] = "M-113",
													["y"] = _pos.z - (45 * math.sin(_hdg)),
													["x"] = _pos.x - (45 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											[5] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-5",
													["type"] = "M-113",
													["y"] = _pos.z - (60 * math.sin(_hdg)),
													["x"] = _pos.x - (60 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											},
								["name"] = "dynamic_NATO_"..eGMs.bluGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(80, Group.Category.GROUND, spawn_group)
			elseif _type == "bt01" and eGMs.allow_modern_red == true then
				eGMs.bluGroupCount = eGMs.bluGroupCount + 1
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-1",
													["type"] = "M-2 Bradley",
													["y"] = _pos.z,
													["x"] = _pos.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },
											[2] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-2",
													["type"] = "M-2 Bradley",
													["y"] = _pos.z - (15 * math.sin(_hdg)),
													["x"] = _pos.x - (15 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[3] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-3",
													["type"] = "M-2 Bradley",
													["y"] = _pos.z - (30 * math.sin(_hdg)),
													["x"] = _pos.x - (30 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[4] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-4",
													["type"] = "M-2 Bradley",
													["y"] = _pos.z - (45 * math.sin(_hdg)),
													["x"] = _pos.x - (45 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											},
								["name"] = "dynamic_NATO_"..eGMs.bluGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(80, Group.Category.GROUND, spawn_group)
			elseif _type == "bt02" and eGMs.allow_modern_red == true then
				eGMs.bluGroupCount = eGMs.bluGroupCount + 1
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-1",
													["type"] = "M-1 Abrams",
													["y"] = _pos.z,
													["x"] = _pos.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },
											[2] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-2",
													["type"] = "M-1 Abrams",
													["y"] = _pos.z - (15 * math.sin(_hdg)),
													["x"] = _pos.x - (15 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[3] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-3",
													["type"] = "M-1 Abrams",
													["y"] = _pos.z - (30 * math.sin(_hdg)),
													["x"] = _pos.x - (30 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[4] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-4",
													["type"] = "M-1 Abrams",
													["y"] = _pos.z - (45 * math.sin(_hdg)),
													["x"] = _pos.x - (45 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											},
								["name"] = "dynamic_NATO_"..eGMs.bluGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(80, Group.Category.GROUND, spawn_group)
			elseif _type == "bt03" and eGMs.allow_modern_red == true then
				eGMs.bluGroupCount = eGMs.bluGroupCount + 1
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-1",
													["type"] = "M-2 Bradley",
													["y"] = _pos.z,
													["x"] = _pos.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },
											[2] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-2",
													["type"] = "M-2 Bradley",
													["y"] = _pos.z - (15 * math.sin(_hdg)),
													["x"] = _pos.x - (15 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[3] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-3",
													["type"] = "M6 Linebacker",
													["y"] = _pos.z - (30 * math.sin(_hdg)),
													["x"] = _pos.x - (30 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[4] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-4",
													["type"] = "M-2 Bradley",
													["y"] = _pos.z - (45 * math.sin(_hdg)),
													["x"] = _pos.x - (45 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											},
								["name"] = "dynamic_NATO_"..eGMs.bluGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(80, Group.Category.GROUND, spawn_group)
			elseif _type == "bt04" and eGMs.allow_modern_red == true then
				eGMs.bluGroupCount = eGMs.bluGroupCount + 1
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-1",
													["type"] = "M-1 Abrams",
													["y"] = _pos.z,
													["x"] = _pos.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },
											[2] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-2",
													["type"] = "M-1 Abrams",
													["y"] = _pos.z - (15 * math.sin(_hdg)),
													["x"] = _pos.x - (15 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[3] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-3",
													["type"] = "M6 Linebacker",
													["y"] = _pos.z - (30 * math.sin(_hdg)),
													["x"] = _pos.x - (30 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[4] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-4",
													["type"] = "M-1 Abrams",
													["y"] = _pos.z - (45 * math.sin(_hdg)),
													["x"] = _pos.x - (45 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											},
								["name"] = "dynamic_NATO_"..eGMs.bluGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(80, Group.Category.GROUND, spawn_group)
			elseif _type == "bt05" and eGMs.allow_modern_red == true then
				eGMs.bluGroupCount = eGMs.bluGroupCount + 1
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-1",
													["type"] = "MCV-80",
													["y"] = _pos.z,
													["x"] = _pos.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },
											[2] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-2",
													["type"] = "MCV-80",
													["y"] = _pos.z - (15 * math.sin(_hdg)),
													["x"] = _pos.x - (15 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[3] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-3",
													["type"] = "MCV-80",
													["y"] = _pos.z - (30 * math.sin(_hdg)),
													["x"] = _pos.x - (30 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[4] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-4",
													["type"] = "MCV-80",
													["y"] = _pos.z - (45 * math.sin(_hdg)),
													["x"] = _pos.x - (45 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											},
								["name"] = "dynamic_NATO_"..eGMs.bluGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(80, Group.Category.GROUND, spawn_group)
			elseif _type == "bt06" and eGMs.allow_modern_red == true then
				eGMs.bluGroupCount = eGMs.bluGroupCount + 1
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-1",
													["type"] = "Challenger2",
													["y"] = _pos.z,
													["x"] = _pos.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },
											[2] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-2",
													["type"] = "Challenger2",
													["y"] = _pos.z - (15 * math.sin(_hdg)),
													["x"] = _pos.x - (15 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[3] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-3",
													["type"] = "Challenger2",
													["y"] = _pos.z - (30 * math.sin(_hdg)),
													["x"] = _pos.x - (30 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[4] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-4",
													["type"] = "Challenger2",
													["y"] = _pos.z - (45 * math.sin(_hdg)),
													["x"] = _pos.x - (45 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											},
								["name"] = "dynamic_NATO_"..eGMs.bluGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(80, Group.Category.GROUND, spawn_group)
			elseif _type == "bt07" and eGMs.allow_modern_red == true then
				eGMs.bluGroupCount = eGMs.bluGroupCount + 1
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-1",
													["type"] = "Marder",
													["y"] = _pos.z,
													["x"] = _pos.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },
											[2] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-2",
													["type"] = "Marder",
													["y"] = _pos.z - (15 * math.sin(_hdg)),
													["x"] = _pos.x - (15 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[3] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-3",
													["type"] = "Marder",
													["y"] = _pos.z - (30 * math.sin(_hdg)),
													["x"] = _pos.x - (30 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[4] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-4",
													["type"] = "Marder",
													["y"] = _pos.z - (45 * math.sin(_hdg)),
													["x"] = _pos.x - (45 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											},
								["name"] = "dynamic_NATO_"..eGMs.bluGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(80, Group.Category.GROUND, spawn_group)
			elseif _type == "bt08" and eGMs.allow_modern_red == true then
				eGMs.bluGroupCount = eGMs.bluGroupCount + 1
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-1",
													["type"] = "Leopard-2",
													["y"] = _pos.z,
													["x"] = _pos.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },
											[2] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-2",
													["type"] = "Leopard-2",
													["y"] = _pos.z - (15 * math.sin(_hdg)),
													["x"] = _pos.x - (15 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[3] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-3",
													["type"] = "Leopard-2",
													["y"] = _pos.z - (30 * math.sin(_hdg)),
													["x"] = _pos.x - (30 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[4] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-4",
													["type"] = "Leopard-2",
													["y"] = _pos.z - (45 * math.sin(_hdg)),
													["x"] = _pos.x - (45 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											},
								["name"] = "dynamic_NATO_"..eGMs.bluGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(80, Group.Category.GROUND, spawn_group)
			elseif _type == "bt09" and eGMs.allow_modern_red == true then
				eGMs.bluGroupCount = eGMs.bluGroupCount + 1
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-1",
													["type"] = "Marder",
													["y"] = _pos.z,
													["x"] = _pos.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },
											[2] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-2",
													["type"] = "Marder",
													["y"] = _pos.z - (15 * math.sin(_hdg)),
													["x"] = _pos.x - (15 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[3] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-3",
													["type"] = "Gepard",
													["y"] = _pos.z - (30 * math.sin(_hdg)),
													["x"] = _pos.x - (30 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[4] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-4",
													["type"] = "Marder",
													["y"] = _pos.z - (45 * math.sin(_hdg)),
													["x"] = _pos.x - (45 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											[5] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-5",
													["type"] = "Marder",
													["y"] = _pos.z - (60 * math.sin(_hdg)),
													["x"] = _pos.x - (60 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											},
								["name"] = "dynamic_NATO_"..eGMs.bluGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(80, Group.Category.GROUND, spawn_group)
			elseif _type == "bt10" and eGMs.allow_modern_red == true then
				eGMs.bluGroupCount = eGMs.bluGroupCount + 1
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-1",
													["type"] = "Leopard-2",
													["y"] = _pos.z,
													["x"] = _pos.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },
											[2] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-2",
													["type"] = "Leopard-2",
													["y"] = _pos.z - (15 * math.sin(_hdg)),
													["x"] = _pos.x - (15 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[3] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-3",
													["type"] = "Gepard",
													["y"] = _pos.z - (30 * math.sin(_hdg)),
													["x"] = _pos.x - (30 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[4] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-4",
													["type"] = "Leopard-2",
													["y"] = _pos.z - (45 * math.sin(_hdg)),
													["x"] = _pos.x - (45 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											[5] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-5",
													["type"] = "Leopard-2",
													["y"] = _pos.z - (60 * math.sin(_hdg)),
													["x"] = _pos.x - (60 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											},
								["name"] = "dynamic_NATO_"..eGMs.bluGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(80, Group.Category.GROUND, spawn_group)
			elseif _type == "bt11" and eGMs.allow_modern_red == true then
				eGMs.bluGroupCount = eGMs.bluGroupCount + 1
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-1",
													["type"] = "M-60",
													["y"] = _pos.z,
													["x"] = _pos.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },
											[2] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-2",
													["type"] = "M-60",
													["y"] = _pos.z - (15 * math.sin(_hdg)),
													["x"] = _pos.x - (15 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[3] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-3",
													["type"] = "M-60",
													["y"] = _pos.z - (30 * math.sin(_hdg)),
													["x"] = _pos.x - (30 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[4] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-4",
													["type"] = "M-60",
													["y"] = _pos.z - (45 * math.sin(_hdg)),
													["x"] = _pos.x - (45 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											},
								["name"] = "dynamic_NATO_"..eGMs.bluGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(80, Group.Category.GROUND, spawn_group)
			elseif _type == "bt12" and eGMs.allow_modern_red == true then
				eGMs.bluGroupCount = eGMs.bluGroupCount + 1
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-1",
													["type"] = "Chieftain_mk3",
													["y"] = _pos.z,
													["x"] = _pos.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },
											[2] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-2",
													["type"] = "Chieftain_mk3",
													["y"] = _pos.z - (15 * math.sin(_hdg)),
													["x"] = _pos.x - (15 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[3] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-3",
													["type"] = "Chieftain_mk3",
													["y"] = _pos.z - (30 * math.sin(_hdg)),
													["x"] = _pos.x - (30 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[4] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-4",
													["type"] = "Chieftain_mk3",
													["y"] = _pos.z - (45 * math.sin(_hdg)),
													["x"] = _pos.x - (45 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											},
								["name"] = "dynamic_NATO_"..eGMs.bluGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(80, Group.Category.GROUND, spawn_group)
			elseif _type == "bt13" and eGMs.allow_modern_red == true then
				eGMs.bluGroupCount = eGMs.bluGroupCount + 1
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-1",
													["type"] = "M-60",
													["y"] = _pos.z,
													["x"] = _pos.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },
											[2] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-2",
													["type"] = "M-60",
													["y"] = _pos.z - (15 * math.sin(_hdg)),
													["x"] = _pos.x - (15 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[3] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-3",
													["type"] = "Vulcan",
													["y"] = _pos.z - (30 * math.sin(_hdg)),
													["x"] = _pos.x - (30 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[4] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-4",
													["type"] = "M-60",
													["y"] = _pos.z - (45 * math.sin(_hdg)),
													["x"] = _pos.x - (45 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											[5] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-5",
													["type"] = "M-60",
													["y"] = _pos.z - (60 * math.sin(_hdg)),
													["x"] = _pos.x - (60 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											},
								["name"] = "dynamic_NATO_"..eGMs.bluGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(80, Group.Category.GROUND, spawn_group)
			elseif _type == "bt14" and eGMs.allow_modern_red == true then
				eGMs.bluGroupCount = eGMs.bluGroupCount + 1
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-1",
													["type"] = "M-60",
													["y"] = _pos.z,
													["x"] = _pos.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },
											[2] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-2",
													["type"] = "M-60",
													["y"] = _pos.z - (15 * math.sin(_hdg)),
													["x"] = _pos.x - (15 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[3] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-3",
													["type"] = "M48 Chaparral",
													["y"] = _pos.z - (30 * math.sin(_hdg)),
													["x"] = _pos.x - (30 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[4] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-4",
													["type"] = "M-60",
													["y"] = _pos.z - (45 * math.sin(_hdg)),
													["x"] = _pos.x - (45 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											[5] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-5",
													["type"] = "M-60",
													["y"] = _pos.z - (60 * math.sin(_hdg)),
													["x"] = _pos.x - (60 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											},
								["name"] = "dynamic_NATO_"..eGMs.bluGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(80, Group.Category.GROUND, spawn_group)
			elseif _type == "bt15" and eGMs.allow_modern_red == true then
				eGMs.bluGroupCount = eGMs.bluGroupCount + 1
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-1",
													["type"] = "Leopard1A3",
													["y"] = _pos.z,
													["x"] = _pos.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },
											[2] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-2",
													["type"] = "Leopard1A3",
													["y"] = _pos.z - (15 * math.sin(_hdg)),
													["x"] = _pos.x - (15 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[3] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-3",
													["type"] = "Leopard1A3",
													["y"] = _pos.z - (30 * math.sin(_hdg)),
													["x"] = _pos.x - (30 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[4] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-4",
													["type"] = "Leopard1A3",
													["y"] = _pos.z - (45 * math.sin(_hdg)),
													["x"] = _pos.x - (45 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											},
								["name"] = "dynamic_NATO_"..eGMs.bluGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(80, Group.Category.GROUND, spawn_group)
			elseif _type == "bt16" and eGMs.allow_modern_red == true then
				eGMs.bluGroupCount = eGMs.bluGroupCount + 1
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-1",
													["type"] = "Leopard1A3",
													["y"] = _pos.z,
													["x"] = _pos.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },
											[2] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-2",
													["type"] = "Leopard1A3",
													["y"] = _pos.z - (15 * math.sin(_hdg)),
													["x"] = _pos.x - (15 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[3] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-3",
													["type"] = "Gepard",
													["y"] = _pos.z - (30 * math.sin(_hdg)),
													["x"] = _pos.x - (30 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[4] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-4",
													["type"] = "Leopard1A3",
													["y"] = _pos.z - (45 * math.sin(_hdg)),
													["x"] = _pos.x - (45 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											[5] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-5",
													["type"] = "Leopard1A3",
													["y"] = _pos.z - (60 * math.sin(_hdg)),
													["x"] = _pos.x - (60 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											},
								["name"] = "dynamic_NATO_"..eGMs.bluGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(80, Group.Category.GROUND, spawn_group)
			elseif _type == "ba01" then
				eGMs.bluGroupCount = eGMs.bluGroupCount + 1
				local _u1 = eGMs.rotateVec2({x = 0, y = 7.5}, _hdg)
				local _u2 = eGMs.rotateVec2({x = 0, y = -7.5}, _hdg)
				local _u3 = eGMs.rotateVec2({x = 0, y = -22.5}, _hdg)
				local _u4 = eGMs.rotateVec2({x = 0, y = 22.5}, _hdg)
				local _u5 = eGMs.rotateVec2({x = 20, y = 0}, _hdg)
				
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-1",
													["type"] = "M-109",
													["y"] = _pos.z - _u1.y,
													["x"] = _pos.x - _u1.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },
											[2] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-2",
													["type"] = "M-109",
													["y"] = _pos.z - _u2.y,
													["x"] = _pos.x - _u2.x,
													["heading"] = _hdg,
												  },	  
											[3] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-3",
													["type"] = "M-109",
													["y"] = _pos.z - _u3.y,
													["x"] = _pos.x - _u3.x,
													["heading"] = _hdg,
												  },	  
											[4] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-4",
													["type"] = "M-109",
													["y"] = _pos.z - _u4.y,
													["x"] = _pos.x - _u4.x,
													["heading"] = _hdg,
												  },
											[5] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-5",
													["type"] = "M 818",
													["y"] = _pos.z - _u5.y,
													["x"] = _pos.x - _u5.x,
													["heading"] = _hdg,
												  },
											},
								["name"] = "dynamic_NATO_"..eGMs.bluGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(80, Group.Category.GROUND, spawn_group)
			elseif _type == "ba02" and eGMs.allow_modern_red == true then
				eGMs.bluGroupCount = eGMs.bluGroupCount + 1
				local _u1 = eGMs.rotateVec2({x = 0, y = 7.5}, _hdg)
				local _u2 = eGMs.rotateVec2({x = 0, y = -7.5}, _hdg)
				local _u3 = eGMs.rotateVec2({x = 0, y = -22.5}, _hdg)
				local _u4 = eGMs.rotateVec2({x = 0, y = 22.5}, _hdg)
				local _u5 = eGMs.rotateVec2({x = 20, y = 0}, _hdg)
				local _u6 = eGMs.rotateVec2({x = 20, y = 5}, _hdg)
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-1",
													["type"] = "MLRS",
													["y"] = _pos.z - _u1.y,
													["x"] = _pos.x - _u1.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg + 1.5708,
												  },
											[2] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-2",
													["type"] = "MLRS",
													["y"] = _pos.z - _u2.y,
													["x"] = _pos.x - _u2.x,
													["heading"] = _hdg + 1.5708,
												  },	  
											[3] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-3",
													["type"] = "MLRS",
													["y"] = _pos.z - _u3.y,
													["x"] = _pos.x - _u3.x,
													["heading"] = _hdg + 1.5708,
												  },	  
											[4] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-4",
													["type"] = "MLRS",
													["y"] = _pos.z - _u4.y,
													["x"] = _pos.x - _u4.x,
													["heading"] = _hdg + 1.5708,
												  },
											[5] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-5",
													["type"] = "MLRS FDDM",
													["y"] = _pos.z - _u5.y,
													["x"] = _pos.x - _u5.x,
													["heading"] = _hdg,
												  },
											[6] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-6",
													["type"] = "M 818",
													["y"] = _pos.z - _u6.y,
													["x"] = _pos.x - _u6.x,
													["heading"] = _hdg,
												  },
											},
								["name"] = "dynamic_NATO_"..eGMs.bluGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(80, Group.Category.GROUND, spawn_group)
			elseif _type == "ba03" and eGMs.allow_modern_red == true then
				eGMs.bluGroupCount = eGMs.bluGroupCount + 1
				local _u1 = eGMs.rotateVec2({x = 0, y = 7.5}, _hdg)
				local _u2 = eGMs.rotateVec2({x = 0, y = -7.5}, _hdg)
				local _u3 = eGMs.rotateVec2({x = 0, y = -22.5}, _hdg)
				local _u4 = eGMs.rotateVec2({x = 0, y = 22.5}, _hdg)
				local _u5 = eGMs.rotateVec2({x = 20, y = 0}, _hdg)
				
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-1",
													["type"] = "SpGH_Dana",
													["y"] = _pos.z - _u1.y,
													["x"] = _pos.x - _u1.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },
											[2] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-2",
													["type"] = "SpGH_Dana",
													["y"] = _pos.z - _u2.y,
													["x"] = _pos.x - _u2.x,
													["heading"] = _hdg,
												  },	  
											[3] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-3",
													["type"] = "SpGH_Dana",
													["y"] = _pos.z - _u3.y,
													["x"] = _pos.x - _u3.x,
													["heading"] = _hdg,
												  },	  
											[4] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-4",
													["type"] = "SpGH_Dana",
													["y"] = _pos.z - _u4.y,
													["x"] = _pos.x - _u4.x,
													["heading"] = _hdg,
												  },
											[5] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-5",
													["type"] = "M 818",
													["y"] = _pos.z - _u5.y,
													["x"] = _pos.x - _u5.x,
													["heading"] = _hdg,
												  },
											},
								["name"] = "dynamic_NATO_"..eGMs.bluGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(80, Group.Category.GROUND, spawn_group)
			elseif _type == "ba04" and eGMs.allow_modern_red == true then
				eGMs.bluGroupCount = eGMs.bluGroupCount + 1
				local _u1 = eGMs.rotateVec2({x = 0, y = 7.5}, _hdg)
				local _u2 = eGMs.rotateVec2({x = 0, y = -7.5}, _hdg)
				local _u3 = eGMs.rotateVec2({x = 0, y = -22.5}, _hdg)
				local _u4 = eGMs.rotateVec2({x = 0, y = 22.5}, _hdg)
				local _u5 = eGMs.rotateVec2({x = 20, y = 0}, _hdg)
				
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-1",
													["type"] = "T155_Firtina",
													["y"] = _pos.z - _u1.y,
													["x"] = _pos.x - _u1.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },
											[2] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-2",
													["type"] = "T155_Firtina",
													["y"] = _pos.z - _u2.y,
													["x"] = _pos.x - _u2.x,
													["heading"] = _hdg,
												  },	  
											[3] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-3",
													["type"] = "T155_Firtina",
													["y"] = _pos.z - _u3.y,
													["x"] = _pos.x - _u3.x,
													["heading"] = _hdg,
												  },	  
											[4] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-4",
													["type"] = "T155_Firtina",
													["y"] = _pos.z - _u4.y,
													["x"] = _pos.x - _u4.x,
													["heading"] = _hdg,
												  },
											[5] = {
													["name"] = "dynamic_NATO_"..eGMs.bluGroupCount.."-5",
													["type"] = "M 818",
													["y"] = _pos.z - _u5.y,
													["x"] = _pos.x - _u5.x,
													["heading"] = _hdg,
												  },
											},
								["name"] = "dynamic_NATO_"..eGMs.bluGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(80, Group.Category.GROUND, spawn_group)
			
			
			
			end
		end
		
-- REDFOR		
--		if eGMs.allow_modern_red == true then
			if _type == "rc01" then
			eGMs.redGroupCount = eGMs.redGroupCount + 1
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-1",
													["type"] = "BTR-80",
													["y"] = _pos.z,
													["x"] = _pos.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },
											[2] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-2",
													["type"] = "BTR-80",
													["y"] = _pos.z - (15 * math.sin(_hdg)),
													["x"] = _pos.x - (15 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[3] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-3",
													["type"] = "KAMAZ Truck",
													["y"] = _pos.z - (30 * math.sin(_hdg)),
													["x"] = _pos.x - (30 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[4] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-4",
													["type"] = "KAMAZ Truck",
													["y"] = _pos.z - (45 * math.sin(_hdg)),
													["x"] = _pos.x - (45 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											[5] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-5",
													["type"] = "KAMAZ Truck",
													["y"] = _pos.z - (60 * math.sin(_hdg)),
													["x"] = _pos.x - (60 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[6] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-6",
													["type"] = "KAMAZ Truck",
													["y"] = _pos.z - (75 * math.sin(_hdg)),
													["x"] = _pos.x - (75 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											[7] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-7",
													["type"] = "BTR-80",
													["y"] = _pos.z - (90 * math.sin(_hdg)),
													["x"] = _pos.x - (90 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											[8] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-8",
													["type"] = "BTR-80",
													["y"] = _pos.z - (105 * math.sin(_hdg)),
													["x"] = _pos.x - (105 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											},
								["name"] = "dynamic_russian_"..eGMs.redGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(81, Group.Category.GROUND, spawn_group)
			elseif _type == "rc02" and eGMs.allow_modern_red == true then
				eGMs.redGroupCount = eGMs.redGroupCount + 1
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-1",
													["type"] = "BTR-82A",
													["y"] = _pos.z,
													["x"] = _pos.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },
											[2] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-2",
													["type"] = "BTR-82A",
													["y"] = _pos.z - (15 * math.sin(_hdg)),
													["x"] = _pos.x - (15 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[3] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-3",
													["type"] = "KAMAZ Truck",
													["y"] = _pos.z - (30 * math.sin(_hdg)),
													["x"] = _pos.x - (30 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[4] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-4",
													["type"] = "KAMAZ Truck",
													["y"] = _pos.z - (45 * math.sin(_hdg)),
													["x"] = _pos.x - (45 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											[5] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-5",
													["type"] = "KAMAZ Truck",
													["y"] = _pos.z - (60 * math.sin(_hdg)),
													["x"] = _pos.x - (60 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[6] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-6",
													["type"] = "KAMAZ Truck",
													["y"] = _pos.z - (75 * math.sin(_hdg)),
													["x"] = _pos.x - (75 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											[7] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-7",
													["type"] = "BTR-82A",
													["y"] = _pos.z - (90 * math.sin(_hdg)),
													["x"] = _pos.x - (90 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											[8] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-8",
													["type"] = "BTR-82A",
													["y"] = _pos.z - (105 * math.sin(_hdg)),
													["x"] = _pos.x - (105 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											},
								["name"] = "dynamic_russian_"..eGMs.redGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(81, Group.Category.GROUND, spawn_group)
			elseif _type == "rc03" then
				eGMs.redGroupCount = eGMs.redGroupCount + 1
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-1",
													["type"] = "BTR-80",
													["y"] = _pos.z,
													["x"] = _pos.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },
											[2] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-2",
													["type"] = "BTR-80",
													["y"] = _pos.z - (15 * math.sin(_hdg)),
													["x"] = _pos.x - (15 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[3] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-3",
													["type"] = "KAMAZ Truck",
													["y"] = _pos.z - (30 * math.sin(_hdg)),
													["x"] = _pos.x - (30 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[4] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-4",
													["type"] = "KAMAZ Truck",
													["y"] = _pos.z - (45 * math.sin(_hdg)),
													["x"] = _pos.x - (45 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											[5] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-5",
													["type"] = "ZSU-23-4 Shilka",
													["y"] = _pos.z - (60 * math.sin(_hdg)),
													["x"] = _pos.x - (60 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },	  
											[6] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-6",
													["type"] = "KAMAZ Truck",
													["y"] = _pos.z - (75 * math.sin(_hdg)),
													["x"] = _pos.x - (75 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											[7] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-7",
													["type"] = "KAMAZ Truck",
													["y"] = _pos.z - (90 * math.sin(_hdg)),
													["x"] = _pos.x - (90 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											[8] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-8",
													["type"] = "BTR-80",
													["y"] = _pos.z - (105 * math.sin(_hdg)),
													["x"] = _pos.x - (105 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											[9] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-9",
													["type"] = "BTR-80",
													["y"] = _pos.z - (105 * math.sin(_hdg)),
													["x"] = _pos.x - (105 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											},
								["name"] = "dynamic_russian_"..eGMs.redGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(81, Group.Category.GROUND, spawn_group)
			elseif _type == "rc04" and eGMs.allow_modern_red == true then
				eGMs.redGroupCount = eGMs.redGroupCount + 1
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-1",
													["type"] = "BTR-82A",
													["y"] = _pos.z,
													["x"] = _pos.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },
											[2] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-2",
													["type"] = "BTR-82A",
													["y"] = _pos.z - (15 * math.sin(_hdg)),
													["x"] = _pos.x - (15 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[3] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-3",
													["type"] = "KAMAZ Truck",
													["y"] = _pos.z - (30 * math.sin(_hdg)),
													["x"] = _pos.x - (30 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[4] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-4",
													["type"] = "KAMAZ Truck",
													["y"] = _pos.z - (45 * math.sin(_hdg)),
													["x"] = _pos.x - (45 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											[5] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-5",
													["type"] = "ZSU-23-4 Shilka",
													["y"] = _pos.z - (60 * math.sin(_hdg)),
													["x"] = _pos.x - (60 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },	  
											[6] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-6",
													["type"] = "KAMAZ Truck",
													["y"] = _pos.z - (75 * math.sin(_hdg)),
													["x"] = _pos.x - (75 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											[7] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-7",
													["type"] = "KAMAZ Truck",
													["y"] = _pos.z - (90 * math.sin(_hdg)),
													["x"] = _pos.x - (90 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											[8] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-8",
													["type"] = "BTR-82A",
													["y"] = _pos.z - (105 * math.sin(_hdg)),
													["x"] = _pos.x - (105 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											[9] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-9",
													["type"] = "BTR-82A",
													["y"] = _pos.z - (105 * math.sin(_hdg)),
													["x"] = _pos.x - (105 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											},
								["name"] = "dynamic_russian_"..eGMs.redGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(81, Group.Category.GROUND, spawn_group)
			elseif _type == "rc05" and eGMs.allow_modern_red == true then
				eGMs.redGroupCount = eGMs.redGroupCount + 1
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-1",
													["type"] = "BTR-80",
													["y"] = _pos.z,
													["x"] = _pos.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },
											[2] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-2",
													["type"] = "BTR-80",
													["y"] = _pos.z - (15 * math.sin(_hdg)),
													["x"] = _pos.x - (15 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[3] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-3",
													["type"] = "KAMAZ Truck",
													["y"] = _pos.z - (30 * math.sin(_hdg)),
													["x"] = _pos.x - (30 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[4] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-4",
													["type"] = "KAMAZ Truck",
													["y"] = _pos.z - (45 * math.sin(_hdg)),
													["x"] = _pos.x - (45 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											[5] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-5",
													["type"] = "KAMAZ Truck",
													["y"] = _pos.z - (60 * math.sin(_hdg)),
													["x"] = _pos.x - (60 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },	  
											[6] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-6",
													["type"] = "ZSU-23-4 Shilka",
													["y"] = _pos.z - (75 * math.sin(_hdg)),
													["x"] = _pos.x - (75 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											[7] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-7",
													["type"] = "ATZ-5",
													["y"] = _pos.z - (90 * math.sin(_hdg)),
													["x"] = _pos.x - (90 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											[8] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-8",
													["type"] = "ATZ-5",
													["y"] = _pos.z - (105 * math.sin(_hdg)),
													["x"] = _pos.x - (105 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											[9] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-9",
													["type"] = "ATZ-5",
													["y"] = _pos.z - (120 * math.sin(_hdg)),
													["x"] = _pos.x - (120 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											[10] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-10",
													["type"] = "Strela-10M3",
													["y"] = _pos.z - (135 * math.sin(_hdg)),
													["x"] = _pos.x - (135 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											[11] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-11",
													["type"] = "KAMAZ Truck",
													["y"] = _pos.z - (150 * math.sin(_hdg)),
													["x"] = _pos.x - (150 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											[12] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-12",
													["type"] = "KAMAZ Truck",
													["y"] = _pos.z - (165 * math.sin(_hdg)),
													["x"] = _pos.x - (165 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											[13] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-13",
													["type"] = "KAMAZ Truck",
													["y"] = _pos.z - (180 * math.sin(_hdg)),
													["x"] = _pos.x - (180 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											[14] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-14",
													["type"] = "BTR-80",
													["y"] = _pos.z - (195 * math.sin(_hdg)),
													["x"] = _pos.x - (195 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											[15] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-15",
													["type"] = "BTR-80",
													["y"] = _pos.z - (210 * math.sin(_hdg)),
													["x"] = _pos.x - (210 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											},
								["name"] = "dynamic_russian_"..eGMs.redGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(81, Group.Category.GROUND, spawn_group)
			elseif _type == "rc06" and eGMs.allow_modern_red == true then
				eGMs.redGroupCount = eGMs.redGroupCount + 1
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-1",
													["type"] = "BTR-82A",
													["y"] = _pos.z,
													["x"] = _pos.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },
											[2] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-2",
													["type"] = "BTR-82A",
													["y"] = _pos.z - (15 * math.sin(_hdg)),
													["x"] = _pos.x - (15 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[3] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-3",
													["type"] = "KAMAZ Truck",
													["y"] = _pos.z - (30 * math.sin(_hdg)),
													["x"] = _pos.x - (30 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[4] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-4",
													["type"] = "KAMAZ Truck",
													["y"] = _pos.z - (45 * math.sin(_hdg)),
													["x"] = _pos.x - (45 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											[5] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-5",
													["type"] = "KAMAZ Truck",
													["y"] = _pos.z - (60 * math.sin(_hdg)),
													["x"] = _pos.x - (60 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },	  
											[6] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-6",
													["type"] = "ZSU-23-4 Shilka",
													["y"] = _pos.z - (75 * math.sin(_hdg)),
													["x"] = _pos.x - (75 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											[7] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-7",
													["type"] = "ATZ-5",
													["y"] = _pos.z - (90 * math.sin(_hdg)),
													["x"] = _pos.x - (90 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											[8] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-8",
													["type"] = "ATZ-5",
													["y"] = _pos.z - (105 * math.sin(_hdg)),
													["x"] = _pos.x - (105 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											[9] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-9",
													["type"] = "ATZ-5",
													["y"] = _pos.z - (120 * math.sin(_hdg)),
													["x"] = _pos.x - (120 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											[10] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-10",
													["type"] = "Strela-10M3",
													["y"] = _pos.z - (135 * math.sin(_hdg)),
													["x"] = _pos.x - (135 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											[11] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-11",
													["type"] = "KAMAZ Truck",
													["y"] = _pos.z - (150 * math.sin(_hdg)),
													["x"] = _pos.x - (150 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											[12] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-12",
													["type"] = "KAMAZ Truck",
													["y"] = _pos.z - (165 * math.sin(_hdg)),
													["x"] = _pos.x - (165 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											[13] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-13",
													["type"] = "KAMAZ Truck",
													["y"] = _pos.z - (180 * math.sin(_hdg)),
													["x"] = _pos.x - (180 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											[14] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-14",
													["type"] = "BTR-82A",
													["y"] = _pos.z - (195 * math.sin(_hdg)),
													["x"] = _pos.x - (195 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											[15] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-15",
													["type"] = "BTR-82A",
													["y"] = _pos.z - (210 * math.sin(_hdg)),
													["x"] = _pos.x - (210 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											},
								["name"] = "dynamic_russian_"..eGMs.redGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(81, Group.Category.GROUND, spawn_group)
			elseif _type == "rc07" and eGMs.allow_modern_red == true then
				eGMs.redGroupCount = eGMs.redGroupCount + 1
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-1",
													["type"] = "BTR-80",
													["y"] = _pos.z,
													["x"] = _pos.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },
											[2] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-2",
													["type"] = "BTR-80",
													["y"] = _pos.z - (15 * math.sin(_hdg)),
													["x"] = _pos.x - (15 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[3] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-3",
													["type"] = "KAMAZ Truck",
													["y"] = _pos.z - (30 * math.sin(_hdg)),
													["x"] = _pos.x - (30 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[4] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-4",
													["type"] = "KAMAZ Truck",
													["y"] = _pos.z - (45 * math.sin(_hdg)),
													["x"] = _pos.x - (45 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											[5] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-5",
													["type"] = "KAMAZ Truck",
													["y"] = _pos.z - (60 * math.sin(_hdg)),
													["x"] = _pos.x - (60 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },	  
											[6] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-6",
													["type"] = "KAMAZ Truck",
													["y"] = _pos.z - (75 * math.sin(_hdg)),
													["x"] = _pos.x - (75 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											[7] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-7",
													["type"] = "KAMAZ Truck",
													["y"] = _pos.z - (90 * math.sin(_hdg)),
													["x"] = _pos.x - (90 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											[8] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-8",
													["type"] = "KAMAZ Truck",
													["y"] = _pos.z - (105 * math.sin(_hdg)),
													["x"] = _pos.x - (105 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											[9] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-9",
													["type"] = "KAMAZ Truck",
													["y"] = _pos.z - (120 * math.sin(_hdg)),
													["x"] = _pos.x - (120 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											[10] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-10",
													["type"] = "KAMAZ Truck",
													["y"] = _pos.z - (135 * math.sin(_hdg)),
													["x"] = _pos.x - (135 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											[11] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-11",
													["type"] = "2S6 Tunguska",
													["y"] = _pos.z - (150 * math.sin(_hdg)),
													["x"] = _pos.x - (150 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											[12] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-12",
													["type"] = "ATZ-5",
													["y"] = _pos.z - (165 * math.sin(_hdg)),
													["x"] = _pos.x - (165 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											[13] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-13",
													["type"] = "ATZ-5",
													["y"] = _pos.z - (180 * math.sin(_hdg)),
													["x"] = _pos.x - (180 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											[14] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-14",
													["type"] = "ATZ-5",
													["y"] = _pos.z - (195 * math.sin(_hdg)),
													["x"] = _pos.x - (195 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											[15] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-15",
													["type"] = "ATZ-5",
													["y"] = _pos.z - (210 * math.sin(_hdg)),
													["x"] = _pos.x - (210 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											[16] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-16",
													["type"] = "Strela-10M3",
													["y"] = _pos.z - (135 * math.sin(_hdg)),
													["x"] = _pos.x - (135 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											[17] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-17",
													["type"] = "KAMAZ Truck",
													["y"] = _pos.z - (150 * math.sin(_hdg)),
													["x"] = _pos.x - (150 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											[18] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-18",
													["type"] = "KAMAZ Truck",
													["y"] = _pos.z - (165 * math.sin(_hdg)),
													["x"] = _pos.x - (165 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											[19] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-19",
													["type"] = "KAMAZ Truck",
													["y"] = _pos.z - (180 * math.sin(_hdg)),
													["x"] = _pos.x - (180 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											[20] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-20",
													["type"] = "BTR-80",
													["y"] = _pos.z - (195 * math.sin(_hdg)),
													["x"] = _pos.x - (195 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											[21] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-21",
													["type"] = "BTR-80",
													["y"] = _pos.z - (210 * math.sin(_hdg)),
													["x"] = _pos.x - (210 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											},
								["name"] = "dynamic_russian_"..eGMs.redGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(81, Group.Category.GROUND, spawn_group)
			elseif _type == "rc08" and eGMs.allow_modern_red == true then
				eGMs.redGroupCount = eGMs.redGroupCount + 1
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-1",
													["type"] = "BTR-82A",
													["y"] = _pos.z,
													["x"] = _pos.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },
											[2] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-2",
													["type"] = "BTR-82A",
													["y"] = _pos.z - (15 * math.sin(_hdg)),
													["x"] = _pos.x - (15 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[3] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-3",
													["type"] = "KAMAZ Truck",
													["y"] = _pos.z - (30 * math.sin(_hdg)),
													["x"] = _pos.x - (30 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[4] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-4",
													["type"] = "KAMAZ Truck",
													["y"] = _pos.z - (45 * math.sin(_hdg)),
													["x"] = _pos.x - (45 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											[5] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-5",
													["type"] = "KAMAZ Truck",
													["y"] = _pos.z - (60 * math.sin(_hdg)),
													["x"] = _pos.x - (60 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },	  
											[6] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-6",
													["type"] = "KAMAZ Truck",
													["y"] = _pos.z - (75 * math.sin(_hdg)),
													["x"] = _pos.x - (75 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											[7] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-7",
													["type"] = "KAMAZ Truck",
													["y"] = _pos.z - (90 * math.sin(_hdg)),
													["x"] = _pos.x - (90 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											[8] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-8",
													["type"] = "KAMAZ Truck",
													["y"] = _pos.z - (105 * math.sin(_hdg)),
													["x"] = _pos.x - (105 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											[9] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-9",
													["type"] = "KAMAZ Truck",
													["y"] = _pos.z - (120 * math.sin(_hdg)),
													["x"] = _pos.x - (120 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											[10] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-10",
													["type"] = "KAMAZ Truck",
													["y"] = _pos.z - (135 * math.sin(_hdg)),
													["x"] = _pos.x - (135 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											[11] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-11",
													["type"] = "2S6 Tunguska",
													["y"] = _pos.z - (150 * math.sin(_hdg)),
													["x"] = _pos.x - (150 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											[12] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-12",
													["type"] = "ATZ-5",
													["y"] = _pos.z - (165 * math.sin(_hdg)),
													["x"] = _pos.x - (165 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											[13] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-13",
													["type"] = "ATZ-5",
													["y"] = _pos.z - (180 * math.sin(_hdg)),
													["x"] = _pos.x - (180 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											[14] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-14",
													["type"] = "ATZ-5",
													["y"] = _pos.z - (195 * math.sin(_hdg)),
													["x"] = _pos.x - (195 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											[15] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-15",
													["type"] = "ATZ-5",
													["y"] = _pos.z - (210 * math.sin(_hdg)),
													["x"] = _pos.x - (210 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											[16] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-16",
													["type"] = "Strela-10M3",
													["y"] = _pos.z - (135 * math.sin(_hdg)),
													["x"] = _pos.x - (135 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											[17] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-17",
													["type"] = "KAMAZ Truck",
													["y"] = _pos.z - (150 * math.sin(_hdg)),
													["x"] = _pos.x - (150 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											[18] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-18",
													["type"] = "KAMAZ Truck",
													["y"] = _pos.z - (165 * math.sin(_hdg)),
													["x"] = _pos.x - (165 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											[19] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-19",
													["type"] = "KAMAZ Truck",
													["y"] = _pos.z - (180 * math.sin(_hdg)),
													["x"] = _pos.x - (180 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											[20] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-20",
													["type"] = "BTR-82A",
													["y"] = _pos.z - (195 * math.sin(_hdg)),
													["x"] = _pos.x - (195 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											[21] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-21",
													["type"] = "BTR-82A",
													["y"] = _pos.z - (210 * math.sin(_hdg)),
													["x"] = _pos.x - (210 * math.cos(_hdg)),
													["playerCanDrive"] = true,
													["heading"] = _hdg,
												  },
											},
								["name"] = "dynamic_russian_"..eGMs.redGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(81, Group.Category.GROUND, spawn_group)
--[[patrol]]elseif _type == "rp01" then
				eGMs.redGroupCount = eGMs.redGroupCount + 1
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-1",
													["type"] = "BRDM-2",
													["y"] = _pos.z,
													["x"] = _pos.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },
											[2] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-2",
													["type"] = "BRDM-2",
													["y"] = _pos.z - (15 * math.sin(_hdg)),
													["x"] = _pos.x - (15 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[3] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-3",
													["type"] = "BRDM-2",
													["y"] = _pos.z - (30 * math.sin(_hdg)),
													["x"] = _pos.x - (30 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[4] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-4",
													["type"] = "BRDM-2",
													["y"] = _pos.z - (45 * math.sin(_hdg)),
													["x"] = _pos.x - (45 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											},
								["name"] = "dynamic_russian_"..eGMs.redGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(81, Group.Category.GROUND, spawn_group)
			elseif _type == "rp02" then
				eGMs.redGroupCount = eGMs.redGroupCount + 1
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-1",
													["type"] = "BRDM-2",
													["y"] = _pos.z,
													["x"] = _pos.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },
											[2] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-2",
													["type"] = "BRDM-2",
													["y"] = _pos.z - (15 * math.sin(_hdg)),
													["x"] = _pos.x - (15 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[3] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-3",
													["type"] = "Ural-375 ZU-23",
													["y"] = _pos.z - (30 * math.sin(_hdg)),
													["x"] = _pos.x - (30 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[4] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-4",
													["type"] = "BRDM-2",
													["y"] = _pos.z - (45 * math.sin(_hdg)),
													["x"] = _pos.x - (45 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											[5] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-5",
													["type"] = "BRDM-2",
													["y"] = _pos.z - (60 * math.sin(_hdg)),
													["x"] = _pos.x - (60 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											},
								["name"] = "dynamic_russian_"..eGMs.redGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(81, Group.Category.GROUND, spawn_group)
			elseif _type == "rp03" then
				eGMs.redGroupCount = eGMs.redGroupCount + 1
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-1",
													["type"] = "BRDM-2",
													["y"] = _pos.z,
													["x"] = _pos.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },
											[2] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-2",
													["type"] = "BRDM-2",
													["y"] = _pos.z - (15 * math.sin(_hdg)),
													["x"] = _pos.x - (15 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[3] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-3",
													["type"] = "Strela-1 9P31",
													["y"] = _pos.z - (30 * math.sin(_hdg)),
													["x"] = _pos.x - (30 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[4] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-4",
													["type"] = "BRDM-2",
													["y"] = _pos.z - (45 * math.sin(_hdg)),
													["x"] = _pos.x - (45 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											[5] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-5",
													["type"] = "BRDM-2",
													["y"] = _pos.z - (60 * math.sin(_hdg)),
													["x"] = _pos.x - (60 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											},
								["name"] = "dynamic_russian_"..eGMs.redGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(81, Group.Category.GROUND, spawn_group)
			elseif _type == "rp04" then
				eGMs.redGroupCount = eGMs.redGroupCount + 1
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-1",
													["type"] = "BTR-80",
													["y"] = _pos.z,
													["x"] = _pos.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },
											[2] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-2",
													["type"] = "BTR-80",
													["y"] = _pos.z - (15 * math.sin(_hdg)),
													["x"] = _pos.x - (15 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[3] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-3",
													["type"] = "BTR-80",
													["y"] = _pos.z - (30 * math.sin(_hdg)),
													["x"] = _pos.x - (30 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[4] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-4",
													["type"] = "BTR-80",
													["y"] = _pos.z - (45 * math.sin(_hdg)),
													["x"] = _pos.x - (45 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											},
								["name"] = "dynamic_russian_"..eGMs.redGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(81, Group.Category.GROUND, spawn_group)
			elseif _type == "rp05" then
				eGMs.redGroupCount = eGMs.redGroupCount + 1
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-1",
													["type"] = "BTR-80",
													["y"] = _pos.z,
													["x"] = _pos.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },
											[2] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-2",
													["type"] = "BTR-80",
													["y"] = _pos.z - (15 * math.sin(_hdg)),
													["x"] = _pos.x - (15 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[3] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-3",
													["type"] = "ZSU-23-4 Shilka",
													["y"] = _pos.z - (30 * math.sin(_hdg)),
													["x"] = _pos.x - (30 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[4] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-4",
													["type"] = "BTR-80",
													["y"] = _pos.z - (45 * math.sin(_hdg)),
													["x"] = _pos.x - (45 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											[5] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-5",
													["type"] = "BTR-80",
													["y"] = _pos.z - (60 * math.sin(_hdg)),
													["x"] = _pos.x - (60 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											},
								["name"] = "dynamic_russian_"..eGMs.redGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(81, Group.Category.GROUND, spawn_group)
			elseif _type == "rp06" then
				eGMs.redGroupCount = eGMs.redGroupCount + 1
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-1",
													["type"] = "BTR-80",
													["y"] = _pos.z,
													["x"] = _pos.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },
											[2] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-2",
													["type"] = "BTR-80",
													["y"] = _pos.z - (15 * math.sin(_hdg)),
													["x"] = _pos.x - (15 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[3] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-3",
													["type"] = "Strela-1 9P31",
													["y"] = _pos.z - (30 * math.sin(_hdg)),
													["x"] = _pos.x - (30 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[4] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-4",
													["type"] = "BTR-80",
													["y"] = _pos.z - (45 * math.sin(_hdg)),
													["x"] = _pos.x - (45 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											[5] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-5",
													["type"] = "BTR-80",
													["y"] = _pos.z - (60 * math.sin(_hdg)),
													["x"] = _pos.x - (60 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											},
								["name"] = "dynamic_russian_"..eGMs.redGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(81, Group.Category.GROUND, spawn_group)
			elseif _type == "rp07" and eGMs.allow_modern_red == true then
				eGMs.redGroupCount = eGMs.redGroupCount + 1
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-1",
													["type"] = "BTR-82A",
													["y"] = _pos.z,
													["x"] = _pos.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },
											[2] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-2",
													["type"] = "BTR-82A",
													["y"] = _pos.z - (15 * math.sin(_hdg)),
													["x"] = _pos.x - (15 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[3] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-3",
													["type"] = "BTR-82A",
													["y"] = _pos.z - (30 * math.sin(_hdg)),
													["x"] = _pos.x - (30 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[4] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-4",
													["type"] = "BTR-82A",
													["y"] = _pos.z - (45 * math.sin(_hdg)),
													["x"] = _pos.x - (45 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											},
								["name"] = "dynamic_russian_"..eGMs.redGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(81, Group.Category.GROUND, spawn_group)
			elseif _type == "rp08" and eGMs.allow_modern_red == true then
				eGMs.redGroupCount = eGMs.redGroupCount + 1
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-1",
													["type"] = "BTR-82A",
													["y"] = _pos.z,
													["x"] = _pos.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },
											[2] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-2",
													["type"] = "BTR-82A",
													["y"] = _pos.z - (15 * math.sin(_hdg)),
													["x"] = _pos.x - (15 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[3] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-3",
													["type"] = "ZSU-23-4 Shilka",
													["y"] = _pos.z - (30 * math.sin(_hdg)),
													["x"] = _pos.x - (30 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[4] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-4",
													["type"] = "BTR-82A",
													["y"] = _pos.z - (45 * math.sin(_hdg)),
													["x"] = _pos.x - (45 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											[5] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-5",
													["type"] = "BTR-82A",
													["y"] = _pos.z - (60 * math.sin(_hdg)),
													["x"] = _pos.x - (60 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											},
								["name"] = "dynamic_russian_"..eGMs.redGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(81, Group.Category.GROUND, spawn_group)
			elseif _type == "rp09" and eGMs.allow_modern_red == true then
				eGMs.redGroupCount = eGMs.redGroupCount + 1
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-1",
													["type"] = "BTR-82A",
													["y"] = _pos.z,
													["x"] = _pos.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },
											[2] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-2",
													["type"] = "BTR-82A",
													["y"] = _pos.z - (15 * math.sin(_hdg)),
													["x"] = _pos.x - (15 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[3] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-3",
													["type"] = "Strela-10M3",
													["y"] = _pos.z - (30 * math.sin(_hdg)),
													["x"] = _pos.x - (30 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[4] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-4",
													["type"] = "BTR-82A",
													["y"] = _pos.z - (45 * math.sin(_hdg)),
													["x"] = _pos.x - (45 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											[5] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-5",
													["type"] = "BTR-82A",
													["y"] = _pos.z - (60 * math.sin(_hdg)),
													["x"] = _pos.x - (60 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											},
								["name"] = "dynamic_russian_"..eGMs.redGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(81, Group.Category.GROUND, spawn_group)
--[[tanks]]	elseif _type == "rt01" then
				eGMs.redGroupCount = eGMs.redGroupCount + 1
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-1",
													["type"] = "T-55",
													["y"] = _pos.z,
													["x"] = _pos.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },
											[2] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-2",
													["type"] = "T-55",
													["y"] = _pos.z - (15 * math.sin(_hdg)),
													["x"] = _pos.x - (15 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[3] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-3",
													["type"] = "T-55",
													["y"] = _pos.z - (30 * math.sin(_hdg)),
													["x"] = _pos.x - (30 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[4] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-4",
													["type"] = "T-55",
													["y"] = _pos.z - (45 * math.sin(_hdg)),
													["x"] = _pos.x - (45 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											},
								["name"] = "dynamic_russian_"..eGMs.redGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(81, Group.Category.GROUND, spawn_group)
			elseif _type == "rt02" then
				eGMs.redGroupCount = eGMs.redGroupCount + 1
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-1",
													["type"] = "T-55",
													["y"] = _pos.z,
													["x"] = _pos.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },
											[2] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-2",
													["type"] = "T-55",
													["y"] = _pos.z - (15 * math.sin(_hdg)),
													["x"] = _pos.x - (15 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[3] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-3",
													["type"] = "Strela-1 9P31",
													["y"] = _pos.z - (30 * math.sin(_hdg)),
													["x"] = _pos.x - (30 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[4] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-4",
													["type"] = "T-55",
													["y"] = _pos.z - (45 * math.sin(_hdg)),
													["x"] = _pos.x - (45 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											[5] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-5",
													["type"] = "T-55",
													["y"] = _pos.z - (60 * math.sin(_hdg)),
													["x"] = _pos.x - (60 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											},
								["name"] = "dynamic_russian_"..eGMs.redGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(81, Group.Category.GROUND, spawn_group)
			elseif _type == "rt03" then
				eGMs.redGroupCount = eGMs.redGroupCount + 1
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-1",
													["type"] = "T-55",
													["y"] = _pos.z,
													["x"] = _pos.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },
											[2] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-2",
													["type"] = "T-55",
													["y"] = _pos.z - (15 * math.sin(_hdg)),
													["x"] = _pos.x - (15 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[3] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-3",
													["type"] = "ZSU-23-4 Shilka",
													["y"] = _pos.z - (30 * math.sin(_hdg)),
													["x"] = _pos.x - (30 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[4] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-4",
													["type"] = "T-55",
													["y"] = _pos.z - (45 * math.sin(_hdg)),
													["x"] = _pos.x - (45 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											[5] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-5",
													["type"] = "T-55",
													["y"] = _pos.z - (60 * math.sin(_hdg)),
													["x"] = _pos.x - (60 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											},
								["name"] = "dynamic_russian_"..eGMs.redGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(81, Group.Category.GROUND, spawn_group)
			elseif _type == "rt04" then
				eGMs.redGroupCount = eGMs.redGroupCount + 1
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-1",
													["type"] = "T-55",
													["y"] = _pos.z,
													["x"] = _pos.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },
											[2] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-2",
													["type"] = "T-55",
													["y"] = _pos.z - (15 * math.sin(_hdg)),
													["x"] = _pos.x - (15 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[3] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-3",
													["type"] = "ZSU_57_2",
													["y"] = _pos.z - (30 * math.sin(_hdg)),
													["x"] = _pos.x - (30 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[4] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-4",
													["type"] = "T-55",
													["y"] = _pos.z - (45 * math.sin(_hdg)),
													["x"] = _pos.x - (45 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											[5] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-5",
													["type"] = "T-55",
													["y"] = _pos.z - (60 * math.sin(_hdg)),
													["x"] = _pos.x - (60 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											},
								["name"] = "dynamic_russian_"..eGMs.redGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(81, Group.Category.GROUND, spawn_group)
			elseif _type == "rt05" and eGMs.allow_modern_red == true then
				eGMs.redGroupCount = eGMs.redGroupCount + 1
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-1",
													["type"] = "T-72B",
													["y"] = _pos.z,
													["x"] = _pos.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },
											[2] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-2",
													["type"] = "T-72B",
													["y"] = _pos.z - (15 * math.sin(_hdg)),
													["x"] = _pos.x - (15 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[3] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-3",
													["type"] = "T-72B",
													["y"] = _pos.z - (30 * math.sin(_hdg)),
													["x"] = _pos.x - (30 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[4] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-4",
													["type"] = "T-72B",
													["y"] = _pos.z - (45 * math.sin(_hdg)),
													["x"] = _pos.x - (45 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											},
								["name"] = "dynamic_russian_"..eGMs.redGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(81, Group.Category.GROUND, spawn_group)
			elseif _type == "rt06" and eGMs.allow_modern_red == true then
				eGMs.redGroupCount = eGMs.redGroupCount + 1
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-1",
													["type"] = "T-72B",
													["y"] = _pos.z,
													["x"] = _pos.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },
											[2] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-2",
													["type"] = "T-72B",
													["y"] = _pos.z - (15 * math.sin(_hdg)),
													["x"] = _pos.x - (15 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[3] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-3",
													["type"] = "ZSU-23-4 Shilka",
													["y"] = _pos.z - (30 * math.sin(_hdg)),
													["x"] = _pos.x - (30 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[4] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-4",
													["type"] = "T-72B",
													["y"] = _pos.z - (45 * math.sin(_hdg)),
													["x"] = _pos.x - (45 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											[5] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-5",
													["type"] = "T-72B",
													["y"] = _pos.z - (60 * math.sin(_hdg)),
													["x"] = _pos.x - (60 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											},
								["name"] = "dynamic_russian_"..eGMs.redGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(81, Group.Category.GROUND, spawn_group)
			elseif _type == "rt07" and eGMs.allow_modern_red == true then
				eGMs.redGroupCount = eGMs.redGroupCount + 1
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-1",
													["type"] = "T-72B",
													["y"] = _pos.z,
													["x"] = _pos.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },
											[2] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-2",
													["type"] = "T-72B",
													["y"] = _pos.z - (15 * math.sin(_hdg)),
													["x"] = _pos.x - (15 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[3] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-3",
													["type"] = "ZSU-23-4 Shilka",
													["y"] = _pos.z - (30 * math.sin(_hdg)),
													["x"] = _pos.x - (30 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[4] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-4",
													["type"] = "T-72B",
													["y"] = _pos.z - (45 * math.sin(_hdg)),
													["x"] = _pos.x - (45 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											[5] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-5",
													["type"] = "T-72B",
													["y"] = _pos.z - (60 * math.sin(_hdg)),
													["x"] = _pos.x - (60 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											},
								["name"] = "dynamic_russian_"..eGMs.redGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(81, Group.Category.GROUND, spawn_group)
			elseif _type == "rt07" and eGMs.allow_modern_red == true then
				eGMs.redGroupCount = eGMs.redGroupCount + 1
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-1",
													["type"] = "T-72B",
													["y"] = _pos.z,
													["x"] = _pos.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },
											[2] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-2",
													["type"] = "T-72B",
													["y"] = _pos.z - (15 * math.sin(_hdg)),
													["x"] = _pos.x - (15 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[3] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-3",
													["type"] = "Strela-10M3",
													["y"] = _pos.z - (30 * math.sin(_hdg)),
													["x"] = _pos.x - (30 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[4] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-4",
													["type"] = "T-72B",
													["y"] = _pos.z - (45 * math.sin(_hdg)),
													["x"] = _pos.x - (45 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											[5] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-5",
													["type"] = "T-72B",
													["y"] = _pos.z - (60 * math.sin(_hdg)),
													["x"] = _pos.x - (60 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											},
								["name"] = "dynamic_russian_"..eGMs.redGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(81, Group.Category.GROUND, spawn_group)
			elseif _type == "rt08" and eGMs.allow_modern_red == true then
				eGMs.redGroupCount = eGMs.redGroupCount + 1
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-1",
													["type"] = "T-80UD",
													["y"] = _pos.z,
													["x"] = _pos.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },
											[2] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-2",
													["type"] = "T-80UD",
													["y"] = _pos.z - (15 * math.sin(_hdg)),
													["x"] = _pos.x - (15 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[3] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-3",
													["type"] = "T-80UD",
													["y"] = _pos.z - (30 * math.sin(_hdg)),
													["x"] = _pos.x - (30 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[4] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-4",
													["type"] = "T-80UD",
													["y"] = _pos.z - (45 * math.sin(_hdg)),
													["x"] = _pos.x - (45 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											},
								["name"] = "dynamic_russian_"..eGMs.redGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(81, Group.Category.GROUND, spawn_group)
			elseif _type == "rt09" and eGMs.allow_modern_red == true then
				eGMs.redGroupCount = eGMs.redGroupCount + 1
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-1",
													["type"] = "T-80UD",
													["y"] = _pos.z,
													["x"] = _pos.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },
											[2] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-2",
													["type"] = "T-80UD",
													["y"] = _pos.z - (15 * math.sin(_hdg)),
													["x"] = _pos.x - (15 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[3] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-3",
													["type"] = "ZSU-23-4 Shilka",
													["y"] = _pos.z - (30 * math.sin(_hdg)),
													["x"] = _pos.x - (30 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[4] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-4",
													["type"] = "T-80UD",
													["y"] = _pos.z - (45 * math.sin(_hdg)),
													["x"] = _pos.x - (45 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											[5] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-5",
													["type"] = "T-80UD",
													["y"] = _pos.z - (60 * math.sin(_hdg)),
													["x"] = _pos.x - (60 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											},
								["name"] = "dynamic_russian_"..eGMs.redGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(81, Group.Category.GROUND, spawn_group)
			elseif _type == "rt10" and eGMs.allow_modern_red == true then
				eGMs.redGroupCount = eGMs.redGroupCount + 1
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-1",
													["type"] = "T-80UD",
													["y"] = _pos.z,
													["x"] = _pos.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },
											[2] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-2",
													["type"] = "T-80UD",
													["y"] = _pos.z - (15 * math.sin(_hdg)),
													["x"] = _pos.x - (15 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[3] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-3",
													["type"] = "Strela-10M3",
													["y"] = _pos.z - (30 * math.sin(_hdg)),
													["x"] = _pos.x - (30 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[4] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-4",
													["type"] = "T-80UD",
													["y"] = _pos.z - (45 * math.sin(_hdg)),
													["x"] = _pos.x - (45 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											[5] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-5",
													["type"] = "T-80UD",
													["y"] = _pos.z - (60 * math.sin(_hdg)),
													["x"] = _pos.x - (60 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											},
								["name"] = "dynamic_russian_"..eGMs.redGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(81, Group.Category.GROUND, spawn_group)
			elseif _type == "rt11" and eGMs.allow_modern_red == true then
				eGMs.redGroupCount = eGMs.redGroupCount + 1
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-1",
													["type"] = "T-80UD",
													["y"] = _pos.z,
													["x"] = _pos.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },
											[2] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-2",
													["type"] = "T-80UD",
													["y"] = _pos.z - (15 * math.sin(_hdg)),
													["x"] = _pos.x - (15 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[3] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-3",
													["type"] = "2S6 Tunguska",
													["y"] = _pos.z - (30 * math.sin(_hdg)),
													["x"] = _pos.x - (30 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[4] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-4",
													["type"] = "T-80UD",
													["y"] = _pos.z - (45 * math.sin(_hdg)),
													["x"] = _pos.x - (45 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											[5] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-5",
													["type"] = "T-80UD",
													["y"] = _pos.z - (60 * math.sin(_hdg)),
													["x"] = _pos.x - (60 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											},
								["name"] = "dynamic_russian_"..eGMs.redGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(81, Group.Category.GROUND, spawn_group)
			elseif _type == "rt12" and eGMs.allow_modern_red == true then
				eGMs.redGroupCount = eGMs.redGroupCount + 1
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-1",
													["type"] = "T-90",
													["y"] = _pos.z,
													["x"] = _pos.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },
											[2] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-2",
													["type"] = "T-90",
													["y"] = _pos.z - (15 * math.sin(_hdg)),
													["x"] = _pos.x - (15 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[3] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-3",
													["type"] = "T-90",
													["y"] = _pos.z - (30 * math.sin(_hdg)),
													["x"] = _pos.x - (30 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[4] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-4",
													["type"] = "T-90",
													["y"] = _pos.z - (45 * math.sin(_hdg)),
													["x"] = _pos.x - (45 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											},
								["name"] = "dynamic_russian_"..eGMs.redGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(81, Group.Category.GROUND, spawn_group)
			elseif _type == "rt13" and eGMs.allow_modern_red == true then
				eGMs.redGroupCount = eGMs.redGroupCount + 1
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-1",
													["type"] = "T-90",
													["y"] = _pos.z,
													["x"] = _pos.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },
											[2] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-2",
													["type"] = "T-90",
													["y"] = _pos.z - (15 * math.sin(_hdg)),
													["x"] = _pos.x - (15 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[3] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-3",
													["type"] = "ZSU-23-4 Shilka",
													["y"] = _pos.z - (30 * math.sin(_hdg)),
													["x"] = _pos.x - (30 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[4] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-4",
													["type"] = "T-90",
													["y"] = _pos.z - (45 * math.sin(_hdg)),
													["x"] = _pos.x - (45 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											[5] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-5",
													["type"] = "T-90",
													["y"] = _pos.z - (60 * math.sin(_hdg)),
													["x"] = _pos.x - (60 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											},
								["name"] = "dynamic_russian_"..eGMs.redGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(81, Group.Category.GROUND, spawn_group)
			elseif _type == "rt14" and eGMs.allow_modern_red == true then
				eGMs.redGroupCount = eGMs.redGroupCount + 1
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-1",
													["type"] = "T-90",
													["y"] = _pos.z,
													["x"] = _pos.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },
											[2] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-2",
													["type"] = "T-90",
													["y"] = _pos.z - (15 * math.sin(_hdg)),
													["x"] = _pos.x - (15 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[3] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-3",
													["type"] = "Strela-10M3",
													["y"] = _pos.z - (30 * math.sin(_hdg)),
													["x"] = _pos.x - (30 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[4] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-4",
													["type"] = "T-90",
													["y"] = _pos.z - (45 * math.sin(_hdg)),
													["x"] = _pos.x - (45 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											[5] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-5",
													["type"] = "T-90",
													["y"] = _pos.z - (60 * math.sin(_hdg)),
													["x"] = _pos.x - (60 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											},
								["name"] = "dynamic_russian_"..eGMs.redGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(81, Group.Category.GROUND, spawn_group)
			elseif _type == "rt15" and eGMs.allow_modern_red == true then
				eGMs.redGroupCount = eGMs.redGroupCount + 1
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-1",
													["type"] = "T-90",
													["y"] = _pos.z,
													["x"] = _pos.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },
											[2] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-2",
													["type"] = "T-90",
													["y"] = _pos.z - (15 * math.sin(_hdg)),
													["x"] = _pos.x - (15 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[3] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-3",
													["type"] = "2S6 Tunguska",
													["y"] = _pos.z - (30 * math.sin(_hdg)),
													["x"] = _pos.x - (30 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[4] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-4",
													["type"] = "T-90",
													["y"] = _pos.z - (45 * math.sin(_hdg)),
													["x"] = _pos.x - (45 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											[5] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-5",
													["type"] = "T-90",
													["y"] = _pos.z - (60 * math.sin(_hdg)),
													["x"] = _pos.x - (60 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											},
								["name"] = "dynamic_russian_"..eGMs.redGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(81, Group.Category.GROUND, spawn_group)
			elseif _type == "rt16" and eGMs.allow_modern_red == true then
				eGMs.redGroupCount = eGMs.redGroupCount + 1
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-1",
													["type"] = "ZTZ96B",
													["y"] = _pos.z,
													["x"] = _pos.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },
											[2] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-2",
													["type"] = "ZTZ96B",
													["y"] = _pos.z - (15 * math.sin(_hdg)),
													["x"] = _pos.x - (15 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[3] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-3",
													["type"] = "ZTZ96B",
													["y"] = _pos.z - (30 * math.sin(_hdg)),
													["x"] = _pos.x - (30 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[4] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-4",
													["type"] = "ZTZ96B",
													["y"] = _pos.z - (45 * math.sin(_hdg)),
													["x"] = _pos.x - (45 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											},
								["name"] = "dynamic_russian_"..eGMs.redGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(81, Group.Category.GROUND, spawn_group)
			elseif _type == "rt17" and eGMs.allow_modern_red == true then
				eGMs.redGroupCount = eGMs.redGroupCount + 1
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-1",
													["type"] = "ZTZ96B",
													["y"] = _pos.z,
													["x"] = _pos.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },
											[2] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-2",
													["type"] = "ZTZ96B",
													["y"] = _pos.z - (15 * math.sin(_hdg)),
													["x"] = _pos.x - (15 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[3] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-3",
													["type"] = "ZSU-23-4 Shilka",
													["y"] = _pos.z - (30 * math.sin(_hdg)),
													["x"] = _pos.x - (30 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[4] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-4",
													["type"] = "ZTZ96B",
													["y"] = _pos.z - (45 * math.sin(_hdg)),
													["x"] = _pos.x - (45 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											[5] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-5",
													["type"] = "ZTZ96B",
													["y"] = _pos.z - (60 * math.sin(_hdg)),
													["x"] = _pos.x - (60 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											},
								["name"] = "dynamic_russian_"..eGMs.redGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(81, Group.Category.GROUND, spawn_group)
			elseif _type == "rt18" and eGMs.allow_modern_red == true then
				eGMs.redGroupCount = eGMs.redGroupCount + 1
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-1",
													["type"] = "ZTZ96B",
													["y"] = _pos.z,
													["x"] = _pos.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },
											[2] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-2",
													["type"] = "ZTZ96B",
													["y"] = _pos.z - (15 * math.sin(_hdg)),
													["x"] = _pos.x - (15 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[3] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-3",
													["type"] = "Strela-10M3",
													["y"] = _pos.z - (30 * math.sin(_hdg)),
													["x"] = _pos.x - (30 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[4] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-4",
													["type"] = "ZTZ96B",
													["y"] = _pos.z - (45 * math.sin(_hdg)),
													["x"] = _pos.x - (45 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											[5] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-5",
													["type"] = "ZTZ96B",
													["y"] = _pos.z - (60 * math.sin(_hdg)),
													["x"] = _pos.x - (60 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											},
								["name"] = "dynamic_russian_"..eGMs.redGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(81, Group.Category.GROUND, spawn_group)
			elseif _type == "rt19" and eGMs.allow_modern_red == true then
				eGMs.redGroupCount = eGMs.redGroupCount + 1
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-1",
													["type"] = "ZTZ96B",
													["y"] = _pos.z,
													["x"] = _pos.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },
											[2] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-2",
													["type"] = "ZTZ96B",
													["y"] = _pos.z - (15 * math.sin(_hdg)),
													["x"] = _pos.x - (15 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[3] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-3",
													["type"] = "2S6 Tunguska",
													["y"] = _pos.z - (30 * math.sin(_hdg)),
													["x"] = _pos.x - (30 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[4] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-4",
													["type"] = "ZTZ96B",
													["y"] = _pos.z - (45 * math.sin(_hdg)),
													["x"] = _pos.x - (45 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											[5] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-5",
													["type"] = "ZTZ96B",
													["y"] = _pos.z - (60 * math.sin(_hdg)),
													["x"] = _pos.x - (60 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											},
								["name"] = "dynamic_russian_"..eGMs.redGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(81, Group.Category.GROUND, spawn_group)
--[[IFV]]	elseif _type == "rt20" then
				eGMs.redGroupCount = eGMs.redGroupCount + 1
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-1",
													["type"] = "BMP-1",
													["y"] = _pos.z,
													["x"] = _pos.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },
											[2] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-2",
													["type"] = "BMP-1",
													["y"] = _pos.z - (15 * math.sin(_hdg)),
													["x"] = _pos.x - (15 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[3] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-3",
													["type"] = "BMP-1",
													["y"] = _pos.z - (30 * math.sin(_hdg)),
													["x"] = _pos.x - (30 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[4] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-4",
													["type"] = "BMP-1",
													["y"] = _pos.z - (45 * math.sin(_hdg)),
													["x"] = _pos.x - (45 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											},
								["name"] = "dynamic_russian_"..eGMs.redGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(81, Group.Category.GROUND, spawn_group)
			elseif _type == "rt21" then
				eGMs.redGroupCount = eGMs.redGroupCount + 1
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-1",
													["type"] = "BMP-1",
													["y"] = _pos.z,
													["x"] = _pos.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },
											[2] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-2",
													["type"] = "BMP-1",
													["y"] = _pos.z - (15 * math.sin(_hdg)),
													["x"] = _pos.x - (15 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[3] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-3",
													["type"] = "ZSU-23-4 Shilka",
													["y"] = _pos.z - (30 * math.sin(_hdg)),
													["x"] = _pos.x - (30 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[4] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-4",
													["type"] = "BMP-1",
													["y"] = _pos.z - (45 * math.sin(_hdg)),
													["x"] = _pos.x - (45 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											[5] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-5",
													["type"] = "BMP-1",
													["y"] = _pos.z - (60 * math.sin(_hdg)),
													["x"] = _pos.x - (60 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											},
								["name"] = "dynamic_russian_"..eGMs.redGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(81, Group.Category.GROUND, spawn_group)
			elseif _type == "rt22" then
				eGMs.redGroupCount = eGMs.redGroupCount + 1
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-1",
													["type"] = "BMP-1",
													["y"] = _pos.z,
													["x"] = _pos.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },
											[2] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-2",
													["type"] = "BMP-1",
													["y"] = _pos.z - (15 * math.sin(_hdg)),
													["x"] = _pos.x - (15 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[3] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-3",
													["type"] = "Strela-1 9P31",
													["y"] = _pos.z - (30 * math.sin(_hdg)),
													["x"] = _pos.x - (30 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[4] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-4",
													["type"] = "BMP-1",
													["y"] = _pos.z - (45 * math.sin(_hdg)),
													["x"] = _pos.x - (45 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											[5] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-5",
													["type"] = "BMP-1",
													["y"] = _pos.z - (60 * math.sin(_hdg)),
													["x"] = _pos.x - (60 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											},
								["name"] = "dynamic_russian_"..eGMs.redGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(81, Group.Category.GROUND, spawn_group)			
			elseif _type == "rt23" then
				eGMs.redGroupCount = eGMs.redGroupCount + 1
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-1",
													["type"] = "BMP-2",
													["y"] = _pos.z,
													["x"] = _pos.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },
											[2] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-2",
													["type"] = "BMP-2",
													["y"] = _pos.z - (15 * math.sin(_hdg)),
													["x"] = _pos.x - (15 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[3] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-3",
													["type"] = "BMP-2",
													["y"] = _pos.z - (30 * math.sin(_hdg)),
													["x"] = _pos.x - (30 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[4] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-4",
													["type"] = "BMP-2",
													["y"] = _pos.z - (45 * math.sin(_hdg)),
													["x"] = _pos.x - (45 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											},
								["name"] = "dynamic_russian_"..eGMs.redGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(81, Group.Category.GROUND, spawn_group)
			elseif _type == "rt24" and eGMs.allow_modern_red == true then
				eGMs.redGroupCount = eGMs.redGroupCount + 1
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-1",
													["type"] = "BMP-2",
													["y"] = _pos.z,
													["x"] = _pos.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },
											[2] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-2",
													["type"] = "BMP-2",
													["y"] = _pos.z - (15 * math.sin(_hdg)),
													["x"] = _pos.x - (15 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[3] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-3",
													["type"] = "ZSU-23-4 Shilka",
													["y"] = _pos.z - (30 * math.sin(_hdg)),
													["x"] = _pos.x - (30 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[4] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-4",
													["type"] = "BMP-2",
													["y"] = _pos.z - (45 * math.sin(_hdg)),
													["x"] = _pos.x - (45 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											[5] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-5",
													["type"] = "BMP-2",
													["y"] = _pos.z - (60 * math.sin(_hdg)),
													["x"] = _pos.x - (60 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											},
								["name"] = "dynamic_russian_"..eGMs.redGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(81, Group.Category.GROUND, spawn_group)
			elseif _type == "rt25" and eGMs.allow_modern_red == true then
				eGMs.redGroupCount = eGMs.redGroupCount + 1
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-1",
													["type"] = "BMP-2",
													["y"] = _pos.z,
													["x"] = _pos.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },
											[2] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-2",
													["type"] = "BMP-2",
													["y"] = _pos.z - (15 * math.sin(_hdg)),
													["x"] = _pos.x - (15 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[3] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-3",
													["type"] = "Strela-10M3",
													["y"] = _pos.z - (30 * math.sin(_hdg)),
													["x"] = _pos.x - (30 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[4] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-4",
													["type"] = "BMP-2",
													["y"] = _pos.z - (45 * math.sin(_hdg)),
													["x"] = _pos.x - (45 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											[5] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-5",
													["type"] = "BMP-2",
													["y"] = _pos.z - (60 * math.sin(_hdg)),
													["x"] = _pos.x - (60 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											},
								["name"] = "dynamic_russian_"..eGMs.redGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(81, Group.Category.GROUND, spawn_group)
			elseif _type == "rt26" and eGMs.allow_modern_red == true then
				eGMs.redGroupCount = eGMs.redGroupCount + 1
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-1",
													["type"] = "BMP-3",
													["y"] = _pos.z,
													["x"] = _pos.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },
											[2] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-2",
													["type"] = "BMP-3",
													["y"] = _pos.z - (15 * math.sin(_hdg)),
													["x"] = _pos.x - (15 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[3] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-3",
													["type"] = "BMP-3",
													["y"] = _pos.z - (30 * math.sin(_hdg)),
													["x"] = _pos.x - (30 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[4] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-4",
													["type"] = "BMP-3",
													["y"] = _pos.z - (45 * math.sin(_hdg)),
													["x"] = _pos.x - (45 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											},
								["name"] = "dynamic_russian_"..eGMs.redGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(81, Group.Category.GROUND, spawn_group)
			elseif _type == "rt27" and eGMs.allow_modern_red == true then
				eGMs.redGroupCount = eGMs.redGroupCount + 1
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-1",
													["type"] = "BMP-3",
													["y"] = _pos.z,
													["x"] = _pos.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },
											[2] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-2",
													["type"] = "BMP-3",
													["y"] = _pos.z - (15 * math.sin(_hdg)),
													["x"] = _pos.x - (15 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[3] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-3",
													["type"] = "ZSU-23-4 Shilka",
													["y"] = _pos.z - (30 * math.sin(_hdg)),
													["x"] = _pos.x - (30 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[4] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-4",
													["type"] = "BMP-3",
													["y"] = _pos.z - (45 * math.sin(_hdg)),
													["x"] = _pos.x - (45 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											[5] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-5",
													["type"] = "BMP-3",
													["y"] = _pos.z - (60 * math.sin(_hdg)),
													["x"] = _pos.x - (60 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											},
								["name"] = "dynamic_russian_"..eGMs.redGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(81, Group.Category.GROUND, spawn_group)
			elseif _type == "rt28" and eGMs.allow_modern_red == true then
				eGMs.redGroupCount = eGMs.redGroupCount + 1
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-1",
													["type"] = "BMP-3",
													["y"] = _pos.z,
													["x"] = _pos.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },
											[2] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-2",
													["type"] = "BMP-3",
													["y"] = _pos.z - (15 * math.sin(_hdg)),
													["x"] = _pos.x - (15 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[3] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-3",
													["type"] = "Strela-10M3",
													["y"] = _pos.z - (30 * math.sin(_hdg)),
													["x"] = _pos.x - (30 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },	  
											[4] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-4",
													["type"] = "BMP-3",
													["y"] = _pos.z - (45 * math.sin(_hdg)),
													["x"] = _pos.x - (45 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											[5] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-5",
													["type"] = "BMP-3",
													["y"] = _pos.z - (60 * math.sin(_hdg)),
													["x"] = _pos.x - (60 * math.cos(_hdg)),
													["heading"] = _hdg,
												  },
											},
								["name"] = "dynamic_russian_"..eGMs.redGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(81, Group.Category.GROUND, spawn_group)
--[[arty]]	elseif _type == "ra01" then
				eGMs.redGroupCount = eGMs.redGroupCount + 1
				local _u1 = eGMs.rotateVec2({x = 0, y = 7.5}, _hdg)
				local _u2 = eGMs.rotateVec2({x = 0, y = -7.5}, _hdg)
				local _u3 = eGMs.rotateVec2({x = 0, y = -22.5}, _hdg)
				local _u4 = eGMs.rotateVec2({x = 0, y = 22.5}, _hdg)
				local _u5 = eGMs.rotateVec2({x = 20, y = 0}, _hdg)
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-1",
													["type"] = "SAU Gvozdika",
													["y"] = _pos.z - _u1.y,
													["x"] = _pos.x - _u1.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },
											[2] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-2",
													["type"] = "SAU Gvozdika",
													["y"] = _pos.z - _u2.y,
													["x"] = _pos.x - _u2.x,
													["heading"] = _hdg,
												  },	  
											[3] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-3",
													["type"] = "SAU Gvozdika",
													["y"] = _pos.z - _u3.y,
													["x"] = _pos.x - _u3.x,
													["heading"] = _hdg,
												  },	  
											[4] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-4",
													["type"] = "SAU Gvozdika",
													["y"] = _pos.z - _u4.y,
													["x"] = _pos.x - _u4.x,
													["heading"] = _hdg,
												  },
											[5] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-5",
													["type"] = "Ural-375",
													["y"] = _pos.z - _u5.y,
													["x"] = _pos.x - _u5.x,
													["heading"] = _hdg,
												  },
											},
								["name"] = "dynamic_russian_"..eGMs.redGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(81, Group.Category.GROUND, spawn_group)
			elseif _type == "ra02" then
				eGMs.redGroupCount = eGMs.redGroupCount + 1
				local _u1 = eGMs.rotateVec2({x = 0, y = 7.5}, _hdg)
				local _u2 = eGMs.rotateVec2({x = 0, y = -7.5}, _hdg)
				local _u3 = eGMs.rotateVec2({x = 0, y = -22.5}, _hdg)
				local _u4 = eGMs.rotateVec2({x = 0, y = 22.5}, _hdg)
				local _u5 = eGMs.rotateVec2({x = 20, y = 0}, _hdg)
				local _u6 = eGMs.rotateVec2({x = 30, y = 5}, _hdg)
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-1",
													["type"] = "SAU Gvozdika",
													["y"] = _pos.z - _u1.y,
													["x"] = _pos.x - _u1.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },
											[2] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-2",
													["type"] = "SAU Gvozdika",
													["y"] = _pos.z - _u2.y,
													["x"] = _pos.x - _u2.x,
													["heading"] = _hdg,
												  },	  
											[3] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-3",
													["type"] = "SAU Gvozdika",
													["y"] = _pos.z - _u3.y,
													["x"] = _pos.x - _u3.x,
													["heading"] = _hdg,
												  },	  
											[4] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-4",
													["type"] = "SAU Gvozdika",
													["y"] = _pos.z - _u4.y,
													["x"] = _pos.x - _u4.x,
													["heading"] = _hdg,
												  },
											[5] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-5",
													["type"] = "Ural-375",
													["y"] = _pos.z - _u5.y,
													["x"] = _pos.x - _u5.x,
													["heading"] = _hdg,
												  },
											[6] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-6",
													["type"] = "ZSU-23-4 Shilka",
													["y"] = _pos.z - _u6.y,
													["x"] = _pos.x - _u6.x,
													["heading"] = _hdg,
												  },
											},
								["name"] = "dynamic_russian_"..eGMs.redGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(81, Group.Category.GROUND, spawn_group)
			elseif _type == "ra03" then
				eGMs.redGroupCount = eGMs.redGroupCount + 1
				local _u1 = eGMs.rotateVec2({x = 0, y = 7.5}, _hdg)
				local _u2 = eGMs.rotateVec2({x = 0, y = -7.5}, _hdg)
				local _u3 = eGMs.rotateVec2({x = 0, y = -22.5}, _hdg)
				local _u4 = eGMs.rotateVec2({x = 0, y = 22.5}, _hdg)
				local _u5 = eGMs.rotateVec2({x = 20, y = 0}, _hdg)
				local _u6 = eGMs.rotateVec2({x = 30, y = 5}, _hdg)
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-1",
													["type"] = "SAU Gvozdika",
													["y"] = _pos.z - _u1.y,
													["x"] = _pos.x - _u1.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },
											[2] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-2",
													["type"] = "SAU Gvozdika",
													["y"] = _pos.z - _u2.y,
													["x"] = _pos.x - _u2.x,
													["heading"] = _hdg,
												  },	  
											[3] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-3",
													["type"] = "SAU Gvozdika",
													["y"] = _pos.z - _u3.y,
													["x"] = _pos.x - _u3.x,
													["heading"] = _hdg,
												  },	  
											[4] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-4",
													["type"] = "SAU Gvozdika",
													["y"] = _pos.z - _u4.y,
													["x"] = _pos.x - _u4.x,
													["heading"] = _hdg,
												  },
											[5] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-5",
													["type"] = "Ural-375",
													["y"] = _pos.z - _u5.y,
													["x"] = _pos.x - _u5.x,
													["heading"] = _hdg,
												  },
											[6] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-6",
													["type"] = "ZSU_57_2",
													["y"] = _pos.z - _u6.y,
													["x"] = _pos.x - _u6.x,
													["heading"] = _hdg,
												  },
											},
								["name"] = "dynamic_russian_"..eGMs.redGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(81, Group.Category.GROUND, spawn_group)
			elseif _type == "ra04" then
				eGMs.redGroupCount = eGMs.redGroupCount + 1
				local _u1 = eGMs.rotateVec2({x = 0, y = 7.5}, _hdg)
				local _u2 = eGMs.rotateVec2({x = 0, y = -7.5}, _hdg)
				local _u3 = eGMs.rotateVec2({x = 0, y = -22.5}, _hdg)
				local _u4 = eGMs.rotateVec2({x = 0, y = 22.5}, _hdg)
				local _u5 = eGMs.rotateVec2({x = 20, y = 0}, _hdg)
				local _u6 = eGMs.rotateVec2({x = 30, y = 5}, _hdg)
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-1",
													["type"] = "SAU Gvozdika",
													["y"] = _pos.z - _u1.y,
													["x"] = _pos.x - _u1.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },
											[2] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-2",
													["type"] = "SAU Gvozdika",
													["y"] = _pos.z - _u2.y,
													["x"] = _pos.x - _u2.x,
													["heading"] = _hdg,
												  },	  
											[3] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-3",
													["type"] = "SAU Gvozdika",
													["y"] = _pos.z - _u3.y,
													["x"] = _pos.x - _u3.x,
													["heading"] = _hdg,
												  },	  
											[4] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-4",
													["type"] = "SAU Gvozdika",
													["y"] = _pos.z - _u4.y,
													["x"] = _pos.x - _u4.x,
													["heading"] = _hdg,
												  },
											[5] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-5",
													["type"] = "Ural-375",
													["y"] = _pos.z - _u5.y,
													["x"] = _pos.x - _u5.x,
													["heading"] = _hdg,
												  },
											[6] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-6",
													["type"] = "Strela-1 9P31",
													["y"] = _pos.z - _u6.y,
													["x"] = _pos.x - _u6.x,
													["heading"] = _hdg,
												  },
											},
								["name"] = "dynamic_russian_"..eGMs.redGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(81, Group.Category.GROUND, spawn_group)
			elseif _type == "ra05" and eGMs.allow_modern_red == true then
				eGMs.redGroupCount = eGMs.redGroupCount + 1
				local _u1 = eGMs.rotateVec2({x = 0, y = 7.5}, _hdg)
				local _u2 = eGMs.rotateVec2({x = 0, y = -7.5}, _hdg)
				local _u3 = eGMs.rotateVec2({x = 0, y = -22.5}, _hdg)
				local _u4 = eGMs.rotateVec2({x = 0, y = 22.5}, _hdg)
				local _u5 = eGMs.rotateVec2({x = 20, y = 0}, _hdg)
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-1",
													["type"] = "SAU Msta",
													["y"] = _pos.z - _u1.y,
													["x"] = _pos.x - _u1.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },
											[2] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-2",
													["type"] = "SAU Msta",
													["y"] = _pos.z - _u2.y,
													["x"] = _pos.x - _u2.x,
													["heading"] = _hdg,
												  },	  
											[3] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-3",
													["type"] = "SAU Msta",
													["y"] = _pos.z - _u3.y,
													["x"] = _pos.x - _u3.x,
													["heading"] = _hdg,
												  },	  
											[4] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-4",
													["type"] = "SAU Msta",
													["y"] = _pos.z - _u4.y,
													["x"] = _pos.x - _u4.x,
													["heading"] = _hdg,
												  },
											[5] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-5",
													["type"] = "Ural-375",
													["y"] = _pos.z - _u5.y,
													["x"] = _pos.x - _u5.x,
													["heading"] = _hdg,
												  },
											},
								["name"] = "dynamic_russian_"..eGMs.redGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(81, Group.Category.GROUND, spawn_group)
			elseif _type == "ra06" and eGMs.allow_modern_red == true then
				eGMs.redGroupCount = eGMs.redGroupCount + 1
				local _u1 = eGMs.rotateVec2({x = 0, y = 7.5}, _hdg)
				local _u2 = eGMs.rotateVec2({x = 0, y = -7.5}, _hdg)
				local _u3 = eGMs.rotateVec2({x = 0, y = -22.5}, _hdg)
				local _u4 = eGMs.rotateVec2({x = 0, y = 22.5}, _hdg)
				local _u5 = eGMs.rotateVec2({x = 20, y = 0}, _hdg)
				local _u6 = eGMs.rotateVec2({x = 30, y = 5}, _hdg)
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-1",
													["type"] = "SAU Msta",
													["y"] = _pos.z - _u1.y,
													["x"] = _pos.x - _u1.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },
											[2] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-2",
													["type"] = "SAU Msta",
													["y"] = _pos.z - _u2.y,
													["x"] = _pos.x - _u2.x,
													["heading"] = _hdg,
												  },	  
											[3] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-3",
													["type"] = "SAU Msta",
													["y"] = _pos.z - _u3.y,
													["x"] = _pos.x - _u3.x,
													["heading"] = _hdg,
												  },	  
											[4] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-4",
													["type"] = "SAU Msta",
													["y"] = _pos.z - _u4.y,
													["x"] = _pos.x - _u4.x,
													["heading"] = _hdg,
												  },
											[5] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-5",
													["type"] = "Ural-375",
													["y"] = _pos.z - _u5.y,
													["x"] = _pos.x - _u5.x,
													["heading"] = _hdg,
												  },
											[6] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-6",
													["type"] = "ZSU-23-4 Shilka",
													["y"] = _pos.z - _u6.y,
													["x"] = _pos.x - _u6.x,
													["heading"] = _hdg,
												  },
											},
								["name"] = "dynamic_russian_"..eGMs.redGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(81, Group.Category.GROUND, spawn_group)
			elseif _type == "ra07" and eGMs.allow_modern_red == true then
				eGMs.redGroupCount = eGMs.redGroupCount + 1
				local _u1 = eGMs.rotateVec2({x = 0, y = 7.5}, _hdg)
				local _u2 = eGMs.rotateVec2({x = 0, y = -7.5}, _hdg)
				local _u3 = eGMs.rotateVec2({x = 0, y = -22.5}, _hdg)
				local _u4 = eGMs.rotateVec2({x = 0, y = 22.5}, _hdg)
				local _u5 = eGMs.rotateVec2({x = 20, y = 0}, _hdg)
				local _u6 = eGMs.rotateVec2({x = 30, y = 5}, _hdg)
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-1",
													["type"] = "SAU Msta",
													["y"] = _pos.z - _u1.y,
													["x"] = _pos.x - _u1.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },
											[2] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-2",
													["type"] = "SAU Msta",
													["y"] = _pos.z - _u2.y,
													["x"] = _pos.x - _u2.x,
													["heading"] = _hdg,
												  },	  
											[3] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-3",
													["type"] = "SAU Msta",
													["y"] = _pos.z - _u3.y,
													["x"] = _pos.x - _u3.x,
													["heading"] = _hdg,
												  },	  
											[4] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-4",
													["type"] = "SAU Msta",
													["y"] = _pos.z - _u4.y,
													["x"] = _pos.x - _u4.x,
													["heading"] = _hdg,
												  },
											[5] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-5",
													["type"] = "Ural-375",
													["y"] = _pos.z - _u5.y,
													["x"] = _pos.x - _u5.x,
													["heading"] = _hdg,
												  },
											[6] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-6",
													["type"] = "Strela-10M3",
													["y"] = _pos.z - _u6.y,
													["x"] = _pos.x - _u6.x,
													["heading"] = _hdg,
												  },
											},
								["name"] = "dynamic_russian_"..eGMs.redGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(81, Group.Category.GROUND, spawn_group)
			elseif _type == "ra08" and eGMs.allow_modern_red == true then
				eGMs.redGroupCount = eGMs.redGroupCount + 1
				local _u1 = eGMs.rotateVec2({x = 0, y = 7.5}, _hdg)
				local _u2 = eGMs.rotateVec2({x = 0, y = -7.5}, _hdg)
				local _u3 = eGMs.rotateVec2({x = 0, y = -22.5}, _hdg)
				local _u4 = eGMs.rotateVec2({x = 0, y = 22.5}, _hdg)
				local _u5 = eGMs.rotateVec2({x = 20, y = 0}, _hdg)
				local _u6 = eGMs.rotateVec2({x = 30, y = 5}, _hdg)
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-1",
													["type"] = "SAU Msta",
													["y"] = _pos.z - _u1.y,
													["x"] = _pos.x - _u1.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },
											[2] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-2",
													["type"] = "SAU Msta",
													["y"] = _pos.z - _u2.y,
													["x"] = _pos.x - _u2.x,
													["heading"] = _hdg,
												  },	  
											[3] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-3",
													["type"] = "SAU Msta",
													["y"] = _pos.z - _u3.y,
													["x"] = _pos.x - _u3.x,
													["heading"] = _hdg,
												  },	  
											[4] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-4",
													["type"] = "SAU Msta",
													["y"] = _pos.z - _u4.y,
													["x"] = _pos.x - _u4.x,
													["heading"] = _hdg,
												  },
											[5] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-5",
													["type"] = "Ural-375",
													["y"] = _pos.z - _u5.y,
													["x"] = _pos.x - _u5.x,
													["heading"] = _hdg,
												  },
											[6] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-6",
													["type"] = "2S6 Tunguska",
													["y"] = _pos.z - _u6.y,
													["x"] = _pos.x - _u6.x,
													["heading"] = _hdg,
												  },
											},
								["name"] = "dynamic_russian_"..eGMs.redGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(81, Group.Category.GROUND, spawn_group)
			elseif _type == "ra09" then
				eGMs.redGroupCount = eGMs.redGroupCount + 1
				local _u1 = eGMs.rotateVec2({x = 0, y = 7.5}, _hdg)
				local _u2 = eGMs.rotateVec2({x = 0, y = -7.5}, _hdg)
				local _u3 = eGMs.rotateVec2({x = 0, y = -22.5}, _hdg)
				local _u4 = eGMs.rotateVec2({x = 0, y = 22.5}, _hdg)
				local _u5 = eGMs.rotateVec2({x = 20, y = 0}, _hdg)
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-1",
													["type"] = "Grad-URAL",
													["y"] = _pos.z - _u1.y,
													["x"] = _pos.x - _u1.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg + 1.5708,
												  },
											[2] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-2",
													["type"] = "Grad-URAL",
													["y"] = _pos.z - _u2.y,
													["x"] = _pos.x - _u2.x,
													["heading"] = _hdg + 1.5708,
												  },	  
											[3] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-3",
													["type"] = "Grad-URAL",
													["y"] = _pos.z - _u3.y,
													["x"] = _pos.x - _u3.x,
													["heading"] = _hdg + 1.5708,
												  },	  
											[4] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-4",
													["type"] = "Grad-URAL",
													["y"] = _pos.z - _u4.y,
													["x"] = _pos.x - _u4.x,
													["heading"] = _hdg + 1.5708,
												  },
											[5] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-5",
													["type"] = "Ural-375",
													["y"] = _pos.z - _u5.y,
													["x"] = _pos.x - _u5.x,
													["heading"] = _hdg,
												  },
											},
								["name"] = "dynamic_russian_"..eGMs.redGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(81, Group.Category.GROUND, spawn_group)
			elseif _type == "ra10" then
				eGMs.redGroupCount = eGMs.redGroupCount + 1
				local _u1 = eGMs.rotateVec2({x = 0, y = 7.5}, _hdg)
				local _u2 = eGMs.rotateVec2({x = 0, y = -7.5}, _hdg)
				local _u3 = eGMs.rotateVec2({x = 0, y = -22.5}, _hdg)
				local _u4 = eGMs.rotateVec2({x = 0, y = 22.5}, _hdg)
				local _u5 = eGMs.rotateVec2({x = 20, y = 0}, _hdg)
				local _u6 = eGMs.rotateVec2({x = 30, y = 5}, _hdg)
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-1",
													["type"] = "Grad-URAL",
													["y"] = _pos.z - _u1.y,
													["x"] = _pos.x - _u1.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg + 1.5708,
												  },
											[2] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-2",
													["type"] = "Grad-URAL",
													["y"] = _pos.z - _u2.y,
													["x"] = _pos.x - _u2.x,
													["heading"] = _hdg + 1.5708,
												  },	  
											[3] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-3",
													["type"] = "Grad-URAL",
													["y"] = _pos.z - _u3.y,
													["x"] = _pos.x - _u3.x,
													["heading"] = _hdg + 1.5708,
												  },	  
											[4] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-4",
													["type"] = "Grad-URAL",
													["y"] = _pos.z - _u4.y,
													["x"] = _pos.x - _u4.x,
													["heading"] = _hdg + 1.5708,
												  },
											[5] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-5",
													["type"] = "Ural-375",
													["y"] = _pos.z - _u5.y,
													["x"] = _pos.x - _u5.x,
													["heading"] = _hdg,
												  },
											[6] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-6",
													["type"] = "ZSU-23-4 Shilka",
													["y"] = _pos.z - _u6.y,
													["x"] = _pos.x - _u6.x,
													["heading"] = _hdg,
												  },
											},
								["name"] = "dynamic_russian_"..eGMs.redGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(81, Group.Category.GROUND, spawn_group)
			elseif _type == "ra11" then
				eGMs.redGroupCount = eGMs.redGroupCount + 1
				local _u1 = eGMs.rotateVec2({x = 0, y = 7.5}, _hdg)
				local _u2 = eGMs.rotateVec2({x = 0, y = -7.5}, _hdg)
				local _u3 = eGMs.rotateVec2({x = 0, y = -22.5}, _hdg)
				local _u4 = eGMs.rotateVec2({x = 0, y = 22.5}, _hdg)
				local _u5 = eGMs.rotateVec2({x = 20, y = 0}, _hdg)
				local _u6 = eGMs.rotateVec2({x = 30, y = 5}, _hdg)
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-1",
													["type"] = "Grad-URAL",
													["y"] = _pos.z - _u1.y,
													["x"] = _pos.x - _u1.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg + 1.5708,
												  },
											[2] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-2",
													["type"] = "Grad-URAL",
													["y"] = _pos.z - _u2.y,
													["x"] = _pos.x - _u2.x,
													["heading"] = _hdg + 1.5708,
												  },	  
											[3] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-3",
													["type"] = "Grad-URAL",
													["y"] = _pos.z - _u3.y,
													["x"] = _pos.x - _u3.x,
													["heading"] = _hdg + 1.5708,
												  },	  
											[4] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-4",
													["type"] = "Grad-URAL",
													["y"] = _pos.z - _u4.y,
													["x"] = _pos.x - _u4.x,
													["heading"] = _hdg + 1.5708,
												  },
											[5] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-5",
													["type"] = "Ural-375",
													["y"] = _pos.z - _u5.y,
													["x"] = _pos.x - _u5.x,
													["heading"] = _hdg,
												  },
											[6] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-6",
													["type"] = "ZSU_57_2",
													["y"] = _pos.z - _u6.y,
													["x"] = _pos.x - _u6.x,
													["heading"] = _hdg,
												  },
											},
								["name"] = "dynamic_russian_"..eGMs.redGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(81, Group.Category.GROUND, spawn_group)
			elseif _type == "ra12" then
				eGMs.redGroupCount = eGMs.redGroupCount + 1
				local _u1 = eGMs.rotateVec2({x = 0, y = 7.5}, _hdg)
				local _u2 = eGMs.rotateVec2({x = 0, y = -7.5}, _hdg)
				local _u3 = eGMs.rotateVec2({x = 0, y = -22.5}, _hdg)
				local _u4 = eGMs.rotateVec2({x = 0, y = 22.5}, _hdg)
				local _u5 = eGMs.rotateVec2({x = 20, y = 0}, _hdg)
				local _u6 = eGMs.rotateVec2({x = 30, y = 5}, _hdg)
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-1",
													["type"] = "Grad-URAL",
													["y"] = _pos.z - _u1.y,
													["x"] = _pos.x - _u1.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg + 1.5708,
												  },
											[2] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-2",
													["type"] = "Grad-URAL",
													["y"] = _pos.z - _u2.y,
													["x"] = _pos.x - _u2.x,
													["heading"] = _hdg + 1.5708,
												  },	  
											[3] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-3",
													["type"] = "Grad-URAL",
													["y"] = _pos.z - _u3.y,
													["x"] = _pos.x - _u3.x,
													["heading"] = _hdg + 1.5708,
												  },	  
											[4] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-4",
													["type"] = "Grad-URAL",
													["y"] = _pos.z - _u4.y,
													["x"] = _pos.x - _u4.x,
													["heading"] = _hdg + 1.5708,
												  },
											[5] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-5",
													["type"] = "Ural-375",
													["y"] = _pos.z - _u5.y,
													["x"] = _pos.x - _u5.x,
													["heading"] = _hdg,
												  },
											[6] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-6",
													["type"] = "Strela-1 9P31",
													["y"] = _pos.z - _u6.y,
													["x"] = _pos.x - _u6.x,
													["heading"] = _hdg,
												  },
											},
								["name"] = "dynamic_russian_"..eGMs.redGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(81, Group.Category.GROUND, spawn_group)
			elseif _type == "ra13" then
				eGMs.redGroupCount = eGMs.redGroupCount + 1
				local _u1 = eGMs.rotateVec2({x = 0, y = 15}, _hdg)
				local _u2 = eGMs.rotateVec2({x = 0, y = -15}, _hdg)
				local _u3 = eGMs.rotateVec2({x = 0, y = -45}, _hdg)
				local _u4 = eGMs.rotateVec2({x = 0, y = 45}, _hdg)
				local _u5 = eGMs.rotateVec2({x = 20, y = 0}, _hdg)
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-1",
													["type"] = "Uragan_BM-27",
													["y"] = _pos.z - _u1.y,
													["x"] = _pos.x - _u1.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },
											[2] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-2",
													["type"] = "Uragan_BM-27",
													["y"] = _pos.z - _u2.y,
													["x"] = _pos.x - _u2.x,
													["heading"] = _hdg,
												  },	  
											[3] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-3",
													["type"] = "Uragan_BM-27",
													["y"] = _pos.z - _u3.y,
													["x"] = _pos.x - _u3.x,
													["heading"] = _hdg,
												  },	  
											[4] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-4",
													["type"] = "Uragan_BM-27",
													["y"] = _pos.z - _u4.y,
													["x"] = _pos.x - _u4.x,
													["heading"] = _hdg,
												  },
											[5] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-5",
													["type"] = "Ural-375",
													["y"] = _pos.z - _u5.y,
													["x"] = _pos.x - _u5.x,
													["heading"] = _hdg,
												  },
											},
								["name"] = "dynamic_russian_"..eGMs.redGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(81, Group.Category.GROUND, spawn_group)
			elseif _type == "ra14" then
				eGMs.redGroupCount = eGMs.redGroupCount + 1
				local _u1 = eGMs.rotateVec2({x = 0, y = 15}, _hdg)
				local _u2 = eGMs.rotateVec2({x = 0, y = -15}, _hdg)
				local _u3 = eGMs.rotateVec2({x = 0, y = -45}, _hdg)
				local _u4 = eGMs.rotateVec2({x = 0, y = 45}, _hdg)
				local _u5 = eGMs.rotateVec2({x = 20, y = 0}, _hdg)
				local _u6 = eGMs.rotateVec2({x = 30, y = 5}, _hdg)
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-1",
													["type"] = "Uragan_BM-27",
													["y"] = _pos.z - _u1.y,
													["x"] = _pos.x - _u1.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },
											[2] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-2",
													["type"] = "Uragan_BM-27",
													["y"] = _pos.z - _u2.y,
													["x"] = _pos.x - _u2.x,
													["heading"] = _hdg,
												  },	  
											[3] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-3",
													["type"] = "Uragan_BM-27",
													["y"] = _pos.z - _u3.y,
													["x"] = _pos.x - _u3.x,
													["heading"] = _hdg,
												  },	  
											[4] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-4",
													["type"] = "Uragan_BM-27",
													["y"] = _pos.z - _u4.y,
													["x"] = _pos.x - _u4.x,
													["heading"] = _hdg,
												  },
											[5] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-5",
													["type"] = "Ural-375",
													["y"] = _pos.z - _u5.y,
													["x"] = _pos.x - _u5.x,
													["heading"] = _hdg,
												  },
											[6] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-6",
													["type"] = "Strela-10M3",
													["y"] = _pos.z - _u6.y,
													["x"] = _pos.x - _u6.x,
													["heading"] = _hdg,
												  },
											},
								["name"] = "dynamic_russian_"..eGMs.redGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(81, Group.Category.GROUND, spawn_group)
			elseif _type == "ra15" then
				eGMs.redGroupCount = eGMs.redGroupCount + 1
				local _u1 = eGMs.rotateVec2({x = 0, y = 15}, _hdg)
				local _u2 = eGMs.rotateVec2({x = 0, y = -15}, _hdg)
				local _u3 = eGMs.rotateVec2({x = 0, y = -45}, _hdg)
				local _u4 = eGMs.rotateVec2({x = 0, y = 45}, _hdg)
				local _u5 = eGMs.rotateVec2({x = 20, y = 0}, _hdg)
				local _u6 = eGMs.rotateVec2({x = 30, y = 5}, _hdg)
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-1",
													["type"] = "Uragan_BM-27",
													["y"] = _pos.z - _u1.y,
													["x"] = _pos.x - _u1.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },
											[2] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-2",
													["type"] = "Uragan_BM-27",
													["y"] = _pos.z - _u2.y,
													["x"] = _pos.x - _u2.x,
													["heading"] = _hdg,
												  },	  
											[3] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-3",
													["type"] = "Uragan_BM-27",
													["y"] = _pos.z - _u3.y,
													["x"] = _pos.x - _u3.x,
													["heading"] = _hdg,
												  },	  
											[4] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-4",
													["type"] = "Uragan_BM-27",
													["y"] = _pos.z - _u4.y,
													["x"] = _pos.x - _u4.x,
													["heading"] = _hdg,
												  },
											[5] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-5",
													["type"] = "Ural-375",
													["y"] = _pos.z - _u5.y,
													["x"] = _pos.x - _u5.x,
													["heading"] = _hdg,
												  },
											[6] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-6",
													["type"] = "2S6 Tunguska",
													["y"] = _pos.z - _u6.y,
													["x"] = _pos.x - _u6.x,
													["heading"] = _hdg,
												  },
											},
								["name"] = "dynamic_russian_"..eGMs.redGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(81, Group.Category.GROUND, spawn_group)
			elseif _type == "ra16" then
				eGMs.redGroupCount = eGMs.redGroupCount + 1
				local _u1 = eGMs.rotateVec2({x = 0, y = 15}, _hdg)
				local _u2 = eGMs.rotateVec2({x = 0, y = -15}, _hdg)
				local _u3 = eGMs.rotateVec2({x = 0, y = -45}, _hdg)
				local _u4 = eGMs.rotateVec2({x = 0, y = 45}, _hdg)
				local _u5 = eGMs.rotateVec2({x = 20, y = 0}, _hdg)
				local _u6 = eGMs.rotateVec2({x = 30, y = 5}, _hdg)
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-1",
													["type"] = "Uragan_BM-27",
													["y"] = _pos.z - _u1.y,
													["x"] = _pos.x - _u1.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },
											[2] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-2",
													["type"] = "Uragan_BM-27",
													["y"] = _pos.z - _u2.y,
													["x"] = _pos.x - _u2.x,
													["heading"] = _hdg,
												  },	  
											[3] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-3",
													["type"] = "Uragan_BM-27",
													["y"] = _pos.z - _u3.y,
													["x"] = _pos.x - _u3.x,
													["heading"] = _hdg,
												  },	  
											[4] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-4",
													["type"] = "Uragan_BM-27",
													["y"] = _pos.z - _u4.y,
													["x"] = _pos.x - _u4.x,
													["heading"] = _hdg,
												  },
											[5] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-5",
													["type"] = "Ural-375",
													["y"] = _pos.z - _u5.y,
													["x"] = _pos.x - _u5.x,
													["heading"] = _hdg,
												  },
											[6] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-6",
													["type"] = "Osa 9A33 ln",
													["y"] = _pos.z - _u6.y,
													["x"] = _pos.x - _u6.x,
													["heading"] = _hdg,
												  },
											},
								["name"] = "dynamic_russian_"..eGMs.redGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(81, Group.Category.GROUND, spawn_group)
			elseif _type == "ra17" then
				eGMs.redGroupCount = eGMs.redGroupCount + 1
				local _u1 = eGMs.rotateVec2({x = 0, y = 15}, _hdg)
				local _u2 = eGMs.rotateVec2({x = 0, y = -15}, _hdg)
				local _u3 = eGMs.rotateVec2({x = 0, y = -45}, _hdg)
				local _u4 = eGMs.rotateVec2({x = 0, y = 45}, _hdg)
				local _u5 = eGMs.rotateVec2({x = 20, y = 0}, _hdg)
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-1",
													["type"] = "Smerch_HE",
													["y"] = _pos.z - _u1.y,
													["x"] = _pos.x - _u1.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },
											[2] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-2",
													["type"] = "Smerch_HE",
													["y"] = _pos.z - _u2.y,
													["x"] = _pos.x - _u2.x,
													["heading"] = _hdg,
												  },	  
											[3] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-3",
													["type"] = "Smerch_HE",
													["y"] = _pos.z - _u3.y,
													["x"] = _pos.x - _u3.x,
													["heading"] = _hdg,
												  },	  
											[4] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-4",
													["type"] = "Smerch_HE",
													["y"] = _pos.z - _u4.y,
													["x"] = _pos.x - _u4.x,
													["heading"] = _hdg,
												  },
											[5] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-5",
													["type"] = "Ural-375",
													["y"] = _pos.z - _u5.y,
													["x"] = _pos.x - _u5.x,
													["heading"] = _hdg,
												  },
											},
								["name"] = "dynamic_russian_"..eGMs.redGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(81, Group.Category.GROUND, spawn_group)
			elseif _type == "ra18" then
				eGMs.redGroupCount = eGMs.redGroupCount + 1
				local _u1 = eGMs.rotateVec2({x = 0, y = 15}, _hdg)
				local _u2 = eGMs.rotateVec2({x = 0, y = -15}, _hdg)
				local _u3 = eGMs.rotateVec2({x = 0, y = -45}, _hdg)
				local _u4 = eGMs.rotateVec2({x = 0, y = 45}, _hdg)
				local _u5 = eGMs.rotateVec2({x = 20, y = 0}, _hdg)
				local _u6 = eGMs.rotateVec2({x = 30, y = 5}, _hdg)
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-1",
													["type"] = "Smerch_HE",
													["y"] = _pos.z - _u1.y,
													["x"] = _pos.x - _u1.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },
											[2] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-2",
													["type"] = "Smerch_HE",
													["y"] = _pos.z - _u2.y,
													["x"] = _pos.x - _u2.x,
													["heading"] = _hdg,
												  },	  
											[3] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-3",
													["type"] = "Smerch_HE",
													["y"] = _pos.z - _u3.y,
													["x"] = _pos.x - _u3.x,
													["heading"] = _hdg,
												  },	  
											[4] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-4",
													["type"] = "Smerch_HE",
													["y"] = _pos.z - _u4.y,
													["x"] = _pos.x - _u4.x,
													["heading"] = _hdg,
												  },
											[5] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-5",
													["type"] = "Ural-375",
													["y"] = _pos.z - _u5.y,
													["x"] = _pos.x - _u5.x,
													["heading"] = _hdg,
												  },
											[6] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-6",
													["type"] = "2S6 Tunguska",
													["y"] = _pos.z - _u6.y,
													["x"] = _pos.x - _u6.x,
													["heading"] = _hdg,
												  },
											},
								["name"] = "dynamic_russian_"..eGMs.redGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(81, Group.Category.GROUND, spawn_group)
			elseif _type == "ra19" then
				eGMs.redGroupCount = eGMs.redGroupCount + 1
				local _u1 = eGMs.rotateVec2({x = 0, y = 15}, _hdg)
				local _u2 = eGMs.rotateVec2({x = 0, y = -15}, _hdg)
				local _u3 = eGMs.rotateVec2({x = 0, y = -45}, _hdg)
				local _u4 = eGMs.rotateVec2({x = 0, y = 45}, _hdg)
				local _u5 = eGMs.rotateVec2({x = 20, y = 0}, _hdg)
				local _u6 = eGMs.rotateVec2({x = 30, y = 5}, _hdg)
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-1",
													["type"] = "Smerch_HE",
													["y"] = _pos.z - _u1.y,
													["x"] = _pos.x - _u1.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },
											[2] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-2",
													["type"] = "Smerch_HE",
													["y"] = _pos.z - _u2.y,
													["x"] = _pos.x - _u2.x,
													["heading"] = _hdg,
												  },	  
											[3] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-3",
													["type"] = "Smerch_HE",
													["y"] = _pos.z - _u3.y,
													["x"] = _pos.x - _u3.x,
													["heading"] = _hdg,
												  },	  
											[4] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-4",
													["type"] = "Smerch_HE",
													["y"] = _pos.z - _u4.y,
													["x"] = _pos.x - _u4.x,
													["heading"] = _hdg,
												  },
											[5] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-5",
													["type"] = "Ural-375",
													["y"] = _pos.z - _u5.y,
													["x"] = _pos.x - _u5.x,
													["heading"] = _hdg,
												  },
											[6] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-6",
													["type"] = "Osa 9A33 ln",
													["y"] = _pos.z - _u6.y,
													["x"] = _pos.x - _u6.x,
													["heading"] = _hdg,
												  },
											},
								["name"] = "dynamic_russian_"..eGMs.redGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(81, Group.Category.GROUND, spawn_group)
			elseif _type == "ra20" then
				eGMs.redGroupCount = eGMs.redGroupCount + 1
				local _u1 = eGMs.rotateVec2({x = 0, y = 15}, _hdg)
				local _u2 = eGMs.rotateVec2({x = 0, y = -15}, _hdg)
				local _u3 = eGMs.rotateVec2({x = 0, y = -45}, _hdg)
				local _u4 = eGMs.rotateVec2({x = 0, y = 45}, _hdg)
				local _u5 = eGMs.rotateVec2({x = 20, y = 0}, _hdg)
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-1",
													["type"] = "Smerch",
													["y"] = _pos.z - _u1.y,
													["x"] = _pos.x - _u1.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },
											[2] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-2",
													["type"] = "Smerch",
													["y"] = _pos.z - _u2.y,
													["x"] = _pos.x - _u2.x,
													["heading"] = _hdg,
												  },	  
											[3] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-3",
													["type"] = "Smerch",
													["y"] = _pos.z - _u3.y,
													["x"] = _pos.x - _u3.x,
													["heading"] = _hdg,
												  },	  
											[4] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-4",
													["type"] = "Smerch",
													["y"] = _pos.z - _u4.y,
													["x"] = _pos.x - _u4.x,
													["heading"] = _hdg,
												  },
											[5] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-5",
													["type"] = "Ural-375",
													["y"] = _pos.z - _u5.y,
													["x"] = _pos.x - _u5.x,
													["heading"] = _hdg,
												  },
											},
								["name"] = "dynamic_russian_"..eGMs.redGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(81, Group.Category.GROUND, spawn_group)
			elseif _type == "ra21" then
				eGMs.redGroupCount = eGMs.redGroupCount + 1
				local _u1 = eGMs.rotateVec2({x = 0, y = 15}, _hdg)
				local _u2 = eGMs.rotateVec2({x = 0, y = -15}, _hdg)
				local _u3 = eGMs.rotateVec2({x = 0, y = -45}, _hdg)
				local _u4 = eGMs.rotateVec2({x = 0, y = 45}, _hdg)
				local _u5 = eGMs.rotateVec2({x = 20, y = 0}, _hdg)
				local _u6 = eGMs.rotateVec2({x = 30, y = 5}, _hdg)
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-1",
													["type"] = "Smerch",
													["y"] = _pos.z - _u1.y,
													["x"] = _pos.x - _u1.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },
											[2] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-2",
													["type"] = "Smerch",
													["y"] = _pos.z - _u2.y,
													["x"] = _pos.x - _u2.x,
													["heading"] = _hdg,
												  },	  
											[3] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-3",
													["type"] = "Smerch",
													["y"] = _pos.z - _u3.y,
													["x"] = _pos.x - _u3.x,
													["heading"] = _hdg,
												  },	  
											[4] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-4",
													["type"] = "Smerch",
													["y"] = _pos.z - _u4.y,
													["x"] = _pos.x - _u4.x,
													["heading"] = _hdg,
												  },
											[5] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-5",
													["type"] = "Ural-375",
													["y"] = _pos.z - _u5.y,
													["x"] = _pos.x - _u5.x,
													["heading"] = _hdg,
												  },
											[6] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-6",
													["type"] = "2S6 Tunguska",
													["y"] = _pos.z - _u6.y,
													["x"] = _pos.x - _u6.x,
													["heading"] = _hdg,
												  },
											},
								["name"] = "dynamic_russian_"..eGMs.redGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(81, Group.Category.GROUND, spawn_group)
			elseif _type == "ra22" then
				eGMs.redGroupCount = eGMs.redGroupCount + 1
				local _u1 = eGMs.rotateVec2({x = 0, y = 15}, _hdg)
				local _u2 = eGMs.rotateVec2({x = 0, y = -15}, _hdg)
				local _u3 = eGMs.rotateVec2({x = 0, y = -45}, _hdg)
				local _u4 = eGMs.rotateVec2({x = 0, y = 45}, _hdg)
				local _u5 = eGMs.rotateVec2({x = 20, y = 0}, _hdg)
				local _u6 = eGMs.rotateVec2({x = 30, y = 5}, _hdg)
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-1",
													["type"] = "Smerch",
													["y"] = _pos.z - _u1.y,
													["x"] = _pos.x - _u1.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },
											[2] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-2",
													["type"] = "Smerch",
													["y"] = _pos.z - _u2.y,
													["x"] = _pos.x - _u2.x,
													["heading"] = _hdg,
												  },	  
											[3] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-3",
													["type"] = "Smerch",
													["y"] = _pos.z - _u3.y,
													["x"] = _pos.x - _u3.x,
													["heading"] = _hdg,
												  },	  
											[4] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-4",
													["type"] = "Smerch",
													["y"] = _pos.z - _u4.y,
													["x"] = _pos.x - _u4.x,
													["heading"] = _hdg,
												  },
											[5] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-5",
													["type"] = "Ural-375",
													["y"] = _pos.z - _u5.y,
													["x"] = _pos.x - _u5.x,
													["heading"] = _hdg,
												  },
											[6] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-6",
													["type"] = "Osa 9A33 ln",
													["y"] = _pos.z - _u6.y,
													["x"] = _pos.x - _u6.x,
													["heading"] = _hdg,
												  },
											},
								["name"] = "dynamic_russian_"..eGMs.redGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(81, Group.Category.GROUND, spawn_group)
			elseif _type == "ra23" then
				eGMs.redGroupCount = eGMs.redGroupCount + 1
				local _u1 = eGMs.rotateVec2({x = 0, y = 15}, _hdg)
				local _u2 = eGMs.rotateVec2({x = 0, y = -15}, _hdg)
				local _u3 = eGMs.rotateVec2({x = 0, y = -45}, _hdg)
				local _u4 = eGMs.rotateVec2({x = 0, y = 45}, _hdg)
				local _u5 = eGMs.rotateVec2({x = 20, y = 0}, _hdg)
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-1",
													["type"] = "Scud_B",
													["y"] = _pos.z - _u1.y,
													["x"] = _pos.x - _u1.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },
											[2] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-2",
													["type"] = "Scud_B",
													["y"] = _pos.z - _u2.y,
													["x"] = _pos.x - _u2.x,
													["heading"] = _hdg,
												  },	  
											[3] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-3",
													["type"] = "Scud_B",
													["y"] = _pos.z - _u3.y,
													["x"] = _pos.x - _u3.x,
													["heading"] = _hdg,
												  },	  
											[4] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-4",
													["type"] = "Scud_B",
													["y"] = _pos.z - _u4.y,
													["x"] = _pos.x - _u4.x,
													["heading"] = _hdg,
												  },
											[5] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-5",
													["type"] = "Ural-375",
													["y"] = _pos.z - _u5.y,
													["x"] = _pos.x - _u5.x,
													["heading"] = _hdg,
												  },
											},
								["name"] = "dynamic_russian_"..eGMs.redGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(81, Group.Category.GROUND, spawn_group)
			elseif _type == "ra24" then
				eGMs.redGroupCount = eGMs.redGroupCount + 1
				local _u1 = eGMs.rotateVec2({x = 0, y = 15}, _hdg)
				local _u2 = eGMs.rotateVec2({x = 0, y = -15}, _hdg)
				local _u3 = eGMs.rotateVec2({x = 0, y = -45}, _hdg)
				local _u4 = eGMs.rotateVec2({x = 0, y = 45}, _hdg)
				local _u5 = eGMs.rotateVec2({x = 20, y = 0}, _hdg)
				local _u6 = eGMs.rotateVec2({x = 30, y = 5}, _hdg)
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-1",
													["type"] = "Scud_B",
													["y"] = _pos.z - _u1.y,
													["x"] = _pos.x - _u1.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },
											[2] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-2",
													["type"] = "Scud_B",
													["y"] = _pos.z - _u2.y,
													["x"] = _pos.x - _u2.x,
													["heading"] = _hdg,
												  },	  
											[3] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-3",
													["type"] = "Scud_B",
													["y"] = _pos.z - _u3.y,
													["x"] = _pos.x - _u3.x,
													["heading"] = _hdg,
												  },	  
											[4] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-4",
													["type"] = "Scud_B",
													["y"] = _pos.z - _u4.y,
													["x"] = _pos.x - _u4.x,
													["heading"] = _hdg,
												  },
											[5] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-5",
													["type"] = "Ural-375",
													["y"] = _pos.z - _u5.y,
													["x"] = _pos.x - _u5.x,
													["heading"] = _hdg,
												  },
											[6] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-6",
													["type"] = "2S6 Tunguska",
													["y"] = _pos.z - _u6.y,
													["x"] = _pos.x - _u6.x,
													["heading"] = _hdg,
												  },
											},
								["name"] = "dynamic_russian_"..eGMs.redGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(81, Group.Category.GROUND, spawn_group)
			elseif _type == "ra25" then
				eGMs.redGroupCount = eGMs.redGroupCount + 1
				local _u1 = eGMs.rotateVec2({x = 0, y = 15}, _hdg)
				local _u2 = eGMs.rotateVec2({x = 0, y = -15}, _hdg)
				local _u3 = eGMs.rotateVec2({x = 0, y = -45}, _hdg)
				local _u4 = eGMs.rotateVec2({x = 0, y = 45}, _hdg)
				local _u5 = eGMs.rotateVec2({x = 20, y = 0}, _hdg)
				local _u6 = eGMs.rotateVec2({x = 30, y = 5}, _hdg)
				spawn_group = {
								["hidden"] = false,
								["units"] = {
											[1] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-1",
													["type"] = "Scud_B",
													["y"] = _pos.z - _u1.y,
													["x"] = _pos.x - _u1.x,
													["playerCanDrive"] = true,
													["heading"] =_hdg,
												  },
											[2] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-2",
													["type"] = "Scud_B",
													["y"] = _pos.z - _u2.y,
													["x"] = _pos.x - _u2.x,
													["heading"] = _hdg,
												  },	  
											[3] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-3",
													["type"] = "Scud_B",
													["y"] = _pos.z - _u3.y,
													["x"] = _pos.x - _u3.x,
													["heading"] = _hdg,
												  },	  
											[4] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-4",
													["type"] = "Scud_B",
													["y"] = _pos.z - _u4.y,
													["x"] = _pos.x - _u4.x,
													["heading"] = _hdg,
												  },
											[5] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-5",
													["type"] = "Ural-375",
													["y"] = _pos.z - _u5.y,
													["x"] = _pos.x - _u5.x,
													["heading"] = _hdg,
												  },
											[6] = {
													["name"] = "dynamic_russian_"..eGMs.redGroupCount.."-6",
													["type"] = "Osa 9A33 ln",
													["y"] = _pos.z - _u6.y,
													["x"] = _pos.x - _u6.x,
													["heading"] = _hdg,
												  },
											},
								["name"] = "dynamic_russian_"..eGMs.redGroupCount,
								["task"] = "Ground Nothing",		
								}
				coalition.addGroup(81, Group.Category.GROUND, spawn_group)
			end
--		end	

	end)
    if (not status) then
        env.error(string.format("Error with spawning insurgents: %s", error), false)-- this is needed because its an issue with EDs event handler
    end
end
--	end spawnable group functions

function eGMs.rotateVec2(_pos, _hdg)
	return { x = _pos.x*math.cos(_hdg) - _pos.y*math.sin(_hdg), y = _pos.x*math.sin(_hdg) + _pos.y*math.cos(_hdg)}
end



--mist.addEventHandler(eGMs.eventHandler)
world.addEventHandler(eGMs)

env.info("Easy Gamemaster Script v"..eGMs.version.." loaded")
