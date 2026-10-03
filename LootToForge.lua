local DX_TAB_ICONS = {
    ["Overview"] = "rbxassetid://18979524646",
    ["Setting"] = "rbxassetid://138572498196410",
    ["Settings"] = "rbxassetid://138572498196410",
    ["Farm"] = "rbxassetid://18777407436",
    ["Dungeon"] = "rbxassetid://16615793832",
    ["Info"] = "rbxassetid://71870986260398",
    ["Forge"] = "rbxassetid://9394791231",
}

--[[
	LUNAR_Hub.lua  -  LUNAR Hub (Neon UI)
	แท็บ: Overview / Example (แท็บตัวอย่าง) / Settings
	เพิ่มแท็บใหม่: คัดลอกบล็อก "EXAMPLE" ในส่วน PAGES แล้วแก้ชื่อกับคอมโพเนนต์
	คอมโพเนนต์: Section / Button / Toggle / Slider / Dropdown (เลือกเดียว/หลายอัน)

	รับ context จาก Loader (ไม่บังคับ): { PlaceId, GameName, Hooks = { ... } }
	Hooks ที่ใช้ตอนนี้: Hooks.AutoLoad(enabled)  (เพิ่ม Hook อื่นเองได้ด้วย callHook / hookAvailable)
]]

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")
local MarketplaceService = game:GetService("MarketplaceService")
local Stats = game:GetService("Stats")

-- Re-execution protection
for _, key in ipairs({ "LunarHubCleanup", "DXPanelCleanup" }) do
	if _G[key] then
		pcall(_G[key])
		_G[key] = nil
	end
end

local LocalPlayer = Players.LocalPlayer
if not LocalPlayer then
	warn("[LUNAR Hub] LocalPlayer not available (must run on client)")
	return
end

local args = { ... }
local Context = type(args[1]) == "table" and args[1] or {}
local Hooks = type(Context.Hooks) == "table" and Context.Hooks or {}

--============================================================
-- SETTINGS (บันทึกลงไฟล์ถ้า executor รองรับ writefile)
--============================================================

local DEFAULT_SETTINGS = {
	Animate = true,
	Pulse = true,
	ShowFloating = true,
	AutoLoad = false,
	Stars = true,
	Rainbow = false,
	RainbowSpeed = 1,
	Multi = true,
	NeonColors = { "9B5CFF", "3DA5FF", "FF5CC8" },
	ThemeColor = "9B5CFF",
}
local SETTINGS_FILE = "LunarHub_Settings.json"

local function copyTable(t)
	local c = {}
	for k, v in pairs(t) do
		c[k] = type(v) == "table" and copyTable(v) or v
	end
	return c
end

local function HexToColor3(hex)
	if type(hex) ~= "string" then
		return nil
	end
	hex = hex:gsub("[#%s]", "")
	if #hex ~= 6 then
		return nil
	end
	local r = tonumber(hex:sub(1, 2), 16)
	local g = tonumber(hex:sub(3, 4), 16)
	local b = tonumber(hex:sub(5, 6), 16)
	if not (r and g and b) then
		return nil
	end
	return Color3.fromRGB(r, g, b)
end

local function Color3ToHex(c)
	return string.format(
		"%02X%02X%02X",
		math.floor(c.R * 255 + 0.5),
		math.floor(c.G * 255 + 0.5),
		math.floor(c.B * 255 + 0.5)
	)
end

local Settings = copyTable(DEFAULT_SETTINGS)
local hasFileApi = type(isfile) == "function" and type(readfile) == "function" and type(writefile) == "function"

local function saveSettings()
	if not hasFileApi then
		return
	end
	pcall(function()
		writefile(SETTINGS_FILE, HttpService:JSONEncode(Settings))
	end)
end

do
	if hasFileApi then
		pcall(function()
			if not isfile(SETTINGS_FILE) then
				return
			end
			local data = HttpService:JSONDecode(readfile(SETTINGS_FILE))
			if type(data) ~= "table" then
				return
			end
			for _, key in ipairs({ "Animate", "Pulse", "ShowFloating", "AutoLoad", "Stars", "Rainbow", "Multi" }) do
				if type(data[key]) == "boolean" then
					Settings[key] = data[key]
				end
			end
			if type(data.NeonColors) == "table" then
				local list = {}
				for _, h in ipairs(data.NeonColors) do
					if HexToColor3(h) and #list < 5 then
						table.insert(list, h)
					end
				end
				if #list >= 2 then
					Settings.NeonColors = list
				end
			end
			if type(data.RainbowSpeed) == "number" then
				Settings.RainbowSpeed = math.clamp(data.RainbowSpeed, 0.2, 3)
			end
			if HexToColor3(data.ThemeColor) then
				Settings.ThemeColor = data.ThemeColor
			end
		end)
	end
end

--============================================================
-- COLOR / THEME
--============================================================

local COLOR = {
	red = Color3.fromRGB(235, 30, 52),
	redBright = Color3.fromRGB(255, 70, 90),
	redSoft = Color3.fromRGB(255, 110, 125),
	redDark = Color3.fromRGB(90, 8, 18),
	neon = Color3.fromRGB(255, 45, 75),

	black = Color3.fromRGB(8, 6, 17),
	black2 = Color3.fromRGB(20, 12, 38),
	sidebar = Color3.fromRGB(12, 9, 24),
	sidebar2 = Color3.fromRGB(18, 12, 34),

	innerBg = Color3.fromRGB(25, 12, 17),
	innerBgHover = Color3.fromRGB(55, 15, 25),
	innerBorder = Color3.fromRGB(75, 30, 42),
	innerBorderHover = Color3.fromRGB(255, 70, 90),

	switchOff = Color3.fromRGB(38, 34, 54),
	switchBorder = Color3.fromRGB(85, 40, 52),

	white = Color3.fromRGB(245, 245, 248),
	grey = Color3.fromRGB(150, 145, 175),
	border = Color3.fromRGB(62, 43, 51),

	good = Color3.fromRGB(100, 220, 125),
	bad = Color3.fromRGB(255, 90, 100),
}

local NeonSequence
local ThemeListeners = {}

local function Shift(c, dh, ds, dv)
	local h, s, v = Color3.toHSV(c)
	return Color3.fromHSV((h + dh) % 1, math.clamp(s + ds, 0, 1), math.clamp(v + dv, 0, 1))
end

local function BuildNeonSequence(c)
	if Settings.Rainbow then
		local pts = {}
		for i = 0, 6 do
			table.insert(pts, ColorSequenceKeypoint.new(i / 6, Color3.fromHSV((i / 6) % 1, 0.75, 1)))
		end
		pts[7] = ColorSequenceKeypoint.new(1, Color3.fromHSV(0, 0.75, 1))
		return ColorSequence.new(pts)
	end
	-- หลายสีพร้อมกัน: ไล่สีวนครบรอบตามพาเลตที่เลือก
	if Settings.Multi and type(Settings.NeonColors) == "table" and #Settings.NeonColors >= 2 then
		local list, n, pts = Settings.NeonColors, #Settings.NeonColors, {}
		for i = 1, n do
			table.insert(pts, ColorSequenceKeypoint.new((i - 1) / n, HexToColor3(list[i]) or c))
		end
		table.insert(pts, ColorSequenceKeypoint.new(1, HexToColor3(list[1]) or c))
		return ColorSequence.new(pts)
	end
	-- ไล่สีข้างเคียง (analogous) ให้ขอบดูมีมิติ เช่น ม่วง -> ฟ้า/ชมพู
	return ColorSequence.new({
		ColorSequenceKeypoint.new(0, Shift(c, -0.07, -0.1, 0.12)),
		ColorSequenceKeypoint.new(0.3, c),
		ColorSequenceKeypoint.new(0.55, Shift(c, 0.1, 0, 0.1)),
		ColorSequenceKeypoint.new(0.8, Shift(c, 0.04, 0, -0.38)),
		ColorSequenceKeypoint.new(1, Shift(c, -0.07, -0.1, 0.12)),
	})
end

local function BuildLineSequence(c)
	return ColorSequence.new({
		ColorSequenceKeypoint.new(0, c),
		ColorSequenceKeypoint.new(0.25, COLOR.border),
		ColorSequenceKeypoint.new(1, COLOR.border),
	})
end

-- คำนวณโทนสีทั้งชุดจากสีหลัก (พื้นการ์ด/ขอบจะเอนตามสีธีมด้วย)
local function DeriveTheme(c)
	local h, s = Color3.toHSV(c)
	local k = math.min(s, 1)
	COLOR.red = c
	COLOR.neon = c
	COLOR.redBright = Color3.fromHSV(h, math.min(s, 0.55), 1)
	COLOR.redSoft = Color3.fromHSV(h, math.min(s, 0.35), 1)
	COLOR.redDark = Color3.fromHSV(h, math.min(s, 0.9), 0.35)
	COLOR.innerBorderHover = COLOR.redBright
	COLOR.innerBg = Color3.fromHSV(h, k * 0.6, 0.1)
	COLOR.innerBgHover = Color3.fromHSV(h, k * 0.84, 0.22)
	COLOR.innerBorder = Color3.fromHSV(h, k * 0.69, 0.3)
	COLOR.switchBorder = Color3.fromHSV(h, k * 0.6, 0.33)
	COLOR.border = Color3.fromHSV(h, k * 0.36, 0.25)
	NeonSequence = BuildNeonSequence(c)
end

-- ลงทะเบียนตัวทาสีใหม่: เรียกทันที 1 ครั้ง และเรียกซ้ำทุกครั้งที่เปลี่ยนธีม
local function OnTheme(fn)
	table.insert(ThemeListeners, fn)
	fn()
end

DeriveTheme(HexToColor3(Settings.ThemeColor) or HexToColor3(DEFAULT_SETTINGS.ThemeColor))


local Actions = {}

--============================================================
-- CLEANUP SYSTEM
--============================================================

local Gui
local destroyed = false
local connections = {}
local cleanupTasks = {}
local SpinTweens = {}

local function track(conn)
	table.insert(connections, conn)
	return conn
end

local function addCleanup(fn)
	table.insert(cleanupTasks, fn)
end

local function cleanup()
	if destroyed then
		return
	end
	destroyed = true
	for _, c in ipairs(connections) do
		pcall(function()
			c:Disconnect()
		end)
	end
	table.clear(connections)
	for _, t in ipairs(SpinTweens) do
		pcall(function()
			t:Cancel()
		end)
	end
	for _, fn in ipairs(cleanupTasks) do
		pcall(fn)
	end
	table.clear(cleanupTasks)
	if Gui then
		pcall(function()
			Gui:Destroy()
		end)
	end
	if _G.LunarHubCleanup == cleanup then
		_G.LunarHubCleanup = nil
	end
end
_G.LunarHubCleanup = cleanup

--============================================================
-- HELPERS
--============================================================

local function New(class, props, parent)
	local obj = Instance.new(class)
	for k, v in pairs(props or {}) do
		obj[k] = v
	end
	obj.Parent = parent
	return obj
end

local function Corner(obj, radius)
	return New("UICorner", { CornerRadius = UDim.new(0, radius) }, obj)
end

local function Stroke(obj, color, thickness, transparency)
	return New("UIStroke", {
		Color = color,
		Thickness = thickness or 1,
		Transparency = transparency or 0,
		ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
	}, obj)
end

local function Gradient(obj, colorSeq, rotation)
	return New("UIGradient", { Color = colorSeq, Rotation = rotation or 0 }, obj)
end

local function Tween(obj, time, props, style, direction)
	local t = TweenService:Create(
		obj,
		TweenInfo.new(
			Settings.Animate and (time or 0.2) or 0,
			style or Enum.EasingStyle.Quart,
			direction or Enum.EasingDirection.Out
		),
		props
	)
	t:Play()
	return t
end

local function Txt(parent, props)
	local base = {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Font = Enum.Font.Gotham,
		TextSize = 11,
		TextColor3 = COLOR.white,
		TextXAlignment = Enum.TextXAlignment.Left,
	}
	for k, v in pairs(props) do
		base[k] = v
	end
	return New("TextLabel", base, parent)
end

local orderCounters = setmetatable({}, { __mode = "k" })
local function ord(parent)
	orderCounters[parent] = (orderCounters[parent] or 0) + 1
	return orderCounters[parent]
end

-- ขอบเรืองแสงหลายชั้น
local function NeonLayers(parent, radius, specs)
	local list = {}
	for i, s in ipairs(specs) do
		local f = New("Frame", {
			Name = "NeonLayer" .. i,
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ZIndex = i,
		}, parent)
		Corner(f, radius)
		local st = New("UIStroke", {
			Color = Color3.new(1, 1, 1),
			Thickness = s[1],
			Transparency = s[2],
			ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
		}, f)
		local grad = Gradient(st, NeonSequence, 0)
		table.insert(list, { Frame = f, Stroke = st, Grad = grad, Bright = s[2], Dim = s[3] })
	end
	return list
end

local function Spin(grad, seconds)
	grad.Rotation = 0
	local t = TweenService:Create(
		grad,
		TweenInfo.new(seconds, Enum.EasingStyle.Linear, Enum.EasingDirection.In, -1),
		{ Rotation = 360 }
	)
	t:Play()
	table.insert(SpinTweens, t)
	return t
end


--============================================================
-- INTERACTION LOCK (ทำงานได้ทีละอย่าง: เลื่อน / ลากสไลเดอร์ / ลากแผง ไม่ซ้อนกัน)
--============================================================

local Interaction = {}
do
	local scrollers, active = {}, nil

	local function setAll(enabled, keep)
		for sf in pairs(scrollers) do
			if sf.Parent and sf ~= keep then
				sf.ScrollingEnabled = enabled
			end
		end
	end

	function Interaction.Begin(owner, keep)
		if active ~= nil then
			return false
		end
		active = owner
		setAll(false, keep)
		return true
	end

	function Interaction.End(owner)
		if active ~= owner then
			return
		end
		active = nil
		setAll(true)
	end

	-- ScrollingFrame ที่กำลังเลื่อนอยู่จะล็อกตัวอื่นทั้งหมดจนกว่าจะหยุดเลื่อน
	function Interaction.WatchScroll(sf)
		scrollers[sf] = true
		local token = 0
		track(sf:GetPropertyChangedSignal("CanvasPosition"):Connect(function()
			if active == nil then
				Interaction.Begin(sf, sf)
			end
			if active == sf then
				token += 1
				local t = token
				task.delay(0.15, function()
					if t == token then
						Interaction.End(sf)
					end
				end)
			end
		end))
	end
end

--============================================================
-- ROOT GUI (ลบตัวเก่าที่ค้างอยู่ก่อน)
--============================================================

do
	local containers = { LocalPlayer:FindFirstChild("PlayerGui") }
	pcall(function()
		table.insert(containers, game:GetService("CoreGui"))
	end)
	for _, c in ipairs(containers) do
		for _, n in ipairs({ "LunarHubGui", "DXPanelGui", "DXPanel" }) do
			local old = c and c:FindFirstChild(n)
			if old then
				pcall(function()
					old:Destroy()
				end)
			end
		end
	end
end

Gui = New("ScreenGui", {
	Name = "LunarHubGui",
	ResetOnSpawn = false,
	IgnoreGuiInset = true,
	DisplayOrder = 999,
	ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
})

local function Viewport()
	local s = Gui.AbsoluteSize
	if s.X < 50 or s.Y < 50 then
		local cam = workspace.CurrentCamera
		s = cam and cam.ViewportSize or Vector2.new(1280, 720)
	end
	return s
end

--============================================================
-- PANEL SIZE / POSITION
--============================================================

local SIZE = { minW = 340, minH = 260, maxW = 850, maxH = 560, defW = 600, defH = 370 }
local PanelSize, PanelPos

local function ClampSize(w, h)
	local vp = Viewport()
	local maxW = math.min(SIZE.maxW, vp.X - 8)
	local maxH = math.min(SIZE.maxH, vp.Y - 8)
	local minW = math.min(SIZE.minW, maxW)
	local minH = math.min(SIZE.minH, maxH)
	return math.clamp(w, minW, maxW), math.clamp(h, minH, maxH)
end

local function ClampPos(x, y)
	local vp = Viewport()
	return math.clamp(x, 0, math.max(0, vp.X - PanelSize.X)), math.clamp(y, 0, math.max(0, vp.Y - PanelSize.Y))
end

do
	local cw, ch = ClampSize(SIZE.defW, SIZE.defH)
	PanelSize = Vector2.new(cw, ch)
	PanelPos = Vector2.new((Viewport().X - cw) / 2, (Viewport().Y - ch) / 2)
end

local Root = New("Frame", {
	Name = "Root",
	Position = UDim2.fromOffset(PanelPos.X, PanelPos.Y),
	Size = UDim2.fromOffset(PanelSize.X, PanelSize.Y),
	BackgroundTransparency = 1,
	BorderSizePixel = 0,
	ZIndex = 1,
}, Gui)

local function ApplyPanel()
	Root.Size = UDim2.fromOffset(PanelSize.X, PanelSize.Y)
	Root.Position = UDim2.fromOffset(PanelPos.X, PanelPos.Y)
end

local function SetPanelPos(v)
	local x, y = ClampPos(v.X, v.Y)
	PanelPos = Vector2.new(x, y)
	Root.Position = UDim2.fromOffset(x, y)
end

local function SetPanelSize(w, h)
	local cw, ch = ClampSize(w, h)
	PanelSize = Vector2.new(cw, ch)
	Root.Size = UDim2.fromOffset(cw, ch)
	SetPanelPos(PanelPos)
	if Actions.ApplyLayout then
		Actions.ApplyLayout()
	end
end

local function FitPanel(w, h, recenter)
	local cw, ch = ClampSize(w, h)
	PanelSize = Vector2.new(cw, ch)
	if Actions.ApplyLayout then
		Actions.ApplyLayout()
	end
	if recenter then
		local vp = Viewport()
		PanelPos = Vector2.new((vp.X - cw) / 2, (vp.Y - ch) / 2)
	else
		local x, y = ClampPos(PanelPos.X, PanelPos.Y)
		PanelPos = Vector2.new(x, y)
	end
	Tween(Root, 0.25, {
		Size = UDim2.fromOffset(PanelSize.X, PanelSize.Y),
		Position = UDim2.fromOffset(PanelPos.X, PanelPos.Y),
	})
end

--============================================================
-- MAIN FRAME
--============================================================

local MainGlow = NeonLayers(Root, 16, {
	{ 3, 0.70, 0.82 },
	{ 7, 0.82, 0.90 },
	{ 12, 0.90, 0.95 },
	{ 18, 0.95, 0.98 },
})
for _, l in ipairs(MainGlow) do
	Spin(l.Grad, 5)
end

