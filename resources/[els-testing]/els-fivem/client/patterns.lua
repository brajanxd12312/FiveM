function trafficAdvisor(elsVehicle, stage, pattern)
	Citizen.CreateThread(function()
		if (not IsEntityDead(elsVehicle) and DoesEntityExist(elsVehicle)) then
			if (doesVehicleHaveTrafficAdvisor(elsVehicle)) then
		        if(stage == 1 or stage == 2 or (canUseAdvisorStageThree(elsVehicle) and stage == 3)) then
		            if stage == 1 then
		                setExtraState(elsVehicle, 5, 1)
		                setExtraState(elsVehicle, 6, 1)
		            end

		            setExtraState(elsVehicle, 7, 1)
                    setExtraState(elsVehicle, 8, 1)
                    setExtraState(elsVehicle, 9, 1)

		            if (pattern == 1) then
	            		local count = 1
	                    while count <= 4 do
	                        if not (stage == 1 or stage == 2 or (canUseAdvisorStageThree(elsVehicle) and stage == 3)) then
	                            setExtraState(elsVehicle, 7, 1)
	                            setExtraState(elsVehicle, 8, 1)
	                            setExtraState(elsVehicle, 9, 1)
	                            break
	                        end
	                        if count == 1 then
	                            setExtraState(elsVehicle, 7, 0)
	                        end
	                        if count == 2 then
	                            setExtraState(elsVehicle, 8, 0)
	                        end
	                        if count == 3 then
	                            setExtraState(elsVehicle, 9, 0)
	                        end
	                        if count == 4 then
	                            setExtraState(elsVehicle, 7, 1)
	                            setExtraState(elsVehicle, 8, 1)
	                            setExtraState(elsVehicle, 9, 1)
	                        end
	                        Wait(200)
	                        count = count + 1
	                    end
		            end
		            if (pattern == 2) then
	                	local count = 1
	                    while count <= 4 do
	                        if not (stage == 1 or stage == 2 or (canUseAdvisorStageThree(elsVehicle) and stage == 3)) then
	                            setExtraState(elsVehicle, 7, 1)
	                            setExtraState(elsVehicle, 8, 1)
	                            setExtraState(elsVehicle, 9, 1)
	                            break
	                        end
	                        if count == 1 then
	                            setExtraState(elsVehicle, 9, 0)
	                        end
	                        if count == 2 then
	                            setExtraState(elsVehicle, 8, 0)
	                        end
	                        if count == 3 then
	                            setExtraState(elsVehicle, 7, 0)
	                        end
	                        if count == 4 then
	                            setExtraState(elsVehicle, 7, 1)
	                            setExtraState(elsVehicle, 8, 1)
	                            setExtraState(elsVehicle, 9, 1)
	                        end
	                        Wait(200)
	                        count = count + 1
	                    end
		            end
		            if (pattern == 3) then
	                	local count = 1
	                    while count <= 4 do
	                        if not (stage == 1 or stage == 2 or (canUseAdvisorStageThree(elsVehicle) and stage == 3)) then
	                            setExtraState(elsVehicle, 7, 1)
	                            setExtraState(elsVehicle, 8, 1)
	                            setExtraState(elsVehicle, 9, 1)
	                            break
	                        end
	                        if count == 1 then
	                            setExtraState(elsVehicle, 8, 0)
	                        end
	                        if count == 2 then
	                            setExtraState(elsVehicle, 9, 0)
	                            setExtraState(elsVehicle, 7, 0)
	                        end
	                        if count == 3 then
	                            setExtraState(elsVehicle, 8, 1)
	                        end
	                        if count == 4 then
	                            setExtraState(elsVehicle, 7, 1)
	                            setExtraState(elsVehicle, 8, 1)
	                            setExtraState(elsVehicle, 9, 1)
	                        end
	                        Wait(200)
	                        count = count + 1
	                    end
		            end
		            if (pattern == 4) then
	            		local count = 1
	                    while count <= 6 do
	                        if not (stage == 1 or stage == 2 or (canUseAdvisorStageThree(elsVehicle) and stage == 3)) then
	                            setExtraState(elsVehicle, 7, 1)
	                            setExtraState(elsVehicle, 8, 1)
	                            setExtraState(elsVehicle, 9, 1)
	                            break
	                        end
	                        if count == 1 then
	                            setExtraState(elsVehicle, 7, 0)
	                        end
	                        if count == 2 then
	                            setExtraState(elsVehicle, 8, 0)
	                        end
	                        if count == 3 then
	                            setExtraState(elsVehicle, 9, 0)
	                        end
	                        if count == 4 then
	                            setExtraState(elsVehicle, 9, 1)
	                        end
	                        if count == 5 then
	                            setExtraState(elsVehicle, 9, 0)
	                        end
	                        if count == 6 then
	                            setExtraState(elsVehicle, 7, 1)
	                            setExtraState(elsVehicle, 8, 1)
	                            setExtraState(elsVehicle, 9, 1)
	                        end
	                        Wait(300)
	                        count = count + 1
	                    end
		            end
		            if (pattern == 5) then
	            		local count = 1
	                    while count <= 6 do
	                        if not (stage == 1 or stage == 2 or (canUseAdvisorStageThree(elsVehicle) and stage == 3)) then
	                            setExtraState(elsVehicle, 7, 1)
	                            setExtraState(elsVehicle, 8, 1)
	                            setExtraState(elsVehicle, 9, 1)
	                            break
	                        end
	                        if count == 1 then
	                            setExtraState(elsVehicle, 9, 0)
	                        end
	                        if count == 2 then
	                            setExtraState(elsVehicle, 8, 0)
	                        end
	                        if count == 3 then
	                            setExtraState(elsVehicle, 7, 0)
	                        end
	                        if count == 4 then
	                            setExtraState(elsVehicle, 7, 1)
	                        end
	                        if count == 5 then
	                            setExtraState(elsVehicle, 7, 0)
	                        end
	                        if count == 6 then
	                            setExtraState(elsVehicle, 7, 1)
	                            setExtraState(elsVehicle, 8, 1)
	                            setExtraState(elsVehicle, 9, 1)
	                        end
	                        Wait(300)
	                        count = count + 1
	                    end
		            end
		            if (pattern == 6) then
	            		local count = 1
	                    while count <= 6 do
	                        if not (stage == 1 or stage == 2 or (canUseAdvisorStageThree(elsVehicle) and stage == 3)) then
	                            setExtraState(elsVehicle, 7, 1)
	                            setExtraState(elsVehicle, 8, 1)
	                            setExtraState(elsVehicle, 9, 1)
	                            break
	                        end
	                        if count == 1 then
	                            setExtraState(elsVehicle, 9, 0)
	                        end
	                        if count == 2 then
	                        	setExtraState(elsVehicle, 9, 1)
	                            setExtraState(elsVehicle, 7, 0)
	                        end
	                        if count == 3 then
	                            setExtraState(elsVehicle, 9, 0)
	                            setExtraState(elsVehicle, 7, 1)
	                        end
	                        if count == 4 then
	                            setExtraState(elsVehicle, 7, 0)
	                            setExtraState(elsVehicle, 9, 1)
	                        end
	                        if count == 5 then
	                            setExtraState(elsVehicle, 9, 0)
	                            setExtraState(elsVehicle, 7, 1)
	                        end
	                        if count == 6 then
	                            setExtraState(elsVehicle, 7, 0)
	                            setExtraState(elsVehicle, 9, 1)
	                        end
	                        Wait(300)
	                        count = count + 1
	                    end
		            end
		        end
		    end
		end
	end)
