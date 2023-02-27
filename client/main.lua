RegisterCommand(Config.command, function()
    lib.showMenu('rockstar_editor_menu')
end)

lib.registerMenu({
    id = 'rockstar_editor_menu',
    title = 'Rockstar Editor',
    position = 'top-right',
    options = {
        {label = 'Start recording'},
        {label = 'Save record'},
        {label = 'Delete record'},
        {label = 'Start Editing'},

    }
}, function(selected)
    if selected == 1 then
        TriggerEvent('alx_rockstareditor:record')
    end
    if selected == 2 then
        TriggerEvent('alx_rockstareditor:saveclip')
    end
    if selected == 3 then
        TriggerEvent('alx_rockstareditor:delclip')
    end
    if selected == 4 then
        TriggerEvent('alx_rockstareditor:editor')
    end
end)

RegisterNetEvent("alx_rockstareditor:record")
AddEventHandler("alx_rockstareditor:record", function()
    StartRecording(1)
end)

RegisterNetEvent("alx_rockstareditor:saveclip")
AddEventHandler("alx_rockstareditor:saveclip", function()
    StartRecording(0)
    StopRecordingAndSaveClip()
end)

RegisterNetEvent("alx_rockstareditor:delclip")
AddEventHandler("alx_rockstareditor:delclip", function()
    StopRecordingAndDiscardClip()
end)

RegisterNetEvent("alx_rockstareditor:editor")
AddEventHandler("alx_rockstareditor:editor", function()
    NetworkSessionLeaveSinglePlayer()
    ActivateRockstarEditor()
end)