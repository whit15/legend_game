RoleTaskInfo21615 =
{
	subtasknum = 2,
	parent = 20001,
	subtask1 =
	{
		traceend = [[<p><newline/><n>将信送至：</n><n></n><goto id="60085" mapid="7" flagpoint="1" taskid="21615"/></p>]],
		onacceptcheck =
		{
			{s_checkTaskCurRing,{20001,1,10}},
			{s_checkCorps,},
		},
		collectitem =
		{
			{31181, 0, 1},
		},
		task = {s_taskCollect, {45112, 60085}},
		onfinish =
		{
			{s_actionDeleteItemByBaseID,{31181,1,"RoleTaskInfo21615"}},
		},
	},
	subtask2 =
	{
		traceend = [[<p><event hotkeyid="52" eid="100" cid="39" text="快速返回团基地"/><newline/><n>回复：</n><n></n><goto id="45112" mapid="101" flagpoint="1" taskid="21615"/></p>]],
		task = {s_taskTalk,{60085,45112}},
	},
}
