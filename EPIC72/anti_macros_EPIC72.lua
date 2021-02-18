


function dead_guard_mob()
	
		datetime = os.date("*t")
		seconds = os.time(datetime)
		
		local count = tonumber(get_global_variable("countMonster_"..gv("name"))) 

		if count == nil or count == "" then 
			count = 0 
			set_global_variable("countMonster_"..gv("name"),0)
		end 
		
		local isBlock = get_global_variable("block_"..gv("name"))
		
		if isBlock == nil or isBlock == "" then 
			isBlock = 0
		    set_global_variable("block_"..gv("name"),0)
		end 
		
		local isKillDate = get_global_variable("kill_date_"..gv("name"))
		if isKillDate == nil or isKillDate == "" then 
		    set_global_variable("kill_date_"..gv("name"), seconds)
		else

		end 
		

		if(isBlock == 1) then
				open_popup("game.helpdesk_url", 1, 0)
				add_state( 6012, 6, 30000 )
				add_cstate( 6012, 6, 30000 )
				add_state( 201085, 6, 30000 )
				add_cstate( 201085, 6, 30000 )
			add_state 3 min  and popup +
						set_global_variable("countMonster_"..gv("name"),0)

		else
		
		if count > 300 then 
				open_popup("game.helpdesk_url", 1, 0)
				add_state( 6012, 6, 30000 )
				add_cstate( 6012, 6, 30000 )
				add_state( 201085, 6, 30000 )
				add_cstate( 201085, 6, 30000 )
			add_state 3 min  and popup +
			set_global_variable("block_"..gv("name"),1)
			set_global_variable("block_date_"..gv("name"),os.date())
							set_global_variable("countMonster_"..gv("name"),0)
		end
		
		if isKillDate ~= nil or isKillDate ~= "" then 
		
		killtime = (seconds - isKillDate)
		if killtime >= 500 then
				set_global_variable("countMonster_"..gv("name"),0)

		else
						set_global_variable("countMonster_"..gv("name"),0)

			--set_global_variable("countMonster_"..gv("name"),count + 1)
			end
		else
		end
		--set_global_variable("kill_date_"..gv("name"), seconds)
		
		end
		
		
	end
	
function dead_guard_mob_sls()
local lv = gv("lv")

		local isBlock = get_global_variable("block_sls_"..gv("name"))
		
		if isBlock == nil or isBlock == "" then 
			isBlock = 0
		    set_global_variable("block_sls_"..gv("name"),0)
		end 
		

		if	lv < 160 then	
		set_global_variable("block_sls_"..gv("name"),1)
		add_state(5997, 60, 360000)
		add_cstate(5997, 60, 360000)
		RunTeleport( 0, 153111 , 76898)
		end
		
		if isBlock == 1 then
		if	lv >= 160 then	
			set_global_variable("block_sls_"..gv("name"),0)
		else 
		add_state(5997, 60, 360000)
		add_cstate(5997, 60, 360000)
		RunTeleport( 0, 153111 , 76898)
		end
		end
		
		
end
