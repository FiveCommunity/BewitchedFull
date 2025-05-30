-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRPS = Tunnel.getInterface("vRP")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
vSERVER = Tunnel.getInterface("police")
-----------------------------------------------------------------------------------------------------------------------------------------
-- POLICE:OPEN
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("police:Open",function()
	if CheckPolice() then
		SetNuiFocus(true,true)
		TriggerEvent("dynamic:Close")
		SendNUIMessage({ name = "Open" })

		local Ped = PlayerPedId()
		if not IsPedInAnyVehicle(Ped) then
			vRP.CreateObjects("amb@code_human_in_bus_passenger_idles@female@tablet@idle_a","idle_a","prop_cs_tablet",49,28422,-0.05,0.0,0.0,0.0,0.0,0.0)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- OPEN
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("Open",function(Data,Callback)
	Callback(vSERVER.Request())
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DASHBOARDREMOVEMESSAGE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("DashboardRemoveMessage",function(Data,Callback)
	Callback(vSERVER.DashboardRemoveMessage(Data["id"]))
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SEARCHLIST
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("SearchList",function(Data,Callback)
	Callback(vSERVER.SearchList())
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SEARCH
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("Search",function(Data,Callback)
	Callback(vSERVER.Search(Data["id"]))
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PERSONAL
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("Personal",function(Data,Callback)
	Callback(vSERVER.Personal(Data["id"]))
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PRISON
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("Prison",function(Data,Callback)
	Callback(vSERVER.Prison(Data))
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- BADGE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("Badge",function(Data,Callback)
	Callback(vSERVER.Badge(Data))
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- MESSAGE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("Message",function(Data,Callback)
	Callback(vSERVER.Message(Data))
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- COURSES
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("Courses",function(Data,Callback)
	Callback(vSERVER.Courses(Data))
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPDATEAVATAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("UpdateAvatar",function(Data,Callback)
	vRPS.UpdateAvatar(Data["passport"],Data["link"])

	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CLOSE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("Close",function(Data,Callback)
	SetNuiFocus(false,false)

	local Ped = PlayerPedId()
	if not IsPedInAnyVehicle(Ped) then
		vRP.Destroy()
	end

	Callback("Ok")
end)