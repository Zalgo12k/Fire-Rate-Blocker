local FireRate = {

    [`weapon_pistol`] = 0.375, 
    [`weapon_pistol_mk2`] = 0.38, 
    [`weapon_heavypistol`] = 0.42, 
    [`weapon_combatpistol`] = 0.38,
    [`weapon_snspistol`] = 0.375,
    [`weapon_vintagepistol`] = 0.42,
    [`weapon_machinepistol`] = 0.12,
    [`weapon_appistol`] = 0.11,
}


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)
		local ped = PlayerPedId()
		local playerPos = GetEntityCoords(ped)
        local ananizisiktim = GetWeaponTimeBetweenShots(GetSelectedPedWeapon(PlayerPedId()))
		if IsPedShooting(ped) then
			local _,wep = GetCurrentPedWeapon(ped)
                local weaponData = FireRate[wep]
				if weaponData then
					-- print(ananizisiktim)  --Kaç saniyede bir ateş edebildiğini gösterir (Test amaçlı açabilrisinz)
					if weaponData < ananizisiktim then
					exports['mythic_notify']:SendAlert('error', 'Fire Rate Düzenlemesi yapan 3.Parti yazılım kullanmayınız.!', 3000)
					TriggerEvent('m3:inventoryhud:client:removeCurrentWeapon')
					end
				end
			end
		end
	end)
