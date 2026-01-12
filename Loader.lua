-- Ghoul Hub Loader (Drawing)

if not game:IsLoaded() then
    game.Loaded:Wait()
end

pcall(function()
    loadstring(game:HttpGet(
        "https://raw.githubusercontent.com/migoel787-arch/Ghoulhub/main/DrawingUI.lua"
    ))()
end)
