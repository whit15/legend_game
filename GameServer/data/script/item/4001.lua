--一翅膀蛋
function OnUseItemEvent_4001(uid,thisid)
	if s_deleteItemByThisID(uid,thisid,1,"翅膀礼盒1") ~= VALUE_OK then
			return VALUE_FAIL
	end
	s_trace("使用翅膀蛋ing..........")
	local yulingdan=10097		--羽灵丹 baseid
	local yulingdan_num=90		--羽灵丹数量
    s_addItem(uid,yulingdan,0,yulingdan_num,0,"1-1","翅膀蛋")
	return VALUE_OK
end
