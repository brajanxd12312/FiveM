function LocalPed()
	return GetPlayerPed(-1)
end
 

local blips = {
    {title="Heli Course", colour=3, id=314, x= -1145.7919921875, y= -2864.9946289063, z= -1.0}
}


local IsRacing = false 
local cP = 0
local cP2 = 0

local CheckPoints = {} 
CheckPoints[1] =  	{ x = -1079.19, y = -2782.28, z = 93.20}
CheckPoints[2] =	{ x = -720.16, y = -2571.93, z = 108.13}
CheckPoints[3] =	{ x = -354.11, y = -2353.95, z = 41.66}
CheckPoints[4] =	{ x = -79.64, y = -2332.55, z = 24.26}
CheckPoints[5] =	{ x = 210.60, y = -2322.20, z = 53.51}
CheckPoints[6] =	{ x = 335.97, y = -2315.58, z = 58.97}
CheckPoints[7] =	{ x = 599.43, y = -2276.61, z = 48.80}
CheckPoints[8] =	{ x = 661.49, y = -1946.08, z = 54.83}
CheckPoints[9] =	{ x = 674.14,   y = -1626.26, z = 47.57}
CheckPoints[10] =	{ x = 584.80,   y = -1306.91, z = 71.71}
CheckPoints[11] =  	{ x = 337.92,  y = -1058.09, z = 71.36}
CheckPoints[12] =  	{ x = 96.66,  y = -992.74, z = 86.53}
CheckPoints[13] =  	{ x = -136.22,  y = -909.56, z = 136.37}
CheckPoints[14] =	{ x = -271.03,  y = -953.90, z = 151.82}
CheckPoints[15] =  	{ x = -559.46,  y = -1643.83, z = 72.9}
CheckPoints[16] =  	{ x = -788.86,  y = -2202.56,  z = 78.43}
CheckPoints[17] =  	{ x = -980.30,  y = -2631.35,  z = 106.27}
CheckPoints[18] =  	{ x = -1107.70,  y = -2637.78,  z = 69.07}
CheckPoints[19] =  	{ x = -1245.75,   y = -2658.42, z = 62.96}
CheckPoints[20] =  	{ x = -1355.93,  y = -2905.30, z = 20.30}
CheckPoints[21] =  	{ x = -1222.65, y = -2890.25, z = 25.45}
CheckPoints[22] =  	{ x = 0, y = 0,  z = 0}
CheckPoints[23] =  	{ x = 0, y = 0,  z = 0},  --Arrows to low to the ground? Add 1.0 or 2.0 to Z. 


Citizen.CreateThread(function()
	while not IsRacing do
        Citizen.Wait(0)
        	DrawMarker(7, -1146.0, -2864.40, 20.0 - 1, 0.0, 0.0, 0.0, 20.0, 20.0, 0.0, 7.0, 7.0, 5.0, 0, 175, 255, 165, 1, 0, 0,0) 
        	DrawMarker(6, -1146.0, -2864.40, 20.0 - 1, 0, 0, 0, 0, 0, 0, 12.0, 12.0, 10.0, 255, 153, 0, 165, 1, 0, 0,0) 
        if GetDistanceBetweenCoords( -1145.7, -2864.9, 13.9, GetEntityCoords(LocalPed())) < 50.0 then
            	Draw3DText( -1145.7919921875, -2864.9946289063, 13.946014404297  +.500, "Helicopter",7,0.3,0.2)
            	Draw3DText( -1145.7919921875, -2864.9946289063, 13.946014404297  +.100, "Course ",7,0.3,0.2)
        end

        if GetDistanceBetweenCoords( -1145.7, -2864.9, 13.9, GetEntityCoords(LocalPed())) < 2.0 then
            race()
        end

        if GetDistanceBetweenCoords(-1145.7, -2864.9, 13.9, GetEntityCoords(GetPlayerPed(-1))) < 5.0 then
            TriggerEvent("fs_race", false)
        end
    end
end)


function race()
    TriggerEvent("fs_freemode:displayHelp", "Press ~INPUT_CONTEXT~ to Race!")
    if (IsControlJustReleased(1, 38)) then
        if IsRacing == false then 
            IsRacing = true 
            TriggerEvent("fs_race", true)
        else
            TriggerEvent("fs_race", false)
        end
    end
end