local Main = New("Frame", {
	Name = "Main",
	Size = UDim2.fromScale(1, 1),
	BackgroundColor3 = COLOR.black,
	BorderSizePixel = 0,
	Active = true,
	ZIndex = 10,
}, Root)
Corner(Main, 16)

Gradient(Main, ColorSequence.new({
	ColorSequenceKeypoint.new(0, COLOR.black2),
	ColorSequenceKeypoint.new(0.55, COLOR.black),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(5, 4, 12)),
}), 65)

local MainStroke = Stroke(Main, Color3.new(1, 1, 1), 2, 0)
local MainStrokeGrad = Gradient(MainStroke, NeonSequence, 0)
Spin(MainStrokeGrad, 5)

--============================================================
-- SKY : พื้นหลังกาแล็กซี (เนบิวลา + ดาวระยิบ + ดาวตก)
--============================================================

local Sky = New("Frame", {
	Name = "Sky",
	Size = UDim2.fromScale(1, 1),
	BackgroundTransparency = 1,
	ClipsDescendants = true,
	Active = false,
	ZIndex = 11,
}, Main)
Corner(Sky, 16)

local rng = Random.new()

-- เนบิวลา: วงกลมโปร่งแสงซ้อนกันให้ดูฟุ้ง
local NebulaLayers = {}
local function Nebula(ax, ay, size, second)
	for i, d in ipairs({ 1, 0.7, 0.42 }) do
		local f = New("Frame", {
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(ax, ay),
			Size = UDim2.fromOffset(size * d, size * d),
			BackgroundColor3 = COLOR.red,
			BackgroundTransparency = ({ 0.965, 0.95, 0.93 })[i],
			BorderSizePixel = 0,
			ZIndex = 11,
		}, Sky)
		Corner(f, size)
		table.insert(NebulaLayers, { Frame = f, Second = second })
	end
end
Nebula(0.88, 0.12, 300, false)
Nebula(0.25, 0.95, 260, true)

local StarList = {}
for i = 1, 36 do
	local big = rng:NextInteger(1, 8) == 1
	local sz = big and 3 or rng:NextInteger(1, 2)
	local f = New("Frame", {
		Position = UDim2.fromScale(rng:NextNumber(), rng:NextNumber()),
		Size = UDim2.fromOffset(sz, sz),
		BackgroundColor3 = Color3.new(1, 1, 1),
		BackgroundTransparency = rng:NextNumber(0.4, 0.85),
		BorderSizePixel = 0,
		Visible = Settings.Stars,
		ZIndex = 11,
	}, Sky)
	Corner(f, 2)
	table.insert(StarList, { Frame = f, Base = f.BackgroundTransparency })
end

OnTheme(function()
	local h, s, v = Color3.toHSV(COLOR.red)
	for _, l in ipairs(NebulaLayers) do
		l.Frame.BackgroundColor3 = l.Second and Color3.fromHSV((h + 0.12) % 1, math.max(s, 0.5), 1) or COLOR.red
	end
end)

function Actions.SetStars(on)
	Settings.Stars = on
	for _, st in ipairs(StarList) do
		st.Frame.Visible = on
	end
end

local function SpawnMeteor()
	local sz = Sky.AbsoluteSize
	if sz.X < 120 then
		return
	end
	local len = rng:NextInteger(70, 130)
	local sx = rng:NextNumber(0.4, 1.05) * sz.X
	local sy = rng:NextNumber(-0.08, 0.35) * sz.Y
	local dist = rng:NextNumber(0.5, 0.85) * sz.X
	local ex, ey = sx - dist * 0.866, sy + dist * 0.5
	local dur = rng:NextNumber(0.8, 1.4)

	local m = New("Frame", {
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromOffset(sx, sy),
		Size = UDim2.fromOffset(len, 2),
		Rotation = -30,
		BackgroundColor3 = Color3.new(1, 1, 1),
		BorderSizePixel = 0,
		ZIndex = 12,
	}, Sky)
	Corner(m, 1)
	local g = Gradient(m, ColorSequence.new(Color3.new(1, 1, 1), COLOR.redSoft), 0)
	g.Transparency = NumberSequence.new({
		NumberSequenceKeypoint.new(0, 0),
		NumberSequenceKeypoint.new(0.18, 0.15),
		NumberSequenceKeypoint.new(1, 1),
	})
	TweenService:Create(m, TweenInfo.new(dur, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
		Position = UDim2.fromOffset(ex, ey),
	}):Play()
	task.delay(dur * 0.55, function()
		if m.Parent then
			TweenService:Create(m, TweenInfo.new(dur * 0.45), { BackgroundTransparency = 1 }):Play()
		end
	end)
	task.delay(dur + 0.05, function()
		if m.Parent then
			m:Destroy()
		end
	end)
end

task.spawn(function()
	while not destroyed and Sky.Parent do
		task.wait(rng:NextNumber(1.2, 3.4))
		if Settings.Stars and Root.Visible then
			SpawnMeteor()
			if rng:NextInteger(1, 4) == 1 then
				task.delay(rng:NextNumber(0.2, 0.5), SpawnMeteor)
			end
		end
	end
end)

task.spawn(function()
	while not destroyed and Sky.Parent do
		task.wait(0.5)
		if Settings.Stars and Root.Visible then
			for _ = 1, 4 do
				local st = StarList[rng:NextInteger(1, #StarList)]
				if st and st.Frame.Parent then
					TweenService:Create(st.Frame, TweenInfo.new(0.45, Enum.EasingStyle.Sine), { BackgroundTransparency = 0.05 }):Play()
					task.delay(0.5, function()
						if st.Frame.Parent then
							TweenService:Create(st.Frame, TweenInfo.new(0.6, Enum.EasingStyle.Sine), { BackgroundTransparency = st.Base }):Play()
						end
					end)
				end
			end
		end
	end
end)

-- Toast (แจ้งผลสั้นๆ ด้านล่าง)
local Toast = New("TextLabel", {
	AnchorPoint = Vector2.new(0.5, 1),
	Position = UDim2.new(0.5, 0, 1, -16),
	Size = UDim2.fromOffset(240, 30),
	BackgroundColor3 = COLOR.black,
	BackgroundTransparency = 0.05,
	Text = "",
	Font = Enum.Font.GothamMedium,
	TextSize = 11,
	TextColor3 = COLOR.white,
	Visible = false,
	ZIndex = 300,
}, Main)
Corner(Toast, 10)
local ToastStroke = Stroke(Toast, COLOR.good, 1.5, 0)
local toastToken = 0

local function Notify(text, good)
	toastToken += 1
	local token = toastToken
	Toast.Text = text
	ToastStroke.Color = good and COLOR.good or COLOR.bad
	Toast.Visible = true
	task.delay(2, function()
		if token == toastToken and Toast.Parent then
			Toast.Visible = false
		end
	end)
end

--============================================================
-- SIDEBAR
--============================================================

local Sidebar = New("Frame", {
	Position = UDim2.new(0, 2, 0, 4),
	Size = UDim2.new(0, 145, 1, -6),
	BackgroundColor3 = COLOR.sidebar2,
	BorderSizePixel = 0,
	Active = true,
	ClipsDescendants = true,
	ZIndex = 11,
}, Main)
Corner(Sidebar, 14)

Gradient(Sidebar, ColorSequence.new(Color3.new(1, 1, 1), Color3.fromRGB(190, 190, 205)), 80)

local SidebarLine = New("Frame", {
	Position = UDim2.new(1, -1, 0, 0),
	Size = UDim2.new(0, 1, 1, 0),
	BackgroundColor3 = COLOR.border,
	BackgroundTransparency = 0.25,
	BorderSizePixel = 0,
	ZIndex = 15,
}, Sidebar)

-- โลโก้พระจันทร์ (วาดด้วย Frame)
local Moon = New("Frame", {
	Position = UDim2.new(0, 14, 0, 13),
	Size = UDim2.fromOffset(30, 30),
	BackgroundTransparency = 1,
	ZIndex = 20,
}, Sidebar)
local MoonDisc = New("Frame", {
	AnchorPoint = Vector2.new(0.5, 0.5),
	Position = UDim2.fromScale(0.5, 0.5),
	Size = UDim2.fromOffset(24, 24),
	BackgroundColor3 = Color3.fromRGB(240, 236, 255),
	BorderSizePixel = 0,
	ZIndex = 21,
}, Moon)
Corner(MoonDisc, 12)
Gradient(MoonDisc, ColorSequence.new(Color3.new(1, 1, 1), Color3.fromRGB(190, 184, 230)), 45)
local MoonStroke = Stroke(MoonDisc, COLOR.neon, 3, 0.6)
for _, c in ipairs({ { 14, 5, 6 }, { 5, 12, 8 }, { 15, 15, 4 } }) do
	local crater = New("Frame", {
		Position = UDim2.fromOffset(c[1], c[2]),
		Size = UDim2.fromOffset(c[3], c[3]),
		BackgroundColor3 = Color3.fromRGB(196, 190, 228),
		BorderSizePixel = 0,
		ZIndex = 22,
	}, MoonDisc)
	Corner(crater, c[3])
end

local LogoTitle = Txt(Sidebar, {
	Position = UDim2.new(0, 52, 0, 12),
	Size = UDim2.new(1, -58, 0, 18),
	Text = "LUNAR",
	Font = Enum.Font.GothamBlack,
	TextSize = 17,
	ZIndex = 20,
})

local PanelWord = Txt(Sidebar, {
	Position = UDim2.new(0, 52, 0, 29),
	Size = UDim2.new(1, -58, 0, 12),
	Text = "H U B",
	Font = Enum.Font.GothamBold,
	TextSize = 9,
	ZIndex = 20,
})

local LogoLine = New("Frame", {
	Visible = false,
	Position = UDim2.new(0, 15, 0, 49),
	Size = UDim2.fromOffset(35, 2),
	BackgroundColor3 = COLOR.red,
	BorderSizePixel = 0,
	ZIndex = 20,
}, Sidebar)
Corner(LogoLine, 2)
local LogoGrad = Gradient(LogoLine, ColorSequence.new({
	ColorSequenceKeypoint.new(0, COLOR.redBright),
	ColorSequenceKeypoint.new(1, COLOR.redDark),
}), 0)

local Online = Txt(Sidebar, {
	Position = UDim2.new(0, 15, 0, 55),
	Size = UDim2.new(1, -30, 0, 18),
	Text = "●  ONLINE",
	Font = Enum.Font.GothamMedium,
	TextSize = 9,
	TextColor3 = COLOR.good,
	ZIndex = 20,
})

task.spawn(function()
	while not destroyed and Online.Parent do
		Tween(Online, 1.0, { TextTransparency = 0.55 }, Enum.EasingStyle.Sine)
		task.wait(1)
		Tween(Online, 1.0, { TextTransparency = 0 }, Enum.EasingStyle.Sine)
		task.wait(1)
	end
end)

local TabHolder = New("ScrollingFrame", {
	Position = UDim2.new(0, 9, 0, 88),
	Size = UDim2.new(1, -18, 1, -98),
	BackgroundTransparency = 1,
	BorderSizePixel = 0,
	ScrollBarThickness = 0,
	CanvasSize = UDim2.new(),
	AutomaticCanvasSize = Enum.AutomaticSize.Y,
	ScrollingDirection = Enum.ScrollingDirection.Y,
	ClipsDescendants = true,
	ZIndex = 20,
}, Sidebar)
New("UIListLayout", { Padding = UDim.new(0, 6), SortOrder = Enum.SortOrder.LayoutOrder }, TabHolder)
Interaction.WatchScroll(TabHolder)

--============================================================
-- CONTENT / HEADER
--============================================================

local Content = New("Frame", {
	Position = UDim2.new(0, 145, 0, 4),
	Size = UDim2.new(1, -145, 1, -6),
	BackgroundTransparency = 1,
	BorderSizePixel = 0,
	ZIndex = 11,
}, Main)

local Header = New("Frame", {
	Position = UDim2.new(0, 15, 0, 9),
	Size = UDim2.new(1, -30, 0, 38),
	BackgroundTransparency = 1,
	Active = true,
	ZIndex = 25,
}, Content)

local Title = Txt(Header, {
	Size = UDim2.new(1, -55, 0, 22),
	Text = "Overview",
	Font = Enum.Font.GothamBold,
	TextSize = 18,
	ZIndex = 30,
})

Txt(Header, {
	Position = UDim2.new(0, 0, 0, 21),
	Size = UDim2.new(1, -55, 0, 14),
	Text = "LUNAR Hub Premium Interface",
	TextSize = 10,
	TextColor3 = COLOR.grey,
	ZIndex = 30,
})

local Close = New("TextButton", {
	Name = "Close",
	AnchorPoint = Vector2.new(1, 0),
	Position = UDim2.new(1, 0, 0, 4),
	Size = UDim2.fromOffset(26, 26),
	BackgroundColor3 = Color3.fromRGB(24, 19, 23),
	BorderSizePixel = 0,
	AutoButtonColor = false,
	Text = "×",
	Font = Enum.Font.GothamBold,
	TextSize = 18,
	TextColor3 = COLOR.grey,
	ZIndex = 100,
}, Header)
Corner(Close, 8)
local CloseStroke = Stroke(Close, COLOR.border, 1, 0.1)

track(Close.MouseEnter:Connect(function()
	Tween(Close, 0.15, { BackgroundColor3 = Color3.fromRGB(70, 12, 20), TextColor3 = COLOR.redBright, Rotation = 90 })
	Tween(CloseStroke, 0.15, { Color = COLOR.red })
end))
track(Close.MouseLeave:Connect(function()
	Tween(Close, 0.15, { BackgroundColor3 = Color3.fromRGB(24, 19, 23), TextColor3 = COLOR.grey, Rotation = 0 })
	Tween(CloseStroke, 0.15, { Color = COLOR.border })
end))

local PageHolder = New("Frame", {
	Position = UDim2.new(0, 15, 0, 57),
	Size = UDim2.new(1, -30, 1, -69),
	BackgroundTransparency = 1,
	ClipsDescendants = true,
	ZIndex = 15,
}, Content)

local Pages = {}
local Tabs = {}

--============================================================
-- RESPONSIVE LAYOUT (ย่อแล้ว sidebar เป็นโหมดไอคอน / หน้าเตี้ยซ่อน ONLINE / แท็บเลื่อนได้)
--============================================================

local layoutCompact, layoutTight

function Actions.ApplyLayout()
	local compact = PanelSize.X < 480
	local tight = PanelSize.Y < 320
	local w = compact and 56 or 145
	local changed = false

	if compact ~= layoutCompact then
		local sizeS = UDim2.new(0, w, 1, -6)
		local posC = UDim2.new(0, w, 0, 4)
		local sizeC = UDim2.new(1, -w, 1, -6)
		if layoutCompact == nil then
			Sidebar.Size, Content.Position, Content.Size = sizeS, posC, sizeC
		else
			Tween(Sidebar, 0.22, { Size = sizeS })
			Tween(Content, 0.22, { Position = posC, Size = sizeC })
		end
		layoutCompact = compact

		LogoTitle.Visible = not compact
		PanelWord.Visible = not compact
		Moon.Position = compact and UDim2.new(0.5, -15, 0, 13) or UDim2.new(0, 14, 0, 13)
		Online.Text = compact and "●" or "●  ONLINE"
		Online.TextXAlignment = compact and Enum.TextXAlignment.Center or Enum.TextXAlignment.Left
		changed = true
	end

	if tight ~= layoutTight then
		layoutTight = tight
		changed = true
	end

	if changed then
		-- ONLINE ไม่หายอีกต่อไป: หน้าเตี้ยจะย้ายลงไปไว้ล่างสุดของ sidebar แล้วให้แท็บเลื่อนอยู่เหนือมัน
		Online.Visible = true
		Online.Size = compact and UDim2.new(1, 0, 0, 18) or UDim2.new(1, -30, 0, 18)
		Online.Position = UDim2.new(0, compact and 0 or 15, tight and 1 or 0, tight and -26 or 55)
		local top = tight and 58 or 88
		local bottom = tight and 32 or 10
		TabHolder.Position = UDim2.new(0, 9, 0, top)
		TabHolder.Size = UDim2.new(1, -18, 1, -(top + bottom))
	end

	for _, tab in pairs(Tabs) do
		tab.Label.Visible = not compact
	end
end

-- ทาสีส่วนที่เป็นธีมของ shell
OnTheme(function()
	MainStroke.Color = Color3.new(1, 1, 1)
	MainStrokeGrad.Color = NeonSequence
	for _, layer in ipairs(MainGlow) do
		layer.Stroke.Color = Color3.new(1, 1, 1)
		layer.Grad.Color = NeonSequence
	end
	LogoTitle.TextColor3 = COLOR.white
	PanelWord.TextColor3 = COLOR.redSoft
	MoonStroke.Color = COLOR.neon
	LogoLine.BackgroundColor3 = COLOR.red
	LogoGrad.Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0, COLOR.redBright),
		ColorSequenceKeypoint.new(1, COLOR.redDark),
	})
	SidebarLine.BackgroundColor3 = COLOR.border
	Title.TextColor3 = COLOR.white
end)

--============================================================
-- PAGE
--============================================================

local function CreatePage(name)
	local Page = New("ScrollingFrame", {
		Name = name,
		Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ScrollBarThickness = 2,
		ScrollBarImageColor3 = COLOR.red,
		CanvasSize = UDim2.new(0, 0, 0, 0),
		Visible = false,
	}, PageHolder)

	Interaction.WatchScroll(Page)

	New("UIPadding", {
		PaddingLeft = UDim.new(0, 2),
		PaddingRight = UDim.new(0, 8),
		PaddingBottom = UDim.new(0, 8),
	}, Page)

	local Layout = New("UIListLayout", { Padding = UDim.new(0, 8), SortOrder = Enum.SortOrder.LayoutOrder }, Page)
	track(Layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
		Page.CanvasSize = UDim2.fromOffset(0, Layout.AbsoluteContentSize.Y + 10)
	end))

	OnTheme(function()
		Page.ScrollBarImageColor3 = COLOR.red
	end)

	Pages[name] = Page
	return Page
end

--============================================================
-- TAB ICONS (วาดด้วย Frame ไม่พึ่งรูป)
--============================================================

local function IconWrap(parent)
	return New("Frame", {
		Position = UDim2.new(0, 9, 0.5, -9),
		Size = UDim2.fromOffset(19, 19),
		BackgroundTransparency = 1,
		ZIndex = 40,
	}, parent)
end

local function Part(parent, props, radius)
	props.BorderSizePixel = 0
	props.ZIndex = props.ZIndex or 41
	local f = New("Frame", props, parent)
	if radius then
		Corner(f, radius)
	end
	return f
end

local IconBuilders = {}

