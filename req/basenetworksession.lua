Hooks:PostHook(BaseNetworkSession, "on_drop_in_pause_request_received", "ndip-drop_in_request",
    function(self, peer_id, nickname, state)

        if not _G.NDIP:ShouldPause() then
            Application:set_pause(false)
            SoundDevice:set_rtpc("ingame_sound", 1)
        end

    end
)
