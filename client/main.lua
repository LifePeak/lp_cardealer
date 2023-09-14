local Keys = {
    ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
    ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
    ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
    ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
    ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
    ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
    ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
    ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
    ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}
--print

local m1 = false 
local color = 0
local colorveh = 0
local vehlist = {}
local default = {
    xyz={x = -1377.514282266, y = -2852.64941406, z = 13.9448}, -- At airport
    text={
    content="Test",
    rgb={255 , 255, 255},
    textOutline=true,
    scaleMultiplier=1,
    font=0
    },
    perspectiveScale=4,
    radius=5000,
    timeout=5000
}

local NumberCharset = {}
local Charset = {}
local model = nil
local car = {}

for i = 48,  57 do table.insert(NumberCharset, string.char(i)) end

for i = 65,  90 do table.insert(Charset, string.char(i)) end
for i = 97, 122 do table.insert(Charset, string.char(i)) end

--DistanceCheck
function distanceCheck(vec1, vec2)

    local distance = GetDistanceBetweenCoords(vec1.x, vec1.y, vec1.z, vec2.x, vec2.y, vec2.z, true)

    return distance
end

function changecolor(color)
    for k,v in pairs(vehlist) do
        local player = PlayerPedId()
        local isinveh = IsPedInVehicle(player, v.vehicle, true) 
        if isinveh then 
            if color == 0 then 
                SetVehicleColours(v.vehicle,27,27)
                colorveh = 27
            end 
            if color == 1 then 
                SetVehicleColours(v.vehicle,88,88)
                colorveh = 88
            end 
            if color == 2 then 
                SetVehicleColours(v.vehicle,64,64)
                colorveh = 64
            end  
            if color == 3 then 
                SetVehicleColours(v.vehicle,49,49)
                colorveh = 49
            end 
            if color == 4 then 
                SetVehicleColours(v.vehicle,71,71)
                colorveh = 71
            end 
            if color == 5 then 
                SetVehicleColours(v.vehicle,111,111)
                colorveh = 111
            end
        end
    end
end


Citizen.CreateThread(function()
    local letsleep = true
    while not ESX.PlayerLoaded do
		Citizen.Wait(1)
	end
    for k,v in pairs(Config.CarDealer) do 
        for kk,vv in pairs(v.cars) do 
            RequestModel(vv.name)
            Citizen.Wait(1000)
        end  
    end
    for k,v in pairs(Config.CarDealer) do
		for kk,vv in pairs(v.cars) do
			car = vv
            
			local vehicle = CreateVehicle(GetHashKey(car.name), car.coord, car.heading, false, false)
            local onground = SetVehicleOnGroundProperly(vehicle)
            Citizen.Wait(3000)
            --print(onground)
            SetVehicleRadioEnabled(vehicle, false)
            SetEntityInvincible(vehicle, true)
            SetDisableVehicleWindowCollisions(vehicle,true)
            SetVehicleNumberPlateText(vehicle,"SHOP")
            SetVehicleLights(vehicle,2)
            SetVehicleEngineOn(vehicle,false,false,false)
            SetVehicleColours(vehicle, 0,0)
            FreezeEntityPosition(vehicle, true)
            SetVehicleDirtLevel(vehicle, 0.0)
            SetEntityCanBeDamaged(vehicle,false)
            SetVehicleFixed(vehicle)
            
			while not DoesEntityExist(vehicle) do
				Citizen.Wait(0)
			end
            car.vehicle = vehicle
            car.spawnpos = v.spawnpos
			table.insert(vehlist,car)
		end
	end
    
    for k,v in pairs(Config.CarDealer) do
        AddTextEntry('name', v.name)
        blip = AddBlipForCoord(v.coords)
        SetBlipColour(blip, v.blips.color)
        SetBlipSprite(blip, v.blips.type)
        SetBlipScale(blip, v.blips.scale)
        BeginTextCommandSetBlipName("name")
        AddTextComponentSubstringPlayerName('me')
        EndTextCommandSetBlipName(blip)
    end

    while true do
        Citizen.Wait(0)
        local letsleep = true 
        for k,v in pairs(vehlist) do 
            local player = PlayerPedId()
            local isinveh = IsPedInVehicle(player, v.vehicle, true)
            if isinveh then
                SetVehicleFixed(v.vehicle)
                ESX.ShowHelpNotification(_U("ColorChange"))
                letsleep = false
                local coords = GetEntityCoords(v.vehicle)
                FreezeEntityPosition(v.vehicle, true)
                local params = {
                    xyz={x = coords.x, y = coords.y, z = coords.z +0.65}, 
                    text={
                        content=_U("BuyMessage"),
                        rgb={255 , 255, 255},
                        textOutline=true,
                        scaleMultiplier=1,
                        font=0
                    },
                    perspectiveScale=4,
                    radius=5000,
                    timeout=5000
                }           
                Draw3DText(params)

                if IsControlJustPressed(0, 175) then
                    if color < 5 then 
                        color = color +1
                        changecolor(color)
                    else 
                        color = 0
                        changecolor(color)
                    end
                end
                if IsControlJustPressed(0, 174) then
                    if color > 1 then
                        color = color -1
                        changecolor(color)
                    else 
                        color = 0
                        changecolor(color)
                    end
                end
                if IsControlJustPressed(0, 38) then
                    print(v.spawnpos)
                    if ESX.Game.IsSpawnPointClear(v.spawnpos, 2.0) then
                        buycar(colorveh)
                    else
                        TriggerEvent("notify", "error", _U("ShopName"), _U("NotClear"))
                    end
                end
            else 
                FreezeEntityPosition(vehicle, false)
                SetVehicleColours(v.vehicle,0,0)
            end

        end
        if letsleep then 
            Citizen.Wait(500)
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        local letsleep = true
        Citizen.Wait(1) 
        local coords = GetEntityCoords(PlayerPedId())
        for k,v in pairs(vehlist) do 
            if distanceCheck(coords,v.coord) <= 3 then
                letsleep = false 
                local params = {
                    xyz={x = v.coord.x, y = v.coord.y, z = coords.z +1}, 
                    text={
                        content= _U("Vehicle",v.label),
                        rgb={255 , 255, 255},
                        textOutline=true,
                        scaleMultiplier=1,
                        font=0
                    },
                    perspectiveScale=4,
                    radius=5000,
                    timeout=5000
                }           
                Draw3DText(params)
                local params1 = {
                    xyz={x = v.coord.x, y = v.coord.y, z = coords.z +0.8}, 
                    text={
                        content=_U("Price",format_int(v.price)),
                        rgb={255 , 255, 255},
                        textOutline=true,
                        scaleMultiplier=1,
                        font=0
                    },
                    perspectiveScale=4,
                    radius=5000,
                    timeout=5000
                }           
                Draw3DText(params1)
            end
        end
        if letsleep then 
            Citizen.Wait(500)
        end
    end
end)


