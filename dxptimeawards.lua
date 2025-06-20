local PANEL = {}

function PANEL:Init()
	// Language
	local l = EliteXP.Lang[GetConVar("xp_language"):GetString()]

	// Collapsible category color
	local CollapsibleCatColor = Color(0, 102, 200, 255)

	// Vars
	local GetTimeAward
	local GetMin = GetConVar("EliteXP.TimeAward.Min"):GetInt()
	local GetXP = GetConVar("EliteXP.TimeAward.Quantity"):GetInt()
	local GetDailyAward
	local GetDailyAwardTable = EliteXP.StringToTable(GetConVar("EliteXP.DailyAward.AmountPerDay"):GetString())
	
	if (GetConVar("EliteXP.TimeAward.ON"):GetBool()) then
		GetTimeAward = l.on
	else
		GetTimeAward = l.off
	end
	if (GetConVar("EliteXP.DailyAward.ON"):GetBool()) then
		GetDailyAward = l.on
	else
		GetDailyAward = l.off
	end
	
	// Aux Functions
	local SortDailyList
	
	// Collapse TimeAward--------------------------------------------
	// Category
	local CollapseTimeAward = vgui.Create("DCollapsibleCategory", self)
	CollapseTimeAward:Dock(TOP)
	CollapseTimeAward:SetSize(668, 80)
	CollapseTimeAward:SetLabel(l.timeAwardSettingsLabel1)
	CollapseTimeAward:SetExpanded(1)
	CollapseTimeAward.Paint = function(self, w, h)
		draw.RoundedBox(0, 0, 0, w, 20, CollapsibleCatColor)
	end
	
	// List
	local ColTimeAwardList = vgui.Create("DListLayout")
	ColTimeAwardList:SetSize(100, 100)
	ColTimeAwardList:SetPaintBackground(true)
	ColTimeAwardList:SetBackgroundColor(Color(200, 200, 200, 200))
	ColTimeAwardList:DockPadding(0, 0, 0, 5)
	CollapseTimeAward:SetContents(ColTimeAwardList)
	
	// Base
	local ColTimeAwardBase = vgui.Create("DPanel")
	ColTimeAwardBase:SetSize(100, (28*3)-3)
	ColTimeAwardBase.Paint = function(self, w, h)
		// Insivible base
		draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 0))
	end
	
	// Labels
	local roundLabel1 = vgui.Create("DLabel", ColTimeAwardBase)
	roundLabel1:SetText(l.timeAwardSettingsLabel2)
	roundLabel1:SetPos(5, 8)
	roundLabel1:SizeToContents()
	roundLabel1:SetDark(1)
	
	local roundLabel2 = vgui.Create("DLabel", ColTimeAwardBase)
	roundLabel2:SetText(l.minutes)
	roundLabel2:SetPos(5, 8+28)
	roundLabel2:SizeToContents()
	roundLabel2:SetDark(1)
	
	local roundLabel3 = vgui.Create("DLabel", ColTimeAwardBase)
	roundLabel3:SetText("// "..l.timeAwardSettingsLabel3)
	roundLabel3:SetPos(220+20, 8+28)
	roundLabel3:SizeToContents()
	roundLabel3:SetDark(1)
	
	local roundLabel4 = vgui.Create("DLabel", ColTimeAwardBase)
	roundLabel4:SetText(l.killingNPCSettingLabel3)
	roundLabel4:SetPos(5, 8+28*2)
	roundLabel4:SizeToContents()
	roundLabel4:SetDark(1)
	
	local roundLabel5 = vgui.Create("DLabel", ColTimeAwardBase)
	roundLabel5:SetText("// "..l.timeAwardSettingsLabel4)
	roundLabel5:SetPos(220+20, 8+28*2)
	roundLabel5:SizeToContents()
	roundLabel5:SetDark(1)
	
	// Selects	
	local TimeAward = vgui.Create("DComboBox", ColTimeAwardBase)
	TimeAward:SetSize(80, 20)
	TimeAward:SetPos(130+20, 5)
	TimeAward:SetValue(GetTimeAward)
	TimeAward:AddChoice(l.on)
	TimeAward:AddChoice(l.off)
	
	local Min = vgui.Create("DNumberWang", ColTimeAwardBase)
	Min:SetSize(80, 20)
	Min:SetPos(130+20, 5+28)
	Min:SetMinMax(0, 9999999)
	Min:SetValue(GetMin)
	
	local XP = vgui.Create("DNumberWang", ColTimeAwardBase)
	XP:SetSize(80, 20)
	XP:SetPos(130+20, 5+28*2)
	XP:SetMinMax(0, 9999999)
	XP:SetValue(GetXP)
	
	// Add Base to List
	ColTimeAwardList:Add(ColTimeAwardBase)
	//---------------------------------------------------------------
	
	// Collapse DailyAward-------------------------------------------
	// Category
	local CollapseDailyAward = vgui.Create("DCollapsibleCategory", self)
	CollapseDailyAward:Dock(TOP)
	CollapseDailyAward:SetSize(668, 80)
	CollapseDailyAward:SetLabel(l.timeAwardSettingsLabel5)
	CollapseDailyAward:SetExpanded(1)
	CollapseDailyAward.Paint = function(self, w, h)
		draw.RoundedBox(0, 0, 0, w, 20, CollapsibleCatColor)
	end
	
	// List
	local ColDailyAwardList = vgui.Create("DListLayout")
	ColDailyAwardList:SetSize(100, 100)
	ColDailyAwardList:SetPaintBackground(true)
	ColDailyAwardList:SetBackgroundColor(Color(200, 200, 200, 200))
	ColDailyAwardList:DockPadding(0, 0, 0, 5)
	CollapseDailyAward:SetContents(ColDailyAwardList)
	
	// Base
	local ColDailyAwardBase = vgui.Create("DPanel")
	ColDailyAwardBase:SetSize(100, (28*15)-3-20)
	ColDailyAwardBase.Paint = function(self, w, h)
		// Insivible base
		draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 0))
	end
	
	// Labels
	local roundLabel6 = vgui.Create("DLabel", ColDailyAwardBase)
	roundLabel6:SetText(l.timeAwardSettingsLabel6)
	roundLabel6:SetPos(5, 8)
	roundLabel6:SizeToContents()
	roundLabel6:SetDark(1)
	
	local roundLabel7 = vgui.Create("DLabel", ColDailyAwardBase)
	roundLabel7:SetText("// "..l.timeAwardSettingsLabel7)
	roundLabel7:SetPos(150, 355)
	roundLabel7:SizeToContents()
	roundLabel7:SetDark(1)
	
	local roundLabel8 = vgui.Create("DLabel", ColDailyAwardBase)
	roundLabel8:SetText("// "..l.timeAwardSettingsLabel8)
	roundLabel8:SetPos(150, 375)
	roundLabel8:SizeToContents()
	roundLabel8:SetDark(1)
	
	// Selects	
	local DailyAward = vgui.Create("DComboBox", ColDailyAwardBase)
	DailyAward:SetSize(80, 20)
	DailyAward:SetPos(130+20, 5)
	DailyAward:SetValue(GetDailyAward)
	DailyAward:AddChoice(l.on)
	DailyAward:AddChoice(l.off)
	
	// View List
	local DailyList = vgui.Create("DListView", ColDailyAwardBase)
	DailyList:SetSize(400, 300)
	DailyList:SetPos(235, 50)
	DailyList:SetMultiSelect(false)
	DailyList:SetSortable(true)
	DailyList:AddColumn(l.day)
	DailyList:AddColumn(l.killingNPCSettingLabel3)
	for i=1, EliteXP.tableLength(GetDailyAwardTable) do
		DailyList:AddLine(i, tonumber(GetDailyAwardTable[i]))
	end
	DailyList:SortByColumn(1, false) // Always at day order
	DailyList.OnRowRightClick = function(self, lineID, line)
		local Menu = vgui.Create("DMenu")
		local Remove = Menu:AddOption(l.listRemoveLine)
		Remove:SetIcon("icon16/delete.png")
		
		Menu.OptionSelected = function(option, text)
			DailyList:RemoveLine(lineID)
			SortDailyList()
		end
		
		Menu:Open()
	end
	
	// Addbutton button----------------------------------------------
	local AddButton = vgui.Create("DButton", ColDailyAwardBase)
	AddButton:SetSize(100, 30)
	AddButton:SetPos(650, 50)
	AddButton:SetText(l.listAddLine)
	AddButton:SetTextColor(Color(255, 255, 255, 255))
	AddButton.Paint = function(self, w, h)
		draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 200))
		
		if (AddButton:IsHovered()) then
			draw.RoundedBox(0, 0, 0, w, h, Color(0, 127, 255, 255))
		end
	end
	local AddLine
	AddButton.DoClick = function()
		if IsValid(AddLine) then return end
		AddLine = vgui.Create("DFrame", self:GetParent())
		AddLine:SetZPos(1)
		AddLine:SetPos(485, 305)
		AddLine:SetSize(400, 130)
		AddLine:SetTitle(l.timeAwardSettingsLabel9.." - "..l.addDay)
		AddLine.Paint = function(self, w, h)
			draw.RoundedBox(4, 0, 0, w, h, Color(60, 60, 60, 255))
			
			draw.DrawText(l.killingNPCSettingLabel3, "DermaDefault", 200, 30, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER)
		end
		
		local XP = vgui.Create("DNumberWang", AddLine)
		XP:SetSize(80, 20)
		XP:SetPos(160, 50)
		XP:SetValue(1)
		XP:SetMin(0)
		
		local acceptsave = vgui.Create("DButton", AddLine)
		acceptsave:SetPos(100, 90)
		acceptsave:SetSize(80, 25)
		acceptsave:SetText(l.add)
		acceptsave:SetTextColor(Color(255, 255, 255, 255))
		acceptsave.Paint = function(self, w, h)
			draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 200))
			
			if (acceptsave:IsHovered()) then
				draw.RoundedBox(0, 0, 0, w, h, Color(0, 127, 255, 255))
			end
		end
		acceptsave.DoClick = function()
			DailyList:AddLine(0, XP:GetValue())
			SortDailyList()
			AddLine:Remove()
		end
		
		local cancelsave = vgui.Create("DButton", AddLine)
		cancelsave:SetPos(220, 90)
		cancelsave:SetSize(80, 25)
		cancelsave:SetText(l.cancel)
		cancelsave:SetTextColor(Color(255, 255, 255, 255))
		cancelsave.Paint = function(self, w, h)
			draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 200))
			
			if (cancelsave:IsHovered()) then
				draw.RoundedBox(0, 0, 0, w, h, Color(0, 127, 255, 255))
			end
		end
		cancelsave.DoClick = function()
			AddLine:Remove()
		end
	end
	//---------------------------------------------------------------
	
	// Add Base to List
	ColDailyAwardList:Add(ColDailyAwardBase)
	//---------------------------------------------------------------
	
	// Aux Functions
	function SortDailyList()	
		local tabl = {}
	
		// Add all lines to table
		for k, line in pairs(DailyList:GetLines()) do
			table.insert(tabl, line:GetValue(2))
		end
		
		// Remove them from panel
		for k, line in pairs(DailyList:GetLines()) do
			DailyList:RemoveLine(k)
		end
		
		// Re-add them ordered
		for i=1, EliteXP.tableLength(tabl) do
			DailyList:AddLine(i, tabl[i])
		end
	end
	
	local function ListToTable()
		local tabl = {}
	
		// Add all lines to table
		for k, line in pairs(DailyList:GetLines()) do
			table.insert(tabl, line:GetValue(2))
		end
		
		return tabl
	end
	
	// Apply button--------------------------------------------------
	local SaveButton = vgui.Create("DButton", self:GetParent())
	SaveButton:SetPos(270, 660)
	SaveButton:SetSize(930, 40)
	SaveButton:SetText(l.applyChanges)
	SaveButton:SetTextColor(Color(255, 255, 255, 255))
	SaveButton.Paint = function(self, w, h)
		draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 200))
		
		if (SaveButton:IsHovered()) then
			draw.RoundedBox(0, 0, 0, w, h, Color(0, 127, 255, 255))
		end
	end
	local Save
	SaveButton.DoClick = function()
		if IsValid(Save) then return end
		Save = vgui.Create("DFrame", self:GetParent())
		Save:SetZPos(1)
		Save:SetPos(485, 305)
		Save:SetSize(400, 130)
		Save:SetTitle(l.timeAwardSettingsLabel10.." - "..l.apply)
		Save.Paint = function(self, w, h)
			draw.RoundedBox(4, 0, 0, w, h, Color(60, 60, 60, 255))
			
			draw.DrawText(l.wantProceed, "DermaDefault", 200, 30, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER)
			draw.DrawText(l.saveSetting, "DermaDefault", 200, 50, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER)
		end
		
		local acceptsave = vgui.Create("DButton", Save)
		acceptsave:SetPos(100, 90)
		acceptsave:SetSize(80, 25)
		acceptsave:SetText(l.accept)
		acceptsave:SetTextColor(Color(255, 255, 255, 255))
		acceptsave.Paint = function(self, w, h)
			draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 200))
			
			if (acceptsave:IsHovered()) then
				draw.RoundedBox(0, 0, 0, w, h, Color(0, 127, 255, 255))
			end
		end
		acceptsave.DoClick = function()
			local wGetTimeAward
			local wGetMin = Min:GetValue()
			local wGetXP = XP:GetValue()
			local wGetDailyAward
			local wGetDailyAwardTable = EliteXP.TableToString(ListToTable())
			
			if (TimeAward:GetSelectedID() == nil) then
				wGetTimeAward = 2
			elseif (TimeAward:GetSelected() == l.on) then
				wGetTimeAward = 1
			else
				wGetTimeAward = 0
			end
			
			if (DailyAward:GetSelectedID() == nil) then
				wGetDailyAward = 2
			elseif (DailyAward:GetSelected() == l.on) then
				wGetDailyAward = 1
			else
				wGetDailyAward = 0
			end
			
			// Send Message
			net.Start("XP_TimeAwardsSettings")
				net.WriteUInt(wGetTimeAward, 2)
				net.WriteUInt(wGetMin, 20)
				net.WriteUInt(wGetXP, 20)
				net.WriteUInt(wGetDailyAward, 2)
				net.WriteString(wGetDailyAwardTable)
			net.SendToServer()
			
			Save:Remove()
		end
		
		local cancelsave = vgui.Create("DButton", Save)
		cancelsave:SetPos(220, 90)
		cancelsave:SetSize(80, 25)
		cancelsave:SetText(l.cancel)
		cancelsave:SetTextColor(Color(255, 255, 255, 255))
		cancelsave.Paint = function(self, w, h)
			draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 200))
			
			if (cancelsave:IsHovered()) then
				draw.RoundedBox(0, 0, 0, w, h, Color(0, 127, 255, 255))
			end
		end
		cancelsave.DoClick = function()
			Save:Remove()
		end
	end
	
	// Delete SaveButton
	self.OnRemove = function()
		SaveButton:Remove()	
		if (Save != nil) then
			Save:Remove()
		end
		if (AddLine != nil) then
			AddLine:Remove() // Remove 2nd panel too
		end
	end
	//---------------------------------------------------------------
end

vgui.Register("DXPTimeAwards", PANEL, "DScrollPanel")

