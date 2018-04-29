find_suitable_ammunition =
{
	private ["_weapon","_result","_ammoArray"];
	_result		=	false;
	_weapon		=	_this;
	_ammoArray	=	getArray (configFile >> "cfgWeapons" >> _weapon >> "magazines");

	if (count _ammoArray > 0) then
	{
		_result = _ammoArray select 0;
	};
	_result
};

loadout_fnc_selectRandom =
{
    _this select (floor random (count _this))
};

_primary	=	["Crossbow_DZ","Remington870_DZ","Winchester1866_DZ","MR43_DZ","LeeEnfield","Bizon_DZ","L85A2_DZ","SA58_RIS_DZ","M16A4_DZ","M16A2_DZ","MP5_DZ","Mosin_DZ","M1014_DZ","M14_DZ","M4A1_DZ","G36C_DZ","AK74_DZ","AKS74U_DZ","AKM_DZ","AKS_74"] call loadout_fnc_selectRandom;
_secondary	=	["G17_DZ","M1911_DZ","M9_DZ","Makarov_DZ","Revolver_DZ","PDW_DZ","Sa61_EP1"] call loadout_fnc_selectRandom;
_ammo		=	_primary call find_suitable_ammunition;
_ammos		=	_secondary call find_suitable_ammunition;
_light		=	["HandRoadFlare","HandChemBlue","HandChemGreen","HandChemRed"] call loadout_fnc_selectRandom;
_food		=	["FoodBioMeat","FoodPumpkin","FoodSunFlowerSeed","FoodMRE","FoodPistachio","FoodNutmix","FoodCanBeef","FoodCanPotatoes","FoodCanGriff","FoodCanBadguy","FoodCanCorn","FoodCanCurgon","FoodCanDemon","FoodCanFraggleos","FoodCanHerpy","FoodCanDerpy","FoodCanOrlok","FoodCanPowell","FoodCanTylers","FoodCanUnlabeled","FoodCanRusUnlabeled","FoodCanRusStew","FoodCanRusPork","FoodCanRusPeas","FoodCanRusMilk","FoodCanRusCorn","FoodChipsSulahoops","FoodChipsMysticales","FoodChipsChocolate","FoodCandyChubby","FoodCandyAnders","FoodCandyLegacys","FoodCakeCremeCakeClean","FoodCandyMintception","FoodCanBakedBeans","FoodCanSardines","FoodCanFrankBeans","FoodCanPasta"] call loadout_fnc_selectRandom;
_drink		=	["ItemSodaRbull","ItemSodaOrangeSherbet","ItemSherbet","ItemSodaGrapeDrink","ItemSodaRocketFuel","ItemSodaSacrite","ItemSodaRabbit","ItemSodaPeppsy","ItemSodaMzly","ItemSodaLvg","ItemSodaLirik","ItemSodaLemonade","ItemSodaFranka","ItemSodaDrwaste","ItemSodaSmasht","ItemSodaClays","ItemSodaR4z0r","ItemSodaMtngreen","ItemSodaMdew","ItemSodaPepsi","ItemSodaCoke"] call loadout_fnc_selectRandom;
_toolOrItem	=	["ItemWatch","ItemCompass","ItemMap","ItemKnife","ItemMatchbox","ItemToolbox","ItemEtool","ItemFlashlight","ItemFlashlightRed","Binocular","PartGeneric","PartWheel","PartEngine","PartGlass"] call loadout_fnc_selectRandom;
_backpack	=	["DZ_Patrol_Pack_EP1","DZ_Assault_Pack_EP1","DZ_Czech_Vest_Pouch","DZ_ALICE_Pack_EP1"] call loadout_fnc_selectRandom;

DefaultMagazines		=	["ItemBandage","ItemBandage","ItemMorphine","ItemPainkiller",_ammo,_ammos,_ammos]; 
DefaultWeapons			=	[_primary,_secondary]; 
DefaultBackpack			=	_backpack; 
DefaultBackpackItems	=	[_food,_drink,_light,_light,_toolOrItem];