state("Bunny")
{
    // Why are you looking at the autosplitter code
    // Why are you even running this game
    // Credits and also apologies to Drimfox for finding the boss health pointer
	uint Scene : "Bunny.exe", 0x1AF2F8;
    double BossHealth : "Bunny.exe", 0x1AF2F4, 0x80, 0x1C8, 0x0, 0x10C, 0x04, 0x60;
    double XPos : "Bunny.exe", 0x1AF2F4, 0x80, 0x194, 0x30C, 0x58;
}

startup
{
	settings.Add("FirstStage", true, "First Stage");
	settings.Add("FinalStage", true, "Final Stage");
}

start
{
    return (old.Scene == 9 && current.Scene == 1);
}

split
{
    return (
        (old.BossHealth == 9 && current.BossHealth != 9) ||
        (old.XPos < 5078 && current.XPos >= 5078)
    );
}

reset
{
    return (old.Scene != 9 && current.Scene == 9);
}
