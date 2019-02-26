{
    
    if (_object isKindof "DSHKM_Gue") then {
         _object setVehicleAmmo 0;
        
    };

    if (_object isKindof "M2StaticMG_US_EP1") then {
         _object setVehicleAmmo 0;
         _ownerID = "0";
    };    
    
} forEach vehicles; 