function IconBuilders.house(parent, color)
	local Wrap = IconWrap(parent)
	local RoofClip = New("Frame", {
		Size = UDim2.fromOffset(19, 9),
		BackgroundTransparency = 1,
		ClipsDescendants = true,
		ZIndex = 41,
	}, Wrap)
	local Roof = Part(RoofClip, {
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.new(0.5, 0, 1, -1),
		Size = UDim2.fromOffset(13, 13),
		Rotation = 45,
		BackgroundColor3 = color,
	}, 3)
	local Chimney = Part(Wrap, {
		Position = UDim2.new(0, 13, 0, 0),
		Size = UDim2.fromOffset(3, 6),
		BackgroundColor3 = color,
		ZIndex = 39,
	}, 1)
	local Body = Part(Wrap, {
		Position = UDim2.new(0, 2, 0, 8),
		Size = UDim2.fromOffset(15, 11),
		BackgroundColor3 = color,
	}, 3)
	Part(Body, {
		AnchorPoint = Vector2.new(0.5, 1),
		Position = UDim2.new(0.5, 1, 1, 0),
		Size = UDim2.fromOffset(4, 7),
		BackgroundColor3 = COLOR.black,
		ZIndex = 42,
	}, 1)
	Part(Body, {
		Position = UDim2.new(0, 3, 0, 2),
		Size = UDim2.fromOffset(4, 4),
		BackgroundColor3 = COLOR.black,
		ZIndex = 42,
	}, 1)
	return Wrap, { Roof, Chimney, Body }
end

function IconBuilders.gear(parent, color)
	local Wrap = IconWrap(parent)
	local parts = {}
	for i = 1, 8 do
		table.insert(parts, Part(Wrap, {
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.new(0.5, 0, 0.5, 0),
			Size = UDim2.fromOffset(4, 18),
			Rotation = (i - 1) * 45,
			BackgroundColor3 = color,
			ZIndex = 40,
		}, 2))
	end
	table.insert(parts, Part(Wrap, {
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		Size = UDim2.fromOffset(13, 13),
		BackgroundColor3 = color,
	}, 7))
	Part(Wrap, {
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		Size = UDim2.fromOffset(5, 5),
		BackgroundColor3 = COLOR.black,
		ZIndex = 42,
	})
	return Wrap, parts
end

function IconBuilders.player(parent, color)
	local Wrap = IconWrap(parent)
	local Head = Part(Wrap, {
		AnchorPoint = Vector2.new(0.5, 0),
		Position = UDim2.new(0.5, 0, 0, 1),
		Size = UDim2.fromOffset(8, 8),
		BackgroundColor3 = color,
	}, 4)
	local Body = Part(Wrap, {
		AnchorPoint = Vector2.new(0.5, 1),
		Position = UDim2.new(0.5, 0, 1, -1),
		Size = UDim2.fromOffset(15, 8),
		BackgroundColor3 = color,
	}, 5)
	return Wrap, { Head, Body }
end

function IconBuilders.sprout(parent, color)
	local Wrap = IconWrap(parent)
	local Stem = Part(Wrap, {
		AnchorPoint = Vector2.new(0.5, 1),
		Position = UDim2.new(0.5, 0, 1, -1),
		Size = UDim2.fromOffset(2, 11),
		BackgroundColor3 = color,
	}, 1)
	local LeafL = Part(Wrap, {
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromOffset(5, 6),
		Size = UDim2.fromOffset(9, 5),
		Rotation = -30,
		BackgroundColor3 = color,
	}, 3)
	local LeafR = Part(Wrap, {
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromOffset(14, 6),
		Size = UDim2.fromOffset(9, 5),
		Rotation = 30,
		BackgroundColor3 = color,
	}, 3)
	return Wrap, { Stem, LeafL, LeafR }
end

function IconBuilders.eye(parent, color)
	local Wrap = IconWrap(parent)
	local Outer = Part(Wrap, {
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		Size = UDim2.fromOffset(19, 12),
		BackgroundColor3 = color,
	}, 6)
	Part(Wrap, {
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		Size = UDim2.fromOffset(9, 9),
		BackgroundColor3 = COLOR.black,
		ZIndex = 42,
	}, 5)
	local Dot = Part(Wrap, {
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		Size = UDim2.fromOffset(4, 4),
		BackgroundColor3 = color,
		ZIndex = 43,
	}, 2)
	return Wrap, { Outer, Dot }
end

function IconBuilders.info(parent, color)
	local Wrap = IconWrap(parent)
	local Circle = Part(Wrap, {
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		Size = UDim2.fromOffset(18, 18),
		BackgroundColor3 = color,
	}, 9)
	Part(Wrap, {
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.new(0.5, 0, 0.5, 2),
		Size = UDim2.fromOffset(2, 7),
		BackgroundColor3 = COLOR.black,
		ZIndex = 42,
	})
	Part(Wrap, {
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.new(0.5, 0, 0.5, -5),
		Size = UDim2.fromOffset(3, 3),
		BackgroundColor3 = COLOR.black,
		ZIndex = 42,
	}, 2)
	return Wrap, { Circle }
end

--============================================================
-- TAB
--============================================================

local function CreateTab(name, icon)
	local Button = New("TextButton", {
		Size = UDim2.new(1, 0, 0, 32),
		BackgroundColor3 = Color3.fromRGB(75, 12, 20),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		AutoButtonColor = false,
		Text = "",
		LayoutOrder = ord(TabHolder),
		ZIndex = 30,
	}, TabHolder)
	Corner(Button, 10)
	-- พื้นแท็บที่เลือก: ไล่จากสีธีมเข้ม -> จางหายไปทางขวา (ไม่เป็นกล่องทึบ)
	New("UIGradient", {
		Rotation = 0,
		Transparency = NumberSequence.new({
			NumberSequenceKeypoint.new(0, 0),
			NumberSequenceKeypoint.new(0.6, 0.45),
			NumberSequenceKeypoint.new(1, 0.9),
		}),
	}, Button)
	local TabStroke = Stroke(Button, COLOR.red, 1, 1)
	TabStroke.Color = COLOR.red

	local Bar = New("Frame", {
		Position = UDim2.new(0, 5, 0.5, -8),
		Size = UDim2.fromOffset(3, 16),
		BackgroundColor3 = COLOR.red,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ZIndex = 40,
	}, Button)
	Corner(Bar, 3)

	local Icon, iconParts, isImage
	local iconStr = tostring(icon)

	if IconBuilders[iconStr] then
		Icon, iconParts = IconBuilders[iconStr](Button, COLOR.grey)
	elseif iconStr:match("^rbxassetid://") or iconStr:match("^%d+$") then
		isImage = true
		Icon = New("ImageLabel", {
			Position = UDim2.new(0, 11, 0.5, -9),
			Size = UDim2.fromOffset(18, 18),
			BackgroundTransparency = 1,
			Image = iconStr:match("^%d+$") and ("rbxassetid://" .. iconStr) or iconStr,
			ImageColor3 = COLOR.grey,
			ZIndex = 40,
		}, Button)
	else
		Icon = Txt(Button, {
			Position = UDim2.new(0, 11, 0, 0),
			Size = UDim2.fromOffset(20, 32),
			Text = iconStr,
			Font = Enum.Font.GothamBold,
			TextSize = 12,
			TextColor3 = COLOR.grey,
			ZIndex = 40,
		})
	end

	local Label = Txt(Button, {
		Position = UDim2.new(0, 37, 0, 0),
		Size = UDim2.new(1, -42, 0, 32),
		Text = name,
		Font = Enum.Font.GothamMedium,
		TextColor3 = COLOR.grey,
		ZIndex = 40,
	})

	local tab = {
		Button = Button,
		Icon = Icon,
		Label = Label,
		Bar = Bar,
		IsImage = isImage,
		IconParts = iconParts,
		Active = false,
	}
	Tabs[name] = tab

	local function IconColor(c, instant)
		if tab.IconParts then
			for _, part in ipairs(tab.IconParts) do
				if instant then
					part.BackgroundColor3 = c
				else
					Tween(part, 0.18, { BackgroundColor3 = c })
				end
			end
		elseif tab.IsImage then
			Tween(tab.Icon, 0.18, { ImageColor3 = c })
		else
			Tween(tab.Icon, 0.18, { TextColor3 = c })
		end
	end

	function tab.Paint(instant)
		local a = tab.Active
		Button.BackgroundColor3 = COLOR.redDark
		Tween(Button, 0.18, { BackgroundTransparency = a and 0.2 or 1 })
		Tween(TabStroke, 0.18, { Transparency = a and 0.55 or 1 })
		TabStroke.Color = COLOR.red
		IconColor(a and COLOR.redSoft or COLOR.grey, instant)
		Tween(Label, 0.18, { TextColor3 = a and COLOR.white or COLOR.grey })
		Tween(Bar, 0.18, { BackgroundTransparency = a and 0 or 1 })
	end

	OnTheme(function()
		Bar.BackgroundColor3 = COLOR.red
		Button.BackgroundColor3 = COLOR.redDark
		TabStroke.Color = COLOR.red
		if tab.Active then
			IconColor(COLOR.redSoft, true)
		end
	end)

	track(Button.MouseEnter:Connect(function()
		if not tab.Active then
			Button.BackgroundColor3 = COLOR.redDark
			Tween(Button, 0.15, { BackgroundTransparency = 0.7 })
			Tween(Label, 0.15, { TextColor3 = COLOR.white })
		end
	end))
	track(Button.MouseLeave:Connect(function()
		if not tab.Active then
			Tween(Button, 0.15, { BackgroundTransparency = 1 })
			Tween(Label, 0.15, { TextColor3 = COLOR.grey })
		end
	end))
	track(Button.Activated:Connect(function()
		Actions.ActivateTab(name)
	end))

	return Button
end

function Actions.ActivateTab(name)
	for tabName, tab in pairs(Tabs) do
		tab.Active = tabName == name
		tab.Paint()
		if Pages[tabName] then
			Pages[tabName].Visible = tab.Active
		end
		if tab.Active then
			Title.Text = tabName
		end
	end
end

--============================================================
-- COMPONENTS
--============================================================

local function Section(parent, text)
	local Holder = New("Frame", {
		Size = UDim2.new(1, 0, 0, 29),
		BackgroundTransparency = 1,
		LayoutOrder = ord(parent),
	}, parent)

	local Label = Txt(Holder, {
		Position = UDim2.new(0, 3, 0, 5),
		Size = UDim2.new(1, -6, 0, 18),
		Text = string.upper(text),
		Font = Enum.Font.GothamBold,
		TextSize = 10,
	})

	local Line = New("Frame", {
		Position = UDim2.new(0, 3, 1, -1),
		Size = UDim2.new(1, -6, 0, 1),
		BackgroundColor3 = Color3.new(1, 1, 1),
		BorderSizePixel = 0,
	}, Holder)
	local LineGrad = Gradient(Line, ColorSequence.new(COLOR.border), 0)

	OnTheme(function()
		Label.TextColor3 = COLOR.redSoft
		LineGrad.Color = ColorSequence.new(COLOR.border)
	end)
	return Holder
end

-- การ์ดพื้นฐาน (กรอบ + แถบสีด้านซ้าย)
local function CardBase(parent, height, class)
	local Holder = New(class or "Frame", {
		Size = UDim2.new(1, 0, 0, height),
		BackgroundColor3 = COLOR.innerBg,
		BorderSizePixel = 0,
		LayoutOrder = ord(parent),
		ZIndex = 50,
	}, parent)
	if class == "TextButton" then
		Holder.AutoButtonColor = false
		Holder.Text = ""
	end
	Corner(Holder, 10)
	Gradient(Holder, ColorSequence.new(Color3.new(1, 1, 1), Color3.fromRGB(200, 200, 212)), 0)
	local S = Stroke(Holder, COLOR.innerBorder, 1.5, 0)
	local Accent = New("Frame", {
		Visible = false,
		Position = UDim2.new(0, 8, 0, 6),
		Size = UDim2.new(0, 3, 1, -12),
		BackgroundColor3 = COLOR.redBright,
		BorderSizePixel = 0,
		ZIndex = 55,
	}, Holder)
	Corner(Accent, 3)
	return Holder, S, Accent
end

local function Hover(obj, fn)
	track(obj.MouseEnter:Connect(function()
		fn(true)
	end))
	track(obj.MouseLeave:Connect(function()
		fn(false)
	end))
end

local function Safe(fn, ...)
	if not fn then
		return
	end
	local ok, err = pcall(fn, ...)
	if not ok then
		warn("[LUNAR Hub] callback error: " .. tostring(err))
	end
end

--------------------------------------------------------------
-- ROW BASE : ไอคอน + ชื่อ + คำอธิบายสั้น (ด้านซ้าย) / ตัวควบคุม (ด้านขวา)
--------------------------------------------------------------

-- คำอธิบายเริ่มต้นตามชื่อรายการ (ใส่ desc เองได้ที่พารามิเตอร์ท้ายสุด)
local RowDescs = {
	["Animation"] = "เปิด/ปิดแอนิเมชันของหน้าต่างและปุ่ม",
	["Premium Effects"] = "แสงนีออนเรืองและขอบหมุน",
	["Show Floating Button"] = "แสดงปุ่ม LH ลอยบนหน้าจอ",
	["Auto Load"] = "โหลดสคริปต์อัตโนมัติเมื่อเข้าเกม",
	["Shooting Stars"] = "ดาวตกและดาวระยิบระยับเป็นพื้นหลัง",
	["Rainbow Mode"] = "ขอบและสีธีมไล่สีรุ้งต่อเนื่อง",
	["Rainbow Speed"] = "ความเร็วในการเปลี่ยนสีรุ้ง",
	["Multi-Color Neon"] = "ขอบนีออนแสดงหลายสีพร้อมกัน",
	["Neon Combo"] = "ชุดสีนีออนสำเร็จรูป",
	["Panel Size"] = "เลือกขนาดหน้าต่างสำเร็จรูป",
	["Reset Interface"] = "คืนขนาดและตำแหน่งหน้าต่างเป็นค่าเริ่มต้น",
	["Reset Settings"] = "ล้างการตั้งค่าทั้งหมดกลับเป็นค่าเริ่มต้น",
	["Destroy GUI"] = "ปิดและลบหน้าต่างนี้ออกจากเกม",
	["Sample Button"] = "ปุ่มตัวอย่างพร้อมคำอธิบายบรรทัดล่าง",
	["Danger Button"] = "ใช้กับการกระทำที่ต้องระวัง",
	["Sample Toggle"] = "สวิตช์เปิด/ปิดแบบมาตรฐาน",
	["Locked Toggle (ยังไม่ผูก Hook)"] = "ยังใช้งานไม่ได้จนกว่าจะผูก Hook",
	["Sample Slider"] = "ลากเพื่อปรับค่า 0 - 100",
	["Decimal Slider"] = "สไลเดอร์ทศนิยม 0.1 - 3",
	["Sample Select"] = "เลือกได้ 1 ตัวเลือก",
	["Sample Multi Select"] = "เลือกได้หลายตัวเลือก",
	["Locked Select"] = "ยังไม่มีตัวเลือกให้เลือก",
}

local function RowBase(parent, title, desc, icon, reserve, class)
	desc = desc or RowDescs[title]
	local h = desc and 48 or 38
	local Holder, S, Accent = CardBase(parent, h, class)
	local rightPad = 18 + (reserve or 12)

	local Title = Txt(Holder, {
		Position = UDim2.new(0, 16, 0, desc and 7 or 0),
		Size = UDim2.new(1, -rightPad, 0, desc and 16 or h),
		Text = title,
		Font = Enum.Font.GothamBold,
		TextSize = 12,
		TextTruncate = Enum.TextTruncate.AtEnd,
		ZIndex = 60,
	})
	if desc then
		Txt(Holder, {
			Position = UDim2.new(0, 16, 0, 24),
			Size = UDim2.new(1, -rightPad, 0, 14),
			Text = desc,
			TextSize = 10,
			TextColor3 = COLOR.grey,
			TextTruncate = Enum.TextTruncate.AtEnd,
			ZIndex = 60,
		})
	end

	return Holder, S, Accent, Title
end

--------------------------------------------------------------
-- BUTTON
--------------------------------------------------------------
local function Button(parent, text, callback, danger, desc, icon)
	local Btn, S, Accent, Title = RowBase(parent, text, desc, icon, 34, "TextButton")
	if danger then
		Title.TextColor3 = COLOR.bad
	end

	local Chevron = Txt(Btn, {
		AnchorPoint = Vector2.new(1, 0.5),
		Position = UDim2.new(1, -14, 0.5, 0),
		Size = UDim2.fromOffset(14, 20),
		Text = ">",
		Font = Enum.Font.GothamBold,
		TextSize = 13,
		TextColor3 = COLOR.grey,
		TextXAlignment = Enum.TextXAlignment.Center,
		ZIndex = 60,
	})

	local hover = false
	local function paint()
		Tween(Btn, 0.15, { BackgroundColor3 = hover and COLOR.innerBgHover or COLOR.innerBg })
		Tween(S, 0.15, {
			Color = danger and COLOR.bad or (hover and COLOR.innerBorderHover or COLOR.innerBorder),
			Thickness = hover and 1.8 or 1.5,
		})
		Tween(Chevron, 0.15, {
			TextColor3 = danger and COLOR.bad or (hover and COLOR.redSoft or COLOR.grey),
			Position = hover and UDim2.new(1, -11, 0.5, 0) or UDim2.new(1, -14, 0.5, 0),
		})
	end
	Hover(Btn, function(h)
		hover = h
		paint()
	end)
	OnTheme(paint)
	track(Btn.Activated:Connect(function()
		task.spawn(Safe, callback)
	end))
	return Btn
end

