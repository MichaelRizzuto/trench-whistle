if SERVER then AddCSLuaFile() end

if CLIENT then
	SWEP.PrintName			= "Trench Whistle"
	SWEP.Author				= "Micro"
	SWEP.Slot				= 1
	SWEP.SlotPos			= 1
end

SWEP.Category				= "Other"
SWEP.ViewModelFlip			= false
SWEP.ViewModelFOV			= 65

SWEP.Spawnable				= true
SWEP.AdminOnly				= false
SWEP.UseHands				= true
SWEP.DrawCrosshair			= false

SWEP.ViewModel				= "models/ufn/ww1/weapons/trenchwhistle/c_trenchwhistle.mdl"
SWEP.WorldModel				= "models/ufn/ww1/weapons/trenchwhistle/w_trenchwhistle.mdl"

SWEP.Primary.ClipSize		= -1
SWEP.Primary.DefaultClip	= -1
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo		    = "none"
SWEP.Secondary.ClipSize		= -1
SWEP.Secondary.DefaultClip	= -1
SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo			= "none"

function SWEP:Initialize()
	self:SetHoldType("slam")
end

local sound = "/ufn/ww1/weapons/trenchwhistle.wav"

function SWEP:Deploy()
	self.Weapon:SendWeaponAnim(ACT_VM_DRAW)
	timer.Simple(1, function()
		self.Weapon:SendWeaponAnim(ACT_VM_IDLE)
	end)
end

function SWEP:PrimaryAttack()
	if self:GetOwner():IsPlayer() and ( self.lastUsed or CurTime() ) <= CurTime() then
		self.lastUsed = CurTime() + 3.16
		self.Weapon:SendWeaponAnim(ACT_VM_PRIMARYATTACK)
		timer.Simple(.25, function()
			self:EmitSound(sound)
		end)
		timer.Simple(3.16, function()
			self.Weapon:SendWeaponAnim(ACT_VM_IDLE)
		end)
	end
end

function SWEP:SecondaryAttack()
	if self:GetOwner():IsPlayer() and ( self.lastUsed or CurTime() ) <= CurTime() then
		self.lastUsed = CurTime() + 3.16
		self.Weapon:SendWeaponAnim(ACT_VM_PRIMARYATTACK)
		timer.Simple(.25, function()
			self:EmitSound(sound)
		end)
		timer.Simple(3.16, function()
			self.Weapon:SendWeaponAnim(ACT_VM_IDLE)
		end)
	end
end

function SWEP:Reload()
	return
end
