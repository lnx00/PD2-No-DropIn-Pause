if not _G.NDIP then

    _G.NDIP = {
        ModPath = ModPath,

        Settings = {
            Enabled = true, -- Prevent drop-in pause
            StealthPause = true -- Allows pause when stealth is active
        }
    }

    function _G.NDIP:ShouldPause()
        if not self.Settings.Enabled then
            return false
        end

        if not self.Settings.StealthPause then
            return false
        end

        return managers.groupai and managers.groupai:state():whisper_mode()
    end

    function _G.NDIP:RequireFile(hook, file)
        if string.lower(RequiredScript) == string.lower(hook) then
            dofile(self.ModPath .. file)
        end
    end

end

_G.NDIP:RequireFile("lib/network/base/basenetworksession", "req/basenetworksession.lua")
_G.NDIP:RequireFile("lib/managers/menumanagerdialogs", "req/menumanagerdialogs.lua")