--------------------------------------------------------------
-- TOGGLE
--------------------------------------------------------------
local function Toggle(parent, text, enabled, callback, availableFn, desc, icon)
	local state = enabled == true
	local hover = false
	local Holder, HolderStroke = RowBase(parent, text, desc, icon, 100)

	local Note = Txt(Holder, {
		AnchorPoint = Vector2.new(1, 0.5),
		Position = UDim2.new(1, -56, 0.5, 0),
		Size = UDim2.fromOffset(64, 14),
		Text = (availableFn and not availableFn()) and "Not Available" or "",
		TextSize = 9,
		TextColor3 = COLOR.bad,
		TextXAlignment = Enum.TextXAlignment.Right,
		ZIndex = 60,
	})

	local Switch = New("TextButton", {
		AnchorPoint = Vector2.new(1, 0.5),
		Position = UDim2.new(1, -14, 0.5, 0),
		Size = UDim2.fromOffset(38, 20),
		BackgroundColor3 = COLOR.switchOff,
		BorderSizePixel = 0,
		AutoButtonColor = false,
		Text = "",
		ZIndex = 70,
	}, Holder)
	Corner(Switch, 10)
	local SwitchStroke = Stroke(Switch, COLOR.switchBorder, 1.4, 0)

	local Knob = New("Frame", {
		AnchorPoint = Vector2.new(0, 0.5),
		Position = UDim2.new(0, 3, 0.5, 0),
		Size = UDim2.fromOffset(14, 14),
		BackgroundColor3 = Color3.fromRGB(215, 215, 220),
		BorderSizePixel = 0,
		ZIndex = 75,
	}, Switch)
	Corner(Knob, 7)

	local Hit = New("TextButton", {
		Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = 1,
		Text = "",
		ZIndex = 52,
	}, Holder)

	local function paint()
		Tween(Holder, 0.15, { BackgroundColor3 = (hover and not state) and COLOR.innerBgHover or COLOR.innerBg })
		Tween(HolderStroke, 0.18, {
			Color = state and COLOR.red or (hover and COLOR.redBright or COLOR.innerBorder),
			Thickness = (state or hover) and 1.7 or 1.5,
		})
		Tween(Switch, 0.18, { BackgroundColor3 = state and COLOR.red or COLOR.switchOff })
		Tween(SwitchStroke, 0.18, { Color = state and COLOR.redBright or COLOR.switchBorder })
		Tween(Knob, 0.18, {
			Position = state and UDim2.new(1, -17, 0.5, 0) or UDim2.new(0, 3, 0.5, 0),
			BackgroundColor3 = state and Color3.new(1, 1, 1) or Color3.fromRGB(215, 215, 220),
		})
	end

	local api = {}
	function api.Get()
		return state
	end
	function api.Set(value, silent)
		state = value == true
		paint()
		if not silent then
			task.spawn(Safe, callback, state)
		end
	end

	local function click()
		if availableFn and not availableFn() then
			Note.Text = "Not Available"
			Notify("ฟังก์ชันนี้ยังไม่ได้ผูก Hook", false)
			return
		end
		api.Set(not state)
	end
	track(Hit.Activated:Connect(click))
	track(Switch.Activated:Connect(click))
	Hover(Holder, function(h)
		hover = h
		paint()
	end)
	OnTheme(paint)
	return Holder, api
end

--------------------------------------------------------------
-- SLIDER  (กล่องตัวเลขด้านขวา + แถบเลื่อนสั้นอยู่ข้างกัน)
--------------------------------------------------------------
local function Slider(parent, text, min, max, default, decimals, onChange, releaseOnly, desc, icon)
	local TRACK_W = 84
	local Row, RowStroke = RowBase(parent, text, desc, icon, TRACK_W + 70)

	local ValueBox = New("Frame", {
		AnchorPoint = Vector2.new(1, 0.5),
		Position = UDim2.new(1, -(14 + TRACK_W + 12), 0.5, 0),
		Size = UDim2.fromOffset(42, 22),
		BackgroundColor3 = COLOR.black,
		BorderSizePixel = 0,
		ZIndex = 60,
	}, Row)
	Corner(ValueBox, 7)
	local ValueStroke = Stroke(ValueBox, COLOR.innerBorder, 1.2, 0.1)
	local ValueLabel = New("TextBox", {
		Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Text = "",
		Font = Enum.Font.GothamBold,
		TextSize = 12,
		TextColor3 = COLOR.redSoft,
		ClearTextOnFocus = false,
		TextXAlignment = Enum.TextXAlignment.Center,
		ZIndex = 62,
	}, ValueBox)

	local Track = New("Frame", {
		AnchorPoint = Vector2.new(1, 0.5),
		Position = UDim2.new(1, -14, 0.5, 0),
		Size = UDim2.fromOffset(TRACK_W, 5),
		BackgroundColor3 = COLOR.switchOff,
		BorderSizePixel = 0,
		ZIndex = 60,
	}, Row)
	Corner(Track, 3)
	local Fill = New("Frame", {
		Size = UDim2.fromScale(0, 1),
		BackgroundColor3 = COLOR.red,
		BorderSizePixel = 0,
		ZIndex = 61,
	}, Track)
	Corner(Fill, 3)
	local Knob = New("Frame", {
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0, 0.5),
		Size = UDim2.fromOffset(14, 14),
		BackgroundColor3 = Color3.new(1, 1, 1),
		BorderSizePixel = 0,
		ZIndex = 65,
	}, Track)
	Corner(Knob, 7)
	local KnobStroke = Stroke(Knob, COLOR.red, 2, 0)

	local Hit = New("TextButton", {
		AnchorPoint = Vector2.new(1, 0.5),
		Position = UDim2.new(1, -6, 0.5, 0),
		Size = UDim2.fromOffset(TRACK_W + 16, 34),
		BackgroundTransparency = 1,
		Text = "",
		ZIndex = 70,
	}, Row)

	OnTheme(function()
		ValueLabel.TextColor3 = COLOR.redSoft
		ValueBox.BackgroundColor3 = COLOR.black
		ValueStroke.Color = COLOR.innerBorder
		Fill.BackgroundColor3 = COLOR.red
		KnobStroke.Color = COLOR.red
		RowStroke.Color = COLOR.innerBorder
		Row.BackgroundColor3 = COLOR.innerBg
	end)

	local value = default
	local pow = 10 ^ decimals
	local function setValue(v, silent)
		v = math.clamp(v, min, max)
		v = math.floor(v * pow + 0.5) / pow
		value = v
		local a = (v - min) / (max - min)
		Fill.Size = UDim2.fromScale(a, 1)
		Knob.Position = UDim2.fromScale(a, 0.5)
		if not ValueLabel:IsFocused() then
			ValueLabel.Text = string.format("%." .. decimals .. "f", v)
		end
		if not silent and not releaseOnly then
			task.spawn(Safe, onChange, v)
		end
	end
	setValue(default, true)

	-- แตะที่ตัวเลขเพื่อพิมพ์ค่าเอง (กดยืนยัน/แตะที่อื่นเพื่อใช้ค่า)
	track(ValueLabel.Focused:Connect(function()
		Tween(ValueStroke, 0.15, { Color = COLOR.redBright, Thickness = 1.8, Transparency = 0 })
		Tween(ValueBox, 0.15, { BackgroundColor3 = Color3.fromRGB(28, 28, 36) })
		ValueLabel.TextColor3 = COLOR.white
		ValueLabel.Text = tostring(value)
	end))
	track(ValueLabel:GetPropertyChangedSignal("Text"):Connect(function()
		local clean = (ValueLabel.Text:gsub("[^%d%.%-]", ""))
		if clean ~= ValueLabel.Text then
			ValueLabel.Text = clean
		end
	end))
	track(ValueLabel.FocusLost:Connect(function()
		Tween(ValueStroke, 0.15, { Color = COLOR.innerBorder, Thickness = 1.2, Transparency = 0.1 })
		Tween(ValueBox, 0.15, { BackgroundColor3 = COLOR.black })
		ValueLabel.TextColor3 = COLOR.redSoft
		local n = tonumber(ValueLabel.Text)
		if n then
			setValue(n, true)
			task.spawn(Safe, onChange, value)
		else
			setValue(value, true)
		end
	end))

	local dragging, dragInput = false, nil
	local function fromX(x)
		local w = Track.AbsoluteSize.X
		if w <= 0 then
			return
		end
		setValue(min + (max - min) * math.clamp((x - Track.AbsolutePosition.X) / w, 0, 1))
	end

	track(Hit.InputBegan:Connect(function(input)
		local t = input.UserInputType
		if t == Enum.UserInputType.MouseButton1 or t == Enum.UserInputType.Touch then
			if dragging or not Interaction.Begin(Hit) then
				return
			end
			dragging = true
			dragInput = input
			fromX(input.Position.X)
		end
	end))
	track(UIS.InputChanged:Connect(function(input)
		if not dragging then
			return
		end
		local t = input.UserInputType
		if t == Enum.UserInputType.MouseMovement or (t == Enum.UserInputType.Touch and input == dragInput) then
			fromX(input.Position.X)
		end
	end))
	track(UIS.InputEnded:Connect(function(input)
		if not dragging then
			return
		end
		local t = input.UserInputType
		if t == Enum.UserInputType.MouseButton1 or (t == Enum.UserInputType.Touch and input == dragInput) then
			dragging = false
			dragInput = nil
			Interaction.End(Hit)
			if releaseOnly then
				task.spawn(Safe, onChange, value)
			end
		end
	end))

	return { Set = setValue, Get = function() return value end }
end

--------------------------------------------------------------
-- DROPDOWN / MULTI-SELECT  (ปุ่มรูปแคปซูลด้านขวา กดแล้วรายการกางลงด้านล่าง)
-- opts = {
--   Options   = { "A", "B" } หรือ function() return {...} end  (string หรือ Instance)
--   Default   = "A" (เลือกเดียว) | { "A", "B" } (เลือกหลายอัน)
--   Multi     = true/false
--   Desc, Icon, Placeholder, Available = function() -> bool, OnChange = function(value)
-- }
--------------------------------------------------------------
local function Dropdown(parent, text, opts)
	opts = opts or {}
	local multi = opts.Multi == true
	local open, hover = false, false
	local selected = multi and {} or nil
	local PILL_W = 124

	local Wrap = New("Frame", {
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundTransparency = 1,
		LayoutOrder = ord(parent),
	}, parent)
	New("UIListLayout", { Padding = UDim.new(0, 6), SortOrder = Enum.SortOrder.LayoutOrder }, Wrap)

	local Head, HeadStroke = RowBase(Wrap, text, opts.Desc, opts.Icon, PILL_W + 28, "TextButton")

	local Pill = New("Frame", {
		AnchorPoint = Vector2.new(1, 0.5),
		Position = UDim2.new(1, -12, 0.5, 0),
		Size = UDim2.fromOffset(PILL_W, 26),
		BackgroundColor3 = COLOR.black,
		BorderSizePixel = 0,
		ZIndex = 60,
	}, Head)
	Corner(Pill, 8)
	local PillStroke = Stroke(Pill, COLOR.innerBorder, 1.2, 0.1)

	local ValueLabel = Txt(Pill, {
		Position = UDim2.new(0, 10, 0, 0),
		Size = UDim2.new(1, -34, 1, 0),
		Font = Enum.Font.GothamMedium,
		TextSize = 11,
		TextTruncate = Enum.TextTruncate.AtEnd,
		ZIndex = 62,
	})

	local Arrow = New("Frame", {
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.new(1, -14, 0.5, 0),
		Size = UDim2.fromOffset(14, 14),
		BackgroundTransparency = 1,
		ZIndex = 62,
	}, Pill)
	local ArrowArms = {}
	for _, side in ipairs({ -1, 1 }) do
		local arm = New("Frame", {
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromOffset(7 + side * 2.6, 8),
			Size = UDim2.fromOffset(2, 7),
			Rotation = side * 45,
			BackgroundColor3 = COLOR.grey,
			BorderSizePixel = 0,
			ZIndex = 63,
		}, Arrow)
		Corner(arm, 1)
		table.insert(ArrowArms, arm)
	end

	local List = New("Frame", {
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundColor3 = COLOR.innerBg,
		BorderSizePixel = 0,
		Visible = false,
		LayoutOrder = 2,
		ZIndex = 50,
	}, Wrap)
	Corner(List, 12)
	local ListStroke = Stroke(List, COLOR.innerBorder, 1.2, 0)
	New("UIPadding", {
		PaddingTop = UDim.new(0, 6),
		PaddingBottom = UDim.new(0, 6),
		PaddingLeft = UDim.new(0, 6),
		PaddingRight = UDim.new(0, 6),
	}, List)
	New("UIListLayout", { Padding = UDim.new(0, 4), SortOrder = Enum.SortOrder.LayoutOrder }, List)

	local rows = {}

	local function available()
		return not opts.Available or opts.Available()
	end

	local function optionList()
		local src = opts.Options
		if type(src) == "function" then
			local ok, r = pcall(src)
			src = ok and r or {}
		end
		local out = {}
		if type(src) == "table" then
			for _, v in ipairs(src) do
				table.insert(out, typeof(v) == "Instance" and v.Name or tostring(v))
			end
		end
		return out
	end

	local function isSel(name)
		if multi then
			return selected[name] == true
		end
		return selected == name
	end

	local function get()
		if multi then
			local arr = {}
			for k in pairs(selected) do
				table.insert(arr, k)
			end
			table.sort(arr)
			return arr
		end
		return selected
	end

	local function summary()
		if not available() then
			return "Not Available"
		end
		if multi then
			local n, names = 0, {}
			for k in pairs(selected) do
				n += 1
				table.insert(names, k)
			end
			table.sort(names)
			if n == 0 then
				return opts.Placeholder or "None"
			elseif n <= 2 then
				return table.concat(names, ", ")
			end
			return n .. " selected"
		end
		return selected or opts.Placeholder or "Select..."
	end

	local function paintRows()
		for _, r in ipairs(rows) do
			if r.Paint then
				r.Paint()
			end
		end
	end

	local function paint()
		Tween(Head, 0.15, { BackgroundColor3 = (hover or open) and COLOR.innerBgHover or COLOR.innerBg })
		Tween(HeadStroke, 0.15, {
			Color = open and COLOR.red or (hover and COLOR.innerBorderHover or COLOR.innerBorder),
			Thickness = (open or hover) and 1.7 or 1.5,
		})
		Tween(PillStroke, 0.15, { Color = open and COLOR.redBright or COLOR.innerBorder })
		Tween(Arrow, 0.18, { Rotation = open and 180 or 0 })
		for _, arm in ipairs(ArrowArms) do
			Tween(arm, 0.18, { BackgroundColor3 = open and COLOR.redSoft or COLOR.grey })
		end
		ValueLabel.Text = summary()
		ValueLabel.TextColor3 = (not available()) and COLOR.bad or COLOR.white
		Pill.BackgroundColor3 = COLOR.black
		List.BackgroundColor3 = COLOR.innerBg
		ListStroke.Color = COLOR.innerBorder
	end

	local api = {}

	local function fire()
		task.spawn(Safe, opts.OnChange, get())
	end

	local function rebuild()
		for _, r in ipairs(rows) do
			r.Btn:Destroy()
		end
		table.clear(rows)

		local list = optionList()
		if #list == 0 then
			local Empty = Txt(List, {
				Size = UDim2.new(1, 0, 0, 28),
				Text = "ไม่มีตัวเลือก",
				TextColor3 = COLOR.grey,
				TextXAlignment = Enum.TextXAlignment.Center,
				LayoutOrder = 1,
				ZIndex = 55,
			})
			table.insert(rows, { Btn = Empty })
			return
		end

		for i, name in ipairs(list) do
			local Btn = New("TextButton", {
				Size = UDim2.new(1, 0, 0, 28),
				BackgroundColor3 = COLOR.innerBgHover,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				AutoButtonColor = false,
				Text = "",
				LayoutOrder = i,
				ZIndex = 55,
			}, List)
			Corner(Btn, 8)

			local Box = New("Frame", {
				AnchorPoint = Vector2.new(0, 0.5),
				Position = UDim2.new(0, 10, 0.5, 0),
				Size = UDim2.fromOffset(16, 16),
				BackgroundColor3 = COLOR.switchOff,
				BorderSizePixel = 0,
				ZIndex = 60,
			}, Btn)
			Corner(Box, multi and 5 or 8)
			local BoxStroke = Stroke(Box, COLOR.switchBorder, 1.4, 0)

			local Mark = New("Frame", {
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				Size = UDim2.fromOffset(6, 6),
				BackgroundColor3 = Color3.new(1, 1, 1),
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ZIndex = 62,
			}, Box)
			Corner(Mark, 3)

			local Label = Txt(Btn, {
				Position = UDim2.new(0, 34, 0, 0),
				Size = UDim2.new(1, -42, 1, 0),
				Text = name,
				Font = Enum.Font.GothamMedium,
				TextTruncate = Enum.TextTruncate.AtEnd,
				ZIndex = 60,
			})

			local rowHover = false
			local row = { Btn = Btn }
			function row.Paint()
				local sel = isSel(name)
				Tween(Btn, 0.12, {
					BackgroundTransparency = sel and 0.55 or (rowHover and 0.7 or 1),
					BackgroundColor3 = COLOR.innerBgHover,
				})
				Tween(Box, 0.12, { BackgroundColor3 = sel and COLOR.red or COLOR.switchOff })
				Tween(BoxStroke, 0.12, { Color = sel and COLOR.redBright or COLOR.switchBorder })
				Tween(Mark, 0.12, { BackgroundTransparency = sel and 0 or 1 })
				Label.TextColor3 = sel and COLOR.white or COLOR.grey
			end
			row.Paint()

			Hover(Btn, function(h)
				rowHover = h
				row.Paint()
			end)
			track(Btn.Activated:Connect(function()
				if multi then
					selected[name] = (not selected[name]) or nil
				else
					selected = name
					open = false
					List.Visible = false
				end
				paintRows()
				paint()
				fire()
			end))

			table.insert(rows, row)
		end
	end

	function api.Get()
		return get()
	end

	function api.Set(value, silent)
		if multi then
			selected = {}
			if type(value) == "table" then
				for _, v in ipairs(value) do
					selected[tostring(v)] = true
				end
			end
		else
			selected = value ~= nil and tostring(value) or nil
		end
		paintRows()
		paint()
		if not silent then
			fire()
		end
	end

	function api.Refresh()
		if open then
			rebuild()
		end
		paint()
	end

	if opts.Default ~= nil then
		api.Set(opts.Default, true)
	end

	track(Head.Activated:Connect(function()
		if not available() then
			Notify("ตัวเลือกนี้ยังไม่ได้ผูก Hook", false)
			return
		end
		open = not open
		if open then
			rebuild()
		end
		List.Visible = open
		paint()
	end))
	Hover(Head, function(h)
		hover = h
		paint()
	end)
	OnTheme(function()
		paint()
		paintRows()
	end)

	return Wrap, api
end

--------------------------------------------------------------
-- INFO ROW (ใช้ในการ์ดข้อมูล)
--------------------------------------------------------------
local function StatRow(holder, label)
	local Row = New("Frame", { Size = UDim2.new(1, 0, 0, 18), BackgroundTransparency = 1 }, holder)
	local Dot = New("Frame", {
		Position = UDim2.new(0, 2, 0.5, -3),
		Size = UDim2.fromOffset(6, 6),
		BackgroundColor3 = COLOR.redBright,
		BorderSizePixel = 0,
	}, Row)
	Corner(Dot, 6)
	OnTheme(function()
		Dot.BackgroundColor3 = COLOR.redBright
	end)
	Txt(Row, {
		Position = UDim2.new(0, 16, 0, 0),
		Size = UDim2.new(0.4, -16, 1, 0),
		Text = label,
		TextColor3 = COLOR.grey,
	})
	return Txt(Row, {
		Position = UDim2.new(0.4, 0, 0, 0),
		Size = UDim2.new(0.6, 0, 1, 0),
		Font = Enum.Font.GothamMedium,
		TextXAlignment = Enum.TextXAlignment.Right,
		TextTruncate = Enum.TextTruncate.AtEnd,
	})
