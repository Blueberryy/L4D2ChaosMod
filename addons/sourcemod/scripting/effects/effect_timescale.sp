int g_func_timescale = -1;

public Action Command_TimeScale(int client, int args)
{
	if (args < 1)
	{
		ReplyToCommand(client, "[SM] Usage: chaosmod_timescale <modifier>");
		return Plugin_Handled;
	}

	char s_scale[255];
	GetCmdArg(1, s_scale, sizeof(s_scale));
	float f_scale = StringToFloat(s_scale);

	if (g_func_timescale > 0)
    {
        RemoveEntity(g_func_timescale);
    }
    
	g_func_timescale = CreateEntityByName("func_timescale");
	DispatchKeyValueFloat(g_func_timescale, "desiredTimescale", f_scale);
	DispatchKeyValueFloat(g_func_timescale, "acceleration", 2.0);
	DispatchKeyValueFloat(g_func_timescale, "minBlendRate", 1.0);
	DispatchKeyValueFloat(g_func_timescale, "blendDeltaMultiplier", 2.0);
	DispatchSpawn(g_func_timescale);
	AcceptEntityInput(g_func_timescale, "Start");

	return Plugin_Handled;
}