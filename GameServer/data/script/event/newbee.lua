--已使用的type
--Caaa_b=xxxxx，与数据库导的值需要对应，其中aaa与channel一致，b与channeltype一致，数据库中还有项type，这个是根据卡是不是需要互斥来配置的，同type的卡互斥

--奖励领取兑换
function OnRequestNewbeeCardEvent(uid,ret,channel,channeltype,mutextype)
    if ret == 0 then
        s_sysInfo(uid,"激活码使用成功",ChatPos_Tips)
    elseif ret == 1 then
        s_sysInfo(uid,"该激活码不存在",ChatPos_Tips)
        return;
    elseif ret == 2 then
        s_sysInfo(uid,"该激活码已过期",ChatPos_Tips)
        return;
    elseif ret == 3 then
        s_sysInfo(uid,"该激活码已被使用,不能重复使用",ChatPos_Tips)
        return;
    elseif ret == 4 then
        s_sysInfo(uid,"已使用同类型的礼包,不能再使用",ChatPos_Tips)
        return;
    end
	local releaseCard; releaseCard = function(attrs)
		if attrs ~=  nil then
			--s_addVar(uid,10005,mutextype,1)
            for i=1,table.getn(attrs) do
                s_addItem(uid,attrs[i][1],attrs[i][2],attrs[i][3],attrs[i][4],attrs[i][5],attrs[i][6])
                local homeland = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_HOMELAND)
                local name = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_NAME)
            end
			--s_countryInfo(homeland,"<p><q buttonid=6005 ownerid=".. uid .. ">" ..name .. "</q><n color=GXColorBlueSky>使用了新手卡:</n><dialog hotkeyid=92 text=" .. attrs[6] .. "/></p>",ChatPos_Sys + ChatPos_Honor)
		else
			--s_sysInfo(uid,"不可识别的卡类型:" .. mutextype,ChatPos_Sys)
		end
	end
	--已使用的type
	--1	媒体
	--2	应用宝
	--3 公会
	--4 二测
	--5 360预约
	--6 二测特权
	--7 二测独家
	--8 二测独家2
	--9 二测独家3
	--10微信关注礼包
	--11白银
	--12至尊
	--133日
	--145日
	--157日
	--16进群
	--17战神传奇进群
	--18新手
	--19特权
	--20独家1
	--21独家2
	--22独家3
	--23独家4
	--24独家5
	--25媒体1
	--26媒体2
	--27公会
	--28微信关注

	local cards_type = {
		c1_1={{10119,3,6,0,"1-1","畅玩包"},{10220,3,2,0,"1-1","畅玩包"},{10056,3,99,0,"1-1","畅玩包"},{10069,3,25,0,"1-1","畅玩包"},{10151,3,5,0,"1-1","畅玩包"}}, --type 1
		c2_1={{10085,3,2,0,"1-1","专属包"},{10089,3,1,0,"1-1","专属包"},{10210,3,2,0,"1-1","专属包"},{10223,3,1,0,"1-1","专属包"},{10191,3,3,0,"1-1","专属包"}}, --type 1
		c3_1={{10223,3,5,0,"1-1","测试包1"},{10220,3,1,0,"1-1","测试包1"},{10054,3,99,0,"1-1","测试包1"},{10116,3,3,0,"1-1","测试包1"},{10075,3,3,0,"1-1","测试包1"}}, --type 1
		c4_1={{10080,3,3,0,"1-1","测试包2"},{10081,3,3,0,"1-1","测试包2"},{10071,3,5,0,"1-1","测试包2"},{10069,3,15,0,"1-1","测试包2"},{10151,3,5,0,"1-1","测试包2"}}, --type 1
		c5_1={{10085,3,3,0,"1-1","微信平台关注"},{10089,3,3,0,"1-1","微信平台关注"},{10056,3,99,0,"1-1","微信平台关注"},{10069,3,5,0,"1-1","微信平台关注"},{10151,3,5,0,"1-1","微信平台关注"}}, --type 1
		c6_1={{10116,3,2,0,"1-1","进群礼包"},{10119,3,3,0,"1-1","进群礼包"},{10071,3,5,0,"1-1","进群礼包"},{10000,3,5,0,"1-1","进群礼包"},{10069,3,5,0,"1-1","进群礼包"}}, --type 1
		c7_1={{10081,3,3,0,"1-1","进群礼包"},{10210,3,10,0,"1-1","进群礼包"},{10056,3,99,0,"1-1","进群礼包"},{10069,3,25,0,"1-1","进群礼包"},{10151,3,5,0,"1-1","进群礼包"}}, --type 1
		c8_1={{10116,3,1,0,"1-1","进群礼包"},{10081,3,3,0,"1-1","进群礼包"},{10056,3,99,0,"1-1","进群礼包"},{10069,3,25,0,"1-1","进群礼包"},{10151,3,5,0,"1-1","进群礼包"}}, --type 1
		c9_1={{10116,3,3,0,"1-1","进群礼包"},{10223,3,5,0,"1-1","进群礼包"},{10056,3,99,0,"1-1","进群礼包"},{10069,3,25,0,"1-1","进群礼包"},{10151,3,5,0,"1-1","进群礼包"}}, --type 1
		c10_1={{10089,3,2,0,"1-1","进群礼包"},{10076,3,10,0,"1-1","进群礼包"},{10077,3,10,0,"1-1","进群礼包"},{10000,3,5,0,"1-1","进群礼包"},{10151,3,5,0,"1-1","进群礼包"}}, --type 1
		c11_1={{10056,3,99,0,"1-1","白银"},{10054,3,99,0,"1-1","白银"},{10089,3,1,0,"1-1","白银"},{10069,3,10,0,"1-1","白银"},{10034,3,1,0,"1-1","白银"}}, --type 1
		c12_1={{10210,3,10,"1-1","至尊"},{10223,3,10,0,"1-1","至尊"},{10080,3,2,0,"1-1","至尊"},{10081,3,1,0,"1-1","至尊"},{10191,3,10,0,"1-1","至尊"}}, --type 1
		c13_1={{10191,3,5,"1-1","至尊"},{10034,3,1,0,"1-1","至尊"},{10056,3,15,0,"1-1","至尊"}}, --type 1
		c14_1={{10080,3,1,"1-1","至尊"},{10081,3,1,0,"1-1","至尊"},{10223,3,1,0,"1-1","至尊"}}, --type 1
		c15_1={{10116,3,1,"1-1","至尊"},{10034,3,1,0,"1-1","至尊"},{10223,3,2,0,"1-1","至尊"},{10220,3,1,0,"1-1","至尊"}}, --type 1
		c16_1={{10054,3,20,0,"1-1","进群礼包"},{10069,3,20,0,"1-1","进群礼包"},{10039,3,5,0,"1-1","进群礼包"}},
		c17_1={{10054,3,20,0,"1-1","进群礼包"},{10069,3,20,0,"1-1","进群礼包"},{10039,3,5,0,"1-1","进群礼包"}},
		c18_1={{10085,3,3,0,"1-1","新手礼包"},{10071,3,3,0,"1-1","新手礼包"},{10056,3,99,0,"1-1","新手礼包"},{10069,3,5,0,"1-1","新手礼包"},{10151,3,5,0,"1-1","新手礼包"}},
		c19_1={{10116,3,1,0,"1-1","特权礼包"},{10119,3,2,0,"1-1","特权礼包"},{10071,3,5,0,"1-1","特权礼包"},{10000,3,5,0,"1-1","特权礼包"},{10069,3,5,0,"1-1","特权礼包"}},
		c20_1={{10081,3,1,0,"1-1","独家礼包1"},{10210,3,10,0,"1-1","独家礼包1"},{10056,3,99,0,"1-1","独家礼包1"},{10069,3,25,0,"1-1","独家礼包1"},{10151,3,5,0,"1-1","独家礼包1"}},
		c21_1={{10116,3,1,0,"1-1","独家礼包2"},{10223,3,5,0,"1-1","独家礼包2"},{10056,3,99,0,"1-1","独家礼包2"},{10069,3,25,0,"1-1","独家礼包2"},{10151,3,5,0,"1-1","独家礼包2"}},
		c22_1={{10116,3,1,0,"1-1","独家礼包3"},{10210,3,5,0,"1-1","独家礼包3"},{10056,3,99,0,"1-1","独家礼包3"},{10069,3,25,0,"1-1","独家礼包3"},{10151,3,5,0,"1-1","独家礼包3"}},
		c23_1={{10148,3,3,0,"1-1","独家礼包4"},{10223,3,5,0,"1-1","独家礼包4"},{10056,3,99,0,"1-1","独家礼包4"},{10069,3,25,0,"1-1","独家礼包4"},{10151,3,5,0,"1-1","独家礼包4"}},
		c24_1={{10116,3,1,0,"1-1","独家礼包5"},{10147,3,5,0,"1-1","独家礼包5"},{10056,3,99,0,"1-1","独家礼包5"},{10069,3,25,0,"1-1","独家礼包5"},{10151,3,5,0,"1-1","独家礼包5"}},
		c25_1={{10116,3,1,0,"1-1","媒体礼包1"},{10224,3,2,0,"1-1","媒体礼包1"},{10071,3,3,0,"1-1","媒体礼包1"},{10000,3,5,0,"1-1","媒体礼包1"},{10069,3,25,0,"1-1","媒体礼包1"}},
		c26_1={{10116,3,1,0,"1-1","媒体礼包2"},{10220,3,5,0,"1-1","媒体礼包2"},{10071,3,3,0,"1-1","媒体礼包2"},{10000,3,5,0,"1-1","媒体礼包2"},{10069,3,25,0,"1-1","媒体礼包2"}},
		c27_1={{10223,3,5,0,"1-1","公会礼包"},{10220,3,5,0,"1-1","公会礼包"},{10054,3,99,0,"1-1","公会礼包"},{10116,3,3,0,"1-1","公会礼包"},{10075,3,3,0,"1-1","公会礼包"}},
		c28_1={{10116,3,1,0,"1-1","微信关注礼包"},{10223,3,2,0,"1-1","微信关注礼包"},{10220,3,3,0,"1-1","微信关注礼包"},{10081,3,5,0,"1-1","微信关注礼包"}},
		c29_1={{10069,3,3,0,"1-1","传送石礼包"},{10056,3,99,0,"1-1","传送石礼包"},{10034,3,3,0,"1-1","传送石礼包"}},
		c30_1={{10080,3,10,0,"1-1","称号礼包"},{10072,3,3,0,"1-1","称号礼包"}},
		c31_1={{10120,3,5,0,"1-1","狩魂珠礼包"},{10072,3,5,0,"1-1","狩魂珠礼包"}},
		c32_1={{10081,3,10,0,"1-1","勋章礼包"},{10072,3,5,0,"1-1","勋章礼包"}},
		c33_1={{10228,3,15,0,"1-1","内功礼包"},{10072,3,5,0,"1-1","内功礼包"}},
		c34_1={{10221,3,10,0,"1-1","灵戒礼包"},{10072,3,5,0,"1-1","灵戒礼包"}},
		c35_1={{10225,3,10,0,"1-1","玄印礼包"},{10072,3,5,0,"1-1","玄印礼包"}},
		c36_1={{18116,3,1,0,"1-1","称号"}},
		c37_1={{10223,3,5,0,"1-1","公会礼包"},{10220,3,5,0,"1-1","公会礼包"},{10054,3,99,0,"1-1","公会礼包"},{10116,3,3,0,"1-1","公会礼包"},{10075,3,3,0,"1-1","公会礼包"}},
		c38_1={{17006,3,500,0,"1-1","1998双十二礼包"},{10080,3,5,0,"1-1","1998双十二礼包"},{10075,3,5,0,"1-1","1998双十二礼包"},{10211,3,5,0,"1-1","1998双十二礼包"},{10034,3,5,0,"1-1","1998双十二礼包"},{10090,3,1,0,"1-1","1998双十二礼包"}},
		c39_1={{17006,3,2000,0,"1-1","2888双十二礼包"},{10211,3,5,0,"1-1","2888双十二礼包"},{10081,3,5,0,"1-1","2888双十二礼包"},{10156,3,3,0,"1-1","2888双十二礼包"},{10117,3,3,0,"1-1","2888双十二礼包"}},
		c40_1={{17006,3,2000,0,"1-1","6888双十二礼包"},{10188,3,10,0,"1-1","6888双十二礼包"},{10080,3,10,0,"1-1","6888双十二礼包"},{10081,3,10,0,"1-1","6888双十二礼包"},{10116,3,1,0,"1-1","6888双十二礼包"}},
		c41_1={{17006,3,20,0,"1-1","周一礼包"},{10080,3,4,0,"1-1","周一礼包"}},
		c42_1={{17006,3,20,0,"1-1","周二礼包"},{10081,3,2,0,"1-1","周二礼包"}},
		c43_1={{17006,3,20,0,"1-1","周三礼包"},{10223,3,20,0,"1-1","周三礼包"}},
		c44_1={{17006,3,20,0,"1-1","周四礼包"},{10211,3,2,0,"1-1","周四礼包"}},
		c45_1={{17006,3,20,0,"1-1","周五礼包"},{10220,3,2,0,"1-1","周五礼包"}},
		c46_1={{17006,3,20,0,"1-1","周六礼包"},{10194,3,2,0,"1-1","周六礼包"}},
		c47_1={{17006,3,20,0,"1-1","周天礼包"},{10116,3,2,0,"1-1","周天礼包"}},
		c48_1={{10194,3,1,0,"1-1","bug反馈礼包"},{10116,3,1,0,"1-1","bug反馈礼包"},{10034,3,1,0,"1-1","bug反馈礼包"},{10090,3,1,0,"1-1","bug反馈礼包"}},
		c49_1={{10211,3,1,0,"1-1","举报礼包"},{10116,3,1,0,"1-1","举报礼包"},{10034,3,1,0,"1-1","举报礼包"},{10090,3,1,0,"1-1","举报礼包"}},
		c50_1={{10116,3,5,0,"1-1","生日礼包"},{10223,3,5,0,"1-1","生日礼包"},{10220,3,5,0,"1-1","生日礼包"},{10034,3,5,0,"1-1","生日礼包"},{10090,3,2,0,"1-1","生日礼包"}},
		c51_1={{10080,3,5,0,"1-1","冬至礼包"},{10081,3,5,0,"1-1","冬至礼包"},{10224,3,5,0,"1-1","冬至礼包"},{10034,3,5,0,"1-1","冬至礼包"},{10090,3,2,0,"1-1","冬至礼包"}},
		c52_1={{10121,3,6,0,"1-1","合成礼包小"},{10080,3,1,0,"1-1","合成礼包小"},{10069,3,5,0,"1-1","合成礼包小"}},
		c53_1={{10121,3,12,0,"1-1","合成礼包大"},{10081,3,1,0,"1-1","合成礼包大"},{10210,3,5,0,"1-1","合成礼包大"},{10069,3,10,0,"1-1","合成礼包大"}},
		c54_1={{10069,3,20,0,"1-1","入群礼包"},{19003,3,20,0,"1-1","入群礼包"},{17005,3,1,0,"1-1","入群礼包"}},
		c55_1={{10069,3,20,0,"1-1","公会会员礼包"},{19003,3,20,0,"1-1","公会会员礼包"},{10085,3,20,0,"1-1","公会会员礼包"},{10151,3,5,0,"1-1","公会会员礼包"},{10075,3,1,0,"1-1","公会会员礼包"}},
		c56_1={{10210,3,10,0,"1-1","公会VIP会员礼包"},{10223,3,10,0,"1-1","公会VIP会员礼包"},{10116,3,3,0,"1-1","公会VIP会员礼包"},{10147,3,5,0,"1-1","公会VIP会员礼包"},{10075,3,5,0,"1-1","公会VIP会员礼包"}},
		c57_1={{10210,3,20,0,"1-1","100RMB"},{10223,3,20,0,"1-1","100RMB"},{10116,3,5,0,"1-1","100RMB"},{10151,3,5,0,"1-1","100RMB"},{10121,3,20,0,"1-1","100RMB"}},
		c58_1={{10210,3,30,0,"1-1","500RMB"},{10223,3,30,0,"1-1","500RMB"},{10116,3,10,0,"1-1","500RMB"},{10151,3,5,0,"1-1","500RMB"},{10121,3,30,0,"1-1","500RMB"}},
		c59_1={{10210,3,50,0,"1-1","1000RMB"},{10223,3,50,0,"1-1","1000RMB"},{10116,3,20,0,"1-1","1000RMB"},{10151,3,5,0,"1-1","1000RMB"},{10121,3,40,0,"1-1","1000RMB"}},
		c60_1={{10212,3,10,0,"1-1","3000RMB"},{10225,3,10,0,"1-1","3000RMB"},{10116,3,30,0,"1-1","3000RMB"},{10151,3,5,0,"1-1","3000RMB"},{10121,3,50,0,"1-1","3000RMB"}},
		c61_1={{10212,3,20,0,"1-1","5000RMB"},{10225,3,20,0,"1-1","5000RMB"},{10116,3,50,0,"1-1","5000RMB"},{10151,3,10,0,"1-1","5000RMB"},{10121,3,100,0,"1-1","5000RMB"}},
		c62_1={{10225,3,10,0,"1-1","10000RMB"},{10222,3,10,0,"1-1","10000RMB"},{10127,3,30,0,"1-1","10000RMB"},{10154,3,30,0,"1-1","10000RMB"},{10121,3,300,0,"1-1","10000RMB"}},
		c63_1={{10225,3,30,0,"1-1","30000RMB"},{10222,3,30,0,"1-1","30000RMB"},{10127,3,50,0,"1-1","30000RMB"},{10154,3,50,0,"1-1","30000RMB"},{10121,3,500,0,"1-1","30000RMB"}},
		c64_1={{10210,3,10,0,"1-1","公会管理礼包"},{10223,3,10,0,"1-1","公会管理礼包"},{10220,3,10,0,"1-1","公会管理礼包"},{10147,3,10,0,"1-1","公会管理礼包"},{10121,3,10,0,"1-1","公会管理礼包"}},
		c65_1={{16002,3,10,0,"1-1","坐骑低端礼包"},{10080,3,2,0,"1-1","坐骑低端礼包"},{10116,3,1,0,"1-1","坐骑低端礼包"},{10069,3,10,0,"1-1","坐骑低端礼包"}},
		c66_1={{16002,3,20,0,"1-1","坐骑高端礼包"},{10080,3,4,0,"1-1","坐骑高端礼包"},{10116,3,2,0,"1-1","坐骑高端礼包"},{10069,3,10,0,"1-1","坐骑高端礼包"},{10220,3,1,0,"1-1","坐骑高端礼包"}},
		c67_1={{10121,3,5,0,"1-1","元宵双节"},{19003,3,150,0,"1-1","元宵双节"},{10084,3,3,0,"1-1","元宵双节"},{10116,3,2,0,"1-1","元宵双节"}},
		c68_1={{10121,3,5,0,"1-1","元宵双节"},{19003,3,150,0,"1-1","元宵双节"},{10084,3,3,0,"1-1","元宵双节"},{10116,3,2,0,"1-1","元宵双节"}},
		c69_1={{16002,3,20,0,"1-1","GS3000累冲"},{10121,3,20,0,"1-1","GS3000累冲"},{10090,3,3,0,"1-1","GS3000累冲"},{10069,3,80,0,"1-1","GS3000累冲"}},
		c70_1={{19007,3,5,0,"1-1","bug反馈"},{10223,3,3,0,"1-1","bug反馈"},{10072,3,2,0,"1-1","bug反馈"}},
		c71_1={{10121,3,20,0,"1-1","GS节日礼包"},{10090,3,1,0,"1-1","GS节日礼包"},{10224,3,2,0,"1-1","GS节日礼包"}},
		c72_1={{10121,3,20,0,"1-1","GS节日礼包"},{10220,3,3,0,"1-1","GS节日礼包"},{10225,3,2,0,"1-1","GS节日礼包"}},
		c73_1={{10095,3,20,0,"1-1","微信关注领取"},{10072,3,1,0,"1-1","微信关注领取"},{10054,3,5,0,"1-1","微信关注领取"}},
		c74_1={{10121,3,10,0,"1-1","微信积分商城"},{10072,3,5,0,"1-1","微信积分商城"}},
		c75_1={{16002,3,15,0,"1-1","微信积分商城"},{10072,3,5,0,"1-1","微信积分商城"}},
		c76_1={{10054,3,5,0,"1-1","怒焰上渠道"},{10081,3,3,0,"1-1","怒焰上渠道"},{10069,3,3,0,"1-1","怒焰上渠道"},{10116,3,1,0,"1-1","怒焰上渠道"},{10157,3,1,0,"1-1","怒焰上渠道"}},
		c77_1={{10069,3,5,0,"1-1","怒焰上渠道"},{19102,3,10,0,"1-1","怒焰上渠道"},{10054,3,99,0,"1-1","怒焰上渠道"},{10085,3,10,0,"1-1","怒焰上渠道"},{10150,3,3,0,"1-1","怒焰上渠道"}},
		c78_1={{17012,3,5,0,"1-1","怒焰上渠道"},{10148,3,5,0,"1-1","怒焰上渠道"},{10079,3,5,0,"1-1","怒焰上渠道"},{10075,3,3,0,"1-1","怒焰上渠道"},{10040,3,3,0,"1-1","怒焰上渠道"}},
		c79_1={{40037,3,1,0,"1-1","GS四转套装"},{50037,3,2,0,"1-1","GS四转套装"},{60037,3,2,0,"1-1","GS四转套装"},{70037,3,1,0,"1-1","GS四转套装"},{90037,3,1,0,"1-1","GS四转套装"},{100037,3,1,0,"1-1","GS四转套装"}},
		c80_1={{40038,3,1,0,"1-1","GS四转套装"},{50038,3,2,0,"1-1","GS四转套装"},{60038,3,2,0,"1-1","GS四转套装"},{70038,3,1,0,"1-1","GS四转套装"},{90038,3,1,0,"1-1","GS四转套装"},{100038,3,1,0,"1-1","GS四转套装"}},
		c81_1={{40039,3,1,0,"1-1","GS四转套装"},{50039,3,2,0,"1-1","GS四转套装"},{60039,3,2,0,"1-1","GS四转套装"},{70039,3,1,0,"1-1","GS四转套装"},{90039,3,1,0,"1-1","GS四转套装"},{100039,3,1,0,"1-1","GS四转套装"}},
		c82_1={{10095,3,20,0,"1-1","预约羽灵礼包"},{10081,3,1,0,"1-1","预约羽灵礼包"},{10080,3,1,0,"1-1","预约羽灵礼包"},{10069,3,5,0,"1-1","预约羽灵礼包"}},
		c83_1={{17012,3,5,0,"1-1","回流羽灵礼包"},{10195,3,10,0,"1-1","回流羽灵礼包"},{10211,3,10,0,"1-1","回流羽灵礼包"},{10224,3,10,0,"1-1","回流羽灵礼包"},{10119,3,10,0,"1-1","回流羽灵礼包"},{10116,3,5,0,"1-1","回流羽灵礼包"}},
		c84_1={{19007,3,5,0,"1-1","好评礼包"},{10069,3,5,0,"1-1","好评礼包"}},
		c85_1={{3010,3,1,0,"1-1","8折狩魂礼券"}},
		c86_1={{3011,3,1,0,"1-1","5折狩魂礼券"}},
		c87_1={{3012,3,1,0,"1-1","1折狩魂礼券"}},

	}
	--if s_getVar(uid,10005,mutextype) ~=  0 then
		--s_sysInfo(uid,"已经领取过奖励！",ChatPos_Sys + ChatPos_Important)
	--else
		releaseCard(cards_type['c'..channel.."_"..channeltype])
	--end
end