end

--============================================================
-- THEME COLOR (เรียกทุก listener ใหม่)
--============================================================

local rainbowGen = 0

-- ใช้สีกับทั้งธีมโดยไม่บันทึกลงไฟล์ (ใช้กับโหมดรุ้ง)
function Actions.ApplyColor(c)
	DeriveTheme(c)
	for _, fn in ipairs(ThemeListeners) do
		pcall(fn)
	end
end

function Actions.SetRainbow(on, silent)
	rainbowGen += 1
	Settings.Rainbow = on
	if on and Settings.Multi then
		Settings.Multi = false
		if Actions.OnMulti then
			Actions.OnMulti(false)
		end
	end
	if on then
		local gen = rainbowGen
		task.spawn(function()
			local h = Color3.toHSV(HexToColor3(Settings.ThemeColor) or COLOR.red)
			while not destroyed and Settings.Rainbow and gen == rainbowGen do
				h = (h + 0.02 * (Settings.RainbowSpeed or 1)) % 1
				Actions.ApplyColor(Color3.fromHSV(h, 0.7, 1))
				task.wait(0.5)
			end
		end)
	else
		Actions.ApplyColor(HexToColor3(Settings.ThemeColor) or COLOR.red)
	end
	if Actions.OnRainbow then
		Actions.OnRainbow(on)
	end
	if not silent then
		saveSettings()
	end
end

function Actions.SetThemeColor(c, silent)
	Settings.ThemeColor = Color3ToHex(c)
	if Settings.Rainbow then
		Actions.SetRainbow(false, true)
	end
	Actions.ApplyColor(c)
	if not silent then
		saveSettings()
	end
end

function Actions.RefreshNeon()
	if Settings.Rainbow then
		return
	end
	Actions.ApplyColor(HexToColor3(Settings.ThemeColor) or COLOR.red)
end

function Actions.SetMulti(on, silent)
	Settings.Multi = on
	if on and Settings.Rainbow then
		Actions.SetRainbow(false, true)
	end
	Actions.RefreshNeon()
	if Actions.OnMulti then
		Actions.OnMulti(on)
	end
	if not silent then
		saveSettings()
	end
end

function Actions.SetNeonSlot(i, c)
	Settings.NeonColors[i] = Color3ToHex(c)
	if not Settings.Multi then
		Actions.SetMulti(true, true)
	else
		Actions.RefreshNeon()
	end
	if Actions.OnNeonChanged then
		Actions.OnNeonChanged()
	end
	saveSettings()
end

--============================================================
-- HOOK HELPER (ใช้กับ AutoLoad และแท็บที่คุณเพิ่มเอง)
--============================================================

local function hookAvailable(name)
	return function()
		return type(Hooks[name]) == "function"
	end
end

local function callHook(name, ...)
	local fn = Hooks[name]
	if type(fn) ~= "function" then
		return false
	end
	local ok, err = pcall(fn, ...)
	if not ok then
		warn("[LUNAR Hub] Hook '" .. name .. "' error: " .. tostring(err))
	end
	return ok
end

local CARD_SHADE = ColorSequence.new(Color3.new(1, 1, 1), Color3.fromRGB(200, 200, 212))

--============================================================
-- GAME SYSTEMS: Farm / Dungeon / Forge
local GameReplicatedStorage = game:GetService("ReplicatedStorage")
local GameRemote = GameReplicatedStorage:WaitForChild("Remote", 10)

local function getRemote(folder, name)
	local f = GameRemote and GameRemote:FindFirstChild(folder)
	return f and f:FindFirstChild(name)
end

local DX_RemoteTrainOnce       = getRemote("Train", "TrainOnceRE")
local DX_RemoteIntoAutoTrain   = getRemote("Train", "IntoAutoTrainRE")
local DX_RemoteExitAutoTrain   = getRemote("Train", "ExitAutoTrainRE")
local DX_RemoteStageFinished   = getRemote("Stage", "StageFinishedRF")
local DX_RemoteGetOre          = getRemote("Stage", "GetOreRF")
local DX_RemoteClaimedAllOre   = getRemote("Stage", "ClaimedAllOreRE")
local DX_RemoteForge           = getRemote("Forge", "ForgeRF")
local DX_RemoteDungeonTicket   = getRemote("Dungeon", "TryClaimDailyDunTicRE")
local DX_RemoteIntoDungeon     = getRemote("Dungeon", "TryIntoDungeonRF")
local DX_RemoteExitDungeon     = getRemote("Dungeon", "ExitDungeonRE")
local DX_RemoteStartRound      = getRemote("Dungeon", "StartRoundRE")
local DX_RemoteCompleteRound   = getRemote("Dungeon", "CompleteRoundRF")

local DX_BackpackData
local DX_ProfileData
local DX_TrainCTRL
local DX_OreHelper
local DX_EnemyCTRL
local DX_HPCTRL
local DX_CommunicationUtils
local DX_EnemyHitBE

pcall(function() DX_BackpackData = require(GameReplicatedStorage.LocalData.BackpackData) end)
pcall(function() DX_ProfileData = require(GameReplicatedStorage.ProfileData) end)
pcall(function() DX_TrainCTRL = require(GameReplicatedStorage.CTRL.TrainCTRL) end)
pcall(function() DX_OreHelper = require(GameReplicatedStorage.Config.Ore.Helper) end)
pcall(function() DX_EnemyCTRL = require(GameReplicatedStorage.CTRL.EnemyCTRL) end)
pcall(function() DX_HPCTRL = require(GameReplicatedStorage.CTRL.HPCTRL) end)
pcall(function() DX_CommunicationUtils = require(GameReplicatedStorage.Utils.CommunicationUtils) end)

pcall(function()
	if DX_CommunicationUtils and DX_CommunicationUtils.TryGetBindableEvent then
		DX_EnemyHitBE = DX_CommunicationUtils.TryGetBindableEvent("Attack", "EnemyHitBE")
	end
end)

local DX_GameState = {
	AutoTrain = false,
	AutoBestZone = false,
	TrainZone = "Auto Best",
	AutoStage = false,
	Stage = "Auto Max",
	StageDelay = 0.35,
	AutoCollectOre = false,

	AutoDungeon = false,
	DungeonInstantKill = false,
	DungeonStart = 1,

	AutoForge = false,
	ForgeType = "Weapon",
	OreQuality = "Best Ores First",
	MaterialAmount = 4,
	ForgeAmount = 1,
}

local DX_TrainZones = {
	{Id=1, Name="Train_1 (x1.5)", Rebirth=0,  Pad=Vector3.new(-53,3,-41), Dummy=Vector3.new(-57.88,6.94,-41.04)},
	{Id=2, Name="Train_2 (x2)",   Rebirth=2,  Pad=Vector3.new(-53,3,-20.9), Dummy=Vector3.new(-57.88,6.94,-20.91)},
	{Id=3, Name="Train_3 (x4)",   Rebirth=5,  Pad=Vector3.new(-53,3,21.4),  Dummy=Vector3.new(-57.88,6.94,21.37)},
	{Id=4, Name="Train_4 (x6)",   Rebirth=9,  Pad=Vector3.new(-53,3,43.25), Dummy=Vector3.new(-57.88,6.94,43.25)},
	{Id=5, Name="Train_5 (x8)",   Rebirth=12, Pad=Vector3.new(-80,8.6,21.29), Dummy=Vector3.new(-84.50,8.61,21.29)},
	{Id=6, Name="Train_6 (x10)",  Rebirth=15, Pad=Vector3.new(-80,9.1,-20.9), Dummy=Vector3.new(-83.92,9.11,-20.90)},
	{Id=7, Name="Train_7 (x15)",  Rebirth=18, Pad=Vector3.new(-108,12.7,32.24), Dummy=Vector3.new(-114.22,12.73,32.24)},
	{Id=8, Name="Train_8 (x25)",  Rebirth=21, Pad=Vector3.new(-106,10.6,-31), Dummy=Vector3.new(-110.27,10.63,-30.99)},
}

local function dxCharacter()
	local c = LocalPlayer.Character
	local hrp = c and c:FindFirstChild("HumanoidRootPart")
	local hum = c and c:FindFirstChildOfClass("Humanoid")
	return c, hrp, hum
end

local function dxBestTrainZone()
	local rebirth = 0
	pcall(function()
		local pd = DX_ProfileData and DX_ProfileData.GetTotalData()
		rebirth = tonumber(pd and pd.Eco and pd.Eco.rebirth) or 0
	end)
	local best = DX_TrainZones[1]
	for _, z in ipairs(DX_TrainZones) do
		if rebirth >= z.Rebirth then best = z end
	end
	return best
end

local function dxSelectedTrainZone()
	if DX_GameState.TrainZone == "Auto Best" then
		return dxBestTrainZone()
	end
	for _, z in ipairs(DX_TrainZones) do
		if z.Name == DX_GameState.TrainZone then return z end
	end
	return dxBestTrainZone()
end

local function dxTrain()
	local zone = dxSelectedTrainZone()
	local _, hrp, hum = dxCharacter()
	if zone and hrp and hum and hum.Health > 0 then
		local dist = (hrp.Position - zone.Pad).Magnitude
		if dist > 6 then
			hrp.CFrame = CFrame.lookAt(zone.Pad + Vector3.new(0,1.5,0), zone.Dummy)
			hrp.AssemblyLinearVelocity = Vector3.zero
		end
		if DX_RemoteIntoAutoTrain and LocalPlayer:GetAttribute("AutoTrainAreaID") ~= zone.Id then
			pcall(function() DX_RemoteIntoAutoTrain:FireServer(zone.Id) end)
		end
	end
	pcall(function()
		if DX_TrainCTRL and DX_TrainCTRL.TrainOnce then DX_TrainCTRL.TrainOnce() end
		if DX_RemoteTrainOnce then DX_RemoteTrainOnce:FireServer() end
	end)
end

local function dxCollectWorldOre()
	local count = 0
	local cache = workspace:FindFirstChild("OreCache")
	if not cache then return 0 end
	for _, ore in ipairs(cache:GetChildren()) do
		local prompt = ore:FindFirstChildWhichIsA("ProximityPrompt", true)
		if prompt then
			pcall(function()
				prompt.MaxActivationDistance = 99999
				prompt.RequiresLineOfSight = false
				if fireproximityprompt then
					fireproximityprompt(prompt, 0)
				else
					prompt:InputHoldBegin()
					task.wait(0.04)
					prompt:InputHoldEnd()
				end
			end)
			count += 1
		end
	end
	return count
end

local function dxKillEnemy(enemy)
	if not enemy then return end
	local uuid = enemy:GetAttribute("UUID") or enemy.Name
	if not uuid then return end
	pcall(function()
		if DX_EnemyHitBE then DX_EnemyHitBE:Fire(uuid, 1e30) end
		if DX_EnemyCTRL and DX_EnemyCTRL.HurtEnemy then DX_EnemyCTRL.HurtEnemy(uuid, 1e30) end
		if DX_EnemyCTRL and DX_EnemyCTRL.DeadEnemyData then DX_EnemyCTRL.DeadEnemyData(uuid) end
		if DX_HPCTRL and DX_HPCTRL.SetCurrentHP then DX_HPCTRL.SetCurrentHP(enemy, 0) end
		enemy:SetAttribute("Dead", true)
		local hum = enemy:FindFirstChildOfClass("Humanoid")
		if hum then hum.Health = 0 end
	end)
end

local function dxStageId()
	if DX_GameState.Stage == "Auto Max" then
		local passed = 0
		pcall(function()
			local pd = DX_ProfileData and DX_ProfileData.GetTotalData()
			passed = tonumber(pd and pd.Stats and pd.Stats.StagePass) or 0
		end)
		return "Stage_" .. tostring(math.clamp(passed + 1, 1, 27))
	end
	return tostring(DX_GameState.Stage)
end

local function dxClearStage()
	if DX_RemoteStageFinished then
		local stage = dxStageId()
		local ok, ores = pcall(function()
			return DX_RemoteStageFinished:InvokeServer(stage)
		end)
		if ok and type(ores) == "table" then
			for uuid in pairs(ores) do
				if DX_RemoteGetOre then
					pcall(function() DX_RemoteGetOre:InvokeServer(uuid) end)
				end
			end
			if DX_RemoteClaimedAllOre then
				pcall(function() DX_RemoteClaimedAllOre:FireServer() end)
			end
		end
	end

	local enemyFolder = workspace:FindFirstChild("EnemyFolder")
	if enemyFolder then
		for _, enemy in ipairs(enemyFolder:GetChildren()) do
			if enemy:IsA("Model") and not enemy:GetAttribute("Dead") then
				dxKillEnemy(enemy)
			end
		end
	end

	if DX_GameState.AutoCollectOre then
		dxCollectWorldOre()
	end
end

local function dxDungeonCombat()
	if not LocalPlayer:GetAttribute("Dungeoning") then return false end

	local enemyFolder = workspace:FindFirstChild("EnemyFolder")
	local _, hrp = dxCharacter()
	local playerCF = hrp and hrp.CFrame or CFrame.new(3482, 23, -4)

	local dmEnv = nil
	pcall(function()
		local ps = LocalPlayer:FindFirstChild("PlayerScripts")
		local manager = ps and ps:FindFirstChild("Manager")
		local dmScript = manager and manager:FindFirstChild("DungeonManager")
		if dmScript and getsenv then
			dmEnv = getsenv(dmScript)
		end
	end)

	local dungeonState = nil
	if dmEnv and debug and debug.getupvalues and dmEnv.CheckFinishedOnce then
		pcall(function()
			local upvalues = debug.getupvalues(dmEnv.CheckFinishedOnce)
			if type(upvalues) == "table" and type(upvalues[1]) == "table" then
				dungeonState = upvalues[1]
			end
		end)
	end

	local lastPivot = nil

	if DX_GameState.DungeonInstantKill and enemyFolder then
		for _, enemy in ipairs(enemyFolder:GetChildren()) do
			if enemy:IsA("Model") and not enemy:GetAttribute("Dead") then
				local uuid = enemy:GetAttribute("UUID") or enemy.Name
				lastPivot = enemy:GetPivot()

				pcall(function()
					if dungeonState then
						dungeonState.DeadCF = lastPivot or playerCF
					end
					if DX_EnemyHitBE then
						DX_EnemyHitBE:Fire(uuid, 1e30)
					end
					if DX_EnemyCTRL and DX_EnemyCTRL.HurtEnemy then
						DX_EnemyCTRL.HurtEnemy(uuid, 1e30)
					end
					if DX_HPCTRL and DX_HPCTRL.SetCurrentHP then
						DX_HPCTRL.SetCurrentHP(enemy, 0)
					end
					enemy:SetAttribute("Dead", true)
					local hum = enemy:FindFirstChildOfClass("Humanoid")
					if hum then hum.Health = 0 end
				end)
			end
		end
	end

	if dungeonState then
		if not dungeonState.DeadCF or typeof(dungeonState.DeadCF) ~= "CFrame" then
			dungeonState.DeadCF = lastPivot or playerCF
		end
	end

	if dmEnv and dmEnv.CheckFinishedOnce then
		pcall(function()
			dmEnv.CheckFinishedOnce()
		end)
	end

	if dungeonState and dungeonState.Round and dungeonState.Round >= 30 and dungeonState.Finished then
		if dmEnv and dmEnv.ExitDungeon then
			pcall(function()
				dmEnv.ExitDungeon()
			end)
		elseif DX_RemoteExitDungeon then
			pcall(function()
				DX_RemoteExitDungeon:FireServer()
			end)
		end
	end

	if DX_GameState.AutoCollectOre then
		dxCollectWorldOre()
	end

	return true
end

local function dxOreEntries()
	local bp = DX_BackpackData and DX_BackpackData.GetData()
	if not bp or not bp.have then return {} end
	local entries = {}

	for uuid, item in pairs(bp.have) do
		if item.Type == "Ore" then
			local power = 0
			pcall(function()
				if DX_OreHelper and DX_OreHelper.GetPower then
					power = DX_OreHelper.GetPower(item.ID) or 0
				end
			end)
			entries[#entries+1] = {
				uuid = uuid,
				count = tonumber(item.Number) or 1,
				power = power,
			}
		end
	end

	table.sort(entries, function(a,b)
		if DX_GameState.OreQuality == "Best Ores First" then
			return a.power > b.power
		end
		return a.power < b.power
	end)

	return entries
end

local function dxForgeOnce()
	if not DX_RemoteForge then return false, "ForgeRF not found" end

	local requested = math.floor(tonumber(DX_GameState.MaterialAmount) or 4)
	local maxAmount = DX_GameState.ForgeType == "Weapon" and 13 or 23
	local target = math.clamp(requested, 4, maxAmount)

	local entries = dxOreEntries()
	local oreList = {}
	local collected = 0

	for _, e in ipairs(entries) do
		local take = math.min(e.count, target - collected)
		if take > 0 then
			oreList[e.uuid] = take
			collected += take
		end
		if collected >= target then break end
	end

	if collected < target then
		return false, "Not enough Ore (" .. collected .. "/" .. target .. ")"
	end

	local ok, result = pcall(function()
		return DX_RemoteForge:InvokeServer({
			ConfigType = DX_GameState.ForgeType,
			UUIDList = oreList,
		})
	end)

	if not ok then return false, tostring(result) end
	if not result then return false, "Server rejected Forge" end
	return true, DX_GameState.ForgeType .. " forged"
end

task.spawn(function()
	while not destroyed do
		if DX_GameState.AutoTrain or DX_GameState.AutoBestZone then
			dxTrain()
		elseif DX_GameState.AutoStage then
			dxClearStage()
			task.wait(math.clamp(DX_GameState.StageDelay, 0.15, 2))
		elseif DX_GameState.AutoCollectOre then
			dxCollectWorldOre()
		else
			if DX_RemoteExitAutoTrain and LocalPlayer:GetAttribute("AutoTrainAreaID") then
				pcall(function() DX_RemoteExitAutoTrain:FireServer() end)
			end
		end
		task.wait(0.15)
	end
end)

task.spawn(function()
	while not destroyed do
		if DX_GameState.AutoDungeon then
			if LocalPlayer:GetAttribute("Dungeoning") then
				dxDungeonCombat()
				task.wait(0.25)
			else
				if DX_RemoteDungeonTicket then
					pcall(function() DX_RemoteDungeonTicket:FireServer() end)
				end
				task.wait(0.25)
				if DX_RemoteIntoDungeon then
					pcall(function()
						DX_RemoteIntoDungeon:InvokeServer(math.clamp(tonumber(DX_GameState.DungeonStart) or 1, 1, 30))
					end)
				end
				task.wait(2.5)
			end
		else
			task.wait(1.0)
		end
	end
end)

