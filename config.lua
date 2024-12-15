Config = {}

Config.DISCORD_TOKEN = "DIN_BOT_TOKEN_HÄR" -- Din Discord Bot Token som du kopierade tidigare
Config.DISCORD_GUILD_ID = "DIN_DISCORD_SERVER_ID" -- Din Discord Server (Guild) ID, se nedan hur du hittar detta
Config.WHITELIST_ROLE_ID = "WHITELIST_ROLL_ID" -- ID för rollen som krävs för att komma åt servern

Config.SupportLink = "https://discord.gg/YourServerLink" -- Ersätt med inbjudningslänk till din server


Config.Messages = {
    Checking = "🔍 Kontrollerar Discord Whitelist...",
    NoDiscordId = "\n\n" ..
                  "════════════════════════════════════════════\n" ..
                  "❌ **Anslutningen nekad** ❌\n" ..
                  "════════════════════════════════════════════\n\n" ..
                  "Tyvärr, men du måste ha **Discord** öppet och kopplat till FiveM för att ansluta till denna server.\n\n" ..
                  "Se till att du är inloggad på Discord och har rätt behörigheter.\n\n" ..
                  "Behöver du hjälp? Besök vår Discord-support: " .. Config.SupportLink .. "\n\n" ..
                  "════════════════════════════════════════════\n",

    NotWhitelisted = function(playerName)
        return "\n\n" ..
               "╔══════════════════════════════════════════╗\n" ..
               "║          🚫 **Begränsad åtkomst** 🚫       ║\n" ..
               "╚══════════════════════════════════════════╝\n\n" ..
               "Hej **" .. playerName .. "**,\n\n" ..
               "Du har inte de nödvändiga behörigheterna för att gå med på denna server.\n" ..
               "För att gå med, se till att du är **whitelistad** i vår Discord-server.\n\n" ..
               "Om du tror att detta är ett misstag, vänligen kontakta supporten:\n" ..
               "Discord: " .. Config.SupportLink .. "\n\n" ..
               "Tack för din förståelse!\n\n" ..
               "════════════════════════════════════════════\n"
    end
}