function buycar(colorveh)
    for k,v in pairs(vehlist) do
        local player = PlayerPedId()
        local isinveh = IsPedInVehicle(player, v.vehicle, true)
        local generatedPlate = GeneratePlate()
        if isinveh then
            ESX.TriggerServerCallback('esx_vehicleshop:buyVehicle', function(success)
                if success then
                    TriggerEvent("lifepeak.notify", 'car', _U("ShopName"), _U("SuccessBuy"), "inverted green", true, "top right", 10000, 'sound.mp3')
                    FreezeEntityPosition(player, false)
                    SetEntityVisible(player, true)
                else
                    TriggerEvent("lifepeak.notify", 'car', _U("ShopName"), _U("NotMoney"), "inverted red", true, "top right", 10000, 'error.mp3')
                end
            end, v.name,v.price, generatedPlate,colorveh, v.spawnpos, v.spawnHeading)
        end
    end
end



function Draw3DText(params)
    if params == nil then params=default end
    if params.xyz == nil then params.xyz=default.xyz end
    if params.text.rgb == nil then params.text.rgb=default.text.rgb end
    if params.text.textOutline == nil then params.text.textOutline=default.text.textOutline end
    Citizen.CreateThread(function()
          -- Checks distance between player and the coords 
            if Vdist2(GetEntityCoords(PlayerPedId(), false), params.xyz.x,params.xyz.y,params.xyz.z) < (params.radius or default.radius) then
                local onScreen, _x, _y = World3dToScreen2d(params.xyz.x,params.xyz.y,params.xyz.z)
                local p = GetGameplayCamCoords()
                local distance = GetDistanceBetweenCoords(p.x, p.y, p.z, params.xyz.x,params.xyz.y,params.xyz.z, 1)
                local scale = (1 / distance) * (params.perspectiveScale or default.perspectiveScale)
                local fov = (1 / GetGameplayCamFov()) * 75
                local scale = scale * fov
                if onScreen then
                    SetTextScale(tonumber(params.text.scaleMultiplier*0.0), tonumber(0.35 * (params.text.scaleMultiplier or default.text.scaleMultiplier)))
                    SetTextFont(params.text.font or default.text.font)
                    SetTextProportional(true)
                    SetTextColour(params.text.rgb[1], params.text.rgb[2], params.text.rgb[3], 255)
                    if (params.text.textOutline) == true then SetTextOutline() end;
                    SetTextEntry("STRING")
                    SetTextCentre(true)
                    AddTextComponentString(params.text.content or default.text.content)
                    DrawText(_x,_y)
                end
        end
    end)
end

function GeneratePlate()
	local generatedPlate
	local doBreak = false

	while true do
		Wait(0)
		math.randomseed(GetGameTimer())
		if Config.PlateUseSpace then
			generatedPlate = string.upper(GetRandomLetter(Config.PlateLetters) .. ' ' .. GetRandomNumber(Config.PlateNumbers))
		else
			generatedPlate = string.upper(GetRandomLetter(Config.PlateLetters) .. GetRandomNumber(Config.PlateNumbers))
		end

		ESX.TriggerServerCallback('esx_vehicleshop:isPlateTaken', function(isPlateTaken)
			if not isPlateTaken then
				doBreak = true
			end
		end, generatedPlate)

		if doBreak then
			break
		end
	end

	return generatedPlate
end

function GetRandomNumber(length)
	Wait(0)
	if length > 0 then
		return GetRandomNumber(length - 1) .. NumberCharset[math.random(1, #NumberCharset)]
	else
		return ''
	end
end

function GetRandomLetter(length)
	Wait(0)
	if length > 0 then
		return GetRandomLetter(length - 1) .. Charset[math.random(1, #Charset)]
	else
		return ''
	end
end

function format_int(number)

    local i, j, minus, int, fraction = tostring(number):find('([-]?)(%d+)([.]?%d*)')
  
    -- reverse the int-string and append a comma to all blocks of 3 digits
    int = int:reverse():gsub("(%d%d%d)", "%1,")
  
    -- reverse the int-string back remove an optional comma and put the 
    -- optional minus and fractional part back
    return minus .. int:reverse():gsub("^,", "") .. fraction
  end