RegisterNetEvent("fs_race:RequestCP")
AddEventHandler("fs_race:RequestCP", function(cP, cP2)
	Citizen.CreateThread(function()
		Citizen.Wait(5) 
			if IsRacing then
				cP = 1
				cP2 = 2
				TriggerEvent("fs_race:CP", cP, cP2)  
			end 
	end) 
	
Citizen.CreateThread(function()
	while IsRacing do 
		Citizen.Wait(5) 
			if GetDistanceBetweenCoords(CheckPoints[cP].x,  CheckPoints[cP].y,  CheckPoints[cP].z, GetEntityCoords(GetPlayerPed(-1))) < 5.0 then
				PlaySoundFrontend(GetPlayerPed(-1), "RACE_PLACED", "HUD_AWARDS")
				
				cP = math.ceil(cP+1)
				cP2 = math.ceil(cP2+1)
				
				
				TriggerEvent("fs_race:CP", cP, cP2)  
				else 
			end 
			
		end 
	end)
end) 




RegisterNetEvent("fs_race:CP")
AddEventHandler("fs_race:CP", function(cP, cP2)
	if IsRacing and cP2 == 23 then 
		 
		local finishLine = CreateCheckpoint(14, -1146.255859375, -2865.8166503906, 14.334774017334, 0, 0, 0, 15.0, 0, 0, 200, 100, 0)	
        PlaySoundFrontend(GetPlayerPed(-1), "ScreenFlash", "MissionFailedSounds")
		
			
		else
		
		local checkpoint = CreateCheckpoint(10, CheckPoints[cP].x,  CheckPoints[cP].y,  CheckPoints[cP].z, CheckPoints[cP2].x, CheckPoints[cP2].y, CheckPoints[cP2].z, 15.0, 204, 204, 1, 100, 0)
		local blip = AddBlipForCoord(CheckPoints[cP].x, CheckPoints[cP].y, CheckPoints[cP].z) 
		




	
Citizen.CreateThread(function()
	while IsRacing do 
		Citizen.Wait(5) 
			if GetDistanceBetweenCoords(CheckPoints[cP].x,  CheckPoints[cP].y,  CheckPoints[cP].z, GetEntityCoords(GetPlayerPed(-1))) < 5.0 then
				DeleteCheckpoint(checkpoint)
					RemoveBlip(blip)
				 
			
			end 
		end
	end)
end
end)






RegisterNetEvent("fs_race")
AddEventHandler("fs_race", function(IsRacing, CheckPoints, cP, cP2)
     if IsRacing then 
            Citizen.Wait(0)
            local playerCoords = GetEntityCoords(GetPlayerPed(-1))
            
            SetVehicleDensityMultiplierThisFrame(0.0)
            SetRandomVehicleDensityMultiplierThisFrame(0.0)
            SetParkedVehicleDensityMultiplierThisFrame(0.0)
		

			TriggerEvent("fs_race:RequestCP", 1, 2)
		  
            		
        end
    end)
	


function Draw3DText(x,y,z,textInput,fontId,scaleX,scaleY) -- A function tells what to do 
         local px,py,pz=table.unpack(GetGameplayCamCoords())
         local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)
    
         local scale = (1/dist)*20
         local fov = (1/GetGameplayCamFov())*100
         local scale = scale*fov
    
         SetTextScale(scaleX*scale, scaleY*scale)
         SetTextFont(fontId)
         SetTextProportional(1)
         SetTextColour(255, 255, 255, 250)
         SetTextDropshadow(1, 1, 1, 1, 255)
         SetTextEdge(2, 0, 0, 0, 150)
         SetTextDropShadow()
         SetTextOutline()
         SetTextEntry("STRING")
         SetTextCentre(1)
         AddTextComponentString(textInput)
         SetDrawOrigin(x,y,z+2, 0)
         DrawText(0.0, 0.0)
         ClearDrawOrigin()
        end

Citizen.CreateThread(function()
    for _, info in pairs(blips) do
        info.blip = AddBlipForCoord(info.x, info.y, info.z)
        SetBlipSprite(info.blip, info.id)
        SetBlipDisplay(info.blip, 4)
        SetBlipScale(info.blip, 1.0)
        
        SetBlipColour(info.blip, info.colour)
        SetBlipAsShortRange(info.blip, true)

        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(info.title)
        EndTextCommandSetBlipName(info.blip)
    end
end)
