local PLUGIN = {}
PLUGIN.Title = "Weapon stats"
PLUGIN.Description = "Display a players weapon stats"
PLUGIN.Author = "Boopington"
PLUGIN.ChatCommand = "stats"
PLUGIN.Usage = "[player or blank]"
PLUGIN.Privileges = { "weaponstats" }
slaytable = {}

function PLUGIN:Call( ply, args )
	if ( ply:EV_HasPrivilege( "weaponstats" ) ) then
		if args[1] == nil then
			sendStats(ply, ply)
		else
			local players = evolve:FindPlayer( args, ply, nil, true )
				
			if ( #players > 0 ) then
				sendStats(ply, players[1])
			else
				evolve:Notify( ply, evolve.colors.red, evolve.constants.noplayers )
			end
		end
	else
		evolve:Notify( ply, evolve.colors.red, evolve.constants.notallowed )
	end
end

function PLUGIN:Menu( arg, players )
	if ( arg ) then
		RunConsoleCommand( "ev", "stats", players[1] )
	else
		return "stats", evolve.category.action
	end
end

evolve:RegisterPlugin( PLUGIN )