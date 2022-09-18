if not NO_DROPIN_PAUSE then
    
    NO_DROPIN_PAUSE = {
        Settings = {
            Enabled = true, -- Prevent drop-in pauses
            StealthPause = true -- Allows pause when stealth is active
        }
    }

    function NO_DROPIN_PAUSE.ShouldPause()
        if (not NO_DROPIN_PAUSE.Settings.Enabled) then
            return true
        end

        if (not NO_DROPIN_PAUSE.Settings.StealthPause) then
            return false
        end

        return (not managers.groupai) or managers.groupai:state():whisper_mode()

    end

    dofile(ModPath .. "lua/basenetworksession.lua")
    dofile(ModPath .. "lua/menumanagerdialogs.lua")

end