end

function prim_wigwag(k) 
	Citizen.CreateThread(function()
		if (not IsEntityDead(k) and DoesEntityExist(k)) then
			local count = 1
			while count <= 8 do
                if count == 1 then
                    setExtraState(k, 1, 0)
                    setExtraState(k, 2, 1)
                    setExtraState(k, 3, 1)
                    setExtraState(k, 4, 0)
                end
                if count == 2 then
                	setExtraState(k, 1, 1)
                    setExtraState(k, 2, 0)
                    setExtraState(k, 3, 0)
                    setExtraState(k, 4, 1)
                end
                if count == 3 then
                    setExtraState(k, 1, 0)
                    setExtraState(k, 2, 1)
                    setExtraState(k, 3, 1)
                    setExtraState(k, 4, 0)
                end
                if count == 4 then
                    setExtraState(k, 1, 1)
                    setExtraState(k, 2, 0)
                    setExtraState(k, 3, 0)
                    setExtraState(k, 4, 1)
                end
                if count == 5 then
                    setExtraState(k, 1, 0)
                    setExtraState(k, 2, 1)
                    setExtraState(k, 3, 1)
                    setExtraState(k, 4, 0)
                end
                if count == 6 then
                	setExtraState(k, 1, 1)
                    setExtraState(k, 2, 0)
                    setExtraState(k, 3, 0)
                    setExtraState(k, 4, 1)
                end
                if count == 7 then
                    setExtraState(k, 1, 0)
                    setExtraState(k, 2, 1)
                    setExtraState(k, 3, 1)
                    setExtraState(k, 4, 0)
                end
                if count == 8 then
                    setExtraState(k, 1, 1)
                    setExtraState(k, 2, 0)
                    setExtraState(k, 3, 0)
                    setExtraState(k, 4, 1)
                end
                Wait(125)
                count = count + 1
            end
		end
	end)