task.spawn(function()
	while not destroyed do
		if DX_GameState.AutoForge then
			local amount = DX_GameState.ForgeAmount
			if amount == "MAX" then
				while DX_GameState.AutoForge and not destroyed do
					local ok = dxForgeOnce()
					if not ok then break end
					task.wait(0.2)
				end
			else
				for _ = 1, tonumber(amount) or 1 do
					if not DX_GameState.AutoForge or destroyed then break end
					local ok = dxForgeOnce()
					if not ok then break end
					task.wait(0.2)
				end
				DX_GameState.AutoForge = false
			end
		end
		task.wait(0.15)
	end
end)

local function hookAvailable(name)
	return function()
		return type(Hooks[name]) == "function"
	end
end

local function callHook(name, ...)
	local fn = Hooks[name]
	if type(fn) ~= "function" then
		return false
	end
	local ok, err = pcall(fn, ...)
	if not ok then
		warn("[DXPanel] Hook '" .. name .. "' error: " .. tostring(err))
	end
	return ok
end

local CARD_SHADE = ColorSequence.new(Color3.new(1, 1, 1), Color3.fromRGB(200, 200, 212))


-- PAGES   (แท็บทั้งหมดอยู่ตรงนี้: Overview / Example / Settings)
--============================================================

-- OVERVIEW -----------------------------------------------------
do
	local Page = CreatePage("Overview")
	CreateTab("Overview", DX_TAB_ICONS["Overview"])

	Section(Page, "Overview")

	local Card = New("Frame", {
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundColor3 = COLOR.innerBg,
		BorderSizePixel = 0,
		LayoutOrder = ord(Page),
		ZIndex = 50,
	}, Page)
	Corner(Card, 14)
	Gradient(Card, CARD_SHADE, 0)
	local CardStroke = Stroke(Card, Color3.new(1, 1, 1), 1.6, 0.15)
	local CardStrokeGrad = Gradient(CardStroke, NeonSequence, 0)
	Spin(CardStrokeGrad, 9)

	New("UIPadding", {
		PaddingLeft = UDim.new(0, 14),
		PaddingRight = UDim.new(0, 14),
		PaddingTop = UDim.new(0, 14),
		PaddingBottom = UDim.new(0, 14),
	}, Card)
	New("UIListLayout", { Padding = UDim.new(0, 12), SortOrder = Enum.SortOrder.LayoutOrder }, Card)

	-- โปรไฟล์ ------------------------------------------------
	local HeaderRow = New("Frame", {
		Size = UDim2.new(1, 0, 0, 64),
		BackgroundTransparency = 1,
		LayoutOrder = 1,
	}, Card)

	local Avatar = New("ImageLabel", {
		Size = UDim2.fromOffset(64, 64),
		BackgroundColor3 = COLOR.black,
		BorderSizePixel = 0,
		ZIndex = 55,
	}, HeaderRow)
	Corner(Avatar, 32)
	local AvatarStroke = Stroke(Avatar, Color3.new(1, 1, 1), 2.2, 0)
	local AvatarGrad = Gradient(AvatarStroke, NeonSequence, 0)
	Spin(AvatarGrad, 6)

	Txt(HeaderRow, {
		Position = UDim2.new(0, 78, 0, 2),
		Size = UDim2.new(1, -160, 0, 22),
		Text = LocalPlayer.DisplayName,
		Font = Enum.Font.GothamBold,
		TextSize = 16,
		TextTruncate = Enum.TextTruncate.AtEnd,
		ZIndex = 55,
	})
	Txt(HeaderRow, {
		Position = UDim2.new(0, 78, 0, 25),
		Size = UDim2.new(1, -160, 0, 16),
		Text = "@" .. LocalPlayer.Name,
		TextColor3 = COLOR.grey,
		TextTruncate = Enum.TextTruncate.AtEnd,
		ZIndex = 55,
	})
	Txt(HeaderRow, {
		Position = UDim2.new(0, 78, 0, 45),
		Size = UDim2.new(1, -160, 0, 14),
		Text = "Account Age: " .. LocalPlayer.AccountAge .. " days",
		TextSize = 10,
		TextColor3 = COLOR.grey,
		ZIndex = 55,
	})

	local Badge = New("Frame", {
		AnchorPoint = Vector2.new(1, 0.5),
		Position = UDim2.new(1, 0, 0.5, 0),
		Size = UDim2.fromOffset(78, 22),
		BackgroundColor3 = Color3.fromRGB(15, 35, 20),
		BorderSizePixel = 0,
		ZIndex = 55,
	}, HeaderRow)
	Corner(Badge, 11)
	Stroke(Badge, Color3.fromRGB(60, 160, 80), 1, 0.2)
	local BadgeInner = New("Frame", {
		Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = 1,
		ZIndex = 58,
	}, Badge)
	New("UIListLayout", {
		FillDirection = Enum.FillDirection.Horizontal,
		HorizontalAlignment = Enum.HorizontalAlignment.Center,
		VerticalAlignment = Enum.VerticalAlignment.Center,
		Padding = UDim.new(0, 6),
		SortOrder = Enum.SortOrder.LayoutOrder,
	}, BadgeInner)
	local BadgeDot = New("Frame", {
		Size = UDim2.fromOffset(6, 6),
		BackgroundColor3 = COLOR.good,
		BorderSizePixel = 0,
		LayoutOrder = 1,
		ZIndex = 60,
	}, BadgeInner)
	Corner(BadgeDot, 6)
	Txt(BadgeInner, {
		AutomaticSize = Enum.AutomaticSize.X,
		Size = UDim2.new(0, 0, 1, 0),
		Text = "ONLINE",
		Font = Enum.Font.GothamBold,
		TextSize = 9,
		TextColor3 = COLOR.good,
		TextXAlignment = Enum.TextXAlignment.Center,
		LayoutOrder = 2,
		ZIndex = 60,
	})

	task.spawn(function()
		local ok, content = pcall(function()
			return Players:GetUserThumbnailAsync(
				LocalPlayer.UserId,
				Enum.ThumbnailType.HeadShot,
				Enum.ThumbnailSize.Size180x180
			)
		end)
		if ok and Avatar.Parent then
			Avatar.Image = content
		end
	end)

	-- ไทล์สถิติ 3 ช่อง -------------------------------------------
	local Tiles = New("Frame", {
		Size = UDim2.new(1, 0, 0, 56),
		BackgroundTransparency = 1,
		LayoutOrder = 2,
	}, Card)
	New("UIListLayout", {
		FillDirection = Enum.FillDirection.Horizontal,
		Padding = UDim.new(0, 8),
		SortOrder = Enum.SortOrder.LayoutOrder,
	}, Tiles)

	local function Tile(label, order)
		local T = New("Frame", {
			Size = UDim2.new(1 / 3, -6, 1, 0),
			BackgroundColor3 = COLOR.innerBg,
			BorderSizePixel = 0,
			LayoutOrder = order,
			ZIndex = 55,
		}, Tiles)
		Corner(T, 10)
		Gradient(T, CARD_SHADE, 90)
		local S = Stroke(T, COLOR.innerBorder, 1.2, 0.1)
		local Bar = New("Frame", {
			Visible = false,
			AnchorPoint = Vector2.new(0.5, 0),
			Position = UDim2.new(0.5, 0, 0, 0),
			Size = UDim2.fromOffset(22, 2),
			BackgroundColor3 = COLOR.red,
			BorderSizePixel = 0,
			ZIndex = 60,
		}, T)
		Corner(Bar, 2)
		local V = Txt(T, {
			Position = UDim2.new(0, 0, 0, 9),
			Size = UDim2.new(1, 0, 0, 24),
			Text = "-",
			Font = Enum.Font.GothamBold,
			TextSize = 17,
			TextXAlignment = Enum.TextXAlignment.Center,
			ZIndex = 60,
		})
		Txt(T, {
			Position = UDim2.new(0, 0, 0, 33),
			Size = UDim2.new(1, 0, 0, 14),
			Text = string.upper(label),
			Font = Enum.Font.GothamMedium,
			TextSize = 9,
			TextColor3 = COLOR.grey,
			TextXAlignment = Enum.TextXAlignment.Center,
			ZIndex = 60,
		})
		OnTheme(function()
			T.BackgroundColor3 = COLOR.innerBg
			S.Color = COLOR.innerBorder
			Bar.BackgroundColor3 = COLOR.red
			V.TextColor3 = COLOR.redSoft
		end)
		return V
	end

	local PlayersValue = Tile("Players", 1)
	local PingValue = Tile("Ping", 2)
	local FpsValue = Tile("FPS", 3)

	-- ข้อมูลเกม ---------------------------------------------------
	local Divider = New("Frame", {
		Size = UDim2.new(1, 0, 0, 1),
		BackgroundColor3 = COLOR.border,
		BackgroundTransparency = 0.4,
		BorderSizePixel = 0,
		LayoutOrder = 3,
	}, Card)

	local StatsHolder = New("Frame", {
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundTransparency = 1,
		LayoutOrder = 4,
	}, Card)
	New("UIListLayout", { Padding = UDim.new(0, 8), SortOrder = Enum.SortOrder.LayoutOrder }, StatsHolder)

	local GameValue = StatRow(StatsHolder, "Game")
	local PlaceValue = StatRow(StatsHolder, "Place ID")
	local ServerValue = StatRow(StatsHolder, "Server")

	GameValue.Text = Context.GameName or game.Name
	PlaceValue.Text = tostring(game.PlaceId)
	ServerValue.Text = (game.JobId ~= "" and string.sub(game.JobId, 1, 8) or "Studio")

	if not Context.GameName then
		task.spawn(function()
			local ok, info = pcall(function()
				return MarketplaceService:GetProductInfo(game.PlaceId)
			end)
			if ok and type(info) == "table" and info.Name and GameValue.Parent then
				GameValue.Text = info.Name
			end
		end)
	end

	OnTheme(function()
		CardStroke.Color = Color3.new(1, 1, 1)
		CardStrokeGrad.Color = NeonSequence
		AvatarStroke.Color = Color3.new(1, 1, 1)
		AvatarGrad.Color = NeonSequence
		Card.BackgroundColor3 = COLOR.innerBg
		Divider.BackgroundColor3 = COLOR.border
	end)

	local function updatePlayers()
		PlayersValue.Text = #Players:GetPlayers() .. "/" .. Players.MaxPlayers
	end
	updatePlayers()

	-- อัปเดตทุก 1 วินาที
	task.spawn(function()
		local frames, acc = 0, 0
		track(RunService.Heartbeat:Connect(function(dt)
			frames += 1
			acc += dt
		end))
		while not destroyed and Card.Parent do
			task.wait(1)
			if acc > 0 then
				FpsValue.Text = tostring(math.floor(frames / acc + 0.5))
				frames, acc = 0, 0
			end
			local ok, ping = pcall(function()
				return Stats.Network.ServerStatsItem["Data Ping"]:GetValue()
			end)
			PingValue.Text = (ok and ping) and (math.floor(ping) .. "ms") or "N/A"
			updatePlayers()
		end
	end)
end

do
	local Page = CreatePage("Farm")
	CreateTab("Farm", DX_TAB_ICONS["Farm"])

	Section(Page, "Training")
	Toggle(Page, "Auto Train", false, function(v)
		DX_GameState.AutoTrain = v
	end)

	Toggle(Page, "Auto Best Zone", false, function(v)
		DX_GameState.AutoBestZone = v
		if v then DX_GameState.TrainZone = "Auto Best" end
	end)

	local trainOptions = {"Auto Best"}
	for _, z in ipairs(DX_TrainZones) do
		table.insert(trainOptions, z.Name)
	end

	Dropdown(Page, "Training Zone", {
		Options = trainOptions,
		Default = "Auto Best",
		OnChange = function(v)
			DX_GameState.TrainZone = v
			if v == "Auto Best" then
				DX_GameState.AutoBestZone = true
			end
		end,
	})

	Section(Page, "Stage & Ore")
	Toggle(Page, "Auto Clear Stage", false, function(v)
		DX_GameState.AutoStage = v
	end)

	local stageOptions = {"Auto Max"}
	for i = 1, 27 do
		table.insert(stageOptions, "Stage_" .. i)
	end

	Dropdown(Page, "Stage", {
		Options = stageOptions,
		Default = "Auto Max",
		OnChange = function(v)
			DX_GameState.Stage = v
		end,
	})

	Slider(Page, "Stage Delay", 0.15, 2, 0.35, 2, function(v)
		DX_GameState.StageDelay = v
	end, true)

	Toggle(Page, "Auto Collect Ore", false, function(v)
		DX_GameState.AutoCollectOre = v
	end)
end

do
	local Page = CreatePage("Dungeon")
	CreateTab("Dungeon", DX_TAB_ICONS["Dungeon"])

	Section(Page, "Dungeon")
	Toggle(Page, "Auto Dungeon", false, function(v)
		DX_GameState.AutoDungeon = v
	end)

	Toggle(Page, "Instant Kill", false, function(v)
		DX_GameState.DungeonInstantKill = v
	end)

	local rounds = {}
	for i = 1, 30 do table.insert(rounds, tostring(i)) end

	Dropdown(Page, "Start Round", {
		Options = rounds,
		Default = "1",
		OnChange = function(v)
			DX_GameState.DungeonStart = tonumber(v) or 1
		end,
	})
end

do
	local Page = CreatePage("Forge")
	CreateTab("Forge", DX_TAB_ICONS["Forge"])

	Section(Page, "Forge")
	Toggle(Page, "Auto Forge", false, function(v)
		DX_GameState.AutoForge = v
	end)

	Dropdown(Page, "Forge Type", {
		Options = {"Weapon", "Armor"},
		Default = "Weapon",
		OnChange = function(v)
			DX_GameState.ForgeType = v
		end,
	})

	Dropdown(Page, "Material Quality", {
		Options = {"Best Ores First", "Lowest Ores First"},
		Default = "Best Ores First",
		OnChange = function(v)
			DX_GameState.OreQuality = v
		end,
	})

	Slider(Page, "Material Amount", 4, 23, 4, 0, function(v)
		local max = DX_GameState.ForgeType == "Weapon" and 13 or 23
		DX_GameState.MaterialAmount = math.clamp(math.floor(v + 0.5), 4, max)
	end, true)

	Dropdown(Page, "Forge Amount", {
		Options = {"1", "5", "10", "20", "50", "100", "MAX"},
		Default = "1",
		OnChange = function(v)
			DX_GameState.ForgeAmount = (v == "MAX") and "MAX" or tonumber(v)
		end,
	})

	Button(Page, "Forge Selected Now", function()
		local ok, msg = dxForgeOnce()
		Notify(ok and msg or ("Forge failed: " .. tostring(msg)), ok)
	end)
end

