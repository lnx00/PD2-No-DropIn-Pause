if not _G.NDIP then

    _G.NDIP = {
        ModPath = ModPath,

        Settings = {
            Enabled = true, -- Prevent drop-in pause
            StealthPause = true, -- Allows pause when stealth is active
            HostOnly = false -- Only prevent pause when hosting
        }
    }

    function NDIP:ShouldPause()
        if not self.Settings.Enabled then
            return true
        end

        if self.Settings.HostOnly and not Network:is_server() then
            return true
        end

        if not self.Settings.StealthPause then
            return false
        end

        return managers.groupai and managers.groupai:state():whisper_mode()
    end

    function NDIP:RequireFile(hook, file)
        if string.lower(RequiredScript) == string.lower(hook) then
            dofile(self.ModPath .. file)
        end
    end

    --[[ Menu Builder ]]
    NDIP.MenuBuilder = MenuBuilder:new("ndip", NDIP.Settings)

    Hooks:Add("MenuManagerBuildCustomMenus", "MenuManagerBuildCustomMenusUsefulBots", function(menu_manager, nodes)
        local loc = managers.localization
        HopLib:load_localization(NDIP.ModPath .. "loc/", loc)
        NDIP.MenuBuilder:create_menu(nodes)
    end)

end

NDIP:RequireFile("lib/network/base/basenetworksession", "req/basenetworksession.lua")
NDIP:RequireFile("lib/managers/menumanagerdialogs", "req/menumanagerdialogs.lua")
