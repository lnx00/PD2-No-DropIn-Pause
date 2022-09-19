if not NDIP then

    NDIP = {
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

end

if string.lower(RequiredScript) == "lib/network/base/basenetworksession" then dofile("lua/basenetworksession.lua") end
if string.lower(RequiredScript) == "lib/managers/menumanagerdialogs" then dofile("lua/menumanagerdialogs.lua") end