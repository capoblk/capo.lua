local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Capo Scripts🔫",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Capo Scripts",
   LoadingSubtitle = "by LUCATIT2015A",
   Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Capo Streetz Hub"
   },

   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = true, -- Set this to true to use our key system
   KeySettings = {
      Title = "Capo Scripts | Key",
      Subtitle = "Key System imclude",
      Note = "Welcome To Capo's Script", -- Use this to tell the user how to get a key
      FileName = "Key hub", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = true, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"https://pastebin.com/raw/00mesSaR"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local MainTab = Window:CreateTab("🏠Home", nil) -- Title, Image
local MainSection = MainTab:CreateSection("Main")

local Button = MainTab:CreateButton({
   Name = "InfiniteJump",
   Callback = function()
          --[[
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
local InfiniteJumpEnabled = true
game:GetService("UserInputService").JumpRequest:connect(function()
	if InfiniteJumpEnabled then
		game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
	end
end)
   end,
})

local Slider = MainTab:CreateSlider({
   Name = "WalkSpeed Slider",
   Range = {0, 400},
   Increment = 1,
   Suffix = "Speed",
   CurrentValue = 16,
   Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = (Value)
   end,
})

local Button = MainTab:CreateButton({
   Name = "WallHack (Beta)",
   Callback = function()
player = game:GetService("Players").LocalPlayer or owner;
repeat wait() until  player.Character ~=nil;
player.Character:WaitForChild("Humanoid");
game:GetService("Workspace").Camera:ClearAllChildren();


game:GetService("RunService").RenderStepped:connect(function()
for k,v in pairs(game:GetService("Workspace").Camera:GetChildren()) do    
for a,b in pairs(v:GetChildren()) do
if b.ClassName == "Part" then
pcall(function()
b.CFrame = game:GetService("Workspace"):FindFirstChild(v.Name):FindFirstChild(b.Name).CFrame;
end);
end;
end;
end;
end);

coroutine.wrap(function()
while wait() do
for k,v in pairs(game:GetService("Workspace"):GetChildren()) do
if v:FindFirstChild("Humanoid") ~=nil and v ~= player.Character then
if game:GetService("Workspace").Camera:FindFirstChild(v.Name) ==nil then
v.Archivable = true;
local player = v:Clone();
for k,v in pairs(player:GetChildren()) do
if v.ClassName == "Part" then
v.Locked = true;
v.Anchored = true;
v.CanCollide = false;
v.Transparency = 1;
v.BrickColor = BrickColor.new("Bright red");
local billboardgui = Instance.new("BillboardGui", v);
billboardgui.Size = UDim2.new(1,0,1,0);
billboardgui.AlwaysOnTop = true;
local frame = Instance.new("Frame", billboardgui);
frame.BorderSizePixel = 0;
frame.BackgroundColor3 = Color3.new(255/255,0/255,0/255);
frame.BackgroundTransparency = .5;
if v.Name == "Head" then
frame.Size = UDim2.new(1,0,1,0);
elseif v.Name == "Torso" then
frame.Size = UDim2.new(2,0,2,0);
frame.Position = UDim2.new(-.5,0,-.5,0);
elseif v.Name == "Left Arm" or v.Name == "Right Arm" or v.Name == "Left Leg" or v.Name == "Right Leg" then
frame.Size = UDim2.new(1,0,2,0);
frame.Position = UDim2.new(0,0,-.5,0)    ;
end;
elseif v.ClassName ~= "Part" then
v:remove();    
end    ;
end;
player.Parent = game:GetService("Workspace").Camera;
v.Archivable = false;    
end;
end    ;
end;

if player.Character.Humanoid.Health == 0 then
game:GetService("Workspace").Camera:ClearAllChildren();
break;
end;
end;
end)();
   end,
})
