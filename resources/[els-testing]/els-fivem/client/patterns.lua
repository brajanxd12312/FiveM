els_patterns = {}

function getNumberOfPrimaryPatterns(veh)
	local count = 0
	if veh.primType == string.lower("leds") then
		for k,v in pairs(led_PrimaryPatterns) do
			if (v ~= nil) then
				count = count + 1
			end
		end
	end
	-- for k,v in pairs(els_patterns.primarys) do
	-- 	if (v ~= nil) then
	-- 		count = count + 1
	-- 	end
	-- end

	return count
end

function getNumberOfSecondaryPatterns(veh)
	local count = 0
	if els_Vehicles[checkCarHash(veh)].secType == string.lower("leds") then
		for k,v in pairs(led_SecondaryPatterns) do
			if (v ~= nil) then
				count = count + 1
			end
		end
	end
	if els_Vehicles[checkCarHash(veh)].secType == string.lower("traf") then
		for k,v in pairs(traf_Patterns) do
			if (v ~= nil) then
				count = count + 1
			end
		end
	end
	-- for k,v in pairs(els_patterns.secondarys) do
	-- 	if (v ~= nil) then
	-- 		count = count + 1
	-- 	end
	-- end

	return count
end

function getNumberOfAdvisorPatterns(veh)
	local count = 0
	if els_Vehicles[checkCarHash(veh)].warnType == string.lower("leds") then
		for k,v in pairs(leds_WarningPatterns) do
			if (v ~= nil) then
				count = count + 1
			end
		end
	end
	-- for k,v in pairs(els_patterns.advisors) do
	-- 	if (v ~= nil) then
	-- 		count = count + 1
	-- 	end
	-- end

	return count
end

function runEnvirementLightWithBrightness(k, extra, brightness)
	Citizen.CreateThread(function()
		local vehN = checkCarHash(k)

		if els_Vehicles[vehN].extras[extra] ~= nil then
			if(els_Vehicles[vehN].extras[extra].env_light) then
		        local boneIndex = GetEntityBoneIndexByName(k, "extra_" .. extra)
		        local coords = GetWorldPositionOfEntityBone(k, boneIndex)
				
				for i=1,5 do
					 if(IsVehicleExtraTurnedOn(k, extra) == false) then break end
					--DrawLightWithRangeAndShadow(coords.x + els_Vehicles[vehN].extras[extra].env_pos.x, coords.y + els_Vehicles[vehN].extras[extra].env_pos.y, coords.z + els_Vehicles[vehN].extras[extra].env_pos.z, els_Vehicles[vehN].extras[extra].env_color.r, els_Vehicles[vehN].extras[extra].env_color.g, els_Vehicles[vehN].extras[extra].env_color.b, 50.0, 0.26, 1.0)
					DrawLightWithRange(coords.x + els_Vehicles[vehN].extras[extra].env_pos.x, coords.y + els_Vehicles[vehN].extras[extra].env_pos.y, coords.z + els_Vehicles[vehN].extras[extra].env_pos.z, els_Vehicles[vehN].extras[extra].env_color.r, els_Vehicles[vehN].extras[extra].env_color.g, els_Vehicles[vehN].extras[extra].env_color.b, 50.0, brightness)
					Wait(2)
				end
		    end
		end
	end)
end

function runEnvirementLight(k, extra)
	Citizen.CreateThread(function()
		if not IsEntityDead(k) and k ~= nil then
			local vehN = checkCarHash(k)

			if els_Vehicles[vehN].extras[extra] ~= nil then
				if(els_Vehicles[vehN].extras[extra].env_light) then
			        local boneIndex = GetEntityBoneIndexByName(k, "extra_" .. extra)
			        local coords = GetWorldPositionOfEntityBone(k, boneIndex)
					
					for i=1,5 do
						 if(IsVehicleExtraTurnedOn(k, extra) == false) then break end
						--DrawLightWithRangeAndShadow(coords.x + els_Vehicles[vehN].extras[extra].env_pos.x, coords.y + els_Vehicles[vehN].extras[extra].env_pos.y, coords.z + els_Vehicles[vehN].extras[extra].env_pos.z, els_Vehicles[vehN].extras[extra].env_color.r, els_Vehicles[vehN].extras[extra].env_color.g, els_Vehicles[vehN].extras[extra].env_color.b, 50.0, 0.26, 1.0)
						DrawLightWithRange(coords.x + els_Vehicles[vehN].extras[extra].env_pos.x, coords.y + els_Vehicles[vehN].extras[extra].env_pos.y, coords.z + els_Vehicles[vehN].extras[extra].env_pos.z, els_Vehicles[vehN].extras[extra].env_color.r, els_Vehicles[vehN].extras[extra].env_color.g, els_Vehicles[vehN].extras[extra].env_color.b, 50.0, envirementLightBrightness)
						Wait(2)
					end
			    end
			end
		end
	end)