end

function prim_wigwag2(k) 
	Citizen.CreateThread(function()
		if (not IsEntityDead(k) and DoesEntityExist(k)) then
			local count = 1
			while count <= 8 do
                if count == 1 then
                    setExtraState(k, 1, 1)
                    setExtraState(k, 2, 1)
                    setExtraState(k, 3, 0)
                    setExtraState(k, 4, 0)
                end
                if count == 2 then
                	setExtraState(k, 1, 0)
                    setExtraState(k, 2, 0)
                    setExtraState(k, 3, 1)
                    setExtraState(k, 4, 1)
                end
                if count == 3 then
                    setExtraState(k, 1, 1)
                    setExtraState(k, 2, 1)
                    setExtraState(k, 3, 0)
                    setExtraState(k, 4, 0)
                end
                if count == 4 then
                    setExtraState(k, 1, 0)
                    setExtraState(k, 2, 0)
                    setExtraState(k, 3, 1)
                    setExtraState(k, 4, 1)
                end
                if count == 5 then
                    setExtraState(k, 1, 1)
                    setExtraState(k, 2, 1)
                    setExtraState(k, 3, 0)
                    setExtraState(k, 4, 0)
                end
                if count == 6 then
                	setExtraState(k, 1, 0)
                    setExtraState(k, 2, 0)
                    setExtraState(k, 3, 1)
                    setExtraState(k, 4, 1)
                end
                if count == 7 then
                    setExtraState(k, 1, 1)
                    setExtraState(k, 2, 1)
                    setExtraState(k, 3, 0)
                    setExtraState(k, 4, 0)
                end
                if count == 8 then
                    setExtraState(k, 1, 0)
                    setExtraState(k, 2, 0)
                    setExtraState(k, 3, 1)
                    setExtraState(k, 4, 1)
                end
                Wait(125)
                count = count + 1
            end
		end
	end)
end

function prim_sidewise(k) 
	Citizen.CreateThread(function()
		if (not IsEntityDead(k) and DoesEntityExist(k)) then
			local count = 1
			while count <= 8 do
                if count == 1 then
                    setExtraState(k, 1, 0)
                    setExtraState(k, 2, 1)
                    setExtraState(k, 3, 1)
                    setExtraState(k, 4, 1)
                end
                if count == 2 then
                	setExtraState(k, 1, 0)
                    setExtraState(k, 2, 0)
                    setExtraState(k, 3, 1)
                    setExtraState(k, 4, 1)
                end
                if count == 3 then
                    setExtraState(k, 1, 1)
                    setExtraState(k, 2, 0)
                    setExtraState(k, 3, 0)
                    setExtraState(k, 4, 1)
                end
                if count == 4 then
                    setExtraState(k, 1, 1)
                    setExtraState(k, 2, 1)
                    setExtraState(k, 3, 0)
                    setExtraState(k, 4, 0)
                end
                if count == 5 then
                    setExtraState(k, 1, 1)
                    setExtraState(k, 2, 1)
                    setExtraState(k, 3, 1)
                    setExtraState(k, 4, 1)
                end
                if count == 6 then
                	setExtraState(k, 1, 0)
                    setExtraState(k, 2, 0)
                    setExtraState(k, 3, 0)
                    setExtraState(k, 4, 0)
                end
                if count == 7 then
                    setExtraState(k, 1, 1)
                    setExtraState(k, 2, 1)
                    setExtraState(k, 3, 1)
                    setExtraState(k, 4, 1)
                end
                if count == 8 then
                    setExtraState(k, 1, 0)
                    setExtraState(k, 2, 0)
                    setExtraState(k, 3, 0)
                    setExtraState(k, 4, 0)
                end
                Wait(125)
                count = count + 1
            end
		end
	end)
