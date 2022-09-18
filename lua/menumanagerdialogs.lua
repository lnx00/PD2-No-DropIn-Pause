local o_show_person_joining = MenuManager.show_person_joining
function MenuManager:show_person_joining(id, nick)

    -- Check if we're in stealth mode
    if managers.groupai:state():whisper_mode() then
        return o_show_person_joining(self, id, nick)
    end

    -- Show a hint instead of a dialog
    local hintText = managers.localization:text("dialog_dropin_title", { USER = nick })
    managers.hud:show_hint({ text = hintText })

end

local o_close_person_joining = MenuManager.close_person_joining
function MenuManager:close_person_joining(id)
    
    -- Check if we're in stealth mode
    if managers.groupai:state():whisper_mode() then
        return o_close_person_joining(self, id)
    end

end
