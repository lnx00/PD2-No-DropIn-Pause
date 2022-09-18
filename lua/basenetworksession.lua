Hooks:PostHook(BaseNetworkSession, "on_drop_in_pause_request_received", "ndip-drop_in_request",
    function(self, peer_id, nickname, state)

        -- Check if we're not in stealth mode
        if not managers.groupai:state():whisper_mode() then
            Application:set_pause(false)
            SoundDevice:set_rtpc("ingame_sound", 1)
        end

    end)
