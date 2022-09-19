if not NDIP then

    NDIP = {
        ModPath = ModPath,

        Settings = {
            Enabled = true, -- Prevent drop-in pause
            StealthPause = true -- Allows pause when stealth is active
        }
    }

    function NDIP:ShouldPause()
        if not self.Settings.Enabled then
            return false
        end

        if self.Settings.StealthPause then
            return true
        end

        return managers.groupai and managers.groupai:state():whisper_mode()
    end

    function NDIP:RequireFile(hook, file)
        if string.lower(RequiredScript) == string.lower(hook) then
            dofile(self.ModPath .. file)
        end
    end

end

NDIP:RequireFile("lib/network/base/basenetworksession", "req/basenetworksession.lua")
NDIP:RequireFile("lib/managers/menumanagerdialogs", "req/menumanagerdialogs.lua")