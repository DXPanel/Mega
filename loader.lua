local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")

local player = Players.LocalPlayer or Players.PlayerAdded:Wait()
local placeId = game.PlaceId

local REGISTRY = "https://raw.githubusercontent.com/DXPanel/Mega/refs/heads/main/games.json"

local function notify(text)
    pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title = "Loot to Forge",
            Text = text,
            Duration = 5
        })
    end)
end

local function loadGame(url, name)
    notify("กำลังโหลด " .. tostring(name) .. "...")

    local ok, source = pcall(function()
        return game:HttpGet(url .. "?t=" .. os.time())
    end)

    if not ok or not source or source == "" then
        notify("โหลดสคริปต์ไม่สำเร็จ")
        return
    end

    local fn, err = loadstring(source)

    if not fn then
        notify("Compile Error")
        warn("[Loot to Forge] " .. tostring(err))
        return
    end

    local success, runtimeErr = pcall(fn)

    if not success then
        notify("Runtime Error")
        warn("[Loot to Forge] " .. tostring(runtimeErr))
        return
    end

    notify("โหลดสำเร็จ")
end

local ok, json = pcall(function()
    return game:HttpGet(REGISTRY .. "?t=" .. os.time())
end)

if not ok or not json or json == "" then
    notify("โหลด games.json ไม่สำเร็จ")
    return
end

local success, games = pcall(function()
    return HttpService:JSONDecode(json)
end)

if not success or type(games) ~= "table" then
    notify("games.json ไม่ถูกต้อง")
    return
end

for _, gameInfo in ipairs(games) do
    if type(gameInfo) == "table" and type(gameInfo.placeIds) == "table" then
        for _, id in ipairs(gameInfo.placeIds) do
            if tonumber(id) == tonumber(placeId) then

                if gameInfo.status ~= "active" then
                    notify("Loot to Forge กำลังปิดปรับปรุง")
                    return
                end

                loadGame(gameInfo.scriptUrl, gameInfo.name)
                return
            end
        end
    end
end

notify("ไม่พบ Loot to Forge ใน games.json")