end

function prim_sidewise2(k) 
	Citizen.CreateThread(function()
		if (not IsEntityDead(k) and DoesEntityExist(k)) then
			local count = 1
			while count <= 8 do
                if count == 1 then
                    setExtraState(k, 1, 1)
                    setExtraState(k, 2, 1)
                    setExtraState(k, 3, 1)
                    setExtraState(k, 4, 0)
                end
                if count == 2 then
                	setExtraState(k, 1, 1)
                    setExtraState(k, 2, 1)
                    setExtraState(k, 3, 0)
                    setExtraState(k, 4, 0)
                end
                if count == 3 then
                    setExtraState(k, 1, 1)
                    setExtraState(k, 2, 0)
                    setExtraState(k, 3, 0)
                    setExtraState(k, 4, 1)
                end
                if count == 4 then
                    setExtraState(k, 1, 0)
                    setExtraState(k, 2, 0)
                    setExtraState(k, 3, 1)
                    setExtraState(k, 4, 1)
                end
                if count == 5 then
                    setExtraState(k, 1, 1)
                    setExtraState(k, 2, 1)
                    setExtraState(k, 3, 1)
                    setExtraState(k, 4, 1)
                end
                if count == 6 then
                	setExtraState(k, 1, 0)
                    setExtraState(k, 2, 0)
                    setExtraState(k, 3, 0)
                    setExtraState(k, 4, 0)
                end
                if count == 7 then
                    setExtraState(k, 1, 1)
                    setExtraState(k, 2, 1)
                    setExtraState(k, 3, 1)
                    setExtraState(k, 4, 1)
                end
                if count == 8 then
                    setExtraState(k, 1, 0)
                    setExtraState(k, 2, 0)
                    setExtraState(k, 3, 0)
                    setExtraState(k, 4, 0)
                end
                Wait(125)
                count = count + 1
            end
		end
	end)
end

function sec_wigwag(k) 
	Citizen.CreateThread(function()
		if (not IsEntityDead(k) and DoesEntityExist(k)) then
			if(doesVehicleHaveTrafficAdvisor(k)) then
				local count = 1
				while count <= 5 do
	                if count == 1 then
	                    setExtraState(k, 5, 0)
	                    setExtraState(k, 6, 1)
	                end
	                if count == 2 then
	                	setExtraState(k, 5, 1)
	                    setExtraState(k, 6, 0)
	                end
	                if count == 3 then
	                    setExtraState(k, 5, 0)
	                    setExtraState(k, 6, 1)
	                end
	                if count == 4 then
	                    setExtraState(k, 5, 1)
	                    setExtraState(k, 6, 0)
	                end
	                if count == 5 then
	                    setExtraState(k, 5, 0)
	                    setExtraState(k, 6, 1)
	                end
	                Wait(200)
	                count = count + 1
	            end
	        else
	        	local count = 1
				while count <= 5 do
	                if count == 1 then
	                    setExtraState(k, 5, 0)
	                    setExtraState(k, 6, 1)
	                    setExtraState(k, 7, 1)
	                    setExtraState(k, 9, 0)
	                end
	                if count == 2 then
	                	setExtraState(k, 5, 1)
	                    setExtraState(k, 6, 0)
	                    setExtraState(k, 7, 0)
	                    setExtraState(k, 9, 1)
	                end
	                if count == 3 then
	                    setExtraState(k, 5, 0)
	                    setExtraState(k, 6, 1)
	                    setExtraState(k, 7, 1)
	                    setExtraState(k, 9, 0)
	                end
	                if count == 4 then
	                    setExtraState(k, 5, 1)
	                    setExtraState(k, 6, 0)
	                    setExtraState(k, 7, 0)
	                    setExtraState(k, 9, 1)
	                end
	                if count == 5 then
	                    setExtraState(k, 5, 0)
	                    setExtraState(k, 6, 1)
	                    setExtraState(k, 7, 1)
	                    setExtraState(k, 9, 0)
	                end
	                Wait(200)
	                count = count + 1
	            end
	        end
		end
	end)
end