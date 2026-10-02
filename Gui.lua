-- DXPanel Stable Extreme Obfuscation
-- Runtime string decoder; no external loader/dependency.
local __dxs_cache = {}
local function __dxs(h)
    local v = __dxs_cache[h]
    if v ~= nil then return v end
    local t = {}
    for i = 1, #h, 2 do
        t[#t + 1] = string.char(tonumber(h:sub(i, i + 1), 16))
    end
    v = table.concat(t)
    __dxs_cache[h] = v
    return v
end
local Players = game : GetService ( __dxs("506c6179657273") ) local UIS = game : GetService (
__dxs("55736572496e70757453657276696365") ) local RunService = game : GetService (
__dxs("52756e53657276696365") ) local TweenService = game : GetService (
__dxs("547765656e53657276696365") ) local HttpService = game : GetService (
__dxs("4874747053657276696365") ) local MarketplaceService = game : GetService (
__dxs("4d61726b6574706c61636553657276696365") ) local Stats = game : GetService (
__dxs("5374617473") ) if _G . DXPanelCleanup then pcall ( _G . DXPanelCleanup ) _G . DXPanelCleanup
= nil end local LocalPlayer = Players . LocalPlayer if not LocalPlayer then warn (
__dxs("5b445850616e656c5d204c6f63616c506c61796572206e6f7420617661696c61626c6520286d7573742072756e206f6e20636c69656e7429")
) return end local args = { ... } local Context = type ( args [ 1 ] ) == __dxs("7461626c65") and
args [ 1 ] or { } local Hooks = type ( Context . Hooks ) == __dxs("7461626c65") and Context . Hooks
or { } local DX_TAB_ICONS = { [ __dxs("4f76657276696577") ] =
__dxs("726278617373657469643a2f2f3138393739353234363436") , [ __dxs("53657474696e67") ] =
__dxs("726278617373657469643a2f2f313338353732343938313936343130") , [ __dxs("53657474696e6773") ] =
__dxs("726278617373657469643a2f2f313338353732343938313936343130") , [ __dxs("4661726d") ] =
__dxs("726278617373657469643a2f2f3138373737343037343336") , [ __dxs("44756e67656f6e") ] =
__dxs("726278617373657469643a2f2f3136363135373933383332") , [ __dxs("496e666f") ] =
__dxs("726278617373657469643a2f2f3731383730393836323630333938") , [ __dxs("466f726765") ] =
__dxs("726278617373657469643a2f2f39333934373931323331") , } local DEFAULT_SETTINGS = { Animate =
true , Pulse = true , ShowFloating = true , AutoLoad = false , ThemeColor = __dxs("454231453334") ,
} local SETTINGS_FILE = __dxs("445850616e656c5f53657474696e67732e6a736f6e") local function copyTable
( t ) local c = { } for k , v in pairs ( t ) do c [ k ] = v end return c end local function
HexToColor3 ( hex ) if type ( hex ) ~= __dxs("737472696e67") then return nil end hex = hex : gsub (
__dxs("5b2325735d") , __dxs("") ) if # hex ~= 6 then return nil end local r = tonumber ( hex : sub (
1 , 2 ) , 16 ) local g = tonumber ( hex : sub ( 3 , 4 ) , 16 ) local b = tonumber ( hex : sub ( 5 ,
6 ) , 16 ) if not ( r and g and b ) then return nil end return Color3 . fromRGB ( r , g , b ) end
local function Color3ToHex ( c ) return string . format ( __dxs("253032582530325825303258") , math .
floor ( c . R * 255 + 0 . 5 ) , math . floor ( c . G * 255 + 0 . 5 ) , math . floor ( c . B * 255 +
0 . 5 ) ) end local Settings = copyTable ( DEFAULT_SETTINGS ) local hasFileApi = type ( isfile ) ==
__dxs("66756e6374696f6e") and type ( readfile ) == __dxs("66756e6374696f6e") and type ( writefile )
== __dxs("66756e6374696f6e") local function saveSettings ( ) if not hasFileApi then return end pcall
( function ( ) writefile ( SETTINGS_FILE , HttpService : JSONEncode ( Settings ) ) end ) end do if
hasFileApi then pcall ( function ( ) if not isfile ( SETTINGS_FILE ) then return end local data =
HttpService : JSONDecode ( readfile ( SETTINGS_FILE ) ) if type ( data ) ~= __dxs("7461626c65") then
return end for _ , key in ipairs ( { __dxs("416e696d617465") , __dxs("50756c7365") ,
__dxs("53686f77466c6f6174696e67") , __dxs("4175746f4c6f6164") } ) do if type ( data [ key ] ) ==
__dxs("626f6f6c65616e") then Settings [ key ] = data [ key ] end end if HexToColor3 ( data .
ThemeColor ) then Settings . ThemeColor = data . ThemeColor end end ) end end local COLOR = { red =
Color3 . fromRGB ( 235 , 30 , 52 ) , redBright = Color3 . fromRGB ( 255 , 70 , 90 ) , redSoft =
Color3 . fromRGB ( 255 , 110 , 125 ) , redDark = Color3 . fromRGB ( 90 , 8 , 18 ) , neon = Color3 .
fromRGB ( 255 , 45 , 75 ) , black = Color3 . fromRGB ( 8 , 8 , 11 ) , black2 = Color3 . fromRGB ( 14
, 10 , 12 ) , sidebar = Color3 . fromRGB ( 12 , 12 , 16 ) , sidebar2 = Color3 . fromRGB ( 16 , 12 ,
14 ) , innerBg = Color3 . fromRGB ( 25 , 12 , 17 ) , innerBgHover = Color3 . fromRGB ( 55 , 15 , 25
) , innerBorder = Color3 . fromRGB ( 75 , 30 , 42 ) , innerBorderHover = Color3 . fromRGB ( 255 , 70
, 90 ) , switchOff = Color3 . fromRGB ( 35 , 35 , 42 ) , switchBorder = Color3 . fromRGB ( 85 , 40 ,
52 ) , white = Color3 . fromRGB ( 245 , 245 , 248 ) , grey = Color3 . fromRGB ( 145 , 145 , 155 ) ,
border = Color3 . fromRGB ( 62 , 43 , 51 ) , good = Color3 . fromRGB ( 100 , 220 , 125 ) , bad =
Color3 . fromRGB ( 255 , 90 , 100 ) , } local NeonSequence local ThemeListeners = { } local function
BuildNeonSequence ( c ) local h , s , v = Color3 . toHSV ( c ) return ColorSequence . new ( {
ColorSequenceKeypoint . new ( 0 , Color3 . fromHSV ( h , s , math . min ( v + 0 . 35 , 1 ) ) ) ,
ColorSequenceKeypoint . new ( 0 . 25 , Color3 . fromHSV ( h , math . max ( s - 0 . 35 , 0 ) , math .
min ( v + 0 . 55 , 1 ) ) ) , ColorSequenceKeypoint . new ( 0 . 5 , c ) , ColorSequenceKeypoint . new
( 0 . 75 , Color3 . fromHSV ( h , s , math . max ( v - 0 . 55 , 0 . 1 ) ) ) , ColorSequenceKeypoint
. new ( 1 , Color3 . fromHSV ( h , s , math . min ( v + 0 . 35 , 1 ) ) ) , } ) end local function
BuildLineSequence ( c ) return ColorSequence . new ( { ColorSequenceKeypoint . new ( 0 , c ) ,
ColorSequenceKeypoint . new ( 0 . 25 , COLOR . border ) , ColorSequenceKeypoint . new ( 1 , COLOR .
border ) , } ) end local function DeriveTheme ( c ) local h , s = Color3 . toHSV ( c ) local k =
math . min ( s , 1 ) COLOR . red = c COLOR . neon = c COLOR . redBright = Color3 . fromHSV ( h ,
math . min ( s , 0 . 55 ) , 1 ) COLOR . redSoft = Color3 . fromHSV ( h , math . min ( s , 0 . 35 ) ,
1 ) COLOR . redDark = Color3 . fromHSV ( h , math . min ( s , 0 . 9 ) , 0 . 35 ) COLOR .
innerBorderHover = COLOR . redBright COLOR . innerBg = Color3 . fromHSV ( h , k * 0 . 6 , 0 . 1 )
COLOR . innerBgHover = Color3 . fromHSV ( h , k * 0 . 84 , 0 . 22 ) COLOR . innerBorder = Color3 .
fromHSV ( h , k * 0 . 69 , 0 . 3 ) COLOR . switchBorder = Color3 . fromHSV ( h , k * 0 . 6 , 0 . 33
) COLOR . border = Color3 . fromHSV ( h , k * 0 . 36 , 0 . 25 ) NeonSequence = BuildNeonSequence ( c
) end local function OnTheme ( fn ) table . insert ( ThemeListeners , fn ) fn ( ) end DeriveTheme (
HexToColor3 ( Settings . ThemeColor ) or HexToColor3 ( DEFAULT_SETTINGS . ThemeColor ) ) local
Actions = { } local Gui local destroyed = false local connections = { } local cleanupTasks = { }
local SpinTweens = { } local function track ( conn ) table . insert ( connections , conn ) return
conn end local function addCleanup ( fn ) table . insert ( cleanupTasks , fn ) end local function
cleanup ( ) if destroyed then return end destroyed = true for _ , c in ipairs ( connections ) do
pcall ( function ( ) c : Disconnect ( ) end ) end table . clear ( connections ) for _ , t in ipairs
( SpinTweens ) do pcall ( function ( ) t : Cancel ( ) end ) end for _ , fn in ipairs ( cleanupTasks
) do pcall ( fn ) end table . clear ( cleanupTasks ) if Gui then pcall ( function ( ) Gui : Destroy
( ) end ) end if _G . DXPanelCleanup == cleanup then _G . DXPanelCleanup = nil end end _G .
DXPanelCleanup = cleanup local function New ( class , props , parent ) local obj = Instance . new (
class ) for k , v in pairs ( props or { } ) do obj [ k ] = v end obj . Parent = parent return obj
end local function Corner ( obj , radius ) return New ( __dxs("5549436f726e6572") , { CornerRadius =
UDim . new ( 0 , radius ) } , obj ) end local function Stroke ( obj , color , thickness ,
transparency ) return New ( __dxs("55495374726f6b65") , { Color = color , Thickness = thickness or 1
, Transparency = transparency or 0 , ApplyStrokeMode = Enum . ApplyStrokeMode . Border , } , obj )
end local function Gradient ( obj , colorSeq , rotation ) return New ( __dxs("55494772616469656e74")
, { Color = colorSeq , Rotation = rotation or 0 } , obj ) end local function Tween ( obj , time ,
props , style , direction ) local t = TweenService : Create ( obj , TweenInfo . new ( Settings .
Animate and ( time or 0 . 2 ) or 0 , style or Enum . EasingStyle . Quart , direction or Enum .
EasingDirection . Out ) , props ) t : Play ( ) return t end local function Txt ( parent , props )
local base = { BackgroundTransparency = 1 , BorderSizePixel = 0 , Font = Enum . Font . Gotham ,
TextSize = 11 , TextColor3 = COLOR . white , TextXAlignment = Enum . TextXAlignment . Left , } for k
, v in pairs ( props ) do base [ k ] = v end return New ( __dxs("546578744c6162656c") , base ,
parent ) end local orderCounters = setmetatable ( { } , { __mode = __dxs("6b") } ) local function
ord ( parent ) orderCounters [ parent ] = ( orderCounters [ parent ] or 0 ) + 1 return orderCounters
[ parent ] end local function NeonLayers ( parent , radius , specs ) local list = { } for i , s in
ipairs ( specs ) do local f = New ( __dxs("4672616d65") , { Name = __dxs("4e656f6e4c61796572") .. i
, Size = UDim2 . fromScale ( 1 , 1 ) , BackgroundTransparency = 1 , BorderSizePixel = 0 , ZIndex = i
, } , parent ) Corner ( f , radius ) local st = New ( __dxs("55495374726f6b65") , { Color = COLOR .
neon , Thickness = s [ 1 ] , Transparency = s [ 2 ] , ApplyStrokeMode = Enum . ApplyStrokeMode .
Border , } , f ) table . insert ( list , { Frame = f , Stroke = st , Bright = s [ 2 ] , Dim = s [ 3
] } ) end return list end local function Spin ( grad , seconds ) grad . Rotation = 0 local t =
TweenService : Create ( grad , TweenInfo . new ( seconds , Enum . EasingStyle . Linear , Enum .
EasingDirection . In , - 1 ) , { Rotation = 360 } ) t : Play ( ) table . insert ( SpinTweens , t )
return t end local Interaction = { } do local scrollers , active = { } , nil local function setAll (
enabled , keep ) for sf in pairs ( scrollers ) do if sf . Parent and sf ~= keep then sf .
ScrollingEnabled = enabled end end end function Interaction . Begin ( owner , keep ) if active ~=
nil then return false end active = owner setAll ( false , keep ) return true end function
Interaction . End ( owner ) if active ~= owner then return end active = nil setAll ( true ) end
function Interaction . WatchScroll ( sf ) scrollers [ sf ] = true local token = 0 track ( sf :
GetPropertyChangedSignal ( __dxs("43616e766173506f736974696f6e") ) : Connect ( function ( ) if
active == nil then Interaction . Begin ( sf , sf ) end if active == sf then token += 1 local t =
token task . delay ( 0 . 15 , function ( ) if t == token then Interaction . End ( sf ) end end ) end
end ) ) end end do local containers = { LocalPlayer : FindFirstChild ( __dxs("506c61796572477569") )
} pcall ( function ( ) table . insert ( containers , game : GetService ( __dxs("436f7265477569") ) )
end ) for _ , c in ipairs ( containers ) do for _ , n in ipairs ( { __dxs("445850616e656c477569") ,
__dxs("445850616e656c") } ) do local old = c and c : FindFirstChild ( n ) if old then pcall (
function ( ) old : Destroy ( ) end ) end end end end Gui = New ( __dxs("53637265656e477569") , {
Name = __dxs("445850616e656c477569") , ResetOnSpawn = false , IgnoreGuiInset = true , DisplayOrder =
999 , ZIndexBehavior = Enum . ZIndexBehavior . Sibling , } ) local function Viewport ( ) local s =
Gui . AbsoluteSize if s . X < 50 or s . Y < 50 then local cam = workspace . CurrentCamera s = cam
and cam . ViewportSize or Vector2 . new ( 1280 , 720 ) end return s end local SIZE = { minW = 340 ,
minH = 260 , maxW = 850 , maxH = 560 , defW = 600 , defH = 370 } local PanelSize , PanelPos local
function ClampSize ( w , h ) local vp = Viewport ( ) local maxW = math . min ( SIZE . maxW , vp . X
- 8 ) local maxH = math . min ( SIZE . maxH , vp . Y - 8 ) local minW = math . min ( SIZE . minW ,
maxW ) local minH = math . min ( SIZE . minH , maxH ) return math . clamp ( w , minW , maxW ) , math
. clamp ( h , minH , maxH ) end local function ClampPos ( x , y ) local vp = Viewport ( ) return
math . clamp ( x , 0 , math . max ( 0 , vp . X - PanelSize . X ) ) , math . clamp ( y , 0 , math .
max ( 0 , vp . Y - PanelSize . Y ) ) end do local cw , ch = ClampSize ( SIZE . defW , SIZE . defH )
PanelSize = Vector2 . new ( cw , ch ) PanelPos = Vector2 . new ( ( Viewport ( ) . X - cw ) / 2 , (
Viewport ( ) . Y - ch ) / 2 ) end local Root = New ( __dxs("4672616d65") , { Name =
__dxs("526f6f74") , Position = UDim2 . fromOffset ( PanelPos . X , PanelPos . Y ) , Size = UDim2 .
fromOffset ( PanelSize . X , PanelSize . Y ) , BackgroundTransparency = 1 , BorderSizePixel = 0 ,
ZIndex = 1 , } , Gui ) local function ApplyPanel ( ) Root . Size = UDim2 . fromOffset ( PanelSize .
X , PanelSize . Y ) Root . Position = UDim2 . fromOffset ( PanelPos . X , PanelPos . Y ) end local
function SetPanelPos ( v ) local x , y = ClampPos ( v . X , v . Y ) PanelPos = Vector2 . new ( x , y
) Root . Position = UDim2 . fromOffset ( x , y ) end local function SetPanelSize ( w , h ) local cw
, ch = ClampSize ( w , h ) PanelSize = Vector2 . new ( cw , ch ) Root . Size = UDim2 . fromOffset (
cw , ch ) SetPanelPos ( PanelPos ) if Actions . ApplyLayout then Actions . ApplyLayout ( ) end end
local function FitPanel ( w , h , recenter ) local cw , ch = ClampSize ( w , h ) PanelSize = Vector2
. new ( cw , ch ) if Actions . ApplyLayout then Actions . ApplyLayout ( ) end if recenter then local
vp = Viewport ( ) PanelPos = Vector2 . new ( ( vp . X - cw ) / 2 , ( vp . Y - ch ) / 2 ) else local
x , y = ClampPos ( PanelPos . X , PanelPos . Y ) PanelPos = Vector2 . new ( x , y ) end Tween ( Root
, 0 . 25 , { Size = UDim2 . fromOffset ( PanelSize . X , PanelSize . Y ) , Position = UDim2 .
fromOffset ( PanelPos . X , PanelPos . Y ) , } ) end local MainGlow = NeonLayers ( Root , 16 , { { 3
, 0 . 70 , 0 . 82 } , { 7 , 0 . 82 , 0 . 90 } , { 12 , 0 . 90 , 0 . 95 } , { 18 , 0 . 95 , 0 . 98 }
, } ) local Main = New ( __dxs("4672616d65") , { Name = __dxs("4d61696e") , Size = UDim2 . fromScale
( 1 , 1 ) , BackgroundColor3 = COLOR . black , BorderSizePixel = 0 , Active = true , ZIndex = 10 , }
, Root ) Corner ( Main , 16 ) Gradient ( Main , ColorSequence . new ( { ColorSequenceKeypoint . new
( 0 , COLOR . black2 ) , ColorSequenceKeypoint . new ( 0 . 55 , COLOR . black ) ,
ColorSequenceKeypoint . new ( 1 , Color3 . fromRGB ( 6 , 6 , 8 ) ) , } ) , 65 ) local MainStroke =
Stroke ( Main , COLOR . neon , 2 , 0 ) local MainStrokeGrad = Gradient ( MainStroke , NeonSequence ,
0 ) Spin ( MainStrokeGrad , 5 ) local Toast = New ( __dxs("546578744c6162656c") , { AnchorPoint =
Vector2 . new ( 0 . 5 , 1 ) , Position = UDim2 . new ( 0 . 5 , 0 , 1 , - 16 ) , Size = UDim2 .
fromOffset ( 240 , 30 ) , BackgroundColor3 = COLOR . black , BackgroundTransparency = 0 . 05 , Text
= __dxs("") , Font = Enum . Font . GothamMedium , TextSize = 11 , TextColor3 = COLOR . white ,
Visible = false , ZIndex = 300 , } , Main ) Corner ( Toast , 10 ) local ToastStroke = Stroke ( Toast
, COLOR . good , 1 . 5 , 0 ) local toastToken = 0 local function Notify ( text , good ) toastToken
+= 1 local token = toastToken Toast . Text = text ToastStroke . Color = good and COLOR . good or
COLOR . bad Toast . Visible = true task . delay ( 2 , function ( ) if token == toastToken and Toast
. Parent then Toast . Visible = false end end ) end local Sidebar = New ( __dxs("4672616d65") , {
Position = UDim2 . new ( 0 , 2 , 0 , 4 ) , Size = UDim2 . new ( 0 , 145 , 1 , - 6 ) ,
BackgroundColor3 = COLOR . sidebar , BorderSizePixel = 0 , Active = true , ClipsDescendants = true ,
ZIndex = 11 , } , Main ) Corner ( Sidebar , 14 ) Gradient ( Sidebar , ColorSequence . new ( {
ColorSequenceKeypoint . new ( 0 , COLOR . sidebar2 ) , ColorSequenceKeypoint . new ( 1 , COLOR .
sidebar ) , } ) , 80 ) local SidebarLine = New ( __dxs("4672616d65") , { Position = UDim2 . new ( 1
, - 1 , 0 , 0 ) , Size = UDim2 . new ( 0 , 1 , 1 , 0 ) , BackgroundColor3 = COLOR . border ,
BackgroundTransparency = 0 . 25 , BorderSizePixel = 0 , ZIndex = 15 , } , Sidebar ) local DXTitle =
Txt ( Sidebar , { Position = UDim2 . new ( 0 , 15 , 0 , 15 ) , Size = UDim2 . new ( 1 , - 30 , 0 ,
28 ) , Text = __dxs("4458") , Font = Enum . Font . GothamBlack , TextSize = 26 , ZIndex = 20 , } )
local PanelWord = Txt ( Sidebar , { Position = UDim2 . new ( 0 , 52 , 0 , 18 ) , Size = UDim2 . new
( 1 , - 60 , 0 , 22 ) , Text = __dxs("50414e454c") , Font = Enum . Font . GothamBold , TextSize = 11
, ZIndex = 20 , } ) local LogoLine = New ( __dxs("4672616d65") , { Visible = false , Position =
UDim2 . new ( 0 , 15 , 0 , 49 ) , Size = UDim2 . fromOffset ( 35 , 2 ) , BackgroundColor3 = COLOR .
red , BorderSizePixel = 0 , ZIndex = 20 , } , Sidebar ) Corner ( LogoLine , 2 ) local LogoGrad =
Gradient ( LogoLine , ColorSequence . new ( { ColorSequenceKeypoint . new ( 0 , COLOR . redBright )
, ColorSequenceKeypoint . new ( 1 , COLOR . redDark ) , } ) , 0 ) local Online = Txt ( Sidebar , {
Position = UDim2 . new ( 0 , 15 , 0 , 55 ) , Size = UDim2 . new ( 1 , - 30 , 0 , 18 ) , Text =
__dxs("e2978f20204f4e4c494e45") , Font = Enum . Font . GothamMedium , TextSize = 9 , TextColor3 =
COLOR . good , ZIndex = 20 , } ) task . spawn ( function ( ) while not destroyed and Online . Parent
do Tween ( Online , 1 . 0 , { TextTransparency = 0 . 55 } , Enum . EasingStyle . Sine ) task . wait
( 1 ) Tween ( Online , 1 . 0 , { TextTransparency = 0 } , Enum . EasingStyle . Sine ) task . wait (
1 ) end end ) local TabHolder = New ( __dxs("5363726f6c6c696e674672616d65") , { Position = UDim2 .
new ( 0 , 9 , 0 , 88 ) , Size = UDim2 . new ( 1 , - 18 , 1 , - 98 ) , BackgroundTransparency = 1 ,
BorderSizePixel = 0 , ScrollBarThickness = 0 , CanvasSize = UDim2 . new ( ) , AutomaticCanvasSize =
Enum . AutomaticSize . Y , ScrollingDirection = Enum . ScrollingDirection . Y , ClipsDescendants =
true , ZIndex = 20 , } , Sidebar ) New ( __dxs("55494c6973744c61796f7574") , { Padding = UDim . new
( 0 , 6 ) , SortOrder = Enum . SortOrder . LayoutOrder } , TabHolder ) Interaction . WatchScroll (
TabHolder ) local Content = New ( __dxs("4672616d65") , { Position = UDim2 . new ( 0 , 145 , 0 , 4 )
, Size = UDim2 . new ( 1 , - 145 , 1 , - 6 ) , BackgroundTransparency = 1 , BorderSizePixel = 0 ,
ZIndex = 11 , } , Main ) local Header = New ( __dxs("4672616d65") , { Position = UDim2 . new ( 0 ,
15 , 0 , 9 ) , Size = UDim2 . new ( 1 , - 30 , 0 , 38 ) , BackgroundTransparency = 1 , Active = true
, ZIndex = 25 , } , Content ) local Title = Txt ( Header , { Size = UDim2 . new ( 1 , - 55 , 0 , 22
) , Text = __dxs("4f76657276696577") , Font = Enum . Font . GothamBold , TextSize = 18 , ZIndex = 30
, } ) Txt ( Header , { Position = UDim2 . new ( 0 , 0 , 0 , 21 ) , Size = UDim2 . new ( 1 , - 55 , 0
, 14 ) , Text = __dxs("445850616e656c205072656d69756d20496e74657266616365") , TextSize = 10 ,
TextColor3 = COLOR . grey , ZIndex = 30 , } ) local Close = New ( __dxs("54657874427574746f6e") , {
Name = __dxs("436c6f7365") , AnchorPoint = Vector2 . new ( 1 , 0 ) , Position = UDim2 . new ( 1 , 0
, 0 , 2 ) , Size = UDim2 . fromOffset ( 30 , 30 ) , BackgroundColor3 = Color3 . fromRGB ( 24 , 19 ,
23 ) , BorderSizePixel = 0 , AutoButtonColor = false , Text = __dxs("c397") , Font = Enum . Font .
GothamBold , TextSize = 18 , TextColor3 = COLOR . grey , ZIndex = 100 , } , Header ) Corner ( Close
, 9 ) local CloseStroke = Stroke ( Close , COLOR . border , 1 , 0 . 1 ) track ( Close . MouseEnter :
Connect ( function ( ) Tween ( Close , 0 . 15 , { BackgroundColor3 = Color3 . fromRGB ( 70 , 12 , 20
) , TextColor3 = COLOR . redBright , Rotation = 90 } ) Tween ( CloseStroke , 0 . 15 , { Color =
COLOR . red } ) end ) ) track ( Close . MouseLeave : Connect ( function ( ) Tween ( Close , 0 . 15 ,
{ BackgroundColor3 = Color3 . fromRGB ( 24 , 19 , 23 ) , TextColor3 = COLOR . grey , Rotation = 0 }
) Tween ( CloseStroke , 0 . 15 , { Color = COLOR . border } ) end ) ) local PageHolder = New (
__dxs("4672616d65") , { Position = UDim2 . new ( 0 , 15 , 0 , 57 ) , Size = UDim2 . new ( 1 , - 30 ,
1 , - 69 ) , BackgroundTransparency = 1 , ClipsDescendants = true , ZIndex = 15 , } , Content )
local Pages = { } local Tabs = { } local layoutCompact , layoutTight function Actions . ApplyLayout
( ) local compact = PanelSize . X < 480 local tight = PanelSize . Y < 320 local w = compact and 56
or 145 if compact ~= layoutCompact then local sizeS = UDim2 . new ( 0 , w , 1 , - 6 ) local posC =
UDim2 . new ( 0 , w , 0 , 4 ) local sizeC = UDim2 . new ( 1 , - w , 1 , - 6 ) if layoutCompact ==
nil then Sidebar . Size , Content . Position , Content . Size = sizeS , posC , sizeC else Tween (
Sidebar , 0 . 22 , { Size = sizeS } ) Tween ( Content , 0 . 22 , { Position = posC , Size = sizeC }
) end layoutCompact = compact PanelWord . Visible = not compact if compact then DXTitle . Position =
UDim2 . new ( 0 , 0 , 0 , 15 ) DXTitle . Size = UDim2 . new ( 1 , 0 , 0 , 28 ) DXTitle .
TextXAlignment = Enum . TextXAlignment . Center LogoLine . Position = UDim2 . new ( 0 . 5 , - 17 , 0
, 49 ) Online . Text = __dxs("e2978f") Online . Position = UDim2 . new ( 0 , 0 , 0 , 55 ) Online .
Size = UDim2 . new ( 1 , 0 , 0 , 18 ) Online . TextXAlignment = Enum . TextXAlignment . Center else
DXTitle . Position = UDim2 . new ( 0 , 15 , 0 , 15 ) DXTitle . Size = UDim2 . new ( 1 , - 30 , 0 ,
28 ) DXTitle . TextXAlignment = Enum . TextXAlignment . Left LogoLine . Position = UDim2 . new ( 0 ,
15 , 0 , 49 ) Online . Text = __dxs("e2978f20204f4e4c494e45") Online . Position = UDim2 . new ( 0 ,
15 , 0 , 55 ) Online . Size = UDim2 . new ( 1 , - 30 , 0 , 18 ) Online . TextXAlignment = Enum .
TextXAlignment . Left end end if tight ~= layoutTight then layoutTight = tight Online . Visible =
not tight local top = tight and 58 or 88 TabHolder . Position = UDim2 . new ( 0 , 9 , 0 , top )
TabHolder . Size = UDim2 . new ( 1 , - 18 , 1 , - ( top + 10 ) ) end for _ , tab in pairs ( Tabs )
do tab . Label . Visible = not compact end end OnTheme ( function ( ) MainStroke . Color = COLOR .
neon MainStrokeGrad . Color = NeonSequence for _ , layer in ipairs ( MainGlow ) do layer . Stroke .
Color = COLOR . neon end DXTitle . TextColor3 = COLOR . red LogoLine . BackgroundColor3 = COLOR .
red LogoGrad . Color = ColorSequence . new ( { ColorSequenceKeypoint . new ( 0 , COLOR . redBright )
, ColorSequenceKeypoint . new ( 1 , COLOR . redDark ) , } ) SidebarLine . BackgroundColor3 = COLOR .
border Title . TextColor3 = COLOR . white end ) local function CreatePage ( name ) local Page = New
( __dxs("5363726f6c6c696e674672616d65") , { Name = name , Size = UDim2 . fromScale ( 1 , 1 ) ,
BackgroundTransparency = 1 , BorderSizePixel = 0 , ScrollBarThickness = 2 , ScrollBarImageColor3 =
COLOR . red , CanvasSize = UDim2 . new ( 0 , 0 , 0 , 0 ) , Visible = false , } , PageHolder )
Interaction . WatchScroll ( Page ) New ( __dxs("554950616464696e67") , { PaddingLeft = UDim . new (
0 , 2 ) , PaddingRight = UDim . new ( 0 , 8 ) , PaddingBottom = UDim . new ( 0 , 8 ) , } , Page )
local Layout = New ( __dxs("55494c6973744c61796f7574") , { Padding = UDim . new ( 0 , 8 ) ,
SortOrder = Enum . SortOrder . LayoutOrder } , Page ) track ( Layout : GetPropertyChangedSignal (
__dxs("4162736f6c757465436f6e74656e7453697a65") ) : Connect ( function ( ) Page . CanvasSize = UDim2
. fromOffset ( 0 , Layout . AbsoluteContentSize . Y + 10 ) end ) ) OnTheme ( function ( ) Page .
ScrollBarImageColor3 = COLOR . red end ) Pages [ name ] = Page return Page end local function
IconWrap ( parent ) return New ( __dxs("4672616d65") , { Position = UDim2 . new ( 0 , 9 , 0 . 5 , -
9 ) , Size = UDim2 . fromOffset ( 19 , 19 ) , BackgroundTransparency = 1 , ZIndex = 40 , } , parent
) end local function Part ( parent , props , radius ) props . BorderSizePixel = 0 props . ZIndex =
props . ZIndex or 41 local f = New ( __dxs("4672616d65") , props , parent ) if radius then Corner (
f , radius ) end return f end local IconBuilders = { } function IconBuilders . house ( parent ,
color ) local Wrap = IconWrap ( parent ) local RoofClip = New ( __dxs("4672616d65") , { Size = UDim2
. fromOffset ( 19 , 9 ) , BackgroundTransparency = 1 , ClipsDescendants = true , ZIndex = 41 , } ,
Wrap ) local Roof = Part ( RoofClip , { AnchorPoint = Vector2 . new ( 0 . 5 , 0 . 5 ) , Position =
UDim2 . new ( 0 . 5 , 0 , 1 , - 1 ) , Size = UDim2 . fromOffset ( 13 , 13 ) , Rotation = 45 ,
BackgroundColor3 = color , } , 3 ) local Chimney = Part ( Wrap , { Position = UDim2 . new ( 0 , 13 ,
0 , 0 ) , Size = UDim2 . fromOffset ( 3 , 6 ) , BackgroundColor3 = color , ZIndex = 39 , } , 1 )
local Body = Part ( Wrap , { Position = UDim2 . new ( 0 , 2 , 0 , 8 ) , Size = UDim2 . fromOffset (
15 , 11 ) , BackgroundColor3 = color , } , 3 ) Part ( Body , { AnchorPoint = Vector2 . new ( 0 . 5 ,
1 ) , Position = UDim2 . new ( 0 . 5 , 1 , 1 , 0 ) , Size = UDim2 . fromOffset ( 4 , 7 ) ,
BackgroundColor3 = COLOR . black , ZIndex = 42 , } , 1 ) Part ( Body , { Position = UDim2 . new ( 0
, 3 , 0 , 2 ) , Size = UDim2 . fromOffset ( 4 , 4 ) , BackgroundColor3 = COLOR . black , ZIndex = 42
, } , 1 ) return Wrap , { Roof , Chimney , Body } end function IconBuilders . gear ( parent , color
) local Wrap = IconWrap ( parent ) local parts = { } for i = 1 , 8 do table . insert ( parts , Part
( Wrap , { AnchorPoint = Vector2 . new ( 0 . 5 , 0 . 5 ) , Position = UDim2 . new ( 0 . 5 , 0 , 0 .
5 , 0 ) , Size = UDim2 . fromOffset ( 4 , 18 ) , Rotation = ( i - 1 ) * 45 , BackgroundColor3 =
color , ZIndex = 40 , } , 2 ) ) end table . insert ( parts , Part ( Wrap , { AnchorPoint = Vector2 .
new ( 0 . 5 , 0 . 5 ) , Position = UDim2 . new ( 0 . 5 , 0 , 0 . 5 , 0 ) , Size = UDim2 . fromOffset
( 13 , 13 ) , BackgroundColor3 = color , } , 7 ) ) Part ( Wrap , { AnchorPoint = Vector2 . new ( 0 .
5 , 0 . 5 ) , Position = UDim2 . new ( 0 . 5 , 0 , 0 . 5 , 0 ) , Size = UDim2 . fromOffset ( 5 , 5 )
, BackgroundColor3 = COLOR . black , ZIndex = 42 , } ) return Wrap , parts end function IconBuilders
. player ( parent , color ) local Wrap = IconWrap ( parent ) local Head = Part ( Wrap , {
AnchorPoint = Vector2 . new ( 0 . 5 , 0 ) , Position = UDim2 . new ( 0 . 5 , 0 , 0 , 1 ) , Size =
UDim2 . fromOffset ( 8 , 8 ) , BackgroundColor3 = color , } , 4 ) local Body = Part ( Wrap , {
AnchorPoint = Vector2 . new ( 0 . 5 , 1 ) , Position = UDim2 . new ( 0 . 5 , 0 , 1 , - 1 ) , Size =
UDim2 . fromOffset ( 15 , 8 ) , BackgroundColor3 = color , } , 5 ) return Wrap , { Head , Body } end
function IconBuilders . sprout ( parent , color ) local Wrap = IconWrap ( parent ) local Stem = Part
( Wrap , { AnchorPoint = Vector2 . new ( 0 . 5 , 1 ) , Position = UDim2 . new ( 0 . 5 , 0 , 1 , - 1
) , Size = UDim2 . fromOffset ( 2 , 11 ) , BackgroundColor3 = color , } , 1 ) local LeafL = Part (
Wrap , { AnchorPoint = Vector2 . new ( 0 . 5 , 0 . 5 ) , Position = UDim2 . fromOffset ( 5 , 6 ) ,
Size = UDim2 . fromOffset ( 9 , 5 ) , Rotation = - 30 , BackgroundColor3 = color , } , 3 ) local
LeafR = Part ( Wrap , { AnchorPoint = Vector2 . new ( 0 . 5 , 0 . 5 ) , Position = UDim2 .
fromOffset ( 14 , 6 ) , Size = UDim2 . fromOffset ( 9 , 5 ) , Rotation = 30 , BackgroundColor3 =
color , } , 3 ) return Wrap , { Stem , LeafL , LeafR } end function IconBuilders . eye ( parent ,
color ) local Wrap = IconWrap ( parent ) local Outer = Part ( Wrap , { AnchorPoint = Vector2 . new (
0 . 5 , 0 . 5 ) , Position = UDim2 . new ( 0 . 5 , 0 , 0 . 5 , 0 ) , Size = UDim2 . fromOffset ( 19
, 12 ) , BackgroundColor3 = color , } , 6 ) Part ( Wrap , { AnchorPoint = Vector2 . new ( 0 . 5 , 0
. 5 ) , Position = UDim2 . new ( 0 . 5 , 0 , 0 . 5 , 0 ) , Size = UDim2 . fromOffset ( 9 , 9 ) ,
BackgroundColor3 = COLOR . black , ZIndex = 42 , } , 5 ) local Dot = Part ( Wrap , { AnchorPoint =
Vector2 . new ( 0 . 5 , 0 . 5 ) , Position = UDim2 . new ( 0 . 5 , 0 , 0 . 5 , 0 ) , Size = UDim2 .
fromOffset ( 4 , 4 ) , BackgroundColor3 = color , ZIndex = 43 , } , 2 ) return Wrap , { Outer , Dot
} end function IconBuilders . info ( parent , color ) local Wrap = IconWrap ( parent ) local Circle
= Part ( Wrap , { AnchorPoint = Vector2 . new ( 0 . 5 , 0 . 5 ) , Position = UDim2 . new ( 0 . 5 , 0
, 0 . 5 , 0 ) , Size = UDim2 . fromOffset ( 18 , 18 ) , BackgroundColor3 = color , } , 9 ) Part (
Wrap , { AnchorPoint = Vector2 . new ( 0 . 5 , 0 . 5 ) , Position = UDim2 . new ( 0 . 5 , 0 , 0 . 5
, 2 ) , Size = UDim2 . fromOffset ( 2 , 7 ) , BackgroundColor3 = COLOR . black , ZIndex = 42 , } )
Part ( Wrap , { AnchorPoint = Vector2 . new ( 0 . 5 , 0 . 5 ) , Position = UDim2 . new ( 0 . 5 , 0 ,
0 . 5 , - 5 ) , Size = UDim2 . fromOffset ( 3 , 3 ) , BackgroundColor3 = COLOR . black , ZIndex = 42
, } , 2 ) return Wrap , { Circle } end local function CreateTab ( name , icon ) local Button = New (
__dxs("54657874427574746f6e") , { Size = UDim2 . new ( 1 , 0 , 0 , 36 ) , BackgroundColor3 = Color3
. fromRGB ( 75 , 12 , 20 ) , BackgroundTransparency = 1 , BorderSizePixel = 0 , AutoButtonColor =
false , Text = __dxs("") , LayoutOrder = ord ( TabHolder ) , ZIndex = 30 , } , TabHolder ) Corner (
Button , 9 ) Gradient ( Button , ColorSequence . new ( Color3 . new ( 1 , 1 , 1 ) , Color3 . fromRGB
( 120 , 120 , 130 ) ) , 0 ) local Bar = New ( __dxs("4672616d65") , { Visible = false , Position =
UDim2 . new ( 0 , 0 , 0 . 5 , - 9 ) , Size = UDim2 . fromOffset ( 3 , 18 ) , BackgroundColor3 =
COLOR . red , BackgroundTransparency = 1 , BorderSizePixel = 0 , ZIndex = 40 , } , Button ) Corner (
Bar , 3 ) local Icon , iconParts , isImage local iconStr = tostring ( icon ) if IconBuilders [
iconStr ] then Icon , iconParts = IconBuilders [ iconStr ] ( Button , COLOR . grey ) elseif iconStr
: match ( __dxs("5e726278617373657469643a2f2f") ) or iconStr : match ( __dxs("5e25642b24") ) then
isImage = true Icon = New ( __dxs("496d6167654c6162656c") , { Position = UDim2 . new ( 0 , 11 , 0 .
5 , - 9 ) , Size = UDim2 . fromOffset ( 18 , 18 ) , BackgroundTransparency = 1 , Image = iconStr :
match ( __dxs("5e25642b24") ) and ( __dxs("726278617373657469643a2f2f") .. iconStr ) or iconStr ,
ImageColor3 = COLOR . grey , ZIndex = 40 , } , Button ) else Icon = Txt ( Button , { Position =
UDim2 . new ( 0 , 11 , 0 , 0 ) , Size = UDim2 . fromOffset ( 20 , 36 ) , Text = iconStr , Font =
Enum . Font . GothamBold , TextSize = 12 , TextColor3 = COLOR . grey , ZIndex = 40 , } ) end local
Label = Txt ( Button , { Position = UDim2 . new ( 0 , 37 , 0 , 0 ) , Size = UDim2 . new ( 1 , - 42 ,
0 , 36 ) , Text = name , Font = Enum . Font . GothamMedium , TextColor3 = COLOR . grey , ZIndex = 40
, } ) local tab = { Button = Button , Icon = Icon , Label = Label , Bar = Bar , IsImage = isImage ,
IconParts = iconParts , Active = false , } Tabs [ name ] = tab local function IconColor ( c ,
instant ) if tab . IconParts then for _ , part in ipairs ( tab . IconParts ) do if instant then part
. BackgroundColor3 = c else Tween ( part , 0 . 18 , { BackgroundColor3 = c } ) end end elseif tab .
IsImage then Tween ( tab . Icon , 0 . 18 , { ImageColor3 = c } ) else Tween ( tab . Icon , 0 . 18 ,
{ TextColor3 = c } ) end end function tab . Paint ( instant ) local a = tab . Active Tween ( Button
, 0 . 18 , { BackgroundTransparency = a and 0 . 15 or 1 } ) IconColor ( a and COLOR . redSoft or
COLOR . grey , instant ) Tween ( Label , 0 . 18 , { TextColor3 = a and COLOR . white or COLOR . grey
} ) Tween ( Bar , 0 . 18 , { BackgroundTransparency = a and 0 or 1 } ) end OnTheme ( function ( )
Bar . BackgroundColor3 = COLOR . red Button . BackgroundColor3 = COLOR . redDark if tab . Active
then IconColor ( COLOR . redSoft , true ) end end ) track ( Button . MouseEnter : Connect ( function
( ) if not tab . Active then Tween ( Button , 0 . 15 , { BackgroundTransparency = 0 . 72 } ) Tween (
Label , 0 . 15 , { TextColor3 = COLOR . white } ) end end ) ) track ( Button . MouseLeave : Connect
( function ( ) if not tab . Active then Tween ( Button , 0 . 15 , { BackgroundTransparency = 1 } )
Tween ( Label , 0 . 15 , { TextColor3 = COLOR . grey } ) end end ) ) track ( Button . Activated :
Connect ( function ( ) Actions . ActivateTab ( name ) end ) ) return Button end function Actions .
ActivateTab ( name ) for tabName , tab in pairs ( Tabs ) do tab . Active = tabName == name tab .
Paint ( ) if Pages [ tabName ] then Pages [ tabName ] . Visible = tab . Active end if tab . Active
then Title . Text = tabName end end end local function Section ( parent , text ) local Holder = New
( __dxs("4672616d65") , { Size = UDim2 . new ( 1 , 0 , 0 , 29 ) , BackgroundTransparency = 1 ,
LayoutOrder = ord ( parent ) , } , parent ) local Label = Txt ( Holder , { Position = UDim2 . new (
0 , 3 , 0 , 5 ) , Size = UDim2 . new ( 1 , - 6 , 0 , 18 ) , Text = string . upper ( text ) , Font =
Enum . Font . GothamBold , TextSize = 10 , } ) local Line = New ( __dxs("4672616d65") , { Position =
UDim2 . new ( 0 , 3 , 1 , - 1 ) , Size = UDim2 . new ( 1 , - 6 , 0 , 1 ) , BackgroundColor3 = Color3
. new ( 1 , 1 , 1 ) , BorderSizePixel = 0 , } , Holder ) local LineGrad = Gradient ( Line ,
ColorSequence . new ( COLOR . border ) , 0 ) OnTheme ( function ( ) Label . TextColor3 = COLOR .
redSoft LineGrad . Color = ColorSequence . new ( COLOR . border ) end ) return Holder end local
function CardBase ( parent , height , class ) local Holder = New ( class or __dxs("4672616d65") , {
Size = UDim2 . new ( 1 , 0 , 0 , height ) , BackgroundColor3 = COLOR . innerBg , BorderSizePixel = 0
, LayoutOrder = ord ( parent ) , ZIndex = 50 , } , parent ) if class ==
__dxs("54657874427574746f6e") then Holder . AutoButtonColor = false Holder . Text = __dxs("") end
Corner ( Holder , 10 ) Gradient ( Holder , ColorSequence . new ( Color3 . new ( 1 , 1 , 1 ) , Color3
. fromRGB ( 200 , 200 , 212 ) ) , 0 ) local S = Stroke ( Holder , COLOR . innerBorder , 1 . 5 , 0 )
local Accent = New ( __dxs("4672616d65") , { Visible = false , Position = UDim2 . new ( 0 , 8 , 0 ,
6 ) , Size = UDim2 . new ( 0 , 3 , 1 , - 12 ) , BackgroundColor3 = COLOR . redBright ,
BorderSizePixel = 0 , ZIndex = 55 , } , Holder ) Corner ( Accent , 3 ) return Holder , S , Accent
end local function Hover ( obj , fn ) track ( obj . MouseEnter : Connect ( function ( ) fn ( true )
end ) ) track ( obj . MouseLeave : Connect ( function ( ) fn ( false ) end ) ) end local function
Safe ( fn , ... ) if not fn then return end local ok , err = pcall ( fn , ... ) if not ok then warn
( __dxs("5b445850616e656c5d2063616c6c6261636b206572726f723a20") .. tostring ( err ) ) end end local
function Button ( parent , text , callback , danger ) local Btn , S , Accent = CardBase ( parent ,
42 , __dxs("54657874427574746f6e") ) local Dot = New ( __dxs("4672616d65") , { Visible = false ,
Position = UDim2 . new ( 0 , 18 , 0 . 5 , - 3 ) , Size = UDim2 . fromOffset ( 6 , 6 ) ,
BackgroundColor3 = COLOR . redBright , BorderSizePixel = 0 , ZIndex = 55 , } , Btn ) Corner ( Dot ,
6 ) Txt ( Btn , { Position = UDim2 . new ( 0 , 16 , 0 , 0 ) , Size = UDim2 . new ( 1 , - 42 , 1 , 0
) , Text = text , Font = Enum . Font . GothamMedium , ZIndex = 60 , } ) local hover = false local
function paint ( ) local ac = danger and COLOR . bad or ( hover and COLOR . redSoft or COLOR .
redBright ) Tween ( Btn , 0 . 15 , { BackgroundColor3 = hover and COLOR . innerBgHover or COLOR .
innerBg } ) Tween ( S , 0 . 15 , { Color = danger and COLOR . bad or ( hover and COLOR .
innerBorderHover or COLOR . innerBorder ) , Thickness = hover and 1 . 8 or 1 . 5 , } ) Tween (
Accent , 0 . 15 , { BackgroundColor3 = ac } ) Tween ( Dot , 0 . 15 , { BackgroundColor3 = ac } ) end
Hover ( Btn , function ( h ) hover = h paint ( ) end ) OnTheme ( paint ) track ( Btn . Activated :
Connect ( function ( ) task . spawn ( Safe , callback ) end ) ) return Btn end local function Toggle
( parent , text , enabled , callback , availableFn ) local state = enabled == true local hover =
false local Holder , HolderStroke , Accent = CardBase ( parent , 42 ) Txt ( Holder , { Position =
UDim2 . new ( 0 , 16 , 0 , 0 ) , Size = UDim2 . new ( 1 , - 150 , 1 , 0 ) , Text = text , Font =
Enum . Font . GothamMedium , TextTruncate = Enum . TextTruncate . AtEnd , ZIndex = 60 , } ) local
Note = Txt ( Holder , { AnchorPoint = Vector2 . new ( 1 , 0 . 5 ) , Position = UDim2 . new ( 1 , -
62 , 0 . 5 , 0 ) , Size = UDim2 . fromOffset ( 90 , 14 ) , Text = ( availableFn and not availableFn
( ) ) and __dxs("4e6f7420417661696c61626c65") or __dxs("") , TextSize = 9 , TextColor3 = COLOR . bad
, TextXAlignment = Enum . TextXAlignment . Right , ZIndex = 60 , } ) local Switch = New (
__dxs("54657874427574746f6e") , { AnchorPoint = Vector2 . new ( 1 , 0 . 5 ) , Position = UDim2 . new
( 1 , - 12 , 0 . 5 , 0 ) , Size = UDim2 . fromOffset ( 42 , 22 ) , BackgroundColor3 = COLOR .
switchOff , BorderSizePixel = 0 , AutoButtonColor = false , Text = __dxs("") , ZIndex = 70 , } ,
Holder ) Corner ( Switch , 12 ) local SwitchStroke = Stroke ( Switch , COLOR . switchBorder , 1 . 4
, 0 ) local Knob = New ( __dxs("4672616d65") , { AnchorPoint = Vector2 . new ( 0 , 0 . 5 ) ,
Position = UDim2 . new ( 0 , 3 , 0 . 5 , 0 ) , Size = UDim2 . fromOffset ( 16 , 16 ) ,
BackgroundColor3 = Color3 . fromRGB ( 190 , 190 , 195 ) , BorderSizePixel = 0 , ZIndex = 75 , } ,
Switch ) Corner ( Knob , 20 ) local Hit = New ( __dxs("54657874427574746f6e") , { Size = UDim2 .
fromScale ( 1 , 1 ) , BackgroundTransparency = 1 , Text = __dxs("") , ZIndex = 52 , } , Holder )
local function paint ( ) Tween ( Holder , 0 . 15 , { BackgroundColor3 = ( hover and not state ) and
COLOR . innerBgHover or COLOR . innerBg } ) Tween ( HolderStroke , 0 . 18 , { Color = state and
COLOR . red or ( hover and COLOR . redBright or COLOR . innerBorder ) , Thickness = state and 1 . 7
or ( hover and 1 . 7 or 1 . 5 ) , } ) Tween ( Switch , 0 . 18 , { BackgroundColor3 = state and COLOR
. red or COLOR . switchOff } ) Tween ( SwitchStroke , 0 . 18 , { Color = state and COLOR . redBright
or COLOR . switchBorder , Thickness = state and 1 . 6 or 1 . 4 , } ) Tween ( Knob , 0 . 18 , {
Position = state and UDim2 . new ( 1 , - 19 , 0 . 5 , 0 ) or UDim2 . new ( 0 , 3 , 0 . 5 , 0 ) ,
BackgroundColor3 = state and Color3 . new ( 1 , 1 , 1 ) or Color3 . fromRGB ( 190 , 190 , 195 ) , }
) Tween ( Accent , 0 . 18 , { BackgroundColor3 = state and COLOR . redSoft or COLOR . redBright } )
end local api = { } function api . Get ( ) return state end function api . Set ( value , silent )
state = value == true paint ( ) if not silent then task . spawn ( Safe , callback , state ) end end
local function click ( ) if availableFn and not availableFn ( ) then Note . Text =
__dxs("4e6f7420417661696c61626c65") Notify (
__dxs("e0b89fe0b8b1e0b887e0b881e0b98ce0b88ae0b8b1e0b899e0b899e0b8b5e0b989e0b8a2e0b8b1e0b887e0b984e0b8a1e0b988e0b984e0b894e0b989e0b89ce0b8b9e0b88120486f6f6b")
, false ) return end api . Set ( not state ) end track ( Hit . Activated : Connect ( click ) ) track
( Switch . Activated : Connect ( click ) ) Hover ( Holder , function ( h ) hover = h paint ( ) end )
OnTheme ( paint ) return Holder , api end local function Slider ( parent , text , min , max ,
default , decimals , onChange , releaseOnly ) local Row , RowStroke , Accent = CardBase ( parent ,
58 ) Accent . Size = UDim2 . new ( 0 , 3 , 0 , 22 ) Txt ( Row , { Position = UDim2 . new ( 0 , 16 ,
0 , 6 ) , Size = UDim2 . new ( 1 , - 110 , 0 , 20 ) , Text = text , Font = Enum . Font .
GothamMedium , TextTruncate = Enum . TextTruncate . AtEnd , ZIndex = 60 , } ) local ValueLabel = Txt
( Row , { AnchorPoint = Vector2 . new ( 1 , 0 ) , Position = UDim2 . new ( 1 , - 14 , 0 , 6 ) , Size
= UDim2 . fromOffset ( 70 , 20 ) , Font = Enum . Font . GothamBold , TextXAlignment = Enum .
TextXAlignment . Right , ZIndex = 60 , } ) local Bar = New ( __dxs("4672616d65") , { Position =
UDim2 . new ( 0 , 16 , 0 , 40 ) , Size = UDim2 . new ( 1 , - 32 , 0 , 6 ) , BackgroundColor3 = COLOR
. switchOff , BorderSizePixel = 0 , ZIndex = 60 , } , Row ) Corner ( Bar , 3 ) local Fill = New (
__dxs("4672616d65") , { Size = UDim2 . fromScale ( 0 , 1 ) , BackgroundColor3 = COLOR . red ,
BorderSizePixel = 0 , ZIndex = 61 , } , Bar ) Corner ( Fill , 3 ) local Knob = New (
__dxs("4672616d65") , { AnchorPoint = Vector2 . new ( 0 . 5 , 0 . 5 ) , Position = UDim2 . fromScale
( 0 , 0 . 5 ) , Size = UDim2 . fromOffset ( 16 , 16 ) , BackgroundColor3 = Color3 . new ( 1 , 1 , 1
) , BorderSizePixel = 0 , ZIndex = 65 , } , Bar ) Corner ( Knob , 8 ) local KnobStroke = Stroke (
Knob , COLOR . red , 2 , 0 ) local Hit = New ( __dxs("54657874427574746f6e") , { Position = UDim2 .
new ( 0 , 0 , 0 , 28 ) , Size = UDim2 . new ( 1 , 0 , 0 , 30 ) , BackgroundTransparency = 1 , Text =
__dxs("") , ZIndex = 70 , } , Row ) OnTheme ( function ( ) ValueLabel . TextColor3 = COLOR . redSoft
Fill . BackgroundColor3 = COLOR . red KnobStroke . Color = COLOR . red RowStroke . Color = COLOR .
innerBorder Row . BackgroundColor3 = COLOR . innerBg Accent . BackgroundColor3 = COLOR . redBright
end ) local value = default local pow = 10 ^ decimals local function setValue ( v , silent ) v =
math . clamp ( v , min , max ) v = math . floor ( v * pow + 0 . 5 ) / pow value = v local a = ( v -
min ) / ( max - min ) Fill . Size = UDim2 . fromScale ( a , 1 ) Knob . Position = UDim2 . fromScale
( a , 0 . 5 ) ValueLabel . Text = string . format ( __dxs("252e") .. decimals .. __dxs("66") , v )
if not silent and not releaseOnly then task . spawn ( Safe , onChange , v ) end end setValue (
default , true ) local dragging , dragInput = false , nil local function fromX ( x ) local w = Bar .
AbsoluteSize . X if w <= 0 then return end setValue ( min + ( max - min ) * math . clamp ( ( x - Bar
. AbsolutePosition . X ) / w , 0 , 1 ) ) end track ( Hit . InputBegan : Connect ( function ( input )
local t = input . UserInputType if t == Enum . UserInputType . MouseButton1 or t == Enum .
UserInputType . Touch then if dragging or not Interaction . Begin ( Hit ) then return end dragging =
true dragInput = input fromX ( input . Position . X ) end end ) ) track ( UIS . InputChanged :
Connect ( function ( input ) if not dragging then return end local t = input . UserInputType if t ==
Enum . UserInputType . MouseMovement or ( t == Enum . UserInputType . Touch and input == dragInput )
then fromX ( input . Position . X ) end end ) ) track ( UIS . InputEnded : Connect ( function (
input ) if not dragging then return end local t = input . UserInputType if t == Enum . UserInputType
. MouseButton1 or ( t == Enum . UserInputType . Touch and input == dragInput ) then dragging = false
dragInput = nil Interaction . End ( Hit ) if releaseOnly then task . spawn ( Safe , onChange , value
) end end end ) ) return { Set = setValue , Get = function ( ) return value end } end local function
Dropdown ( parent , text , opts ) opts = opts or { } local multi = opts . Multi == true local open ,
hover = false , false local selected = multi and { } or nil local Wrap = New ( __dxs("4672616d65") ,
{ Size = UDim2 . new ( 1 , 0 , 0 , 0 ) , AutomaticSize = Enum . AutomaticSize . Y ,
BackgroundTransparency = 1 , LayoutOrder = ord ( parent ) , } , parent ) New (
__dxs("55494c6973744c61796f7574") , { Padding = UDim . new ( 0 , 6 ) , SortOrder = Enum . SortOrder
. LayoutOrder } , Wrap ) local Head , HeadStroke , Accent = CardBase ( Wrap , 42 ,
__dxs("54657874427574746f6e") ) Txt ( Head , { Position = UDim2 . new ( 0 , 16 , 0 , 0 ) , Size =
UDim2 . new ( 0 . 45 , - 32 , 1 , 0 ) , Text = text , Font = Enum . Font . GothamMedium ,
TextTruncate = Enum . TextTruncate . AtEnd , ZIndex = 60 , } ) local Arrow = New (
__dxs("4672616d65") , { AnchorPoint = Vector2 . new ( 0 . 5 , 0 . 5 ) , Position = UDim2 . new ( 1 ,
- 20 , 0 . 5 , 0 ) , Size = UDim2 . fromOffset ( 16 , 16 ) , BackgroundTransparency = 1 , ZIndex =
60 , } , Head ) local ArrowArms = { } for _ , side in ipairs ( { - 1 , 1 } ) do local arm = New (
__dxs("4672616d65") , { AnchorPoint = Vector2 . new ( 0 . 5 , 0 . 5 ) , Position = UDim2 .
fromOffset ( 8 + side * 3 , 9 ) , Size = UDim2 . fromOffset ( 2 , 8 ) , Rotation = side * 45 ,
BackgroundColor3 = COLOR . grey , BorderSizePixel = 0 , ZIndex = 61 , } , Arrow ) Corner ( arm , 1 )
table . insert ( ArrowArms , arm ) end local ValueLabel = Txt ( Head , { AnchorPoint = Vector2 . new
( 1 , 0 . 5 ) , Position = UDim2 . new ( 1 , - 36 , 0 . 5 , 0 ) , Size = UDim2 . new ( 0 . 55 , - 44
, 1 , 0 ) , Font = Enum . Font . GothamBold , TextXAlignment = Enum . TextXAlignment . Right ,
TextTruncate = Enum . TextTruncate . AtEnd , ZIndex = 60 , } ) local List = New (
__dxs("4672616d65") , { Size = UDim2 . new ( 1 , 0 , 0 , 0 ) , AutomaticSize = Enum . AutomaticSize
. Y , BackgroundColor3 = COLOR . innerBg , BorderSizePixel = 0 , Visible = false , LayoutOrder = 2 ,
ZIndex = 50 , } , Wrap ) Corner ( List , 10 ) local ListStroke = Stroke ( List , COLOR . innerBorder
, 1 . 2 , 0 ) New ( __dxs("554950616464696e67") , { PaddingTop = UDim . new ( 0 , 6 ) ,
PaddingBottom = UDim . new ( 0 , 6 ) , PaddingLeft = UDim . new ( 0 , 6 ) , PaddingRight = UDim .
new ( 0 , 6 ) , } , List ) New ( __dxs("55494c6973744c61796f7574") , { Padding = UDim . new ( 0 , 4
) , SortOrder = Enum . SortOrder . LayoutOrder } , List ) local rows = { } local function available
( ) return not opts . Available or opts . Available ( ) end local function optionList ( ) local src
= opts . Options if type ( src ) == __dxs("66756e6374696f6e") then local ok , r = pcall ( src ) src
= ok and r or { } end local out = { } if type ( src ) == __dxs("7461626c65") then for _ , v in
ipairs ( src ) do table . insert ( out , typeof ( v ) == __dxs("496e7374616e6365") and v . Name or
tostring ( v ) ) end end return out end local function isSel ( name ) if multi then return selected
[ name ] == true end return selected == name end local function get ( ) if multi then local arr = {
} for k in pairs ( selected ) do table . insert ( arr , k ) end table . sort ( arr ) return arr end
return selected end local function summary ( ) if not available ( ) then return
__dxs("4e6f7420417661696c61626c65") end if multi then local n , last = 0 , nil for k in pairs (
selected ) do n += 1 last = k end if n == 0 then return opts . Placeholder or __dxs("4e6f6e65")
elseif n == 1 then return last end return n .. __dxs("2073656c6563746564") end return selected or
opts . Placeholder or __dxs("53656c6563742e2e2e") end local function paintRows ( ) for _ , r in
ipairs ( rows ) do if r . Paint then r . Paint ( ) end end end local function paint ( ) Tween ( Head
, 0 . 15 , { BackgroundColor3 = ( hover or open ) and COLOR . innerBgHover or COLOR . innerBg } )
Tween ( HeadStroke , 0 . 15 , { Color = open and COLOR . red or ( hover and COLOR . innerBorderHover
or COLOR . innerBorder ) , Thickness = ( open or hover ) and 1 . 7 or 1 . 5 , } ) Tween ( Accent , 0
. 15 , { BackgroundColor3 = ( open or hover ) and COLOR . redSoft or COLOR . redBright } ) Tween (
Arrow , 0 . 18 , { Rotation = open and 180 or 0 } ) for _ , arm in ipairs ( ArrowArms ) do Tween (
arm , 0 . 18 , { BackgroundColor3 = open and COLOR . redSoft or COLOR . grey } ) end ValueLabel .
Text = summary ( ) ValueLabel . TextColor3 = ( not available ( ) ) and COLOR . bad or COLOR .
redSoft List . BackgroundColor3 = COLOR . innerBg ListStroke . Color = COLOR . innerBorder end local
api = { } local function fire ( ) task . spawn ( Safe , opts . OnChange , get ( ) ) end local
function rebuild ( ) for _ , r in ipairs ( rows ) do r . Btn : Destroy ( ) end table . clear ( rows
) local list = optionList ( ) if # list == 0 then local Empty = Txt ( List , { Size = UDim2 . new (
1 , 0 , 0 , 28 ) , Text =
__dxs("e0b984e0b8a1e0b988e0b8a1e0b8b5e0b895e0b8b1e0b8a7e0b980e0b8a5e0b8b7e0b8ade0b881") , TextColor3
= COLOR . grey , TextXAlignment = Enum . TextXAlignment . Center , LayoutOrder = 1 , ZIndex = 55 , }
) table . insert ( rows , { Btn = Empty } ) return end for i , name in ipairs ( list ) do local Btn
= New ( __dxs("54657874427574746f6e") , { Size = UDim2 . new ( 1 , 0 , 0 , 30 ) , BackgroundColor3 =
COLOR . innerBgHover , BackgroundTransparency = 1 , BorderSizePixel = 0 , AutoButtonColor = false ,
Text = __dxs("") , LayoutOrder = i , ZIndex = 55 , } , List ) Corner ( Btn , 8 ) local Box = New (
__dxs("4672616d65") , { AnchorPoint = Vector2 . new ( 0 , 0 . 5 ) , Position = UDim2 . new ( 0 , 8 ,
0 . 5 , 0 ) , Size = UDim2 . fromOffset ( 16 , 16 ) , BackgroundColor3 = COLOR . switchOff ,
BorderSizePixel = 0 , ZIndex = 60 , } , Btn ) Corner ( Box , multi and 4 or 8 ) local BoxStroke =
Stroke ( Box , COLOR . switchBorder , 1 . 4 , 0 ) local Mark = New ( __dxs("4672616d65") , {
AnchorPoint = Vector2 . new ( 0 . 5 , 0 . 5 ) , Position = UDim2 . fromScale ( 0 . 5 , 0 . 5 ) ,
Size = UDim2 . fromOffset ( 6 , 6 ) , BackgroundColor3 = Color3 . new ( 1 , 1 , 1 ) ,
BackgroundTransparency = 1 , BorderSizePixel = 0 , ZIndex = 62 , } , Box ) Corner ( Mark , 3 ) local
Label = Txt ( Btn , { Position = UDim2 . new ( 0 , 32 , 0 , 0 ) , Size = UDim2 . new ( 1 , - 40 , 1
, 0 ) , Text = name , Font = Enum . Font . GothamMedium , TextTruncate = Enum . TextTruncate . AtEnd
, ZIndex = 60 , } ) local rowHover = false local row = { Btn = Btn } function row . Paint ( ) local
sel = isSel ( name ) Tween ( Btn , 0 . 12 , { BackgroundTransparency = sel and 0 . 55 or ( rowHover
and 0 . 7 or 1 ) , BackgroundColor3 = COLOR . innerBgHover } ) Tween ( Box , 0 . 12 , {
BackgroundColor3 = sel and COLOR . red or COLOR . switchOff } ) Tween ( BoxStroke , 0 . 12 , { Color
= sel and COLOR . redBright or COLOR . switchBorder } ) Tween ( Mark , 0 . 12 , {
BackgroundTransparency = sel and 0 or 1 } ) Label . TextColor3 = sel and COLOR . white or COLOR .
grey end row . Paint ( ) Hover ( Btn , function ( h ) rowHover = h row . Paint ( ) end ) track ( Btn
. Activated : Connect ( function ( ) if multi then selected [ name ] = ( not selected [ name ] ) or
nil else selected = name open = false List . Visible = false end paintRows ( ) paint ( ) fire ( )
end ) ) table . insert ( rows , row ) end end function api . Get ( ) return get ( ) end function api
. Set ( value , silent ) if multi then selected = { } if type ( value ) == __dxs("7461626c65") then
for _ , v in ipairs ( value ) do selected [ tostring ( v ) ] = true end end else selected = value ~=
nil and tostring ( value ) or nil end paintRows ( ) paint ( ) if not silent then fire ( ) end end
function api . Refresh ( ) if open then rebuild ( ) end paint ( ) end if opts . Default ~= nil then
api . Set ( opts . Default , true ) end track ( Head . Activated : Connect ( function ( ) if not
available ( ) then Notify (
__dxs("e0b895e0b8b1e0b8a7e0b980e0b8a5e0b8b7e0b8ade0b881e0b899e0b8b5e0b989e0b8a2e0b8b1e0b887e0b984e0b8a1e0b988e0b984e0b894e0b989e0b89ce0b8b9e0b88120486f6f6b")
, false ) return end open = not open if open then rebuild ( ) end List . Visible = open paint ( )
end ) ) Hover ( Head , function ( h ) hover = h paint ( ) end ) OnTheme ( function ( ) paint ( )
paintRows ( ) end ) return Wrap , api end local function StatRow ( holder , label ) local Row = New
( __dxs("4672616d65") , { Size = UDim2 . new ( 1 , 0 , 0 , 18 ) , BackgroundTransparency = 1 } ,
holder ) local Dot = New ( __dxs("4672616d65") , { Position = UDim2 . new ( 0 , 2 , 0 . 5 , - 3 ) ,
Size = UDim2 . fromOffset ( 6 , 6 ) , BackgroundColor3 = COLOR . redBright , BorderSizePixel = 0 , }
, Row ) Corner ( Dot , 6 ) OnTheme ( function ( ) Dot . BackgroundColor3 = COLOR . redBright end )
Txt ( Row , { Position = UDim2 . new ( 0 , 16 , 0 , 0 ) , Size = UDim2 . new ( 0 . 4 , - 16 , 1 , 0
) , Text = label , TextColor3 = COLOR . grey , } ) return Txt ( Row , { Position = UDim2 . new ( 0 .
4 , 0 , 0 , 0 ) , Size = UDim2 . new ( 0 . 6 , 0 , 1 , 0 ) , Font = Enum . Font . GothamMedium ,
TextXAlignment = Enum . TextXAlignment . Right , TextTruncate = Enum . TextTruncate . AtEnd , } )
end function Actions . SetThemeColor ( c , silent ) DeriveTheme ( c ) Settings . ThemeColor =
Color3ToHex ( c ) for _ , fn in ipairs ( ThemeListeners ) do pcall ( fn ) end if not silent then
saveSettings ( ) end end local GameReplicatedStorage = game : GetService (
__dxs("5265706c69636174656453746f72616765") ) local GameRemote = GameReplicatedStorage :
WaitForChild ( __dxs("52656d6f7465") , 10 ) local function getRemote ( folder , name ) local f =
GameRemote and GameRemote : FindFirstChild ( folder ) return f and f : FindFirstChild ( name ) end
local DX_RemoteTrainOnce = getRemote ( __dxs("547261696e") , __dxs("547261696e4f6e63655245") ) local
DX_RemoteIntoAutoTrain = getRemote ( __dxs("547261696e") , __dxs("496e746f4175746f547261696e5245") )
local DX_RemoteExitAutoTrain = getRemote ( __dxs("547261696e") ,
__dxs("457869744175746f547261696e5245") ) local DX_RemoteStageFinished = getRemote (
__dxs("5374616765") , __dxs("537461676546696e69736865645246") ) local DX_RemoteGetOre = getRemote (
__dxs("5374616765") , __dxs("4765744f72655246") ) local DX_RemoteClaimedAllOre = getRemote (
__dxs("5374616765") , __dxs("436c61696d6564416c6c4f72655245") ) local DX_RemoteForge = getRemote (
__dxs("466f726765") , __dxs("466f7267655246") ) local DX_RemoteDungeonTicket = getRemote (
__dxs("44756e67656f6e") , __dxs("547279436c61696d4461696c7944756e5469635245") ) local
DX_RemoteIntoDungeon = getRemote ( __dxs("44756e67656f6e") ,
__dxs("547279496e746f44756e67656f6e5246") ) local DX_RemoteExitDungeon = getRemote (
__dxs("44756e67656f6e") , __dxs("4578697444756e67656f6e5245") ) local DX_RemoteStartRound =
getRemote ( __dxs("44756e67656f6e") , __dxs("5374617274526f756e645245") ) local
DX_RemoteCompleteRound = getRemote ( __dxs("44756e67656f6e") ,
__dxs("436f6d706c657465526f756e645246") ) local DX_BackpackData local DX_ProfileData local
DX_TrainCTRL local DX_OreHelper local DX_EnemyCTRL local DX_HPCTRL local DX_CommunicationUtils local
DX_EnemyHitBE pcall ( function ( ) DX_BackpackData = require ( GameReplicatedStorage . LocalData .
BackpackData ) end ) pcall ( function ( ) DX_ProfileData = require ( GameReplicatedStorage .
ProfileData ) end ) pcall ( function ( ) DX_TrainCTRL = require ( GameReplicatedStorage . CTRL .
TrainCTRL ) end ) pcall ( function ( ) DX_OreHelper = require ( GameReplicatedStorage . Config . Ore
. Helper ) end ) pcall ( function ( ) DX_EnemyCTRL = require ( GameReplicatedStorage . CTRL .
EnemyCTRL ) end ) pcall ( function ( ) DX_HPCTRL = require ( GameReplicatedStorage . CTRL . HPCTRL )
end ) pcall ( function ( ) DX_CommunicationUtils = require ( GameReplicatedStorage . Utils .
CommunicationUtils ) end ) pcall ( function ( ) if DX_CommunicationUtils and DX_CommunicationUtils .
TryGetBindableEvent then DX_EnemyHitBE = DX_CommunicationUtils . TryGetBindableEvent (
__dxs("41747461636b") , __dxs("456e656d794869744245") ) end end ) local DX_GameState = { AutoTrain =
false , AutoBestZone = false , TrainZone = __dxs("4175746f2042657374") , AutoStage = false , Stage =
__dxs("4175746f204d6178") , StageDelay = 0 . 35 , AutoCollectOre = false , AutoDungeon = false ,
DungeonInstantKill = false , DungeonStart = 1 , AutoForge = false , ForgeType =
__dxs("576561706f6e") , OreQuality = __dxs("42657374204f726573204669727374") , MaterialAmount = 4 ,
ForgeAmount = 1 , } local DX_TrainZones = { { Id = 1 , Name = __dxs("547261696e5f31202878312e3529")
, Rebirth = 0 , Pad = Vector3 . new ( - 53 , 3 , - 41 ) , Dummy = Vector3 . new ( - 57 . 88 , 6 . 94
, - 41 . 04 ) } , { Id = 2 , Name = __dxs("547261696e5f322028783229") , Rebirth = 2 , Pad = Vector3
. new ( - 53 , 3 , - 20 . 9 ) , Dummy = Vector3 . new ( - 57 . 88 , 6 . 94 , - 20 . 91 ) } , { Id =
3 , Name = __dxs("547261696e5f332028783429") , Rebirth = 5 , Pad = Vector3 . new ( - 53 , 3 , 21 . 4
) , Dummy = Vector3 . new ( - 57 . 88 , 6 . 94 , 21 . 37 ) } , { Id = 4 , Name =
__dxs("547261696e5f342028783629") , Rebirth = 9 , Pad = Vector3 . new ( - 53 , 3 , 43 . 25 ) , Dummy
= Vector3 . new ( - 57 . 88 , 6 . 94 , 43 . 25 ) } , { Id = 5 , Name =
__dxs("547261696e5f352028783829") , Rebirth = 12 , Pad = Vector3 . new ( - 80 , 8 . 6 , 21 . 29 ) ,
Dummy = Vector3 . new ( - 84 . 50 , 8 . 61 , 21 . 29 ) } , { Id = 6 , Name =
__dxs("547261696e5f36202878313029") , Rebirth = 15 , Pad = Vector3 . new ( - 80 , 9 . 1 , - 20 . 9 )
, Dummy = Vector3 . new ( - 83 . 92 , 9 . 11 , - 20 . 90 ) } , { Id = 7 , Name =
__dxs("547261696e5f37202878313529") , Rebirth = 18 , Pad = Vector3 . new ( - 108 , 12 . 7 , 32 . 24
) , Dummy = Vector3 . new ( - 114 . 22 , 12 . 73 , 32 . 24 ) } , { Id = 8 , Name =
__dxs("547261696e5f38202878323529") , Rebirth = 21 , Pad = Vector3 . new ( - 106 , 10 . 6 , - 31 ) ,
Dummy = Vector3 . new ( - 110 . 27 , 10 . 63 , - 30 . 99 ) } , } local function dxCharacter ( )
local c = LocalPlayer . Character local hrp = c and c : FindFirstChild (
__dxs("48756d616e6f6964526f6f7450617274") ) local hum = c and c : FindFirstChildOfClass (
__dxs("48756d616e6f6964") ) return c , hrp , hum end local function dxBestTrainZone ( ) local
rebirth = 0 pcall ( function ( ) local pd = DX_ProfileData and DX_ProfileData . GetTotalData ( )
rebirth = tonumber ( pd and pd . Eco and pd . Eco . rebirth ) or 0 end ) local best = DX_TrainZones
[ 1 ] for _ , z in ipairs ( DX_TrainZones ) do if rebirth >= z . Rebirth then best = z end end
return best end local function dxSelectedTrainZone ( ) if DX_GameState . TrainZone ==
__dxs("4175746f2042657374") then return dxBestTrainZone ( ) end for _ , z in ipairs ( DX_TrainZones
) do if z . Name == DX_GameState . TrainZone then return z end end return dxBestTrainZone ( ) end
local function dxTrain ( ) local zone = dxSelectedTrainZone ( ) local _ , hrp , hum = dxCharacter (
) if zone and hrp and hum and hum . Health > 0 then local dist = ( hrp . Position - zone . Pad ) .
Magnitude if dist > 6 then hrp . CFrame = CFrame . lookAt ( zone . Pad + Vector3 . new ( 0 , 1 . 5 ,
0 ) , zone . Dummy ) hrp . AssemblyLinearVelocity = Vector3 . zero end if DX_RemoteIntoAutoTrain and
LocalPlayer : GetAttribute ( __dxs("4175746f547261696e417265614944") ) ~= zone . Id then pcall (
function ( ) DX_RemoteIntoAutoTrain : FireServer ( zone . Id ) end ) end end pcall ( function ( ) if
DX_TrainCTRL and DX_TrainCTRL . TrainOnce then DX_TrainCTRL . TrainOnce ( ) end if
DX_RemoteTrainOnce then DX_RemoteTrainOnce : FireServer ( ) end end ) end local function
dxCollectWorldOre ( ) local count = 0 local cache = workspace : FindFirstChild (
__dxs("4f72654361636865") ) if not cache then return 0 end for _ , ore in ipairs ( cache :
GetChildren ( ) ) do local prompt = ore : FindFirstChildWhichIsA (
__dxs("50726f78696d69747950726f6d7074") , true ) if prompt then pcall ( function ( ) prompt .
MaxActivationDistance = 99999 prompt . RequiresLineOfSight = false if fireproximityprompt then
fireproximityprompt ( prompt , 0 ) else prompt : InputHoldBegin ( ) task . wait ( 0 . 04 ) prompt :
InputHoldEnd ( ) end end ) count += 1 end end return count end local function dxKillEnemy ( enemy )
if not enemy then return end local uuid = enemy : GetAttribute ( __dxs("55554944") ) or enemy . Name
if not uuid then return end pcall ( function ( ) if DX_EnemyHitBE then DX_EnemyHitBE : Fire ( uuid ,
1e30 ) end if DX_EnemyCTRL and DX_EnemyCTRL . HurtEnemy then DX_EnemyCTRL . HurtEnemy ( uuid , 1e30
) end if DX_EnemyCTRL and DX_EnemyCTRL . DeadEnemyData then DX_EnemyCTRL . DeadEnemyData ( uuid )
end if DX_HPCTRL and DX_HPCTRL . SetCurrentHP then DX_HPCTRL . SetCurrentHP ( enemy , 0 ) end enemy
: SetAttribute ( __dxs("44656164") , true ) local hum = enemy : FindFirstChildOfClass (
__dxs("48756d616e6f6964") ) if hum then hum . Health = 0 end end ) end local function dxStageId ( )
if DX_GameState . Stage == __dxs("4175746f204d6178") then local passed = 0 pcall ( function ( )
local pd = DX_ProfileData and DX_ProfileData . GetTotalData ( ) passed = tonumber ( pd and pd .
Stats and pd . Stats . StagePass ) or 0 end ) return __dxs("53746167655f") .. tostring ( math .
clamp ( passed + 1 , 1 , 27 ) ) end return tostring ( DX_GameState . Stage ) end local function
dxClearStage ( ) if DX_RemoteStageFinished then local stage = dxStageId ( ) local ok , ores = pcall
( function ( ) return DX_RemoteStageFinished : InvokeServer ( stage ) end ) if ok and type ( ores )
== __dxs("7461626c65") then for uuid in pairs ( ores ) do if DX_RemoteGetOre then pcall ( function (
) DX_RemoteGetOre : InvokeServer ( uuid ) end ) end end if DX_RemoteClaimedAllOre then pcall (
function ( ) DX_RemoteClaimedAllOre : FireServer ( ) end ) end end end local enemyFolder = workspace
: FindFirstChild ( __dxs("456e656d79466f6c646572") ) if enemyFolder then for _ , enemy in ipairs (
enemyFolder : GetChildren ( ) ) do if enemy : IsA ( __dxs("4d6f64656c") ) and not enemy :
GetAttribute ( __dxs("44656164") ) then dxKillEnemy ( enemy ) end end end if DX_GameState .
AutoCollectOre then dxCollectWorldOre ( ) end end local function dxDungeonCombat ( ) if not
LocalPlayer : GetAttribute ( __dxs("44756e67656f6e696e67") ) then return false end local enemyFolder
= workspace : FindFirstChild ( __dxs("456e656d79466f6c646572") ) local _ , hrp = dxCharacter ( )
local playerCF = hrp and hrp . CFrame or CFrame . new ( 3482 , 23 , - 4 ) local dmEnv = nil pcall (
function ( ) local ps = LocalPlayer : FindFirstChild ( __dxs("506c6179657253637269707473") ) local
manager = ps and ps : FindFirstChild ( __dxs("4d616e61676572") ) local dmScript = manager and
manager : FindFirstChild ( __dxs("44756e67656f6e4d616e61676572") ) if dmScript and getsenv then
dmEnv = getsenv ( dmScript ) end end ) local dungeonState = nil if dmEnv and debug and debug .
getupvalues and dmEnv . CheckFinishedOnce then pcall ( function ( ) local upvalues = debug .
getupvalues ( dmEnv . CheckFinishedOnce ) if type ( upvalues ) == __dxs("7461626c65") and type (
upvalues [ 1 ] ) == __dxs("7461626c65") then dungeonState = upvalues [ 1 ] end end ) end local
lastPivot = nil if DX_GameState . DungeonInstantKill and enemyFolder then for _ , enemy in ipairs (
enemyFolder : GetChildren ( ) ) do if enemy : IsA ( __dxs("4d6f64656c") ) and not enemy :
GetAttribute ( __dxs("44656164") ) then local uuid = enemy : GetAttribute ( __dxs("55554944") ) or
enemy . Name lastPivot = enemy : GetPivot ( ) pcall ( function ( ) if dungeonState then dungeonState
. DeadCF = lastPivot or playerCF end if DX_EnemyHitBE then DX_EnemyHitBE : Fire ( uuid , 1e30 ) end
if DX_EnemyCTRL and DX_EnemyCTRL . HurtEnemy then DX_EnemyCTRL . HurtEnemy ( uuid , 1e30 ) end if
DX_HPCTRL and DX_HPCTRL . SetCurrentHP then DX_HPCTRL . SetCurrentHP ( enemy , 0 ) end enemy :
SetAttribute ( __dxs("44656164") , true ) local hum = enemy : FindFirstChildOfClass (
__dxs("48756d616e6f6964") ) if hum then hum . Health = 0 end end ) end end end if dungeonState then
if not dungeonState . DeadCF or typeof ( dungeonState . DeadCF ) ~= __dxs("434672616d65") then
dungeonState . DeadCF = lastPivot or playerCF end end if dmEnv and dmEnv . CheckFinishedOnce then
pcall ( function ( ) dmEnv . CheckFinishedOnce ( ) end ) end if dungeonState and dungeonState .
Round and dungeonState . Round >= 30 and dungeonState . Finished then if dmEnv and dmEnv .
ExitDungeon then pcall ( function ( ) dmEnv . ExitDungeon ( ) end ) elseif DX_RemoteExitDungeon then
pcall ( function ( ) DX_RemoteExitDungeon : FireServer ( ) end ) end end if DX_GameState .
AutoCollectOre then dxCollectWorldOre ( ) end return true end local function dxOreEntries ( ) local
bp = DX_BackpackData and DX_BackpackData . GetData ( ) if not bp or not bp . have then return { }
end local entries = { } for uuid , item in pairs ( bp . have ) do if item . Type == __dxs("4f7265")
then local power = 0 pcall ( function ( ) if DX_OreHelper and DX_OreHelper . GetPower then power =
DX_OreHelper . GetPower ( item . ID ) or 0 end end ) entries [ # entries + 1 ] = { uuid = uuid ,
count = tonumber ( item . Number ) or 1 , power = power , } end end table . sort ( entries ,
function ( a , b ) if DX_GameState . OreQuality == __dxs("42657374204f726573204669727374") then
return a . power > b . power end return a . power < b . power end ) return entries end local
function dxForgeOnce ( ) if not DX_RemoteForge then return false ,
__dxs("466f7267655246206e6f7420666f756e64") end local requested = math . floor ( tonumber (
DX_GameState . MaterialAmount ) or 4 ) local maxAmount = DX_GameState . ForgeType ==
__dxs("576561706f6e") and 13 or 23 local target = math . clamp ( requested , 4 , maxAmount ) local
entries = dxOreEntries ( ) local oreList = { } local collected = 0 for _ , e in ipairs ( entries )
do local take = math . min ( e . count , target - collected ) if take > 0 then oreList [ e . uuid ]
= take collected += take end if collected >= target then break end end if collected < target then
return false , __dxs("4e6f7420656e6f756768204f72652028") .. collected .. __dxs("2f") .. target ..
__dxs("29") end local ok , result = pcall ( function ( ) return DX_RemoteForge : InvokeServer ( {
ConfigType = DX_GameState . ForgeType , UUIDList = oreList , } ) end ) if not ok then return false ,
tostring ( result ) end if not result then return false ,
__dxs("5365727665722072656a656374656420466f726765") end return true , DX_GameState . ForgeType ..
__dxs("20666f72676564") end task . spawn ( function ( ) while not destroyed do if DX_GameState .
AutoTrain or DX_GameState . AutoBestZone then dxTrain ( ) elseif DX_GameState . AutoStage then
dxClearStage ( ) task . wait ( math . clamp ( DX_GameState . StageDelay , 0 . 15 , 2 ) ) elseif
DX_GameState . AutoCollectOre then dxCollectWorldOre ( ) else if DX_RemoteExitAutoTrain and
LocalPlayer : GetAttribute ( __dxs("4175746f547261696e417265614944") ) then pcall ( function ( )
DX_RemoteExitAutoTrain : FireServer ( ) end ) end end task . wait ( 0 . 15 ) end end ) task . spawn
( function ( ) while not destroyed do if DX_GameState . AutoDungeon then if LocalPlayer :
GetAttribute ( __dxs("44756e67656f6e696e67") ) then dxDungeonCombat ( ) task . wait ( 0 . 25 ) else
if DX_RemoteDungeonTicket then pcall ( function ( ) DX_RemoteDungeonTicket : FireServer ( ) end )
end task . wait ( 0 . 25 ) if DX_RemoteIntoDungeon then pcall ( function ( ) DX_RemoteIntoDungeon :
InvokeServer ( math . clamp ( tonumber ( DX_GameState . DungeonStart ) or 1 , 1 , 30 ) ) end ) end
task . wait ( 2 . 5 ) end else task . wait ( 1 . 0 ) end end end ) task . spawn ( function ( ) while
not destroyed do if DX_GameState . AutoForge then local amount = DX_GameState . ForgeAmount if
amount == __dxs("4d4158") then while DX_GameState . AutoForge and not destroyed do local ok =
dxForgeOnce ( ) if not ok then break end task . wait ( 0 . 2 ) end else for _ = 1 , tonumber (
amount ) or 1 do if not DX_GameState . AutoForge or destroyed then break end local ok = dxForgeOnce
( ) if not ok then break end task . wait ( 0 . 2 ) end DX_GameState . AutoForge = false end end task
. wait ( 0 . 15 ) end end ) local function hookAvailable ( name ) return function ( ) return type (
Hooks [ name ] ) == __dxs("66756e6374696f6e") end end local function callHook ( name , ... ) local
fn = Hooks [ name ] if type ( fn ) ~= __dxs("66756e6374696f6e") then return false end local ok , err
= pcall ( fn , ... ) if not ok then warn ( __dxs("5b445850616e656c5d20486f6f6b2027") .. name ..
__dxs("27206572726f723a20") .. tostring ( err ) ) end return ok end local CARD_SHADE = ColorSequence
. new ( Color3 . new ( 1 , 1 , 1 ) , Color3 . fromRGB ( 200 , 200 , 212 ) ) do local Page =
CreatePage ( __dxs("4f76657276696577") ) CreateTab ( __dxs("4f76657276696577") , DX_TAB_ICONS [
__dxs("4f76657276696577") ] ) Section ( Page , __dxs("4f76657276696577") ) local Card = New (
__dxs("4672616d65") , { Size = UDim2 . new ( 1 , 0 , 0 , 0 ) , AutomaticSize = Enum . AutomaticSize
. Y , BackgroundColor3 = COLOR . innerBg , BorderSizePixel = 0 , LayoutOrder = ord ( Page ) , ZIndex
= 50 , } , Page ) Corner ( Card , 14 ) Gradient ( Card , CARD_SHADE , 0 ) local CardStroke = Stroke
( Card , COLOR . neon , 1 . 6 , 0 . 15 ) local CardStrokeGrad = Gradient ( CardStroke , NeonSequence
, 0 ) Spin ( CardStrokeGrad , 9 ) New ( __dxs("554950616464696e67") , { PaddingLeft = UDim . new ( 0
, 14 ) , PaddingRight = UDim . new ( 0 , 14 ) , PaddingTop = UDim . new ( 0 , 14 ) , PaddingBottom =
UDim . new ( 0 , 14 ) , } , Card ) New ( __dxs("55494c6973744c61796f7574") , { Padding = UDim . new
( 0 , 12 ) , SortOrder = Enum . SortOrder . LayoutOrder } , Card ) local HeaderRow = New (
__dxs("4672616d65") , { Size = UDim2 . new ( 1 , 0 , 0 , 64 ) , BackgroundTransparency = 1 ,
LayoutOrder = 1 , } , Card ) local Avatar = New ( __dxs("496d6167654c6162656c") , { Size = UDim2 .
fromOffset ( 64 , 64 ) , BackgroundColor3 = COLOR . black , BorderSizePixel = 0 , ZIndex = 55 , } ,
HeaderRow ) Corner ( Avatar , 32 ) local AvatarStroke = Stroke ( Avatar , COLOR . neon , 2 . 2 , 0 )
local AvatarGrad = Gradient ( AvatarStroke , NeonSequence , 0 ) Spin ( AvatarGrad , 6 ) Txt (
HeaderRow , { Position = UDim2 . new ( 0 , 78 , 0 , 2 ) , Size = UDim2 . new ( 1 , - 160 , 0 , 22 )
, Text = LocalPlayer . DisplayName , Font = Enum . Font . GothamBold , TextSize = 16 , TextTruncate
= Enum . TextTruncate . AtEnd , ZIndex = 55 , } ) Txt ( HeaderRow , { Position = UDim2 . new ( 0 ,
78 , 0 , 25 ) , Size = UDim2 . new ( 1 , - 160 , 0 , 16 ) , Text = __dxs("40") .. LocalPlayer . Name
, TextColor3 = COLOR . grey , TextTruncate = Enum . TextTruncate . AtEnd , ZIndex = 55 , } ) Txt (
HeaderRow , { Position = UDim2 . new ( 0 , 78 , 0 , 45 ) , Size = UDim2 . new ( 1 , - 160 , 0 , 14 )
, Text = __dxs("4163636f756e74204167653a20") .. LocalPlayer . AccountAge .. __dxs("2064617973") ,
TextSize = 10 , TextColor3 = COLOR . grey , ZIndex = 55 , } ) local Badge = New (
__dxs("4672616d65") , { AnchorPoint = Vector2 . new ( 1 , 0 ) , Position = UDim2 . new ( 1 , 0 , 0 ,
4 ) , Size = UDim2 . fromOffset ( 74 , 20 ) , BackgroundColor3 = Color3 . fromRGB ( 15 , 35 , 20 ) ,
BorderSizePixel = 0 , ZIndex = 55 , } , HeaderRow ) Corner ( Badge , 10 ) Stroke ( Badge , Color3 .
fromRGB ( 60 , 160 , 80 ) , 1 , 0 . 2 ) local BadgeDot = New ( __dxs("4672616d65") , { Position =
UDim2 . new ( 0 , 8 , 0 . 5 , - 3 ) , Size = UDim2 . fromOffset ( 6 , 6 ) , BackgroundColor3 = COLOR
. good , BorderSizePixel = 0 , ZIndex = 60 , } , Badge ) Corner ( BadgeDot , 6 ) Txt ( Badge , {
Position = UDim2 . new ( 0 , 18 , 0 , 0 ) , Size = UDim2 . new ( 1 , - 24 , 1 , 0 ) , Text =
__dxs("4f4e4c494e45") , Font = Enum . Font . GothamBold , TextSize = 9 , TextColor3 = COLOR . good ,
ZIndex = 60 , } ) task . spawn ( function ( ) local ok , content = pcall ( function ( ) return
Players : GetUserThumbnailAsync ( LocalPlayer . UserId , Enum . ThumbnailType . HeadShot , Enum .
ThumbnailSize . Size180x180 ) end ) if ok and Avatar . Parent then Avatar . Image = content end end
) local Tiles = New ( __dxs("4672616d65") , { Size = UDim2 . new ( 1 , 0 , 0 , 56 ) ,
BackgroundTransparency = 1 , LayoutOrder = 2 , } , Card ) New ( __dxs("55494c6973744c61796f7574") ,
{ FillDirection = Enum . FillDirection . Horizontal , Padding = UDim . new ( 0 , 8 ) , SortOrder =
Enum . SortOrder . LayoutOrder , } , Tiles ) local function Tile ( label , order ) local T = New (
__dxs("4672616d65") , { Size = UDim2 . new ( 1 / 3 , - 6 , 1 , 0 ) , BackgroundColor3 = COLOR .
innerBg , BorderSizePixel = 0 , LayoutOrder = order , ZIndex = 55 , } , Tiles ) Corner ( T , 10 )
Gradient ( T , CARD_SHADE , 90 ) local S = Stroke ( T , COLOR . innerBorder , 1 . 2 , 0 . 1 ) local
Bar = New ( __dxs("4672616d65") , { Visible = false , AnchorPoint = Vector2 . new ( 0 . 5 , 0 ) ,
Position = UDim2 . new ( 0 . 5 , 0 , 0 , 0 ) , Size = UDim2 . fromOffset ( 22 , 2 ) ,
BackgroundColor3 = COLOR . red , BorderSizePixel = 0 , ZIndex = 60 , } , T ) Corner ( Bar , 2 )
local V = Txt ( T , { Position = UDim2 . new ( 0 , 0 , 0 , 9 ) , Size = UDim2 . new ( 1 , 0 , 0 , 24
) , Text = __dxs("2d") , Font = Enum . Font . GothamBold , TextSize = 17 , TextXAlignment = Enum .
TextXAlignment . Center , ZIndex = 60 , } ) Txt ( T , { Position = UDim2 . new ( 0 , 0 , 0 , 33 ) ,
Size = UDim2 . new ( 1 , 0 , 0 , 14 ) , Text = string . upper ( label ) , Font = Enum . Font .
GothamMedium , TextSize = 9 , TextColor3 = COLOR . grey , TextXAlignment = Enum . TextXAlignment .
Center , ZIndex = 60 , } ) OnTheme ( function ( ) T . BackgroundColor3 = COLOR . innerBg S . Color =
COLOR . innerBorder Bar . BackgroundColor3 = COLOR . red V . TextColor3 = COLOR . redSoft end )
return V end local PlayersValue = Tile ( __dxs("506c6179657273") , 1 ) local PingValue = Tile (
__dxs("50696e67") , 2 ) local FpsValue = Tile ( __dxs("465053") , 3 ) local Divider = New (
__dxs("4672616d65") , { Size = UDim2 . new ( 1 , 0 , 0 , 1 ) , BackgroundColor3 = COLOR . border ,
BackgroundTransparency = 0 . 4 , BorderSizePixel = 0 , LayoutOrder = 3 , } , Card ) local
StatsHolder = New ( __dxs("4672616d65") , { Size = UDim2 . new ( 1 , 0 , 0 , 0 ) , AutomaticSize =
Enum . AutomaticSize . Y , BackgroundTransparency = 1 , LayoutOrder = 4 , } , Card ) New (
__dxs("55494c6973744c61796f7574") , { Padding = UDim . new ( 0 , 8 ) , SortOrder = Enum . SortOrder
. LayoutOrder } , StatsHolder ) local GameValue = StatRow ( StatsHolder , __dxs("47616d65") ) local
PlaceValue = StatRow ( StatsHolder , __dxs("506c616365204944") ) local ServerValue = StatRow (
StatsHolder , __dxs("536572766572") ) GameValue . Text = Context . GameName or game . Name
PlaceValue . Text = tostring ( game . PlaceId ) ServerValue . Text = ( game . JobId ~= __dxs("") and
string . sub ( game . JobId , 1 , 8 ) or __dxs("53747564696f") ) if not Context . GameName then task
. spawn ( function ( ) local ok , info = pcall ( function ( ) return MarketplaceService :
GetProductInfo ( game . PlaceId ) end ) if ok and type ( info ) == __dxs("7461626c65") and info .
Name and GameValue . Parent then GameValue . Text = info . Name end end ) end OnTheme ( function ( )
CardStroke . Color = COLOR . neon CardStrokeGrad . Color = NeonSequence AvatarStroke . Color = COLOR
. neon AvatarGrad . Color = NeonSequence Card . BackgroundColor3 = COLOR . innerBg Divider .
BackgroundColor3 = COLOR . border end ) local function updatePlayers ( ) PlayersValue . Text = #
Players : GetPlayers ( ) .. __dxs("2f") .. Players . MaxPlayers end updatePlayers ( ) task . spawn (
function ( ) local frames , acc = 0 , 0 track ( RunService . Heartbeat : Connect ( function ( dt )
frames += 1 acc += dt end ) ) while not destroyed and Card . Parent do task . wait ( 1 ) if acc > 0
then FpsValue . Text = tostring ( math . floor ( frames / acc + 0 . 5 ) ) frames , acc = 0 , 0 end
local ok , ping = pcall ( function ( ) return Stats . Network . ServerStatsItem [
__dxs("446174612050696e67") ] : GetValue ( ) end ) PingValue . Text = ( ok and ping ) and ( math .
floor ( ping ) .. __dxs("6d73") ) or __dxs("4e2f41") updatePlayers ( ) end end ) end do local Page =
CreatePage ( __dxs("4661726d") ) CreateTab ( __dxs("4661726d") , DX_TAB_ICONS [ __dxs("4661726d") ]
) Section ( Page , __dxs("547261696e696e67") ) Toggle ( Page , __dxs("4175746f20547261696e") , false
, function ( v ) DX_GameState . AutoTrain = v end ) Toggle ( Page ,
__dxs("4175746f2042657374205a6f6e65") , false , function ( v ) DX_GameState . AutoBestZone = v if v
then DX_GameState . TrainZone = __dxs("4175746f2042657374") end end ) local trainOptions = {
__dxs("4175746f2042657374") } for _ , z in ipairs ( DX_TrainZones ) do table . insert ( trainOptions
, z . Name ) end Dropdown ( Page , __dxs("547261696e696e67205a6f6e65") , { Options = trainOptions ,
Default = __dxs("4175746f2042657374") , OnChange = function ( v ) DX_GameState . TrainZone = v if v
== __dxs("4175746f2042657374") then DX_GameState . AutoBestZone = true end end , } ) Section ( Page
, __dxs("53746167652026204f7265") ) Toggle ( Page , __dxs("4175746f20436c656172205374616765") ,
false , function ( v ) DX_GameState . AutoStage = v end ) local stageOptions = {
__dxs("4175746f204d6178") } for i = 1 , 27 do table . insert ( stageOptions , __dxs("53746167655f")
.. i ) end Dropdown ( Page , __dxs("5374616765") , { Options = stageOptions , Default =
__dxs("4175746f204d6178") , OnChange = function ( v ) DX_GameState . Stage = v end , } ) Slider (
Page , __dxs("53746167652044656c6179") , 0 . 15 , 2 , 0 . 35 , 2 , function ( v ) DX_GameState .
StageDelay = v end , true ) Toggle ( Page , __dxs("4175746f20436f6c6c656374204f7265") , false ,
function ( v ) DX_GameState . AutoCollectOre = v end ) end do local Page = CreatePage (
__dxs("44756e67656f6e") ) CreateTab ( __dxs("44756e67656f6e") , DX_TAB_ICONS [
__dxs("44756e67656f6e") ] ) Section ( Page , __dxs("44756e67656f6e") ) Toggle ( Page ,
__dxs("4175746f2044756e67656f6e") , false , function ( v ) DX_GameState . AutoDungeon = v end )
Toggle ( Page , __dxs("496e7374616e74204b696c6c") , false , function ( v ) DX_GameState .
DungeonInstantKill = v end ) local rounds = { } for i = 1 , 30 do table . insert ( rounds , tostring
( i ) ) end Dropdown ( Page , __dxs("537461727420526f756e64") , { Options = rounds , Default =
__dxs("31") , OnChange = function ( v ) DX_GameState . DungeonStart = tonumber ( v ) or 1 end , } )
end do local Page = CreatePage ( __dxs("466f726765") ) CreateTab ( __dxs("466f726765") ,
DX_TAB_ICONS [ __dxs("466f726765") ] ) Section ( Page , __dxs("466f726765") ) Toggle ( Page ,
__dxs("4175746f20466f726765") , false , function ( v ) DX_GameState . AutoForge = v end ) Dropdown (
Page , __dxs("466f7267652054797065") , { Options = { __dxs("576561706f6e") , __dxs("41726d6f72") } ,
Default = __dxs("576561706f6e") , OnChange = function ( v ) DX_GameState . ForgeType = v end , } )
Dropdown ( Page , __dxs("4d6174657269616c205175616c697479") , { Options = {
__dxs("42657374204f726573204669727374") , __dxs("4c6f77657374204f726573204669727374") } , Default =
__dxs("42657374204f726573204669727374") , OnChange = function ( v ) DX_GameState . OreQuality = v
end , } ) Slider ( Page , __dxs("4d6174657269616c20416d6f756e74") , 4 , 23 , 4 , 0 , function ( v )
local max = DX_GameState . ForgeType == __dxs("576561706f6e") and 13 or 23 DX_GameState .
MaterialAmount = math . clamp ( math . floor ( v + 0 . 5 ) , 4 , max ) end , true ) Dropdown ( Page
, __dxs("466f72676520416d6f756e74") , { Options = { __dxs("31") , __dxs("35") , __dxs("3130") ,
__dxs("3230") , __dxs("3530") , __dxs("313030") , __dxs("4d4158") } , Default = __dxs("31") ,
OnChange = function ( v ) DX_GameState . ForgeAmount = ( v == __dxs("4d4158") ) and __dxs("4d4158")
or tonumber ( v ) end , } ) Button ( Page , __dxs("466f7267652053656c6563746564204e6f77") , function
( ) local ok , msg = dxForgeOnce ( ) Notify ( ok and msg or ( __dxs("466f726765206661696c65643a20")
.. tostring ( msg ) ) , ok ) end ) end do local Page = CreatePage ( __dxs("53657474696e6773") )
CreateTab ( __dxs("53657474696e6773") , __dxs("67656172") ) local ctl = { } local _ Section ( Page ,
__dxs("47656e6572616c") ) _ , ctl . anim = Toggle ( Page , __dxs("416e696d6174696f6e") , Settings .
Animate , function ( on ) Settings . Animate = on saveSettings ( ) end ) _ , ctl . pulse = Toggle (
Page , __dxs("5072656d69756d2045666665637473") , Settings . Pulse , function ( on ) Actions .
SetPulse ( on ) Settings . Pulse = on saveSettings ( ) end ) _ , ctl . float = Toggle ( Page ,
__dxs("53686f7720466c6f6174696e6720427574746f6e") , Settings . ShowFloating , function ( on )
Settings . ShowFloating = on Actions . RefreshFloating ( ) saveSettings ( ) end ) _ , ctl . autoload
= Toggle ( Page , __dxs("4175746f204c6f6164") , Settings . AutoLoad , function ( on ) Settings .
AutoLoad = on saveSettings ( ) callHook ( __dxs("4175746f4c6f6164") , on ) end ) Section ( Page ,
__dxs("50616e656c") ) local sizeMap = { Compact = { SIZE . minW , SIZE . minH } , Default = { SIZE .
defW , SIZE . defH } , Large = { SIZE . maxW , SIZE . maxH } , } local _ , sizeDrop = Dropdown (
Page , __dxs("50616e656c2053697a65") , { Options = { __dxs("436f6d70616374") ,
__dxs("44656661756c74") , __dxs("4c61726765") } , Default = __dxs("44656661756c74") , OnChange =
function ( v ) local s = sizeMap [ v ] if s then FitPanel ( s [ 1 ] , s [ 2 ] , false ) end end , }
) Button ( Page , __dxs("526573657420496e74657266616365") , function ( ) FitPanel ( SIZE . defW ,
SIZE . defH , true ) sizeDrop . Set ( __dxs("44656661756c74") , true ) Actions . ActivateTab (
__dxs("4f76657276696577") ) end ) Section ( Page , __dxs("5468656d6520436f6c6f72") ) local Presets =
{ { __dxs("526564") , __dxs("454231453334") } , { __dxs("4f72616e6765") , __dxs("463237313143") } ,
{ __dxs("476f6c64") , __dxs("453641463238") } , { __dxs("477265656e") , __dxs("323843383738") } , {
__dxs("4379616e") , __dxs("314543384536") } , { __dxs("426c7565") , __dxs("314538434542") } , {
__dxs("507572706c65") , __dxs("393633434536") } , { __dxs("50696e6b") , __dxs("454234424130") } , }
local Picker = New ( __dxs("4672616d65") , { Size = UDim2 . new ( 1 , 0 , 0 , 226 ) ,
BackgroundColor3 = COLOR . innerBg , BorderSizePixel = 0 , LayoutOrder = ord ( Page ) , ZIndex = 50
, } , Page ) Corner ( Picker , 14 ) Gradient ( Picker , CARD_SHADE , 0 ) local PickerStroke = Stroke
( Picker , COLOR . innerBorder , 1 . 5 , 0 ) local ph , ps , pv = 0 , 0 . 85 , 0 . 92 local picker =
{ } local bars = { } local presetSwatches = { } local function currentColor ( ) return Color3 .
fromHSV ( ph , ps , pv ) end local Preview = New ( __dxs("4672616d65") , { Position = UDim2 .
fromOffset ( 14 , 14 ) , Size = UDim2 . fromOffset ( 42 , 42 ) , BackgroundColor3 = currentColor ( )
, BorderSizePixel = 0 , ZIndex = 60 , } , Picker ) Corner ( Preview , 21 ) local PreviewStroke =
Stroke ( Preview , Color3 . new ( 1 , 1 , 1 ) , 2 , 0 . 55 ) local Field = New ( __dxs("4672616d65")
, { Position = UDim2 . new ( 0 , 66 , 0 , 14 ) , Size = UDim2 . new ( 1 , - 66 - 92 , 0 , 42 ) ,
BackgroundColor3 = COLOR . black , BorderSizePixel = 0 , ZIndex = 60 , } , Picker ) Corner ( Field ,
10 ) local FieldStroke = Stroke ( Field , COLOR . innerBorder , 1 . 5 , 0 ) Gradient ( Field ,
ColorSequence . new ( Color3 . fromRGB ( 235 , 235 , 240 ) , Color3 . new ( 1 , 1 , 1 ) ) , 90 ) Txt
( Field , { Position = UDim2 . new ( 0 , 12 , 0 , 0 ) , Size = UDim2 . fromOffset ( 14 , 42 ) , Text
= __dxs("23") , Font = Enum . Font . GothamBold , TextSize = 15 , TextColor3 = COLOR . grey , ZIndex
= 65 , } ) local Input = New ( __dxs("54657874426f78") , { Position = UDim2 . new ( 0 , 28 , 0 , 0 )
, Size = UDim2 . new ( 1 , - 38 , 1 , 0 ) , BackgroundTransparency = 1 , Text = Color3ToHex (
currentColor ( ) ) , PlaceholderText = __dxs("464632443442") , Font = Enum . Font . GothamBold ,
TextSize = 14 , TextColor3 = COLOR . white , PlaceholderColor3 = COLOR . grey , TextXAlignment =
Enum . TextXAlignment . Left , ClearTextOnFocus = false , ZIndex = 65 , } , Field ) local Apply =
New ( __dxs("54657874427574746f6e") , { AnchorPoint = Vector2 . new ( 1 , 0 ) , Position = UDim2 .
new ( 1 , - 14 , 0 , 14 ) , Size = UDim2 . fromOffset ( 70 , 42 ) , BackgroundColor3 = COLOR . red ,
BorderSizePixel = 0 , AutoButtonColor = false , Text = __dxs("4150504c59") , Font = Enum . Font .
GothamBold , TextSize = 11 , TextColor3 = Color3 . new ( 1 , 1 , 1 ) , ZIndex = 65 , } , Picker )
Corner ( Apply , 10 ) local ApplyStroke = Stroke ( Apply , COLOR . redBright , 1 . 2 , 0 . 35 )
Gradient ( Apply , ColorSequence . new ( Color3 . new ( 1 , 1 , 1 ) , Color3 . fromRGB ( 190 , 190 ,
190 ) ) , 90 ) Txt ( Picker , { Position = UDim2 . fromOffset ( 16 , 66 ) , Size = UDim2 . new ( 1 ,
- 32 , 0 , 12 ) , Text = __dxs("50524553455453") , Font = Enum . Font . GothamBold , TextSize = 9 ,
TextColor3 = COLOR . grey , ZIndex = 60 , } ) local PresetRow = New ( __dxs("4672616d65") , {
Position = UDim2 . fromOffset ( 14 , 82 ) , Size = UDim2 . new ( 1 , - 28 , 0 , 32 ) ,
BackgroundTransparency = 1 , ZIndex = 60 , } , Picker ) New ( __dxs("55494c6973744c61796f7574") , {
FillDirection = Enum . FillDirection . Horizontal , Padding = UDim . new ( 0 , 8 ) ,
VerticalAlignment = Enum . VerticalAlignment . Center , SortOrder = Enum . SortOrder . LayoutOrder ,
} , PresetRow ) local function MakeBar ( title , y , onMove ) Txt ( Picker , { Position = UDim2 .
fromOffset ( 16 , y - 15 ) , Size = UDim2 . new ( 1 , - 32 , 0 , 12 ) , Text = string . upper (
title ) , Font = Enum . Font . GothamBold , TextSize = 9 , TextColor3 = COLOR . grey , ZIndex = 60 ,
} ) local Track = New ( __dxs("4672616d65") , { Position = UDim2 . new ( 0 , 14 , 0 , y ) , Size =
UDim2 . new ( 1 , - 28 , 0 , 12 ) , BackgroundColor3 = Color3 . new ( 1 , 1 , 1 ) , BorderSizePixel
= 0 , ZIndex = 60 , } , Picker ) Corner ( Track , 6 ) Stroke ( Track , COLOR . innerBorder , 1 , 0 .
3 ) local G = Gradient ( Track , ColorSequence . new ( Color3 . new ( 1 , 1 , 1 ) ) , 0 ) local Knob
= New ( __dxs("4672616d65") , { AnchorPoint = Vector2 . new ( 0 . 5 , 0 . 5 ) , Position = UDim2 .
fromScale ( 0 , 0 . 5 ) , Size = UDim2 . fromOffset ( 20 , 20 ) , BackgroundColor3 = Color3 . new (
1 , 1 , 1 ) , BorderSizePixel = 0 , ZIndex = 66 , } , Track ) Corner ( Knob , 10 ) Stroke ( Knob ,
Color3 . fromRGB ( 20 , 20 , 24 ) , 2 . 5 , 0 . 1 ) local Hit = New ( __dxs("54657874427574746f6e")
, { Position = UDim2 . new ( 0 , 14 , 0 , y - 12 ) , Size = UDim2 . new ( 1 , - 28 , 0 , 36 ) ,
BackgroundTransparency = 1 , Text = __dxs("") , ZIndex = 70 , } , Picker ) local bar = { Gradient =
G , Knob = Knob } function bar . Set ( v ) Knob . Position = UDim2 . fromScale ( math . clamp ( v ,
0 , 1 ) , 0 . 5 ) end local dragging , dragInput = false , nil local function fromX ( x ) local w =
Track . AbsoluteSize . X if w <= 0 then return end onMove ( math . clamp ( ( x - Track .
AbsolutePosition . X ) / w , 0 , 1 ) , false ) end track ( Hit . InputBegan : Connect ( function (
input ) local t = input . UserInputType if t == Enum . UserInputType . MouseButton1 or t == Enum .
UserInputType . Touch then if dragging or not Interaction . Begin ( Hit ) then return end dragging ,
dragInput = true , input fromX ( input . Position . X ) end end ) ) track ( UIS . InputChanged :
Connect ( function ( input ) if not dragging then return end local t = input . UserInputType if t ==
Enum . UserInputType . MouseMovement or ( t == Enum . UserInputType . Touch and input == dragInput )
then fromX ( input . Position . X ) end end ) ) track ( UIS . InputEnded : Connect ( function (
input ) if not dragging then return end local t = input . UserInputType if t == Enum . UserInputType
. MouseButton1 or ( t == Enum . UserInputType . Touch and input == dragInput ) then dragging ,
dragInput = false , nil Interaction . End ( Hit ) onMove ( nil , true ) end end ) ) return bar end
local function refreshVisual ( ) local c = currentColor ( ) Preview . BackgroundColor3 = c if not
Input : IsFocused ( ) then Input . Text = Color3ToHex ( c ) end bars . h . Set ( ph ) bars . s . Set
( ps ) bars . v . Set ( pv ) bars . s . Gradient . Color = ColorSequence . new ( Color3 . fromHSV (
ph , 0 , pv ) , Color3 . fromHSV ( ph , 1 , pv ) ) bars . v . Gradient . Color = ColorSequence . new
( Color3 . new ( 0 , 0 , 0 ) , Color3 . fromHSV ( ph , ps , 1 ) ) local hex = Color3ToHex ( c ) for
_ , sw in ipairs ( presetSwatches ) do local on = sw . Hex == Color3ToHex ( HexToColor3 ( sw . Hex )
) and sw . Hex == hex Tween ( sw . Stroke , 0 . 15 , { Color = on and Color3 . new ( 1 , 1 , 1 ) or
COLOR . innerBorder , Transparency = on and 0 or 0 . 2 , Thickness = on and 2 . 4 or 1 . 5 } ) end
end local function applyCurrent ( ) Actions . SetThemeColor ( currentColor ( ) ) end bars . h =
MakeBar ( __dxs("487565") , 138 , function ( v , released ) if released then applyCurrent ( ) else
ph = v refreshVisual ( ) end end ) bars . s = MakeBar ( __dxs("53617475726174696f6e") , 172 ,
function ( v , released ) if released then applyCurrent ( ) else ps = v refreshVisual ( ) end end )
bars . v = MakeBar ( __dxs("4272696768746e657373") , 206 , function ( v , released ) if released
then applyCurrent ( ) else pv = math . max ( v , 0 . 25 ) refreshVisual ( ) end end ) bars . h .
Gradient . Color = ColorSequence . new ( { ColorSequenceKeypoint . new ( 0 , Color3 . fromHSV ( 0 ,
1 , 1 ) ) , ColorSequenceKeypoint . new ( 0 . 17 , Color3 . fromHSV ( 0 . 17 , 1 , 1 ) ) ,
ColorSequenceKeypoint . new ( 0 . 33 , Color3 . fromHSV ( 0 . 33 , 1 , 1 ) ) , ColorSequenceKeypoint
. new ( 0 . 5 , Color3 . fromHSV ( 0 . 5 , 1 , 1 ) ) , ColorSequenceKeypoint . new ( 0 . 67 , Color3
. fromHSV ( 0 . 67 , 1 , 1 ) ) , ColorSequenceKeypoint . new ( 0 . 83 , Color3 . fromHSV ( 0 . 83 ,
1 , 1 ) ) , ColorSequenceKeypoint . new ( 1 , Color3 . fromHSV ( 1 , 1 , 1 ) ) , } ) function picker
. Sync ( c ) ph , ps , pv = Color3 . toHSV ( c ) pv = math . max ( pv , 0 . 25 ) refreshVisual ( )
end for i , p in ipairs ( Presets ) do local col = HexToColor3 ( p [ 2 ] ) local Swatch = New (
__dxs("54657874427574746f6e") , { Size = UDim2 . fromOffset ( 30 , 30 ) , BackgroundColor3 = col ,
AutoButtonColor = false , Text = __dxs("") , LayoutOrder = i , ZIndex = 65 , } , PresetRow ) Corner
( Swatch , 15 ) local SwStroke = Stroke ( Swatch , COLOR . innerBorder , 1 . 5 , 0 . 2 ) table .
insert ( presetSwatches , { Hex = p [ 2 ] , Stroke = SwStroke } ) track ( Swatch . MouseEnter :
Connect ( function ( ) Tween ( Swatch , 0 . 12 , { Size = UDim2 . fromOffset ( 34 , 34 ) } ) end ) )
track ( Swatch . MouseLeave : Connect ( function ( ) Tween ( Swatch , 0 . 12 , { Size = UDim2 .
fromOffset ( 30 , 30 ) } ) end ) ) track ( Swatch . Activated : Connect ( function ( ) picker . Sync
( col ) applyCurrent ( ) end ) ) end track ( Input . Focused : Connect ( function ( ) Tween (
FieldStroke , 0 . 15 , { Color = COLOR . redBright , Thickness = 2 } ) Tween ( Field , 0 . 15 , {
BackgroundColor3 = Color3 . fromRGB ( 18 , 18 , 24 ) } ) end ) ) track ( Input :
GetPropertyChangedSignal ( __dxs("54657874") ) : Connect ( function ( ) local clean = string . upper
( Input . Text : gsub ( __dxs("5b5e25785d") , __dxs("") ) ) : sub ( 1 , 6 ) if clean ~= Input . Text
then Input . Text = clean return end local c = HexToColor3 ( clean ) if c and Input : IsFocused ( )
then Preview . BackgroundColor3 = c end end ) ) local function commitHex ( ) local c = HexToColor3 (
Input . Text ) if c then picker . Sync ( c ) applyCurrent ( ) else Notify (
__dxs("e0b982e0b884e0b989e0b894e0b8aae0b8b5e0b984e0b8a1e0b988e0b896e0b8b9e0b881e0b895e0b989e0b8ade0b8872028e0b895e0b989e0b8ade0b887e0b8a1e0b8b5203620e0b8abe0b8a5e0b8b1e0b88129")
, false ) Tween ( FieldStroke , 0 . 1 , { Color = COLOR . bad } ) task . delay ( 0 . 4 , function (
) if FieldStroke . Parent then Tween ( FieldStroke , 0 . 2 , { Color = COLOR . innerBorder } ) end
end ) refreshVisual ( ) end end track ( Input . FocusLost : Connect ( function ( enter ) Tween (
FieldStroke , 0 . 15 , { Color = COLOR . innerBorder , Thickness = 1 . 5 } ) Tween ( Field , 0 . 15
, { BackgroundColor3 = COLOR . black } ) if enter then commitHex ( ) else refreshVisual ( ) end end
) ) track ( Apply . Activated : Connect ( commitHex ) ) Hover ( Apply , function ( h ) Tween ( Apply
, 0 . 12 , { BackgroundColor3 = h and COLOR . redBright or COLOR . red } ) end ) OnTheme ( function
( ) Picker . BackgroundColor3 = COLOR . innerBg PickerStroke . Color = COLOR . innerBorder
FieldStroke . Color = COLOR . innerBorder Apply . BackgroundColor3 = COLOR . red ApplyStroke . Color
= COLOR . redBright end ) picker . Sync ( HexToColor3 ( Settings . ThemeColor ) or COLOR . red )
Section ( Page , __dxs("416374696f6e73") ) Button ( Page , __dxs("52657365742053657474696e6773") ,
function ( ) Settings = copyTable ( DEFAULT_SETTINGS ) ctl . anim . Set ( Settings . Animate , true
) ctl . pulse . Set ( Settings . Pulse , true ) ctl . float . Set ( Settings . ShowFloating , true )
ctl . autoload . Set ( Settings . AutoLoad , true ) Actions . SetPulse ( Settings . Pulse ) Actions
. SetThemeColor ( HexToColor3 ( Settings . ThemeColor ) , true ) picker . Sync ( HexToColor3 (
Settings . ThemeColor ) ) sizeDrop . Set ( __dxs("44656661756c74") , true ) FitPanel ( SIZE . defW ,
SIZE . defH , true ) Actions . RefreshFloating ( ) saveSettings ( ) Notify (
__dxs("e0b8a3e0b8b5e0b980e0b88be0b987e0b895e0b881e0b8b2e0b8a3e0b895e0b8b1e0b989e0b887e0b884e0b988e0b8b2e0b981e0b8a5e0b989e0b8a7")
, true ) end ) Button ( Page , __dxs("44657374726f7920475549") , cleanup , true ) end do local Page
= CreatePage ( __dxs("43726564697473") ) CreateTab ( __dxs("43726564697473") , __dxs("696e666f") )
Section ( Page , __dxs("43726564697473") ) local Card = New ( __dxs("4672616d65") , { Size = UDim2 .
new ( 1 , 0 , 0 , 0 ) , AutomaticSize = Enum . AutomaticSize . Y , BackgroundColor3 = COLOR .
innerBg , BorderSizePixel = 0 , LayoutOrder = ord ( Page ) , ZIndex = 50 , } , Page ) Corner ( Card
, 14 ) Gradient ( Card , CARD_SHADE , 0 ) local CardStroke = Stroke ( Card , COLOR . neon , 1 . 6 ,
0 . 15 ) local CardStrokeGrad = Gradient ( CardStroke , NeonSequence , 0 ) Spin ( CardStrokeGrad , 9
) New ( __dxs("554950616464696e67") , { PaddingLeft = UDim . new ( 0 , 16 ) , PaddingRight = UDim .
new ( 0 , 16 ) , PaddingTop = UDim . new ( 0 , 16 ) , PaddingBottom = UDim . new ( 0 , 16 ) , } ,
Card ) New ( __dxs("55494c6973744c61796f7574") , { Padding = UDim . new ( 0 , 6 ) , SortOrder = Enum
. SortOrder . LayoutOrder } , Card ) local Logo = Txt ( Card , { Size = UDim2 . new ( 1 , 0 , 0 , 28
) , Text = __dxs("44582050616e656c") , Font = Enum . Font . GothamBlack , TextSize = 22 ,
LayoutOrder = 1 , ZIndex = 55 , } ) local Line = New ( __dxs("4672616d65") , { Visible = false ,
Size = UDim2 . fromOffset ( 42 , 2 ) , BackgroundColor3 = COLOR . red , BorderSizePixel = 0 ,
LayoutOrder = 2 , ZIndex = 55 , } , Card ) Corner ( Line , 2 ) Txt ( Card , { Size = UDim2 . new ( 1
, 0 , 0 , 16 ) , Text = __dxs("556e6976657273616c20436f6e74726f6c2050616e656c") , TextColor3 = COLOR
. grey , LayoutOrder = 3 , ZIndex = 55 , } ) Txt ( Card , { Size = UDim2 . new ( 1 , 0 , 0 , 18 ) ,
Text = __dxs("5549202f2053797374656d20203a20204458205465616d") , Font = Enum . Font . GothamMedium ,
LayoutOrder = 4 , ZIndex = 55 , } ) Txt ( Card , { Size = UDim2 . new ( 1 , 0 , 0 , 16 ) , Text =
__dxs("4e656f6e20554920696e737069726564206279207468652044582074656d706c617465") , TextSize = 10 ,
TextColor3 = COLOR . grey , LayoutOrder = 5 , ZIndex = 55 , } ) OnTheme ( function ( ) Logo .
TextColor3 = COLOR . red Line . BackgroundColor3 = COLOR . red Card . BackgroundColor3 = COLOR .
innerBg CardStroke . Color = COLOR . neon CardStrokeGrad . Color = NeonSequence end ) end Actions .
ApplyLayout ( ) Actions . ActivateTab ( __dxs("4f76657276696577") ) local function Draggable (
handle , opts ) local dragging , moved = false , false local startInput , startPointer , startValue
local function finish ( ) if not dragging then return end dragging = false Interaction . End (
handle ) if not moved and opts . onClick then opts . onClick ( ) end end track ( handle . InputBegan
: Connect ( function ( input ) if input . UserInputType ~= Enum . UserInputType . MouseButton1 and
input . UserInputType ~= Enum . UserInputType . Touch then return end if opts . canStart and not
opts . canStart ( ) then return end if dragging or not Interaction . Begin ( handle ) then return
end dragging , moved = true , false startInput = input startPointer = Vector2 . new ( input .
Position . X , input . Position . Y ) startValue = opts . get ( ) input . Changed : Connect (
function ( ) if input . UserInputState == Enum . UserInputState . End then finish ( ) end end ) end
) ) track ( UIS . InputChanged : Connect ( function ( input ) if not dragging then return end local
t = input . UserInputType if t == Enum . UserInputType . MouseMovement or ( t == Enum .
UserInputType . Touch and input == startInput ) then local delta = Vector2 . new ( input . Position
. X , input . Position . Y ) - startPointer if not moved and delta . Magnitude < 5 then return end
moved = true opts . set ( startValue + delta ) end end ) ) track ( UIS . InputEnded : Connect (
function ( input ) if input . UserInputType == Enum . UserInputType . MouseButton1 or ( input .
UserInputType == Enum . UserInputType . Touch and input == startInput ) then finish ( ) end end ) )
end local TOGGLE = 58 local ToggleCenter = Vector2 . new ( Viewport ( ) . X - 52 , Viewport ( ) . Y
* 0 . 72 ) local ToggleRoot = New ( __dxs("4672616d65") , { Name =
__dxs("466c6f6174696e67546f67676c65") , AnchorPoint = Vector2 . new ( 0 . 5 , 0 . 5 ) , Position =
UDim2 . fromOffset ( ToggleCenter . X , ToggleCenter . Y ) , Size = UDim2 . fromOffset ( TOGGLE ,
TOGGLE ) , BackgroundTransparency = 1 , BorderSizePixel = 0 , ZIndex = 200 , } , Gui ) local
ToggleGlow = NeonLayers ( ToggleRoot , 16 , { { 3 , 0 . 65 , 0 . 80 } , { 7 , 0 . 80 , 0 . 90 } , {
12 , 0 . 90 , 0 . 96 } , } ) local ToggleButton = New ( __dxs("54657874427574746f6e") , { Name =
__dxs("426f6479") , Size = UDim2 . fromScale ( 1 , 1 ) , BackgroundColor3 = Color3 . fromRGB ( 10 ,
10 , 14 ) , BorderSizePixel = 0 , AutoButtonColor = false , Text = __dxs("") , ZIndex = 10 , } ,
ToggleRoot ) Corner ( ToggleButton , 16 ) Gradient ( ToggleButton , ColorSequence . new ( {
ColorSequenceKeypoint . new ( 0 , Color3 . fromRGB ( 26 , 12 , 16 ) ) , ColorSequenceKeypoint . new
( 1 , Color3 . fromRGB ( 8 , 8 , 11 ) ) , } ) , 90 ) local ToggleStroke = Stroke ( ToggleButton ,
COLOR . neon , 2 , 0 ) local ToggleStrokeGrad = Gradient ( ToggleStroke , NeonSequence , 0 ) Spin (
ToggleStrokeGrad , 4 ) local ToggleLabel = New ( __dxs("546578744c6162656c") , { AnchorPoint =
Vector2 . new ( 0 . 5 , 0 . 5 ) , Position = UDim2 . new ( 0 . 5 , 0 , 0 . 5 , - 2 ) , Size = UDim2
. fromScale ( 1 , 0 . 7 ) , BackgroundTransparency = 1 , RichText = true , Text = __dxs("4458") ,
Font = Enum . Font . GothamBlack , TextSize = 24 , TextColor3 = COLOR . white , ZIndex = 12 , } ,
ToggleButton ) local ToggleLabelStroke = New ( __dxs("55495374726f6b65") , { Color = COLOR . neon ,
Thickness = 1 . 4 , Transparency = 0 . 45 , ApplyStrokeMode = Enum . ApplyStrokeMode . Contextual ,
} , ToggleLabel ) local ToggleBar = New ( __dxs("4672616d65") , { Visible = false , AnchorPoint =
Vector2 . new ( 0 . 5 , 1 ) , Position = UDim2 . new ( 0 . 5 , 0 , 1 , - 8 ) , Size = UDim2 .
fromOffset ( 22 , 2 ) , BackgroundColor3 = Color3 . new ( 1 , 1 , 1 ) , BorderSizePixel = 0 , ZIndex
= 12 , } , ToggleButton ) Corner ( ToggleBar , 2 ) local ToggleBarGrad = Gradient ( ToggleBar ,
ColorSequence . new ( COLOR . red ) , 0 ) local ToggleDot = New ( __dxs("4672616d65") , {
AnchorPoint = Vector2 . new ( 1 , 0 ) , Position = UDim2 . new ( 1 , - 7 , 0 , 7 ) , Size = UDim2 .
fromOffset ( 6 , 6 ) , BackgroundColor3 = COLOR . redBright , BorderSizePixel = 0 , ZIndex = 12 , }
, ToggleButton ) Corner ( ToggleDot , 6 ) local PanelVisible = true OnTheme ( function ( )
ToggleStroke . Color = COLOR . neon ToggleStrokeGrad . Color = NeonSequence ToggleLabelStroke .
Color = COLOR . neon for _ , layer in ipairs ( ToggleGlow ) do layer . Stroke . Color = COLOR . neon
end ToggleBarGrad . Color = ColorSequence . new ( { ColorSequenceKeypoint . new ( 0 , COLOR .
redDark ) , ColorSequenceKeypoint . new ( 0 . 5 , COLOR . redSoft ) , ColorSequenceKeypoint . new (
1 , COLOR . redDark ) , } ) ToggleDot . BackgroundColor3 = PanelVisible and COLOR . redBright or
Color3 . fromRGB ( 90 , 90 , 100 ) end ) local function SetToggleCenter ( v ) local vp = Viewport (
) local half = TOGGLE / 2 + 4 ToggleCenter = Vector2 . new ( math . clamp ( v . X , half , math .
max ( half , vp . X - half ) ) , math . clamp ( v . Y , half , math . max ( half , vp . Y - half ) )
) ToggleRoot . Position = UDim2 . fromOffset ( ToggleCenter . X , ToggleCenter . Y ) end track (
ToggleButton . MouseEnter : Connect ( function ( ) Tween ( ToggleRoot , 0 . 18 , { Size = UDim2 .
fromOffset ( TOGGLE + 6 , TOGGLE + 6 ) } ) Tween ( ToggleStroke , 0 . 18 , { Thickness = 2 . 6 } )
end ) ) track ( ToggleButton . MouseLeave : Connect ( function ( ) Tween ( ToggleRoot , 0 . 18 , {
Size = UDim2 . fromOffset ( TOGGLE , TOGGLE ) } ) Tween ( ToggleStroke , 0 . 18 , { Thickness = 2 }
) end ) ) function Actions . RefreshFloating ( ) ToggleRoot . Visible = Settings . ShowFloating or
not PanelVisible end local Animating = false local AnimToken = 0 local POP = 26 local function
SetToggleState ( open ) Tween ( ToggleDot , 0 . 2 , { BackgroundColor3 = open and COLOR . redBright
or Color3 . fromRGB ( 90 , 90 , 100 ) } ) Tween ( ToggleLabel , 0 . 2 , { TextTransparency = open
and 0 or 0 . 4 } ) end local function OpenPanel ( ) PanelVisible = true Animating = true AnimToken
+= 1 local token = AnimToken Actions . RefreshFloating ( ) Root . Visible = true Root . Size = UDim2
. fromOffset ( PanelSize . X - POP , PanelSize . Y - POP ) Root . Position = UDim2 . fromOffset (
PanelPos . X + POP / 2 , PanelPos . Y + POP / 2 ) Tween ( Root , 0 . 28 , { Size = UDim2 .
fromOffset ( PanelSize . X , PanelSize . Y ) , Position = UDim2 . fromOffset ( PanelPos . X ,
PanelPos . Y ) , } , Enum . EasingStyle . Back ) SetToggleState ( true ) task . delay ( 0 . 32 ,
function ( ) if token == AnimToken then Animating = false ApplyPanel ( ) end end ) end local
function ClosePanel ( ) PanelVisible = false Animating = true AnimToken += 1 local token = AnimToken
Actions . RefreshFloating ( ) Tween ( Root , 0 . 2 , { Size = UDim2 . fromOffset ( PanelSize . X -
POP , PanelSize . Y - POP ) , Position = UDim2 . fromOffset ( PanelPos . X + POP / 2 , PanelPos . Y
+ POP / 2 ) , } , Enum . EasingStyle . Quad , Enum . EasingDirection . In ) SetToggleState ( false )
task . delay ( 0 . 24 , function ( ) if token == AnimToken then Animating = false Root . Visible =
false ApplyPanel ( ) end end ) end local function CanMovePanel ( ) return PanelVisible and not
Animating end Draggable ( ToggleButton , { get = function ( ) return ToggleCenter end , set =
SetToggleCenter , onClick = function ( ) if PanelVisible then ClosePanel ( ) else OpenPanel ( ) end
end , } ) local PanelDrag = { get = function ( ) return PanelPos end , set = SetPanelPos , canStart
= CanMovePanel , } Draggable ( Header , PanelDrag ) Draggable ( Sidebar , PanelDrag ) track ( Close
. Activated : Connect ( function ( ) if PanelVisible then ClosePanel ( ) end end ) ) local Resize =
New ( __dxs("54657874427574746f6e") , { Name = __dxs("526573697a6548616e646c65") , AnchorPoint =
Vector2 . new ( 1 , 1 ) , Position = UDim2 . new ( 1 , - 3 , 1 , - 3 ) , Size = UDim2 . fromOffset (
26 , 26 ) , BackgroundTransparency = 1 , BorderSizePixel = 0 , AutoButtonColor = false , Text =
__dxs("") , ZIndex = 100 , } , Main ) local GripDots = { } for _ , p in ipairs ( { { 18 , 18 } , {
18 , 11 } , { 11 , 18 } , { 18 , 4 } , { 4 , 18 } , { 11 , 11 } } ) do local d = New (
__dxs("4672616d65") , { Position = UDim2 . fromOffset ( p [ 1 ] , p [ 2 ] ) , Size = UDim2 .
fromOffset ( 3 , 3 ) , BackgroundColor3 = COLOR . innerBorder , BorderSizePixel = 0 , ZIndex = 101 ,
} , Resize ) Corner ( d , 2 ) table . insert ( GripDots , d ) end local gripHover , gripActive =
false , false local function PaintGrip ( ) local c = ( gripHover or gripActive ) and COLOR . redSoft
or COLOR . innerBorder for _ , d in ipairs ( GripDots ) do Tween ( d , 0 . 15 , { BackgroundColor3 =
c } ) end end OnTheme ( PaintGrip ) track ( Resize . MouseEnter : Connect ( function ( ) gripHover =
true PaintGrip ( ) end ) ) track ( Resize . MouseLeave : Connect ( function ( ) gripHover = false
PaintGrip ( ) end ) ) local SizeTip = New ( __dxs("546578744c6162656c") , { AnchorPoint = Vector2 .
new ( 0 . 5 , 1 ) , Position = UDim2 . new ( 0 . 5 , 0 , 1 , - 14 ) , Size = UDim2 . fromOffset (
120 , 24 ) , BackgroundColor3 = COLOR . black , BackgroundTransparency = 0 . 1 , Text = __dxs("") ,
Font = Enum . Font . GothamBold , TextSize = 11 , TextColor3 = COLOR . white , Visible = false ,
ZIndex = 250 , } , Main ) Corner ( SizeTip , 12 ) local SizeTipStroke = Stroke ( SizeTip , COLOR .
red , 1 . 5 , 0 . 1 ) OnTheme ( function ( ) SizeTipStroke . Color = COLOR . red end ) local
tipToken = 0 local function ShowSizeTip ( ) tipToken += 1 local token = tipToken SizeTip . Text =
string . format ( __dxs("256420c3972025642573") , PanelSize . X , PanelSize . Y , PanelSize . X <
480 and __dxs("2020c2b72020436f6d70616374") or __dxs("") ) SizeTip . Size = UDim2 . fromOffset (
PanelSize . X < 480 and 150 or 100 , 24 ) SizeTip . Visible = true task . delay ( 0 . 9 , function (
) if token == tipToken and SizeTip . Parent and not gripActive then SizeTip . Visible = false end
end ) end Draggable ( Resize , { get = function ( ) return PanelSize end , set = function ( v )
gripActive = true PaintGrip ( ) SetPanelSize ( v . X , v . Y ) ShowSizeTip ( ) end , canStart =
CanMovePanel , } ) track ( UIS . InputEnded : Connect ( function ( input ) if gripActive and ( input
. UserInputType == Enum . UserInputType . MouseButton1 or input . UserInputType == Enum .
UserInputType . Touch ) then gripActive = false PaintGrip ( ) ShowSizeTip ( ) end end ) ) function
Actions . Refit ( ) SetPanelSize ( PanelSize . X , PanelSize . Y ) SetToggleCenter ( ToggleCenter )
end track ( Gui : GetPropertyChangedSignal ( __dxs("4162736f6c75746553697a65") ) : Connect ( Actions
. Refit ) ) function Actions . SetPulse ( on ) Settings . Pulse = on for _ , t in ipairs (
SpinTweens ) do if on then t : Play ( ) else t : Pause ( ) end end end local PulseList = { } for _ ,
layer in ipairs ( MainGlow ) do table . insert ( PulseList , layer ) end for _ , layer in ipairs (
ToggleGlow ) do table . insert ( PulseList , layer ) end task . spawn ( function ( ) local dim =
false while not destroyed and Gui . Parent do if Settings . Pulse then for _ , layer in ipairs (
PulseList ) do Tween ( layer . Stroke , 1 . 2 , { Transparency = dim and layer . Dim or layer .
Bright } , Enum . EasingStyle . Sine ) end end dim = not dim task . wait ( 1 . 2 ) end end ) track (
Gui . AncestryChanged : Connect ( function ( _ , parent ) if not parent then cleanup ( ) end end ) )
do local ok = pcall ( function ( ) Gui . Parent = game : GetService ( __dxs("436f7265477569") ) end
) if not ok or not Gui . Parent then Gui . Parent = LocalPlayer : WaitForChild (
__dxs("506c61796572477569") ) end end Actions . SetPulse ( Settings . Pulse ) Actions . ApplyLayout
( ) Actions . Refit ( ) Actions . RefreshFloating ( ) Actions . ActivateTab (
__dxs("4f76657276696577") ) print (
__dxs("5b445850616e656c5d204c6f61646564207375636365737366756c6c7920286e656f6e20554929") )
