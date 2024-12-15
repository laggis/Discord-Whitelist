AddEventHandler('playerConnecting', function(name, setKickReason, deferrals)
    local player = source
    deferrals.defer()
    deferrals.update(Config.Messages.Checking)

    local discordId = getPlayerDiscordId(player)

    if not discordId then
        deferrals.done(Config.Messages.NoDiscordId)
        return
    end

    local hasRole = checkDiscordRole(discordId, Config.WHITELIST_ROLE_ID)

    if hasRole then
        deferrals.done()
    else
        deferrals.done(Config.Messages.NotWhitelisted(name))
    end
end)

function getPlayerDiscordId(player)
    for _, id in ipairs(GetPlayerIdentifiers(player)) do
        if string.match(id, "discord:") then
            return string.gsub(id, "discord:", "")
        end
    end
    return nil
end


function checkDiscordRole(discordId, roleId)
    local endpoint = string.format("https://discord.com/api/v10/guilds/%s/members/%s", Config.DISCORD_GUILD_ID, discordId)
    local headers = {
        ["Authorization"] = "Bot " .. Config.DISCORD_TOKEN,
        ["Content-Type"] = "application/json"
    }


    local result = nil
    PerformHttpRequest(endpoint, function(statusCode, response, headers)
        if statusCode == 200 then
            local data = json.decode(response)
            if data and data.roles then
                for _, role in ipairs(data.roles) do
                    if role == roleId then
                        result = true
                        return
                    end
                end
            end
            result = false
        else
            print("Error: Unable to fetch Discord roles. HTTP Status: " .. tostring(statusCode))
            result = false
        end
    end, "GET", "", headers)


    while result == nil do
        Citizen.Wait(0)
    end

    return result
end
