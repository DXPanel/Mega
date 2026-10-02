local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local MarketplaceService = game:GetService("MarketplaceService")

local player = Players.LocalPlayer or Players.PlayerAdded:Wait()
local currentPlaceId = game.PlaceId

local REGISTRY_URL =
    "https://raw.githubusercontent.com/DXPanel/Mega/refs/heads/main/games.json"

local function notify(text, duration)
    pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title = "DXPanel",
            Text = text,
            Duration = duration or 5
        })
    end)
end

local function getGameName()
    local name = "Unknown Game"

    pcall(function()
        name = MarketplaceService:GetProductInfo(currentPlaceId).Name
    end)

    return name
end

local function loadScript(url, gameName)
    notify("กำลังโหลด " .. tostring(gameName) .. "...", 4)

    local ok, source = pcall(function()
        return game:HttpGet(
            url .. "?t=" .. tostring(os.time())
        )
    end)

    if not ok or not source or source == "" then
        notify("โหลดสคริปต์ไม่สำเร็จ", 6)
        warn("[DXPanel] HTTP Error:", source)
        return false
    end

    local fn, err = loadstring(source)

    if not fn then
        notify("Script Compile Error", 7)
        warn("[DXPanel] Compile Error:", err)
        return false
    end

    local success, runtimeError = pcall(fn)

    if not success then
        notify("Script Runtime Error", 7)
        warn("[DXPanel] Runtime Error:", runtimeError)
        return false
    end

    notify(tostring(gameName) .. " โหลดสำเร็จ", 4)
    return true
end

-- โหลด games.json
local ok, json = pcall(function()
    return game:HttpGet(
        REGISTRY_URL .. "?t=" .. tostring(os.time())
    )
end)

if not ok or not json or json == "" then
    notify("โหลด games.json ไม่สำเร็จ", 7)
    return
end

-- อ่าน JSON
local decoded, games = pcall(function()
    return HttpService:JSONDecode(json)
end)

if not decoded or type(games) ~= "table" then
    notify("games.json ไม่ถูกต้อง", 7)
    return
end

-- ตรวจหาเกมจาก PlaceId
local matchedGame = nil

for _, gameInfo in ipairs(games) do
    if type(gameInfo) == "table"
    and type(gameInfo.placeIds) == "table" then

        for _, id in ipairs(gameInfo.placeIds) do
            if tonumber(id) == tonumber(currentPlaceId) then
                matchedGame = gameInfo
                break
            end
        end
    end

    if matchedGame then
        break
    end
end

-- พบเกม
if matchedGame then

    local gameName =
        matchedGame.name or getGameName()

    if matchedGame.status ~= "active" then
        notify(
            tostring(gameName) .. " กำลังปิดปรับปรุง",
            7
        )
        return
    end

    if type(matchedGame.scriptUrl) ~= "string"
    or matchedGame.scriptUrl == "" then

        notify("ไม่พบ Script URL", 7)
        return
    end

    loadScript(
        matchedGame.scriptUrl,
        gameName
    )

else

    -- ไม่พบเกม
    local gameName = getGameName()

    notify(
        "เกมนี้ยังไม่รองรับ\n"
        .. tostring(gameName)
        .. "\nPlaceId: "
        .. tostring(currentPlaceId),
        8
    )

    warn(
        "[DXPanel] Unsupported Game:",
        gameName,
        currentPlaceId
    )
end
