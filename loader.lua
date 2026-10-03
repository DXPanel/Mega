local __lunar_cache = {}
local function __lunars(h)
    local v = __lunar_cache[h]
    if v ~= nil then
        return v
    end
    local t = {}
    for i = 1, #h, 2 do
        t[#t + 1] = string.char(tonumber(h:sub(i, i + 1), 16))
    end
    v = table.concat(t)
    __lunar_cache[h] = v
    return v
end
local Players = game:GetService(__lunars("506c6179657273"))
local TweenService = game:GetService(__lunars("547765656e53657276696365"))
local RunService = game:GetService(__lunars("52756e53657276696365"))
local StarterGui = game:GetService(__lunars("53746172746572477569"))

local LocalPlayer = Players.LocalPlayer
if not LocalPlayer then
	warn(__lunars("5b4c554e4152204c6f616465725d204c6f63616c506c61796572206e6f7420617661696c61626c6520286d7573742072756e206f6e20636c69656e7429"))
	return
end

local args = { ... }
local Config = type(args[1]) == __lunars("7461626c65") and args[1] or {}

local TITLE = Config.Title or __lunars("4c554e415220485542")
local SUBTITLE = Config.Subtitle or __lunars("5052454d49554d20494e54455246414345")
local LOAD_TIME = Config.LoadTime or 3.2 
local SCRIPTS = Config.Scripts
    or {
        {
            Name = __lunars("4c6f6f7420546f20466f726765"),
            Description = __lunars("31204c6f6f7420546f20466f726765"),
            Image = __lunars("7262787468756d623a2f2f747970653d47616d6549636f6e2669643d313036383437353038373926773d31353026683d313530"),
            Url = __lunars("68747470733a2f2f7261772e67697468756275736572636f6e74656e742e636f6d2f445850616e656c2f4d6567612f726566732f68656164732f6d61696e2f4c6f6f74546f466f7267652e6c7561"),
            PlaceIds = {118805555015549},
        },
    }

local C = {
	bg = Color3.fromRGB(8, 6, 17),
	panel = Color3.fromRGB(14, 10, 28),
	card = Color3.fromRGB(22, 15, 40),
	cardHover = Color3.fromRGB(34, 22, 66),
	line = Color3.fromRGB(52, 38, 92),
	purple = Color3.fromRGB(155, 92, 255),
	blue = Color3.fromRGB(61, 165, 255),
	pink = Color3.fromRGB(255, 92, 200),
	white = Color3.fromRGB(245, 245, 248),
	grey = Color3.fromRGB(150, 145, 175),
}

local NEON = ColorSequence.new({
	ColorSequenceKeypoint.new(0, C.purple),
	ColorSequenceKeypoint.new(0.35, C.blue),
	ColorSequenceKeypoint.new(0.7, C.pink),
	ColorSequenceKeypoint.new(1, C.purple),
})

local function GetScriptIcon(entry)
    return entry and entry.Image or __lunars("7262787468756d623a2f2f747970653d47616d6549636f6e2669643d31313838303535353530313535343926773d31353026683d313530")
end

local function New(class, props, parent)
	local obj = Instance.new(class)
	for k, v in pairs(props or {}) do
		obj[k] = v
	end
	obj.Parent = parent
	return obj
end

local function Corner(obj, radius)
	return New(__lunars("5549436f726e6572"), { CornerRadius = UDim.new(0, radius) }, obj)
end

local function Stroke(obj, color, thickness, transparency)
	return New(__lunars("55495374726f6b65"), {
		Color = color,
		Thickness = thickness or 1,
		Transparency = transparency or 0,
		ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
	}, obj)
end

local function Gradient(obj, seq, rotation)
	return New(__lunars("55494772616469656e74"), { Color = seq, Rotation = rotation or 0 }, obj)
end

local function Tween(obj, time, props, style, dir)
	local t = TweenService:Create(
		obj,
		TweenInfo.new(time, style or Enum.EasingStyle.Quart, dir or Enum.EasingDirection.Out),
		props
	)
	t:Play()
	return t
end

local function Label(parent, props)
	local p = {
		BackgroundTransparency = 1,
		Font = Enum.Font.Gotham,
		TextSize = 14,
		TextColor3 = C.white,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextYAlignment = Enum.TextYAlignment.Center,
		BorderSizePixel = 0,
	}
	for k, v in pairs(props) do
		p[k] = v
	end
	return New(__lunars("546578744c6162656c"), p, parent)
end

local originals = setmetatable({}, { __mode = __lunars("6b") })

local function FadeProps(inst)
	if inst:IsA(__lunars("55495374726f6b65")) then
		return { __lunars("5472616e73706172656e6379") }
	elseif inst:IsA(__lunars("546578744c6162656c")) or inst:IsA(__lunars("54657874427574746f6e")) or inst:IsA(__lunars("54657874426f78")) then
		return { __lunars("4261636b67726f756e645472616e73706172656e6379"), __lunars("546578745472616e73706172656e6379"), __lunars("546578745374726f6b655472616e73706172656e6379") }
	elseif inst:IsA(__lunars("496d6167654c6162656c")) or inst:IsA(__lunars("496d616765427574746f6e")) then
		return { __lunars("4261636b67726f756e645472616e73706172656e6379"), __lunars("496d6167655472616e73706172656e6379") }
	elseif inst:IsA(__lunars("5363726f6c6c696e674672616d65")) then
		return { __lunars("4261636b67726f756e645472616e73706172656e6379"), __lunars("5363726f6c6c426172496d6167655472616e73706172656e6379") }
	elseif inst:IsA(__lunars("4775694f626a656374")) then
		return { __lunars("4261636b67726f756e645472616e73706172656e6379") }
	end
	return nil
end

local function Fade(root, show, duration)
	local list = root:GetDescendants()
	table.insert(list, root)
	for _, inst in ipairs(list) do
		local names = FadeProps(inst)
		if names then
			local orig = originals[inst]
			if not orig then
				orig = {}
				for _, n in ipairs(names) do
					orig[n] = inst[n]
				end
				originals[inst] = orig
			end
			local goal = {}
			for n, v in pairs(orig) do
				goal[n] = show and v or 1
			end
			if duration and duration > 0 then
				Tween(inst, duration, goal, Enum.EasingStyle.Quad)
			else
				for n, v in pairs(goal) do
					inst[n] = v
				end
			end
		end
	end
end

local function HashHue(text)
	local h = 0
	for i = 1, #text do
		h = (h * 31 + string.byte(text, i)) % 360
	end
	return h / 360
end

local function FirstChar(text)
	local ok, nextPos = pcall(utf8.offset, text, 2)
	if ok and nextPos then
		return string.sub(text, 1, nextPos - 1)
	end
	return string.sub(text, 1, 1)
end

local function MakeMoon(parent, size, pos)
	local Disc = New(__lunars("4672616d65"), {
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = pos,
		Size = UDim2.fromOffset(size, size),
		BackgroundColor3 = Color3.fromRGB(240, 236, 255),
		BorderSizePixel = 0,
	}, parent)
	Corner(Disc, size)
	Gradient(Disc, ColorSequence.new(Color3.new(1, 1, 1), Color3.fromRGB(190, 184, 230)), 45)
	for _, c in ipairs({ { 0.58, 0.14, 0.2 }, { 0.14, 0.42, 0.26 }, { 0.6, 0.6, 0.16 } }) do
		local cr = New(__lunars("4672616d65"), {
			Position = UDim2.fromScale(c[1], c[2]),
			Size = UDim2.fromScale(c[3], c[3]),
			BackgroundColor3 = Color3.fromRGB(196, 190, 228),
			BorderSizePixel = 0,
		}, Disc)
		Corner(cr, 100)
	end
	return Disc
end

local Launch 
local function Execute(entry)
    if entry.PlaceIds and #entry.PlaceIds > 0 then
        local matched = false
        for _, allowedPlaceId in ipairs(entry.PlaceIds) do
            if tonumber(allowedPlaceId) == tonumber(game.PlaceId) then
                matched = true
                break
            end
        end

        if not matched then
            pcall(function()
                StarterGui:SetCore(__lunars("53656e644e6f74696669636174696f6e"), {
                    Title = __lunars("4c554e4152204c6f61646572"),
                    Text = __lunars("e0b8aae0b884e0b8a3e0b8b4e0b89be0b895e0b98ce0b899e0b8b5e0b989e0b983e0b88ae0b989e0b881e0b8b1e0b89ae0b981e0b8a1e0b89ee0b899e0b8b5e0b989e0b984e0b8a1e0b988e0b984e0b894e0b989"),
                    Duration = 4
                })
            end)
            return false, __lunars("5468697320736372697074206973206e6f7420666f7220746869732067616d65")
        end
    end

    if not entry.Url then
        return false, __lunars("4e6f207363726970742055524c")
    end

    local ok, result = pcall(function()
        local source = game:HttpGet(entry.Url)
        local fn = loadstring(source)
        if type(fn) ~= __lunars("66756e6374696f6e") then
            error(__lunars("4661696c656420746f20636f6d70696c6520736372697074"))
        end
        return fn()
    end)

    if not ok then
        return false, tostring(result)
    end

    return true
end

Launch = function(notice)
			
	do
		local containers = { LocalPlayer:FindFirstChild(__lunars("506c61796572477569")) }
		pcall(function()
			table.insert(containers, game:GetService(__lunars("436f7265477569")))
		end)
		for _, c in ipairs(containers) do
			local old = c and c:FindFirstChild(__lunars("4c756e61724c6f61646572477569"))
			if old then
				pcall(function()
					old:Destroy()
				end)
			end
		end
	end

	local Gui = New(__lunars("53637265656e477569"), {
		Name = __lunars("4c756e61724c6f61646572477569"),
		ResetOnSpawn = false,
		IgnoreGuiInset = true,
		DisplayOrder = 1000,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
	})

	local okParent = pcall(function()
		Gui.Parent = (gethui and gethui()) or game:GetService(__lunars("436f7265477569"))
	end)
	if not okParent or not Gui.Parent then
		Gui.Parent = LocalPlayer:WaitForChild(__lunars("506c61796572477569"))
	end

	local Root = New(__lunars("4672616d65"), {
		Name = __lunars("526f6f74"),
		Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
	}, Gui)

	local Backdrop = New(__lunars("4672616d65"), {
		Name = __lunars("4261636b64726f70"),
		Size = UDim2.fromScale(1, 1),
		BackgroundColor3 = C.bg,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ClipsDescendants = true,
	}, Root)

	local function Viewport()
		local s = Gui.AbsoluteSize
		if s.X < 50 or s.Y < 50 then
			local cam = workspace.CurrentCamera
			s = cam and cam.ViewportSize or Vector2.new(1280, 720)
		end
		return s
	end

	local Stars = {}
	for _ = 1, 48 do
		local size = math.random(1, 3)
		local f = New(__lunars("4672616d65"), {
			Position = UDim2.fromScale(math.random(), math.random()),
			Size = UDim2.fromOffset(size, size),
			BackgroundColor3 = Color3.new(1, 1, 1),
			BackgroundTransparency = 0.6,
			BorderSizePixel = 0,
		}, Backdrop)
		Corner(f, 3)
		table.insert(Stars, {
			Frame = f,
			Base = 0.35 + math.random() * 0.3,
			Amp = 0.25,
			Speed = 1 + math.random() * 2.5,
			Phase = math.random() * 6.28,
		})
	end

	local function Shoot()
		local v = Viewport()
		local ang = math.rad(25)
		local start = Vector2.new(v.X * (0.05 + math.random() * 0.55), v.Y * math.random() * 0.35)
		local goal = start + Vector2.new(math.cos(ang), math.sin(ang)) * 460
		local star = New(__lunars("4672616d65"), {
			AnchorPoint = Vector2.new(1, 0.5),
			Position = UDim2.fromOffset(start.X, start.Y),
			Size = UDim2.fromOffset(100, 2),
			Rotation = 25,
			BackgroundColor3 = Color3.new(1, 1, 1),
			BorderSizePixel = 0,
			ZIndex = 2,
		}, Backdrop)
		Corner(star, 2)
		New(__lunars("55494772616469656e74"), { Transparency = NumberSequence.new(1, 0) }, star)
		Tween(star, 0.95, { Position = UDim2.fromOffset(goal.X, goal.Y) }, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
		task.delay(1, function()
			star:Destroy()
		end)
	end

	local Stage = New(__lunars("4672616d65"), {
		Name = __lunars("5374616765"),
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.5),
		Size = UDim2.fromOffset(400, 290),
		BackgroundTransparency = 1,
	}, Root)
	local StageScale = New(__lunars("55495363616c65"), {}, Stage)

	local LogoGroup = New(__lunars("4672616d65"), {
		Size = UDim2.fromOffset(400, 200),
		BackgroundTransparency = 1,
	}, Stage)

	local Glow = New(__lunars("4672616d65"), {
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromOffset(200, 100),
		Size = UDim2.fromOffset(190, 190),
		BackgroundColor3 = C.purple,
		BackgroundTransparency = 0.88,
		BorderSizePixel = 0,
	}, LogoGroup)
	Corner(Glow, 100)
	local GlowScale = New(__lunars("55495363616c65"), {}, Glow)

	local Glow2 = New(__lunars("4672616d65"), {
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromOffset(200, 100),
		Size = UDim2.fromOffset(140, 140),
		BackgroundColor3 = C.pink,
		BackgroundTransparency = 0.9,
		BorderSizePixel = 0,
	}, LogoGroup)
	Corner(Glow2, 100)

	local Ring = New(__lunars("4672616d65"), {
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromOffset(200, 100),
		Size = UDim2.fromOffset(112, 112),
		BackgroundTransparency = 1,
	}, LogoGroup)
	Corner(Ring, 60)
	local RingStroke = Stroke(Ring, Color3.new(1, 1, 1), 3, 0)
	local RingGradient = Gradient(RingStroke, NEON, 0)

	local Moon = MakeMoon(LogoGroup, 72, UDim2.fromOffset(200, 100))
	Stroke(Moon, C.purple, 3, 0.6)

	local Orbit = {}
	for i, s in ipairs({ { 9, 0 }, { 6, 0.45 }, { 4, 0.7 } }) do
		local d = New(__lunars("4672616d65"), {
			AnchorPoint = Vector2.new(0.5, 0.5),
			Size = UDim2.fromOffset(s[1], s[1]),
			BackgroundColor3 = i == 1 and Color3.new(1, 1, 1) or C.blue,
			BackgroundTransparency = s[2],
			BorderSizePixel = 0,
		}, LogoGroup)
		Corner(d, 6)
		table.insert(Orbit, d)
	end

	local TextGroup = New(__lunars("4672616d65"), {
		Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = 1,
	}, Stage)

	local spacedTitle = {}
	for _, cp in utf8.codes(TITLE) do
		table.insert(spacedTitle, utf8.char(cp))
	end
	spacedTitle = table.concat(spacedTitle, __lunars("20"))

	local TitleLabel = Label(TextGroup, {
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromOffset(200, 192),
		Size = UDim2.fromOffset(400, 34),
		Text = spacedTitle,
		Font = Enum.Font.GothamBlack,
		TextSize = 28,
		TextXAlignment = Enum.TextXAlignment.Center,
		MaxVisibleGraphemes = 0,
	})
	Gradient(TitleLabel, NEON, 0)

	Label(TextGroup, {
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromOffset(200, 220),
		Size = UDim2.fromOffset(400, 16),
		Text = SUBTITLE,
		Font = Enum.Font.GothamMedium,
		TextSize = 11,
		TextColor3 = Color3.fromRGB(165, 155, 205),
		TextXAlignment = Enum.TextXAlignment.Center,
	})

	local BarTrack = New(__lunars("4672616d65"), {
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromOffset(200, 250),
		Size = UDim2.fromOffset(260, 6),
		BackgroundColor3 = Color3.fromRGB(30, 22, 56),
		BorderSizePixel = 0,
	}, TextGroup)
	Corner(BarTrack, 3)
	local BarFill = New(__lunars("4672616d65"), {
		Size = UDim2.fromScale(0, 1),
		BackgroundColor3 = Color3.new(1, 1, 1),
		BorderSizePixel = 0,
	}, BarTrack)
	Corner(BarFill, 3)
	Gradient(BarFill, NEON, 0)

	local StatusLabel = Label(TextGroup, {
		Position = UDim2.fromOffset(70, 262),
		Size = UDim2.fromOffset(190, 16),
		Text = __lunars("496e697469616c697a696e672e2e2e"),
		Font = Enum.Font.GothamMedium,
		TextSize = 11,
		TextColor3 = C.grey,
	})
	local PercentLabel = Label(TextGroup, {
		Position = UDim2.fromOffset(270, 262),
		Size = UDim2.fromOffset(60, 16),
		Text = __lunars("3025"),
		Font = Enum.Font.GothamBold,
		TextSize = 11,
		TextColor3 = C.white,
		TextXAlignment = Enum.TextXAlignment.Right,
	})

	local STATUS = {
		{ 0, __lunars("496e697469616c697a696e672e2e2e") },
		{ 0.25, __lunars("4c6f6164696e67206d6f64756c65732e2e2e") },
		{ 0.5, __lunars("53796e63696e6720696e746572666163652e2e2e") },
		{ 0.75, __lunars("507265706172696e6720736372697074732e2e2e") },
		{ 0.97, __lunars("5265616479") },
	}

	local Panel, PanelScale
	local panelFit, panelReady = 1, false
	local closing = false
	local Quit 
	local function Fit()
		local v = Viewport()
		StageScale.Scale = math.clamp(v.Y / 720, 0.6, 1.5)
		panelFit = math.clamp(math.min(v.X * 0.8 / 580, v.Y * 0.8 / 360), 0.5, 1.6)
		if PanelScale and panelReady then
			PanelScale.Scale = panelFit
		end
	end

	local spinners = {} 
	local function BuildPanel()
		Panel = New(__lunars("4672616d65"), {
			Name = __lunars("50616e656c"),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.fromOffset(580, 360),
			BackgroundColor3 = C.panel,
			BorderSizePixel = 0,
		}, Root)
		Corner(Panel, 16)
		PanelScale = New(__lunars("55495363616c65"), { Scale = panelFit }, Panel)

		local pStroke = Stroke(Panel, Color3.new(1, 1, 1), 2, 0)
		table.insert(spinners, { Gradient(pStroke, NEON, 0), 70 })

				MakeMoon(Panel, 34, UDim2.fromOffset(33, 33))
		Label(Panel, {
			Position = UDim2.fromOffset(58, 12),
			Size = UDim2.fromOffset(320, 24),
			Text = __lunars("53656c65637420536372697074"),
			Font = Enum.Font.GothamBold,
			TextSize = 20,
		})
		local SubLabel = Label(Panel, {
			Position = UDim2.fromOffset(58, 37),
			Size = UDim2.fromOffset(380, 16),
			Text = __lunars("e0b980e0b8a5e0b8b7e0b8ade0b881e0b8aae0b884e0b8a3e0b8b4e0b89be0b895e0b98ce0b897e0b8b5e0b988e0b895e0b989e0b8ade0b887e0b881e0b8b2e0b8a3e0b8a3e0b8b1e0b8992020c2b72020") .. #SCRIPTS .. __lunars("20e0b8a3e0b8b2e0b8a2e0b881e0b8b2e0b8a3"),
			TextSize = 12,
			TextColor3 = C.grey,
		})
		if notice then
			local normalText = SubLabel.Text
			SubLabel.Text = __lunars("2120") .. notice
			SubLabel.TextColor3 = Color3.fromRGB(255, 110, 120)
			task.delay(6, function()
				if SubLabel.Parent then
					SubLabel.Text = normalText
					Tween(SubLabel, 0.3, { TextColor3 = C.grey })
				end
			end)
		end

		local Close = New(__lunars("54657874427574746f6e"), {
			Position = UDim2.fromOffset(534, 16),
			Size = UDim2.fromOffset(30, 30),
			BackgroundColor3 = C.card,
			AutoButtonColor = false,
			Text = __lunars("c397"),
			Font = Enum.Font.GothamBold,
			TextSize = 20,
			TextColor3 = C.grey,
			BorderSizePixel = 0,
		}, Panel)
		Corner(Close, 9)
		local closeStroke = Stroke(Close, C.line, 1, 0)
		Close.MouseEnter:Connect(function()
			Tween(closeStroke, 0.15, { Color = C.pink })
			Tween(Close, 0.15, { TextColor3 = C.white })
		end)
		Close.MouseLeave:Connect(function()
			Tween(closeStroke, 0.15, { Color = C.line })
			Tween(Close, 0.15, { TextColor3 = C.grey })
		end)
		Close.Activated:Connect(function()
			Quit(nil)
		end)

				local SearchWrap = New(__lunars("4672616d65"), {
			Position = UDim2.fromOffset(16, 68),
			Size = UDim2.fromOffset(548, 34),
			BackgroundColor3 = C.card,
			BorderSizePixel = 0,
		}, Panel)
		Corner(SearchWrap, 10)
		local searchStroke = Stroke(SearchWrap, C.line, 1, 0)
		local Search = New(__lunars("54657874426f78"), {
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			Text = __lunars(""),
			PlaceholderText = __lunars("e0b884e0b989e0b899e0b8abe0b8b2e0b8aae0b884e0b8a3e0b8b4e0b89be0b895e0b98c2e2e2e"),
			PlaceholderColor3 = Color3.fromRGB(110, 102, 140),
			ClearTextOnFocus = false,
			Font = Enum.Font.Gotham,
			TextSize = 14,
			TextColor3 = C.white,
			TextXAlignment = Enum.TextXAlignment.Left,
			BorderSizePixel = 0,
		}, SearchWrap)
		New(__lunars("554950616464696e67"), { PaddingLeft = UDim.new(0, 14), PaddingRight = UDim.new(0, 14) }, Search)
		Search.Focused:Connect(function()
			Tween(searchStroke, 0.15, { Color = C.purple })
		end)
		Search.FocusLost:Connect(function()
			Tween(searchStroke, 0.15, { Color = C.line })
		end)

				local List = New(__lunars("5363726f6c6c696e674672616d65"), {
			Position = UDim2.fromOffset(16, 112),
			Size = UDim2.fromOffset(548, 232),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ScrollBarThickness = 3,
			ScrollBarImageColor3 = C.purple,
			CanvasSize = UDim2.new(),
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			ScrollingDirection = Enum.ScrollingDirection.Y,
		}, Panel)
		New(__lunars("55494c6973744c61796f7574"), { Padding = UDim.new(0, 8), SortOrder = Enum.SortOrder.LayoutOrder }, List)
		New(__lunars("554950616464696e67"), {
			PaddingTop = UDim.new(0, 2),
			PaddingLeft = UDim.new(0, 2),
			PaddingRight = UDim.new(0, 10),
			PaddingBottom = UDim.new(0, 4),
		}, List)

		local Empty = Label(Panel, {
			Position = UDim2.fromOffset(16, 150),
			Size = UDim2.fromOffset(548, 30),
			Text = __lunars("e0b984e0b8a1e0b988e0b89ee0b89ae0b8aae0b884e0b8a3e0b8b4e0b89be0b895e0b98ce0b897e0b8b5e0b988e0b884e0b989e0b899e0b8abe0b8b2"),
			TextColor3 = C.grey,
			TextXAlignment = Enum.TextXAlignment.Center,
			Visible = false,
		})

		local cards = {}

		for index, entry in ipairs(SCRIPTS) do
			local name = tostring(entry.Name or (__lunars("53637269707420") .. index))
			local desc = tostring(entry.Description or __lunars(""))

			local Card = New(__lunars("54657874427574746f6e"), {
				Size = UDim2.new(1, 0, 0, 76),
				BackgroundColor3 = C.card,
				AutoButtonColor = false,
				Text = __lunars(""),
				LayoutOrder = index,
				BorderSizePixel = 0,
			}, List)
			Corner(Card, 12)
			local cardStroke = Stroke(Card, C.line, 1.5, 0)

						local hue = HashHue(name)
			local Thumb = New(__lunars("4672616d65"), {
				Position = UDim2.fromOffset(8, 8),
				Size = UDim2.fromOffset(60, 60),
				BackgroundColor3 = Color3.fromHSV(hue, 0.55, 0.9),
				BorderSizePixel = 0,
			}, Card)
			Corner(Thumb, 10)
			Gradient(Thumb, ColorSequence.new(Color3.new(1, 1, 1), Color3.fromRGB(110, 90, 150)), 45)

			local img = entry.Image
			if img ~= nil and tostring(img) ~= __lunars("") then
				local id = tostring(img)
				if id:match(__lunars("5e25642b24")) then
					id = __lunars("726278617373657469643a2f2f") .. id
				end
				local pic = New(__lunars("496d6167654c6162656c"), {
					Size = UDim2.fromScale(1, 1),
					BackgroundTransparency = 1,
					Image = id,
					ScaleType = Enum.ScaleType.Crop,
					BorderSizePixel = 0,
					Visible = true,
				}, Thumb)
				Corner(pic, 10)

																if id:find(__lunars("47616d6549636f6e")) then
					local fallback = New(__lunars("496d6167654c6162656c"), {
						Size = UDim2.fromScale(1, 1),
						BackgroundTransparency = 1,
						Image = __lunars("7262787468756d623a2f2f747970653d47616d6549636f6e2669643d31313838303535353530313535343926773d31353026683d313530"),
						ScaleType = Enum.ScaleType.Crop,
						BorderSizePixel = 0,
						ZIndex = pic.ZIndex + 1,
					}, Thumb)
					Corner(fallback, 10)
				end
			else
				Label(Thumb, {
					Size = UDim2.fromScale(1, 1),
					Text = string.upper(FirstChar(name)),
					Font = Enum.Font.GothamBlack,
					TextSize = 26,
					TextXAlignment = Enum.TextXAlignment.Center,
				})
			end

			Label(Card, {
				Position = UDim2.fromOffset(80, 12),
				Size = UDim2.new(1, -176, 0, 20),
				Text = name,
				Font = Enum.Font.GothamBold,
				TextSize = 15,
				TextTruncate = Enum.TextTruncate.AtEnd,
			})
			Label(Card, {
				Position = UDim2.fromOffset(80, 34),
				Size = UDim2.new(1, -176, 0, 32),
				Text = desc,
				TextSize = 12,
				TextColor3 = C.grey,
				TextWrapped = true,
				TextYAlignment = Enum.TextYAlignment.Top,
				TextTruncate = Enum.TextTruncate.AtEnd,
			})

			local Pill = New(__lunars("4672616d65"), {
				AnchorPoint = Vector2.new(1, 0.5),
				Position = UDim2.new(1, -12, 0.5, 0),
				Size = UDim2.fromOffset(64, 28),
				BackgroundColor3 = Color3.new(1, 1, 1),
				BorderSizePixel = 0,
			}, Card)
			Corner(Pill, 14)
			Gradient(Pill, ColorSequence.new(C.purple, C.blue), 0)
			Label(Pill, {
				Size = UDim2.fromScale(1, 1),
				Text = __lunars("52554e"),
				Font = Enum.Font.GothamBold,
				TextSize = 12,
				TextXAlignment = Enum.TextXAlignment.Center,
			})

			Card.MouseEnter:Connect(function()
				if closing then
					return
				end
				Tween(Card, 0.15, { BackgroundColor3 = C.cardHover })
				Tween(cardStroke, 0.15, { Color = C.purple })
			end)
			Card.MouseLeave:Connect(function()
				if closing then
					return
				end
				Tween(Card, 0.15, { BackgroundColor3 = C.card })
				Tween(cardStroke, 0.15, { Color = C.line })
			end)
			Card.Activated:Connect(function()
				if closing then
					return
				end
				Tween(cardStroke, 0.1, { Color = C.pink, Thickness = 2.5 })
				Tween(Card, 0.1, { BackgroundColor3 = C.cardHover })
				task.wait(0.12)
				Quit(entry)
			end)

			table.insert(cards, { Frame = Card, Key = string.lower(name .. __lunars("20") .. desc) })
		end

		Search:GetPropertyChangedSignal(__lunars("54657874")):Connect(function()
			local q = string.lower(Search.Text)
			local shown = 0
			for _, c in ipairs(cards) do
				local hit = q == __lunars("") or string.find(c.Key, q, 1, true) ~= nil
				c.Frame.Visible = hit
				if hit then
					shown += 1
				end
			end
			Empty.Visible = shown == 0
		end)

				Fade(Panel, false, 0)
		PanelScale.Scale = panelFit * 0.88
		Tween(PanelScale, 0.55, { Scale = panelFit }, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
		Fade(Panel, true, 0.45)
		task.delay(0.6, function()
			panelReady = true
		end)
	end

	local t = 0
	local starsOn = true
	local nextShoot = 1.2
	local loading = false
	local loadStart = 0
	local loadDone = false
	local conn

	local PROGRESS_DELAY = 0.7
	local loadTime = notice and math.min(LOAD_TIME, 1.6) or LOAD_TIME

	conn = RunService.Heartbeat:Connect(function(dt)
		t += dt

				RingGradient.Rotation = (t * 200) % 360
		for _, s in ipairs(spinners) do
			s[1].Rotation = (t * s[2]) % 360
		end

				if starsOn then
			for _, s in ipairs(Stars) do
				s.Frame.BackgroundTransparency = s.Base + s.Amp * math.sin(t * s.Speed + s.Phase)
			end
			nextShoot -= dt
			if nextShoot <= 0 then
				nextShoot = 2.5 + math.random() * 3.5
				Shoot()
			end
		end

				if Stage.Visible then
			GlowScale.Scale = 1 + 0.09 * math.sin(t * 2)
			Moon.Position = UDim2.fromOffset(200, 100 + 3 * math.sin(t * 1.6))
			for i, d in ipairs(Orbit) do
				local a = t * 2.6 - (i - 1) * 0.38
				d.Position = UDim2.fromOffset(200 + 66 * math.cos(a), 100 + 66 * math.sin(a))
			end
		end

				if loading then
			local lt = t - loadStart
			local n = math.clamp(math.floor((lt - 0.15) / 0.08), 0, #spacedTitle)
			TitleLabel.MaxVisibleGraphemes = n

			local x = math.clamp((lt - PROGRESS_DELAY) / loadTime, 0, 1)
			local p = x * x * (3 - 2 * x)
			BarFill.Size = UDim2.fromScale(p, 1)
			PercentLabel.Text = math.floor(p * 100) .. __lunars("25")
			for _, s in ipairs(STATUS) do
				if p >= s[1] then
					StatusLabel.Text = s[2]
				end
			end
			if x >= 1 and lt > PROGRESS_DELAY + loadTime + 0.3 then
				loading = false
				loadDone = true
			end
		end
	end)

	local function Shutdown()
		if conn then
			conn:Disconnect()
			conn = nil
		end
		Gui:Destroy()
	end

	Quit = function(entry)
		if closing then
			return
		end
		closing = true
		starsOn = false
		if PanelScale then
			Tween(PanelScale, 0.6, { Scale = panelFit * 0.94 }, Enum.EasingStyle.Quad)
		end
		Fade(Root, false, 0.6)
		task.wait(0.65)
		Shutdown()
		if entry then
			task.spawn(Execute, entry)
		end
	end

	Fit()
	Gui:GetPropertyChangedSignal(__lunars("4162736f6c75746553697a65")):Connect(Fit)

	Fade(LogoGroup, false, 0)
	Fade(TextGroup, false, 0)
	Tween(Backdrop, 0.6, { BackgroundTransparency = 0.06 }, Enum.EasingStyle.Quad)
	task.wait(0.1)
	Fade(LogoGroup, true, 0.8)
	loadStart = t
	loading = true
	task.delay(0.45, function()
		if Gui.Parent then
			Fade(TextGroup, true, 0.5)
		end
	end)

	repeat
		task.wait()
	until loadDone or not Gui.Parent

	if Gui.Parent then
				Fade(Stage, false, 0.45)
		task.wait(0.5)
		Stage.Visible = false
		Tween(Backdrop, 0.5, { BackgroundTransparency = 0.35 }, Enum.EasingStyle.Quad)
		BuildPanel()
	end
end

Launch(nil)