do
	local Page = CreatePage("Settings")
	CreateTab("Settings", DX_TAB_ICONS["Settings"])
	local ctl = {}
	local _

	Section(Page, "General")
	_, ctl.anim = Toggle(Page, "Animation", Settings.Animate, function(on)
		Settings.Animate = on
		saveSettings()
	end)
	_, ctl.pulse = Toggle(Page, "Premium Effects", Settings.Pulse, function(on)
		Actions.SetPulse(on)
		Settings.Pulse = on
		saveSettings()
	end)
	_, ctl.float = Toggle(Page, "Show Floating Button", Settings.ShowFloating, function(on)
		Settings.ShowFloating = on
		Actions.RefreshFloating()
		saveSettings()
	end)
	_, ctl.stars = Toggle(Page, "Shooting Stars", Settings.Stars, function(on)
		Actions.SetStars(on)
		saveSettings()
	end)
	_, ctl.autoload = Toggle(Page, "Auto Load", Settings.AutoLoad, function(on)
		Settings.AutoLoad = on
		saveSettings()
		callHook("AutoLoad", on)
	end)

	Section(Page, "Panel")
	local sizeMap = {
		Compact = { SIZE.minW, SIZE.minH },
		Default = { SIZE.defW, SIZE.defH },
		Large = { SIZE.maxW, SIZE.maxH },
	}
	local _, sizeDrop = Dropdown(Page, "Panel Size", {
		Options = { "Compact", "Default", "Large" },
		Default = "Default",
		OnChange = function(v)
			local s = sizeMap[v]
			if s then
				FitPanel(s[1], s[2], false)
			end
		end,
	})
	Button(Page, "Reset Interface", function()
		FitPanel(SIZE.defW, SIZE.defH, true)
		sizeDrop.Set("Default", true)
		Actions.ActivateTab("Overview")
	end)

	Section(Page, "Theme Color")
	_, ctl.rainbow = Toggle(Page, "Rainbow Mode", Settings.Rainbow, function(on)
		Actions.SetRainbow(on)
	end)
	Actions.OnRainbow = function(on)
		if ctl.rainbow then
			ctl.rainbow.Set(on, true)
		end
	end
	ctl.rspeed = Slider(Page, "Rainbow Speed", 0.2, 3, Settings.RainbowSpeed or 1, 1, function(v)
		Settings.RainbowSpeed = v
		saveSettings()
	end, true)

	-- ===== Neon หลายสีพร้อมกัน =====
	local pickTarget = nil -- nil = สีหลักของธีม, เลข = ช่องสีนีออน
	local pickerRef = {}
	local palette = {}

	_, ctl.multi = Toggle(Page, "Multi-Color Neon", Settings.Multi, function(on)
		Actions.SetMulti(on)
	end)
	Actions.OnMulti = function(on)
		if ctl.multi then
			ctl.multi.Set(on, true)
		end
	end

	local Combos = {
		{ "Lunar Trio", { "9B5CFF", "3DA5FF", "FF5CC8" } },
		{ "Aurora", { "3DDCC8", "5CFF9B", "9B5CFF" } },
		{ "Sunset", { "FF8A3D", "FF4F8B", "9B5CFF" } },
		{ "Cyber", { "00E5FF", "FF2BD6", "FFE600" } },
		{ "Candy", { "FF8FD8", "8FC8FF", "B7FF9B" } },
		{ "Galaxy", { "5C3DFF", "E75CFF", "3DDCFF", "FFFFFF" } },
	}
	local comboNames = {}
	for _, c in ipairs(Combos) do
		table.insert(comboNames, c[1])
	end

	local Palette = New("Frame", {
		Size = UDim2.new(1, 0, 0, 98),
		BackgroundColor3 = COLOR.innerBg,
		BorderSizePixel = 0,
		LayoutOrder = 0,
		ZIndex = 50,
	}, Page)
	Corner(Palette, 14)
	Gradient(Palette, CARD_SHADE, 0)
	local PalStroke = Stroke(Palette, COLOR.innerBorder, 1.5, 0)
	Txt(Palette, {
		Position = UDim2.fromOffset(16, 10),
		Size = UDim2.new(1, -32, 0, 12),
		Text = "NEON PALETTE",
		Font = Enum.Font.GothamBold,
		TextSize = 9,
		TextColor3 = COLOR.grey,
		ZIndex = 60,
	})
	local PalStatus = Txt(Palette, {
		Position = UDim2.fromOffset(16, 24),
		Size = UDim2.new(1, -32, 0, 14),
		TextSize = 10,
		TextColor3 = COLOR.redSoft,
		TextTruncate = Enum.TextTruncate.AtEnd,
		ZIndex = 60,
	})
	local SlotRow = New("Frame", {
		Position = UDim2.fromOffset(14, 48),
		Size = UDim2.new(1, -28, 0, 36),
		BackgroundTransparency = 1,
		ZIndex = 55,
	}, Palette)
	New("UIListLayout", {
		FillDirection = Enum.FillDirection.Horizontal,
		Padding = UDim.new(0, 8),
		VerticalAlignment = Enum.VerticalAlignment.Center,
		SortOrder = Enum.SortOrder.LayoutOrder,
	}, SlotRow)
	local slotObjs = {}

	local function setStatus()
		PalStatus.Text = pickTarget and ("กำลังปรับ: สีนีออนที่ " .. pickTarget .. "  (แตะซ้ำเพื่อกลับไปสีหลัก)")
			or "กำลังปรับ: สีหลักของธีม  (แตะวงกลมเพื่อเลือกสีนีออน)"
	end

	local function selectTarget(t)
		pickTarget = t
		setStatus()
		local c = t and HexToColor3(Settings.NeonColors[t]) or HexToColor3(Settings.ThemeColor)
		if c and pickerRef.Sync then
			pickerRef.Sync(c)
		end
		palette.Build()
	end

	function palette.Build()
		for _, o in ipairs(slotObjs) do
			o:Destroy()
		end
		table.clear(slotObjs)
		local list = Settings.NeonColors
		for i, hex in ipairs(list) do
			local sel = pickTarget == i
			local Sw = New("TextButton", {
				Size = UDim2.fromOffset(32, 32),
				BackgroundColor3 = HexToColor3(hex) or COLOR.red,
				AutoButtonColor = false,
				Text = "",
				LayoutOrder = i,
				ZIndex = 60,
			}, SlotRow)
			Corner(Sw, 16)
			Stroke(Sw, sel and Color3.new(1, 1, 1) or COLOR.innerBorder, sel and 2.6 or 1.5, sel and 0 or 0.2)
			track(Sw.Activated:Connect(function()
				selectTarget(pickTarget == i and nil or i)
			end))
			table.insert(slotObjs, Sw)
		end
		local function mini(text, order, fn)
			local B = New("TextButton", {
				Size = UDim2.fromOffset(32, 32),
				BackgroundColor3 = COLOR.switchOff,
				AutoButtonColor = false,
				Text = text,
				Font = Enum.Font.GothamBold,
				TextSize = 16,
				TextColor3 = COLOR.white,
				LayoutOrder = order,
				ZIndex = 60,
			}, SlotRow)
			Corner(B, 16)
			Stroke(B, COLOR.innerBorder, 1.5, 0.1)
			track(B.Activated:Connect(fn))
			table.insert(slotObjs, B)
		end
		if #list < 5 then
			mini("+", 20, function()
				local h, s, v = Color3.toHSV(HexToColor3(list[#list]) or COLOR.red)
				table.insert(Settings.NeonColors, Color3ToHex(Color3.fromHSV((h + 0.17) % 1, s, v)))
				if not Settings.Multi then
					Actions.SetMulti(true, true)
				else
					Actions.RefreshNeon()
				end
				saveSettings()
				palette.Build()
			end)
		end
		if #list > 2 then
			mini("-", 21, function()
				table.remove(Settings.NeonColors, pickTarget or #Settings.NeonColors)
				pickTarget = nil
				setStatus()
				Actions.RefreshNeon()
				saveSettings()
				palette.Build()
			end)
		end
	end
	function palette.Reset()
		pickTarget = nil
		setStatus()
		palette.Build()
	end
	Actions.OnNeonChanged = palette.Build
	setStatus()
	palette.Build()
	OnTheme(function()
		Palette.BackgroundColor3 = COLOR.innerBg
		PalStroke.Color = COLOR.innerBorder
		PalStatus.TextColor3 = COLOR.redSoft
	end)

	local _, comboDrop = Dropdown(Page, "Neon Combo", {
		Options = comboNames,
		OnChange = function(v)
			for _, c in ipairs(Combos) do
				if c[1] == v then
					Settings.NeonColors = copyTable(c[2])
					Actions.SetMulti(true, true)
					Actions.SetThemeColor(HexToColor3(c[2][1]), true)
					pickTarget = nil
					setStatus()
					palette.Build()
					if pickerRef.Sync then
						pickerRef.Sync(HexToColor3(c[2][1]))
					end
					saveSettings()
				end
			end
		end,
	})
	-- จัดลำดับ: การ์ดพาเลตอยู่ต่อจากกล่อง Neon Combo
	Palette.LayoutOrder = ord(Page)

	local Presets = {
		{ "Lunar Purple", "9B5CFF" },
		{ "Nebula", "6C7BFF" },
		{ "Galaxy Pink", "E75CFF" },
		{ "Aurora", "3DDCC8" },
		{ "Moonlight", "8FB8FF" },
		{ "Rose Moon", "FF6FA8" },
		{ "Solar Gold", "FFC857" },
	}

	local Picker = New("Frame", {
		Size = UDim2.new(1, 0, 0, 226),
		BackgroundColor3 = COLOR.innerBg,
		BorderSizePixel = 0,
		LayoutOrder = ord(Page),
		ZIndex = 50,
	}, Page)
	Corner(Picker, 14)
	Gradient(Picker, CARD_SHADE, 0)
	local PickerStroke = Stroke(Picker, COLOR.innerBorder, 1.5, 0)

	local ph, ps, pv = 0, 0.85, 0.92
	local picker = {}
	local bars = {}
	local presetSwatches = {}

	local function currentColor()
		return Color3.fromHSV(ph, ps, pv)
	end

	-- ตัวอย่างสี + ช่องกรอก HEX ------------------------------------
	local Preview = New("Frame", {
		Position = UDim2.fromOffset(14, 14),
		Size = UDim2.fromOffset(42, 42),
		BackgroundColor3 = currentColor(),
		BorderSizePixel = 0,
		ZIndex = 60,
	}, Picker)
	Corner(Preview, 21)
	local PreviewStroke = Stroke(Preview, Color3.new(1, 1, 1), 2, 0.55)

	local Field = New("Frame", {
		Position = UDim2.new(0, 66, 0, 14),
		Size = UDim2.new(1, -66 - 92, 0, 42),
		BackgroundColor3 = COLOR.black,
		BorderSizePixel = 0,
		ZIndex = 60,
	}, Picker)
	Corner(Field, 10)
	local FieldStroke = Stroke(Field, COLOR.innerBorder, 1.5, 0)
	Gradient(Field, ColorSequence.new(Color3.fromRGB(235, 235, 240), Color3.new(1, 1, 1)), 90)

	Txt(Field, {
		Position = UDim2.new(0, 12, 0, 0),
		Size = UDim2.fromOffset(14, 42),
		Text = "#",
		Font = Enum.Font.GothamBold,
		TextSize = 15,
		TextColor3 = COLOR.grey,
		ZIndex = 65,
	})
	local Input = New("TextBox", {
		Position = UDim2.new(0, 28, 0, 0),
		Size = UDim2.new(1, -38, 1, 0),
		BackgroundTransparency = 1,
		Text = Color3ToHex(currentColor()),
		PlaceholderText = "FF2D4B",
		Font = Enum.Font.GothamBold,
		TextSize = 14,
		TextColor3 = COLOR.white,
		PlaceholderColor3 = COLOR.grey,
		TextXAlignment = Enum.TextXAlignment.Left,
		ClearTextOnFocus = false,
		ZIndex = 65,
	}, Field)

	local Apply = New("TextButton", {
		AnchorPoint = Vector2.new(1, 0),
		Position = UDim2.new(1, -14, 0, 14),
		Size = UDim2.fromOffset(70, 42),
		BackgroundColor3 = COLOR.red,
		BorderSizePixel = 0,
		AutoButtonColor = false,
		Text = "APPLY",
		Font = Enum.Font.GothamBold,
		TextSize = 11,
		TextColor3 = Color3.new(1, 1, 1),
		ZIndex = 65,
	}, Picker)
	Corner(Apply, 10)
	local ApplyStroke = Stroke(Apply, COLOR.redBright, 1.2, 0.35)
	Gradient(Apply, ColorSequence.new(Color3.new(1, 1, 1), Color3.fromRGB(190, 190, 190)), 90)

	-- พรีเซ็ตสี ---------------------------------------------------
	Txt(Picker, {
		Position = UDim2.fromOffset(16, 66),
		Size = UDim2.new(1, -32, 0, 12),
		Text = "PRESETS",
		Font = Enum.Font.GothamBold,
		TextSize = 9,
		TextColor3 = COLOR.grey,
		ZIndex = 60,
	})
	local PresetRow = New("Frame", {
		Position = UDim2.fromOffset(14, 82),
		Size = UDim2.new(1, -28, 0, 32),
		BackgroundTransparency = 1,
		ZIndex = 60,
	}, Picker)
	New("UIListLayout", {
		FillDirection = Enum.FillDirection.Horizontal,
		Padding = UDim.new(0, 8),
		VerticalAlignment = Enum.VerticalAlignment.Center,
		SortOrder = Enum.SortOrder.LayoutOrder,
	}, PresetRow)

	-- แถบเลื่อนสี (Hue / Saturation / Brightness) ------------------
	local function MakeBar(title, y, onMove)
		Txt(Picker, {
			Position = UDim2.fromOffset(16, y - 15),
			Size = UDim2.new(1, -32, 0, 12),
			Text = string.upper(title),
			Font = Enum.Font.GothamBold,
			TextSize = 9,
			TextColor3 = COLOR.grey,
			ZIndex = 60,
		})
		local Track = New("Frame", {
			Position = UDim2.new(0, 14, 0, y),
			Size = UDim2.new(1, -28, 0, 12),
			BackgroundColor3 = Color3.new(1, 1, 1),
			BorderSizePixel = 0,
			ZIndex = 60,
		}, Picker)
		Corner(Track, 6)
		Stroke(Track, COLOR.innerBorder, 1, 0.3)
		local G = Gradient(Track, ColorSequence.new(Color3.new(1, 1, 1)), 0)
		local Knob = New("Frame", {
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0, 0.5),
			Size = UDim2.fromOffset(20, 20),
			BackgroundColor3 = Color3.new(1, 1, 1),
			BorderSizePixel = 0,
			ZIndex = 66,
		}, Track)
		Corner(Knob, 10)
		Stroke(Knob, Color3.fromRGB(20, 20, 24), 2.5, 0.1)

		local Hit = New("TextButton", {
			Position = UDim2.new(0, 14, 0, y - 12),
			Size = UDim2.new(1, -28, 0, 36),
			BackgroundTransparency = 1,
			Text = "",
			ZIndex = 70,
		}, Picker)

		local bar = { Gradient = G, Knob = Knob }
		function bar.Set(v)
			Knob.Position = UDim2.fromScale(math.clamp(v, 0, 1), 0.5)
		end

		local dragging, dragInput = false, nil
		local function fromX(x)
			local w = Track.AbsoluteSize.X
			if w <= 0 then
				return
			end
			onMove(math.clamp((x - Track.AbsolutePosition.X) / w, 0, 1), false)
		end
		track(Hit.InputBegan:Connect(function(input)
			local t = input.UserInputType
			if t == Enum.UserInputType.MouseButton1 or t == Enum.UserInputType.Touch then
				if dragging or not Interaction.Begin(Hit) then
					return
				end
				dragging, dragInput = true, input
				fromX(input.Position.X)
			end
		end))
		track(UIS.InputChanged:Connect(function(input)
			if not dragging then
				return
			end
			local t = input.UserInputType
			if t == Enum.UserInputType.MouseMovement or (t == Enum.UserInputType.Touch and input == dragInput) then
				fromX(input.Position.X)
			end
		end))
		track(UIS.InputEnded:Connect(function(input)
			if not dragging then
				return
			end
			local t = input.UserInputType
			if t == Enum.UserInputType.MouseButton1 or (t == Enum.UserInputType.Touch and input == dragInput) then
				dragging, dragInput = false, nil
				Interaction.End(Hit)
				onMove(nil, true) -- ปล่อยแล้ว -> นำสีไปใช้กับธีม
			end
		end))
		return bar
	end

	local function refreshVisual()
		local c = currentColor()
		Preview.BackgroundColor3 = c
		if not Input:IsFocused() then
			Input.Text = Color3ToHex(c)
		end
		bars.h.Set(ph)
		bars.s.Set(ps)
		bars.v.Set(pv)
		bars.s.Gradient.Color = ColorSequence.new(Color3.fromHSV(ph, 0, pv), Color3.fromHSV(ph, 1, pv))
		bars.v.Gradient.Color = ColorSequence.new(Color3.new(0, 0, 0), Color3.fromHSV(ph, ps, 1))
		local hex = Color3ToHex(c)
		for _, sw in ipairs(presetSwatches) do
			local on = sw.Hex == Color3ToHex(HexToColor3(sw.Hex)) and sw.Hex == hex
			Tween(sw.Stroke, 0.15, { Color = on and Color3.new(1, 1, 1) or COLOR.innerBorder, Transparency = on and 0 or 0.2, Thickness = on and 2.4 or 1.5 })
		end
	end

	local function applyCurrent()
		if pickTarget then
			Actions.SetNeonSlot(pickTarget, currentColor())
		else
			Actions.SetThemeColor(currentColor())
		end
	end

	bars.h = MakeBar("Hue", 138, function(v, released)
		if released then
			applyCurrent()
		else
			ph = v
			refreshVisual()
		end
	end)
	bars.s = MakeBar("Saturation", 172, function(v, released)
		if released then
			applyCurrent()
		else
			ps = v
			refreshVisual()
		end
	end)
	bars.v = MakeBar("Brightness", 206, function(v, released)
		if released then
			applyCurrent()
		else
			pv = math.max(v, 0.25)
			refreshVisual()
		end
	end)
	bars.h.Gradient.Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0, Color3.fromHSV(0, 1, 1)),
		ColorSequenceKeypoint.new(0.17, Color3.fromHSV(0.17, 1, 1)),
		ColorSequenceKeypoint.new(0.33, Color3.fromHSV(0.33, 1, 1)),
		ColorSequenceKeypoint.new(0.5, Color3.fromHSV(0.5, 1, 1)),
		ColorSequenceKeypoint.new(0.67, Color3.fromHSV(0.67, 1, 1)),
		ColorSequenceKeypoint.new(0.83, Color3.fromHSV(0.83, 1, 1)),
		ColorSequenceKeypoint.new(1, Color3.fromHSV(1, 1, 1)),
	})

	function picker.Sync(c)
		ph, ps, pv = Color3.toHSV(c)
		pv = math.max(pv, 0.25)
		refreshVisual()
	end

	for i, p in ipairs(Presets) do
		local col = HexToColor3(p[2])
		local Swatch = New("TextButton", {
			Size = UDim2.fromOffset(30, 30),
			BackgroundColor3 = col,
			AutoButtonColor = false,
			Text = "",
			LayoutOrder = i,
			ZIndex = 65,
		}, PresetRow)
		Corner(Swatch, 15)
		local SwStroke = Stroke(Swatch, COLOR.innerBorder, 1.5, 0.2)
		table.insert(presetSwatches, { Hex = p[2], Stroke = SwStroke })
		track(Swatch.MouseEnter:Connect(function()
			Tween(Swatch, 0.12, { Size = UDim2.fromOffset(34, 34) })
		end))
		track(Swatch.MouseLeave:Connect(function()
			Tween(Swatch, 0.12, { Size = UDim2.fromOffset(30, 30) })
		end))
		track(Swatch.Activated:Connect(function()
			picker.Sync(col)
			applyCurrent()
		end))
	end

	-- ช่องกรอก HEX: โฟกัสแล้วขอบสว่าง / พิมพ์แล้วพรีวิวสด ------------------
	track(Input.Focused:Connect(function()
		Tween(FieldStroke, 0.15, { Color = COLOR.redBright, Thickness = 2 })
		Tween(Field, 0.15, { BackgroundColor3 = Color3.fromRGB(18, 18, 24) })
	end))
	track(Input:GetPropertyChangedSignal("Text"):Connect(function()
		local clean = string.upper(Input.Text:gsub("[^%x]", "")):sub(1, 6)
		if clean ~= Input.Text then
			Input.Text = clean
			return
		end
		local c = HexToColor3(clean)
		if c and Input:IsFocused() then
			Preview.BackgroundColor3 = c
		end
	end))
	local function commitHex()
		local c = HexToColor3(Input.Text)
		if c then
			picker.Sync(c)
			applyCurrent()
		else
			Notify("โค้ดสีไม่ถูกต้อง (ต้องมี 6 หลัก)", false)
			Tween(FieldStroke, 0.1, { Color = COLOR.bad })
			task.delay(0.4, function()
				if FieldStroke.Parent then
					Tween(FieldStroke, 0.2, { Color = COLOR.innerBorder })
				end
			end)
			refreshVisual()
		end
	end
	track(Input.FocusLost:Connect(function(enter)
		Tween(FieldStroke, 0.15, { Color = COLOR.innerBorder, Thickness = 1.5 })
		Tween(Field, 0.15, { BackgroundColor3 = COLOR.black })
		if enter then
			commitHex()
		else
			refreshVisual()
		end
	end))
	track(Apply.Activated:Connect(commitHex))
	Hover(Apply, function(h)
		Tween(Apply, 0.12, { BackgroundColor3 = h and COLOR.redBright or COLOR.red })
	end)

	OnTheme(function()
		Picker.BackgroundColor3 = COLOR.innerBg
		PickerStroke.Color = COLOR.innerBorder
		FieldStroke.Color = COLOR.innerBorder
		Apply.BackgroundColor3 = COLOR.red
		ApplyStroke.Color = COLOR.redBright
	end)

	pickerRef.Sync = picker.Sync
	picker.Sync(HexToColor3(Settings.ThemeColor) or COLOR.red)

	Section(Page, "Actions")
	Button(Page, "Reset Settings", function()
		Settings = copyTable(DEFAULT_SETTINGS)
		ctl.anim.Set(Settings.Animate, true)
		ctl.pulse.Set(Settings.Pulse, true)
		ctl.float.Set(Settings.ShowFloating, true)
		ctl.autoload.Set(Settings.AutoLoad, true)
		ctl.stars.Set(Settings.Stars, true)
		ctl.rainbow.Set(false, true)
		ctl.rspeed.Set(Settings.RainbowSpeed, true)
		Actions.SetStars(Settings.Stars)
		Actions.SetRainbow(false, true)
		ctl.multi.Set(Settings.Multi, true)
		Actions.SetMulti(Settings.Multi, true)
		palette.Reset()
		Actions.SetPulse(Settings.Pulse)
		Actions.SetThemeColor(HexToColor3(Settings.ThemeColor), true)
		picker.Sync(HexToColor3(Settings.ThemeColor))
		sizeDrop.Set("Default", true)
		FitPanel(SIZE.defW, SIZE.defH, true)
		Actions.RefreshFloating()
		saveSettings()
		Notify("รีเซ็ตการตั้งค่าแล้ว", true)
	end)
	Button(Page, "Destroy GUI", cleanup, true)
