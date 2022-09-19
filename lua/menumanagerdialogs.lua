local o_show_person_joining = MenuManager.show_person_joining
function MenuManager:show_person_joining(id, nick)

    if NDIP:ShouldPause() then
        o_show_person_joining(self, id, nick)
    else
        -- Show a hint instead of a dialog
        local hintText = managers.localization:text("dialog_dropin_title", { USER = nick })
        managers.hud:show_hint({ text = hintText })
    end

end

local o_close_person_joining = MenuManager.close_person_joining
function MenuManager:close_person_joining(id)

    if NDIP:ShouldPause() then
        o_close_person_joining(self, id)
    end

end
