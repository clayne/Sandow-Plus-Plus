Scriptname DM_SandowPPSkillUp extends Quest 
{Script to catch skill increases}

DM_SandowPPMain property SandowPP auto

function OnStoryIncreaseSkill(string aSkill)
    SandowPP.Train(aSkill)
    Stop()
endFunction
