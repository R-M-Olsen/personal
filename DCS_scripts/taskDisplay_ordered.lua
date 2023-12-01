-- Task Display script by TAW Lurchian, Apr2022

--[[
	Instructions:
		taskFlag can be text or a number, it can be set true in the mission editor to show as completed in the task list
		taskName is the description of the task to be completed
]]

taskDisplay = {}	-- leave this line alone

taskDisplay.tasks = {
--					{"taskFlag","Task name"},	-- this is the format for the task, key ( [#] = ) is optional
					}
					
-- No editing below this

taskDisplay.version = "0.1_ordered"

taskDisplay.playerGroups = {}

function taskDisplay.initTasks()
--	for _taskFlag, _taskText in pairs(taskDisplay.tasks) do
	for i = 1, #taskDisplay.tasks do
		taskDisplay.tasks[i][3] = false
		env.info("Task Display: Initializing task '"..taskDisplay.tasks[i][2].."' as incomplete")
	end
end

function taskDisplay.addMenu()
	env.info("Task Display: Update group list")
	local activePilots = mist.makeUnitTable({"[blue][plane]", "[blue][helicopter]"})
	for i = 1, #activePilots do
		local status, error = pcall(function()
		if Unit.getByName(activePilots[i]) ~= nil and Unit.getByName(activePilots[i]):getPlayerName() ~= nil then
			if Unit.getByName(activePilots[i]):getGroup() ~= nil then
				local _groupId = Unit.getByName(activePilots[i]):getGroup():getID()
				if _groupId then		
					if taskDisplay.playerGroups[tostring(_groupId)] == nil then
						missionCommands.addCommandForGroup(_groupId, "Display Mission Tasks", {}, taskDisplay.showTasks, _groupId)
						taskDisplay.playerGroups[tostring(_groupId)] = true
						env.info("Task Display: added menu to ".. Unit.getByName(activePilots[i]):getGroup():getName() )
					end
				end
			end
		end
		end)
		if (not status) then
		env.error(string.format("Error group to Task Display list: %s", error), false)
		end
	end
	timer.scheduleFunction(taskDisplay.addMenu, {}, timer.getTime() + 60)
end

function taskDisplay.flagCheck()
--	for _taskFlag, _taskText in pairs(taskDisplay.tasks) do
	for i = 1, #taskDisplay.tasks do
		if taskDisplay.tasks[i][3] == false then
			if trigger.misc.getUserFlag(taskDisplay.tasks[i][1]) == true or trigger.misc.getUserFlag(taskDisplay.tasks[i][1]) >= 1  then
				taskDisplay.tasks[i][3] = true
				env.info("Task Display: Task '"..taskDisplay.tasks[i][2].."' completed!")
			end
		end
	end
	timer.scheduleFunction(taskDisplay.flagCheck, {}, timer.getTime() + 1)
end

function taskDisplay.showTasks(_groupId)
	local next = next
	local task1, task2, task3, task4, task5, task6, task7, task8, task9, task10, task11, task12, task13, task14, task15 = "","","","","","","","","","","","","","",""
	for i = 1, #taskDisplay.tasks do
		local _status = "INCOMPLETE"

		if taskDisplay.tasks[i][3] == true then
			_status = "COMPLETE   "
		end
		
		if i == 1 then
			task1 = "\n".._status .."     "..taskDisplay.tasks[i][2]
		elseif i == 2 then
			task2 = "\n".._status .."     "..taskDisplay.tasks[i][2]
		elseif i == 3 then
			task3 = "\n".._status .."     "..taskDisplay.tasks[i][2]
		elseif i == 4 then
			task4 = "\n".._status .."     "..taskDisplay.tasks[i][2]
		elseif i == 5 then
			task5 = "\n".._status .."     "..taskDisplay.tasks[i][2]
		elseif i == 6 then
			task6 = "\n".._status .."     "..taskDisplay.tasks[i][2]
		elseif i == 7 then
			task7 = "\n".._status .."     "..taskDisplay.tasks[i][2]
		elseif i == 8 then
			task8 = "\n".._status .."     "..taskDisplay.tasks[i][2]
		elseif i == 9 then
			task9 = "\n".._status .."     "..taskDisplay.tasks[i][2]
		elseif i == 10 then
			task10 = "\n".._status .."     "..taskDisplay.tasks[i][2]
		elseif i == 11 then
			task11 = "\n".._status .."     "..taskDisplay.tasks[i][2]
		elseif i == 12 then
			task12 = "\n".._status .."     "..taskDisplay.tasks[i][2]
		elseif i == 13 then
			task13 = "\n".._status .."     "..taskDisplay.tasks[i][2]
		elseif i == 14 then
			task14 = "\n".._status .."     "..taskDisplay.tasks[i][2]
		elseif i == 15 then
			task15 = "\n".._status .."     "..taskDisplay.tasks[i][2]
		end
	end
	trigger.action.outTextForGroup(_groupId,"Status:             Task:"..task1..task2..task3..task4..task5..task6..task7..task8..task9..task10..task11..task12..task13..task14..task15,15)
end

function taskDisplay.initScript()
	local next = next
	if next(taskDisplay.tasks) ~= nil then
		env.info("Task Display: Tasks found! Starting script...")
		taskDisplay.initTasks()
		timer.scheduleFunction(taskDisplay.addMenu, {}, timer.getTime() + 1)
		timer.scheduleFunction(taskDisplay.flagCheck, {}, timer.getTime() + 2)
	else
		env.info("Task Display: No tasks set, stopping script...")
	end
end

timer.scheduleFunction(taskDisplay.initScript, {}, timer.getTime() + 10)
env.info("Task Display v"..taskDisplay.version.." loaded, checking for tasks in 10 seconds...")