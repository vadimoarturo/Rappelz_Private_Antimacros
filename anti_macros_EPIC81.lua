function answer_insert(i)
local waitanswer = get_global_variable("waitanswerBlock_"..gv("name"))
local isBlock = get_global_variable("block_"..gv("name"))
local item = 61110223 .. i
insert_item(item,1)

		if isBlock == nil or isBlock == "" then 
			isBlock = 0
		    set_global_variable("block_"..gv("name"),0)
		end 
		if(isBlock == 1) then
		if i == waitanswer then
		local text = "@999994"
		private_notice(text)
		set_global_variable("block_"..gv("name"),0)
		set_global_variable("countMonster_"..gv("name"),0)
		set_global_variable("waitanswerBlock_"..gv("name"),0)
		remove_state( 6007, 6)
		add_cstate( 6007, 6, 5)
		add_state( 201085, 2, 100 )
		add_cstate( 201085, 2, 100 )
		else
		local text = "@999995"
		RunTeleport( 0, 152879 , 77312 )
		private_notice(text)
		end
		else 
		local text = "@999996"
		private_notice(text)
		end

end

function dead_guard_mob()
	
		local datetime = get_os_date("*t")
		local seconds = get_os_time(datetime)
		
		local count = tonumber(get_global_variable("countMonster_"..gv("name"))) 
		local waitanswer = get_global_variable("waitanswerBlock_"..gv("name"))
		local isBlock = get_global_variable("block_"..gv("name"))
		

		if waitanswer == nil or waitanswer == "" then 
			set_global_variable("waitanswerBlock_"..gv("name"),0)
		end 

		if count == nil or count == "" then 
			count = 0 
			set_global_variable("countMonster_"..gv("name"),0)
		end 
		
		
		if isBlock == nil or isBlock == "" then 
			isBlock = 0
		    set_global_variable("block_"..gv("name"),0)
		end 
		
		local isKillDate = get_global_variable("kill_date_"..gv("name"))
		if isKillDate == nil or isKillDate == "" then 
		    set_global_variable("kill_date_"..gv("name"), seconds)
		end 
		
		
		if(isBlock == 1) then
			local mathcount = math.random(1,5)
			local mathcounttwo
			
			if mathcount == 5 then
			mathcounttwo = 0
			elseif mathcount == 4 then
			mathcounttwo = math.random(0,1)
			elseif mathcount == 3 then
			mathcounttwo = math.random(0,2)
			elseif mathcount == 2 then
			mathcounttwo = math.random(0,3)
			elseif mathcount == 1 then
			mathcounttwo = math.random(0,4)
			end
			
			local waitanswer = mathcounttwo + mathcount
			set_global_variable("waitanswerBlock_"..gv("name"),waitanswer)
			local text = "@999993"
			private_notice(text)
			private_notice("<#03ff8d>"..mathcounttwo.."+"..mathcount.."?")
			add_state( 6007, 1, 30000 )
			add_cstate( 6007, 1, 30000 )
			add_state( 201085, 1, 30000 )
			add_cstate( 201085, 1, 30000 )
	
		else
		local countmob_random = math.random(300,400)
		if count > countmob_random then 
			set_global_variable("block_"..gv("name"),1)
			set_global_variable("block_date_"..gv("name"),os.date())
			local mathcount = math.random(1,5)
			local mathcounttwo
			
			if mathcount == 5 then
			mathcounttwo = 0
			elseif mathcount == 4 then
			mathcounttwo = math.random(0,1)
			elseif mathcount == 3 then
			mathcounttwo = math.random(0,2)
			elseif mathcount == 2 then
			mathcounttwo = math.random(0,3)
			elseif mathcount == 1 then
			mathcounttwo = math.random(0,4)
			end
			
			local waitanswer = mathcounttwo + mathcount
			set_global_variable("waitanswerBlock_"..gv("name"),waitanswer)
			local text = "@999992"
			private_notice(text)
			private_notice("<#03ff8d>"..mathcounttwo.."+"..mathcount.."?")
		end
		
		end
		
		
		
		if isKillDate ~= nil or isKillDate ~= "" then 
		
		local killtime = (seconds - isKillDate)
		if killtime >= 800 then
			set_global_variable("countMonster_"..gv("name"),0)
			set_global_variable("kill_date_"..gv("name"), seconds)
		else
			set_global_variable("countMonster_"..gv("name"),count + 1)
			set_global_variable("kill_date_"..gv("name"), seconds)

		end
		end
		
		end
		
	
	
function dead_guard_mob_sls()
local lv = gv("lv")

		local isBlock = get_global_variable("block_sls_"..gv("name"))
		
		if isBlock == nil or isBlock == "" then 
			isBlock = 0
		    set_global_variable("block_sls_"..gv("name"),0)
		end 
		

		if	lv < 155 then	
		set_global_variable("block_sls_"..gv("name"),1)
		add_state(6012, 360000)
		add_state(6012, 360000)
		RunTeleport( 0, 153111 , 76898)
		end
		
		if isBlock == 1 then
		if	lv >= 155 then	
			set_global_variable("block_sls_"..gv("name"),0)
		else 
		add_state(6012, 360000)
		add_cstate(6012, 360000)
		RunTeleport( 0, 153111 , 76898)
		end
		end
		
		
end

function dead_guard_mob_ws()
local lv = gv("lv")

		local isBlock = get_global_variable("block_ws_"..gv("name"))
		
		if isBlock == nil or isBlock == "" then 
			isBlock = 0
		    set_global_variable("block_ws_"..gv("name"),0)
		end 
		

		if	lv < 165 then	
		set_global_variable("block_ws_"..gv("name"),1)
		add_state(6012, 360000)
		add_cstate(6012, 360000)
		RunTeleport( 0, 153111 , 76898)
		end
		
		if isBlock == 1 then
		if	lv >= 165 then	
			set_global_variable("block_ws_"..gv("name"),0)
		else 
		add_state(6012, 360000)
		add_cstate(6012, 360000)
		RunTeleport( 0, 153111 , 76898)
		end
		end
		
		
end