end

function runTrafPattern(k, pattern, cb) 
	Citizen.CreateThread(function()
		if (not IsEntityDead(k) and DoesEntityExist(k)) then

				cb(false)

				local done = {}
				done[1] = false
				done[2] = false
				done[3] = false

				Citizen.CreateThread(function()
					for spot = 1, string.len(traf_Patterns[pattern][7]) do
					    local c = tonumber(string.sub(traf_Patterns[pattern][7], spot, spot) )
						setExtraState(k, 7, c)
						if c == 0 then
							runEnvirementLight(k, 7)
						end

						if elsVehs[k].secPattern ~= pattern then
							done[1] = true
							break
						end

						Wait(0)

						if spot == string.len(traf_Patterns[pattern][7]) then
							done[1] = true
							break
						end
					end

					return
				end)

				Citizen.CreateThread(function()
					for spot = 1, string.len(traf_Patterns[pattern][8]) do
					    local c = tonumber(string.sub(traf_Patterns[pattern][8], spot, spot) )
						setExtraState(k, 8, c)
						if c == 0 then
							runEnvirementLight(k, 8)
						end

						if elsVehs[k].secPattern ~= pattern then
							done[2] = true
							break
						end

						Wait(0)

						if spot == string.len(traf_Patterns[pattern][8]) then
							done[2] = true
							break
						end
					end

					return
				end)

				Citizen.CreateThread(function()
					for spot = 1, string.len(traf_Patterns[pattern][9]) do
					    local c = tonumber(string.sub(traf_Patterns[pattern][9], spot, spot) )
						setExtraState(k, 9, c)
						if c == 0 then
							runEnvirementLight(k, 9)
						end

						if elsVehs[k].secPattern ~= pattern then
							done[3] = true
							break
						end

						Wait(0)

						if spot == string.len(traf_Patterns[pattern][9]) then
							done[3] = true
							break
						end
					end

					return
				end)

				while (not done[1] or not done[2] or not done[3]) do Wait(0) end
				if done[1] and done[2] and done[3] then
					cb(true)
				end
		end
	end)
end

function runLedPatternSecondary(k, pattern, cb)
	Citizen.CreateThread(function()
		if (not IsEntityDead(k) and DoesEntityExist(k)) then

			cb(false)

			local done = {}
			done[1] = false
			done[2] = false
			done[3] = false

			Citizen.CreateThread(function()
				for spot = 1, string.len(led_SecondaryPatterns[pattern][7]) do
				    local c = tonumber(string.sub(led_SecondaryPatterns[pattern][7], spot, spot) )

					setExtraState(k, 7, c)
					if c == 0 then
						runEnvirementLight(k, 7)
					end

					if elsVehs[k] ~= nil then
						if elsVehs[k].secPattern ~= pattern then
							done[1] = true
							ledSecondary = 1
							break
						end
					end

					Wait(35)

					if spot == string.len(led_SecondaryPatterns[pattern][7]) then
						done[1] = true
						break
					end
				end

				return
			end)

			Citizen.CreateThread(function()
				for spot = 1, string.len(led_SecondaryPatterns[pattern][8]) do
				    local c = tonumber(string.sub(led_SecondaryPatterns[pattern][8], spot, spot) )

					setExtraState(k, 8, c)
					if c == 0 then
						runEnvirementLight(k, 8)
					end

					if elsVehs[k] ~= nil then
						if elsVehs[k].secPattern ~= pattern then
							done[2] = true
							ledSecondary = 1
							break
						end
					end

					Wait(0)

					if spot == string.len(led_SecondaryPatterns[pattern][8]) then
						done[35] = true
						break
					end
				end

				return
			end)

			Citizen.CreateThread(function()
				for spot = 1, string.len(led_SecondaryPatterns[pattern][9]) do
				    local c = tonumber(string.sub(led_SecondaryPatterns[pattern][9], spot, spot) )
					setExtraState(k, 9, c)
					if c == 0 then
						runEnvirementLight(k, 9)
					end

					if elsVehs[k] ~= nil then
						if elsVehs[k].secPattern ~= pattern then
							done[3] = true
							ledSecondary = 1
							break
						end
					end

					Wait(35)

					if spot == string.len(led_SecondaryPatterns[pattern][9]) then
						done[3] = true
						break
					end
				end

				return
			end)

			while (not done[1] or not done[2] or not done[3]) do Wait(0) end
			if done[1] and done[2] and done[3] then
				cb(true)
			end
		end
	end)