end


-- CREDITS ------------------------------------------------------
do
	local Page = CreatePage("Credits")
	CreateTab("Credits", "info")

	Section(Page, "Credits")
	local Card = New("Frame", {
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundColor3 = COLOR.innerBg,
		BorderSizePixel = 0,
		LayoutOrder = ord(Page),
		ZIndex = 50,
	}, Page)
	Corner(Card, 14)
	Gradient(Card, CARD_SHADE, 0)
	local CardStroke = Stroke(Card, Color3.new(1, 1, 1), 1.6, 0.15)
	local CardStrokeGrad = Gradient(CardStroke, NeonSequence, 0)
	Spin(CardStrokeGrad, 9)
	New("UIPadding", {
		PaddingLeft = UDim.new(0, 16),
		PaddingRight = UDim.new(0, 16),
		PaddingTop = UDim.new(0, 16),
		PaddingBottom = UDim.new(0, 16),
	}, Card)
	New("UIListLayout", { Padding = UDim.new(0, 6), SortOrder = Enum.SortOrder.LayoutOrder }, Card)

	local Logo = Txt(Card, {
		Size = UDim2.new(1, 0, 0, 28),
		Text = "LUNAR Hub",
		Font = Enum.Font.GothamBlack,
		TextSize = 22,
		LayoutOrder = 1,
		ZIndex = 55,
	})
	local Line = New("Frame", {
		Visible = false,
		Size = UDim2.fromOffset(42, 2),
		BackgroundColor3 = COLOR.red,
		BorderSizePixel = 0,
		LayoutOrder = 2,
		ZIndex = 55,
	}, Card)
	Corner(Line, 2)
	Txt(Card, {
		Size = UDim2.new(1, 0, 0, 16),
		Text = "Universal Control Panel",
		TextColor3 = COLOR.grey,
		LayoutOrder = 3,
		ZIndex = 55,
	})
	Txt(Card, {
		Size = UDim2.new(1, 0, 0, 18),
		Text = "UI / System  :  LUNAR Team",
		Font = Enum.Font.GothamMedium,
		LayoutOrder = 4,
		ZIndex = 55,
	})
	Txt(Card, {
		Size = UDim2.new(1, 0, 0, 16),
		Text = "Neon interface for LUNAR Hub",
		TextSize = 10,
		TextColor3 = COLOR.grey,
		LayoutOrder = 5,
		ZIndex = 55,
	})

	OnTheme(function()
		Logo.TextColor3 = COLOR.red
		Line.BackgroundColor3 = COLOR.red
		Card.BackgroundColor3 = COLOR.innerBg
		CardStroke.Color = Color3.new(1, 1, 1)
		CardStrokeGrad.Color = NeonSequence
	end)
end

Actions.ApplyLayout()
Actions.ActivateTab("Overview")

--============================================================
-- DRAG SYSTEM (Mouse + Touch)
--============================================================

local function Draggable(handle, opts)
	local dragging, moved = false, false
	local startInput, startPointer, startValue

	local function finish()
		if not dragging then
			return
		end
		dragging = false
		Interaction.End(handle)
		if not moved and opts.onClick then
			opts.onClick()
		end
	end

	track(handle.InputBegan:Connect(function(input)
		if input.UserInputType ~= Enum.UserInputType.MouseButton1 and input.UserInputType ~= Enum.UserInputType.Touch then
			return
		end
		if opts.canStart and not opts.canStart() then
			return
		end
		if dragging or not Interaction.Begin(handle) then
			return
		end
		dragging, moved = true, false
		startInput = input
		startPointer = Vector2.new(input.Position.X, input.Position.Y)
		startValue = opts.get()
		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				finish()
			end
		end)
	end))

	track(UIS.InputChanged:Connect(function(input)
		if not dragging then
			return
		end
		local t = input.UserInputType
		if t == Enum.UserInputType.MouseMovement or (t == Enum.UserInputType.Touch and input == startInput) then
			local delta = Vector2.new(input.Position.X, input.Position.Y) - startPointer
			if not moved and delta.Magnitude < 5 then
				return
			end
			moved = true
			opts.set(startValue + delta)
		end
	end))

	track(UIS.InputEnded:Connect(function(input)
		if
			input.UserInputType == Enum.UserInputType.MouseButton1
			or (input.UserInputType == Enum.UserInputType.Touch and input == startInput)
		then
			finish()
		end
	end))
end

--============================================================
-- FLOATING TOGGLE
--============================================================

local TOGGLE = 50
local ToggleCenter = Vector2.new(Viewport().X - 52, Viewport().Y * 0.72)

local ToggleRoot = New("Frame", {
	Name = "FloatingToggle",
	AnchorPoint = Vector2.new(0.5, 0.5),
	Position = UDim2.fromOffset(ToggleCenter.X, ToggleCenter.Y),
	Size = UDim2.fromOffset(TOGGLE, TOGGLE),
	BackgroundTransparency = 1,
	BorderSizePixel = 0,
	ZIndex = 200,
}, Gui)

local ToggleGlow = NeonLayers(ToggleRoot, 16, {
	{ 3, 0.65, 0.80 },
	{ 7, 0.80, 0.90 },
	{ 12, 0.90, 0.96 },
})
for _, l in ipairs(ToggleGlow) do
	Spin(l.Grad, 4)
end

local ToggleButton = New("TextButton", {
	Name = "Body",
	Size = UDim2.fromScale(1, 1),
	BackgroundColor3 = Color3.fromRGB(10, 10, 14),
	BorderSizePixel = 0,
	AutoButtonColor = false,
	Text = "",
	ZIndex = 10,
}, ToggleRoot)
Corner(ToggleButton, 16)
Gradient(ToggleButton, ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(26, 12, 16)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(8, 8, 11)),
}), 90)

local ToggleStroke = Stroke(ToggleButton, Color3.new(1, 1, 1), 2, 0)
local ToggleStrokeGrad = Gradient(ToggleStroke, NeonSequence, 0)
Spin(ToggleStrokeGrad, 4)

local ToggleLabel = New("TextLabel", {
	AnchorPoint = Vector2.new(0.5, 0.5),
	Position = UDim2.new(0.5, 0, 0.5, -2),
	Size = UDim2.fromScale(1, 0.7),
	BackgroundTransparency = 1,
	RichText = true,
	Text = "",
	Font = Enum.Font.GothamBlack,
	TextSize = 19,
	TextColor3 = COLOR.white,
	ZIndex = 12,
}, ToggleButton)
local ToggleLabelStroke = New("UIStroke", {
	Color = COLOR.neon,
	Thickness = 1.4,
	Transparency = 0.45,
	ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual,
}, ToggleLabel)

-- พระจันทร์บนปุ่มลอย
local FMoon = New("Frame", {
	AnchorPoint = Vector2.new(0.5, 0.5),
	Position = UDim2.new(0.5, 0, 0.5, -2),
	Size = UDim2.fromOffset(26, 26),
	BackgroundColor3 = Color3.fromRGB(240, 236, 255),
	BorderSizePixel = 0,
	ZIndex = 13,
}, ToggleButton)
Corner(FMoon, 13)
Gradient(FMoon, ColorSequence.new(Color3.new(1, 1, 1), Color3.fromRGB(190, 184, 230)), 45)
local FMoonStroke = Stroke(FMoon, COLOR.neon, 3, 0.55)
for _, c in ipairs({ { 15, 5, 6 }, { 5, 13, 8 }, { 16, 16, 4 } }) do
	local crater = New("Frame", {
		Position = UDim2.fromOffset(c[1], c[2]),
		Size = UDim2.fromOffset(c[3], c[3]),
		BackgroundColor3 = Color3.fromRGB(196, 190, 228),
		BorderSizePixel = 0,
		ZIndex = 14,
	}, FMoon)
	Corner(crater, c[3])
end
OnTheme(function()
	FMoonStroke.Color = COLOR.neon
end)

local ToggleBar = New("Frame", {
	Visible = false,
	AnchorPoint = Vector2.new(0.5, 1),
	Position = UDim2.new(0.5, 0, 1, -8),
	Size = UDim2.fromOffset(22, 2),
	BackgroundColor3 = Color3.new(1, 1, 1),
	BorderSizePixel = 0,
	ZIndex = 12,
}, ToggleButton)
Corner(ToggleBar, 2)
local ToggleBarGrad = Gradient(ToggleBar, ColorSequence.new(COLOR.red), 0)

local ToggleDot = New("Frame", {
	AnchorPoint = Vector2.new(1, 0),
	Position = UDim2.new(1, -7, 0, 7),
	Size = UDim2.fromOffset(6, 6),
	BackgroundColor3 = COLOR.redBright,
	BorderSizePixel = 0,
	ZIndex = 12,
}, ToggleButton)
Corner(ToggleDot, 6)

local PanelVisible = true

OnTheme(function()
	ToggleStroke.Color = Color3.new(1, 1, 1)
	ToggleStrokeGrad.Color = NeonSequence
	ToggleLabelStroke.Color = COLOR.neon
	for _, layer in ipairs(ToggleGlow) do
		layer.Stroke.Color = Color3.new(1, 1, 1)
		layer.Grad.Color = NeonSequence
	end
	ToggleBarGrad.Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0, COLOR.redDark),
		ColorSequenceKeypoint.new(0.5, COLOR.redSoft),
		ColorSequenceKeypoint.new(1, COLOR.redDark),
	})
	ToggleDot.BackgroundColor3 = PanelVisible and COLOR.redBright or Color3.fromRGB(90, 90, 100)
end)

local function SetToggleCenter(v)
	local vp = Viewport()
	local half = TOGGLE / 2 + 4
	ToggleCenter = Vector2.new(
		math.clamp(v.X, half, math.max(half, vp.X - half)),
		math.clamp(v.Y, half, math.max(half, vp.Y - half))
	)
	ToggleRoot.Position = UDim2.fromOffset(ToggleCenter.X, ToggleCenter.Y)
end

track(ToggleButton.MouseEnter:Connect(function()
	Tween(ToggleRoot, 0.18, { Size = UDim2.fromOffset(TOGGLE + 6, TOGGLE + 6) })
	Tween(ToggleStroke, 0.18, { Thickness = 2.6 })
end))
track(ToggleButton.MouseLeave:Connect(function()
	Tween(ToggleRoot, 0.18, { Size = UDim2.fromOffset(TOGGLE, TOGGLE) })
	Tween(ToggleStroke, 0.18, { Thickness = 2 })
end))

function Actions.RefreshFloating()
	ToggleRoot.Visible = Settings.ShowFloating or not PanelVisible
end

--============================================================
-- OPEN / CLOSE
--============================================================

local Animating = false
local AnimToken = 0
local POP = 26

local function SetToggleState(open)
	Tween(ToggleDot, 0.2, { BackgroundColor3 = open and COLOR.redBright or Color3.fromRGB(90, 90, 100) })
	Tween(ToggleLabel, 0.2, { TextTransparency = open and 0 or 0.4 })
end

local function OpenPanel()
	PanelVisible = true
	Animating = true
	AnimToken += 1
	local token = AnimToken
	Actions.RefreshFloating()
	Root.Visible = true
	Root.Size = UDim2.fromOffset(PanelSize.X - POP, PanelSize.Y - POP)
	Root.Position = UDim2.fromOffset(PanelPos.X + POP / 2, PanelPos.Y + POP / 2)
	Tween(Root, 0.28, {
		Size = UDim2.fromOffset(PanelSize.X, PanelSize.Y),
		Position = UDim2.fromOffset(PanelPos.X, PanelPos.Y),
	}, Enum.EasingStyle.Back)
	SetToggleState(true)
	task.delay(0.32, function()
		if token == AnimToken then
			Animating = false
			ApplyPanel()
		end
	end)
end

local function ClosePanel()
	PanelVisible = false
	Animating = true
	AnimToken += 1
	local token = AnimToken
	Actions.RefreshFloating()
	Tween(Root, 0.2, {
		Size = UDim2.fromOffset(PanelSize.X - POP, PanelSize.Y - POP),
		Position = UDim2.fromOffset(PanelPos.X + POP / 2, PanelPos.Y + POP / 2),
	}, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
	SetToggleState(false)
	task.delay(0.24, function()
		if token == AnimToken then
			Animating = false
			Root.Visible = false
			ApplyPanel()
		end
	end)
end

--============================================================
-- DRAG BINDINGS
--============================================================

local function CanMovePanel()
	return PanelVisible and not Animating
end

Draggable(ToggleButton, {
	get = function()
		return ToggleCenter
	end,
	set = SetToggleCenter,
	onClick = function()
		if PanelVisible then
			ClosePanel()
		else
			OpenPanel()
		end
	end,
})

local PanelDrag = {
	get = function()
		return PanelPos
	end,
	set = SetPanelPos,
	canStart = CanMovePanel,
}
Draggable(Header, PanelDrag)
Draggable(Sidebar, PanelDrag)

track(Close.Activated:Connect(function()
	if PanelVisible then
		ClosePanel()
	end
end))

--============================================================
-- RESIZE HANDLE
--============================================================

local Resize = New("TextButton", {
	Name = "ResizeHandle",
	AnchorPoint = Vector2.new(1, 1),
	Position = UDim2.new(1, -3, 1, -3),
	Size = UDim2.fromOffset(26, 26),
	BackgroundTransparency = 1,
	BorderSizePixel = 0,
	AutoButtonColor = false,
	Text = "",
	ZIndex = 100,
}, Main)

-- กริปจุด 3 จุด (สามเหลี่ยม) มุมขวาล่าง
local GripDots = {}
for _, p in ipairs({ { 18, 18 }, { 18, 11 }, { 11, 18 }, { 18, 4 }, { 4, 18 }, { 11, 11 } }) do
	local d = New("Frame", {
		Position = UDim2.fromOffset(p[1], p[2]),
		Size = UDim2.fromOffset(3, 3),
		BackgroundColor3 = COLOR.innerBorder,
		BorderSizePixel = 0,
		ZIndex = 101,
	}, Resize)
	Corner(d, 2)
	table.insert(GripDots, d)
end
local gripHover, gripActive = false, false
local function PaintGrip()
	local c = (gripHover or gripActive) and COLOR.redSoft or COLOR.innerBorder
	for _, d in ipairs(GripDots) do
		Tween(d, 0.15, { BackgroundColor3 = c })
	end
end
OnTheme(PaintGrip)
track(Resize.MouseEnter:Connect(function()
	gripHover = true
	PaintGrip()
end))
track(Resize.MouseLeave:Connect(function()
	gripHover = false
	PaintGrip()
end))

-- ป้ายบอกขนาดตอนลาก
local SizeTip = New("TextLabel", {
	AnchorPoint = Vector2.new(0.5, 1),
	Position = UDim2.new(0.5, 0, 1, -14),
	Size = UDim2.fromOffset(120, 24),
	BackgroundColor3 = COLOR.black,
	BackgroundTransparency = 0.1,
	Text = "",
	Font = Enum.Font.GothamBold,
	TextSize = 11,
	TextColor3 = COLOR.white,
	Visible = false,
	ZIndex = 250,
}, Main)
Corner(SizeTip, 12)
local SizeTipStroke = Stroke(SizeTip, COLOR.red, 1.5, 0.1)
OnTheme(function()
	SizeTipStroke.Color = COLOR.red
end)
local tipToken = 0

local function ShowSizeTip()
	tipToken += 1
	local token = tipToken
	SizeTip.Text = string.format("%d × %d%s", PanelSize.X, PanelSize.Y, PanelSize.X < 480 and "  ·  Compact" or "")
	SizeTip.Size = UDim2.fromOffset(PanelSize.X < 480 and 150 or 100, 24)
	SizeTip.Visible = true
	task.delay(0.9, function()
		if token == tipToken and SizeTip.Parent and not gripActive then
			SizeTip.Visible = false
		end
	end)
end

Draggable(Resize, {
	get = function()
		return PanelSize
	end,
	set = function(v)
		gripActive = true
		PaintGrip()
		SetPanelSize(v.X, v.Y)
		ShowSizeTip()
	end,
	canStart = CanMovePanel,
})
track(UIS.InputEnded:Connect(function(input)
	if gripActive and (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
		gripActive = false
		PaintGrip()
		ShowSizeTip()
	end
end))

--============================================================
-- REFIT / PULSE
--============================================================

function Actions.Refit()
	SetPanelSize(PanelSize.X, PanelSize.Y)
	SetToggleCenter(ToggleCenter)
end
track(Gui:GetPropertyChangedSignal("AbsoluteSize"):Connect(Actions.Refit))

function Actions.SetPulse(on)
	Settings.Pulse = on
	for _, t in ipairs(SpinTweens) do
		if on then
			t:Play()
		else
			t:Pause()
		end
	end
end

local PulseList = {}
for _, layer in ipairs(MainGlow) do
	table.insert(PulseList, layer)
end
for _, layer in ipairs(ToggleGlow) do
	table.insert(PulseList, layer)
end

task.spawn(function()
	local dim = false
	while not destroyed and Gui.Parent do
		if Settings.Pulse then
			for _, layer in ipairs(PulseList) do
				Tween(layer.Stroke, 1.2, { Transparency = dim and layer.Dim or layer.Bright }, Enum.EasingStyle.Sine)
			end
		end
		dim = not dim
		task.wait(1.2)
	end
end)

-- ถ้า GUI ถูกลบจากภายนอก ให้ cleanup ตามด้วย
track(Gui.AncestryChanged:Connect(function(_, parent)
	if not parent then
		cleanup()
	end
end))

--============================================================
-- MOUNT + START
--============================================================

do
	local ok = pcall(function()
		Gui.Parent = game:GetService("CoreGui")
	end)
	if not ok or not Gui.Parent then
		Gui.Parent = LocalPlayer:WaitForChild("PlayerGui")
	end
end

Actions.SetPulse(Settings.Pulse)
Actions.SetStars(Settings.Stars)
if Settings.Rainbow then
	Actions.SetRainbow(true, true)
end
Actions.ApplyLayout()
Actions.Refit()
Actions.RefreshFloating()
Actions.ActivateTab("Overview")

print("[LUNAR Hub] Loaded successfully")
