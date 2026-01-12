if not game:IsLoaded() then
    game.Loaded:Wait()
end

loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/migoel787-arch/Ghoulhub/main/DrawingUI.lua"
))()