end

function runLedPatternWarning(k, pattern, cb) 
	Citizen.CreateThread(function()
		if (not IsEntityDead(k) and DoesEntityExist(k)) then

			cb(false)

			local done = {}
			done[1] = false
			done[2] = false
			done[3] = false

			Citizen.CreateThread(function()
				for spot = 1, string.len(leds_WarningPatterns[pattern][5]) do
				    local c = tonumber(string.sub(leds_WarningPatterns[pattern][5], spot, spot) )
					setExtraState(k, 5, c)
					if c == 0 then
						runEnvirementLight(k, 5)
					end

					if elsVehs[k].advisorPattern ~= pattern then
						done[1] = true
						break
					end

					Wait(35)

					if spot == string.len(leds_WarningPatterns[pattern][5]) then
						done[1] = true
						break
					end
				end

				return
			end)

			Citizen.CreateThread(function()
				for spot = 1, string.len(leds_WarningPatterns[pattern][6]) do
				    local c = tonumber(string.sub(leds_WarningPatterns[pattern][6], spot, spot) )
					setExtraState(k, 6, c)
					if c == 0 then
						runEnvirementLight(k, 6)
					end

					if elsVehs[k].advisorPattern ~= pattern then
						done[2] = true
						break
					end

					Wait(35)

					if spot == string.len(leds_WarningPatterns[pattern][6]) then
						done[2] = true
						break
					end
				end

				return
			end)

			while (not done[1] or not done[2]) do Wait(0) end
			if done[1] and done[2] then
				cb(true)
			end
		end
	end)
end

function runLedPatternPrimary(k, pattern, cb) 
	Citizen.CreateThread(function()
		if (not IsEntityDead(k) and DoesEntityExist(k)) then
        	SetVehicleAutoRepairDisabled(k, true)

			cb(false)

			local done = {}
			done[1] = false
			done[2] = false
			done[3] = false
			done[4] = false

			Citizen.CreateThread(function()
				for spot = 1, string.len(led_PrimaryPatterns[pattern][1]) do
				    local c = tonumber(string.sub(led_PrimaryPatterns[pattern][1], spot, spot) )
					setExtraState(k, 1, c)
					if c == 0 then
						runEnvirementLight(k, 1)
					end

					if elsVehs[k].primPattern ~= pattern then
						done[1] = true
						break
					end

					Wait(35)

					if spot == string.len(led_PrimaryPatterns[pattern][1]) then
						done[1] = true
						break
					end
				end

				return
			end)

			Citizen.CreateThread(function()
				for spot = 1, string.len(led_PrimaryPatterns[pattern][2]) do
				    local c = tonumber(string.sub(led_PrimaryPatterns[pattern][2], spot, spot) )
					setExtraState(k, 2, c)
					if c == 0 then
						runEnvirementLight(k, 2)
					end

					if elsVehs[k].primPattern ~= pattern then
						done[2] = true
						break
					end

					Wait(35)

					if spot == string.len(led_PrimaryPatterns[pattern][2]) then
						done[2] = true
						break
					end
				end

				return
			end)

			Citizen.CreateThread(function()
				for spot = 1, string.len(led_PrimaryPatterns[pattern][3]) do
				    local c = tonumber(string.sub(led_PrimaryPatterns[pattern][3], spot, spot) )
					setExtraState(k, 3, c)
					if c == 0 then
						runEnvirementLight(k, 3)
					end

					if elsVehs[k].primPattern ~= pattern then
						done[3] = true
						break
					end

					Wait(35)

					if spot == string.len(led_PrimaryPatterns[pattern][3]) then
						done[3] = true
						break
					end
				end

				return
			end)

			Citizen.CreateThread(function()
				for spot = 1, string.len(led_PrimaryPatterns[pattern][4]) do
				    local c = tonumber(string.sub(led_PrimaryPatterns[pattern][4], spot, spot) )
					setExtraState(k, 4, c)
					if c == 0 then
						runEnvirementLight(k, 4)
					end

					if elsVehs[k].primPattern ~= pattern then
						done[4] = true
						break
					end

					Wait(35)

					if spot == string.len(led_PrimaryPatterns[pattern][4]) then
						done[4] = true
						break
					end
				end

				return
			end)
			
			while (not done[1] or not done[2] or not done[3] or not done[4]) do Wait(0) end
			if done[1] and done[2] and done[3] and done[4] then
				cb(true)
			end
		end
	end)
end