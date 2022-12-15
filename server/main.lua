local vehlist = {}




ESX.RegisterServerCallback('esx_vehicleshop:buyVehicle', function(source, cb, model, price, plate, color,pos)
	local xPlayer = ESX.GetPlayerFromId(source)
	local modelPrice = price

	if modelPrice and xPlayer.getMoney() >= modelPrice then
		xPlayer.removeMoney(modelPrice, "Vehicle Purchase")
		MySQL.insert('INSERT INTO owned_vehicles (owner, plate, vehicle) VALUES (?, ?, ?)', {xPlayer.identifier, plate, json.encode({model = model, plate = plate, color1 = color})
		}, function(rowsChanged)
			xPlayer.showNotification(TranslateCap('vehicle_belongs', plate))
			ESX.OneSync.SpawnVehicle(model, pos, Config.SpawnHeading,{plate = plate, color1 = color}, function(vehicle)
				Wait(100)
				local vehicle = NetworkGetEntityFromNetworkId(vehicle)
				Wait(300)
				TaskWarpPedIntoVehicle(GetPlayerPed(source), vehicle, -1)
			end)
			cb(true)
		end)
	elseif xPlayer.getAccount("bank").money >= modelPrice  then
		xPlayer.removeAccountMoney("bank", modelPrice)
		MySQL.insert('INSERT INTO owned_vehicles (owner, plate, vehicle) VALUES (?, ?, ?)', {xPlayer.identifier, plate, json.encode({model = model, plate = plate, color1 = color})
		}, function(rowsChanged)
			xPlayer.showNotification(TranslateCap('vehicle_belongs', plate))
			ESX.OneSync.SpawnVehicle(model, pos, Config.SpawnHeading,{plate = plate, color1 = color}, function(vehicle)
				Wait(100)
				local vehicle = NetworkGetEntityFromNetworkId(vehicle)
				Wait(300)
				TaskWarpPedIntoVehicle(GetPlayerPed(source), vehicle, -1)
			end)
			cb(true)
		end)
	else
		cb(false)
	end
end)




ESX.RegisterServerCallback('lp_cardealer:getVehicles', function(source, cb)
	cb(vehlist)
end)
ESX.RegisterServerCallback('esx_vehicleshop:isPlateTaken', function(source, cb, plate)
	MySQL.scalar('SELECT plate FROM owned_vehicles WHERE plate = ?', {plate},
	function(result)
		cb(result ~= nil)
	end)
end)

function getVehicleFromModel(model)
	for i = 1, #vehicles do
		local vehicle = vehicles[i]
		if vehicle.model == model then
			return vehicle
		end
	end

	return
end



