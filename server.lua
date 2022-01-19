local webhookcoords = ""


function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end

RegisterCommand("save", function(source, args)
		local _source = source
TriggerClientEvent("salva", source)
end)

RegisterServerEvent("coordenadas")
AddEventHandler("coordenadas", function(playerX , playerY , playerZ )
SendWebhookMessage(webhookcoords,"```\n{"..playerX..","..playerY..","..playerZ.."},```")
end)


