require 'json'

file = File.read('SmogonList.json')
parsed = JSON.parse(file)
region = "johto"


File.open('Output.txt', 'w') do |f|
	f.puts "[CENTER]"
	parsed[region].count.times do |i|
		# This sets variables to make formatting output simpler
		dexno = parsed[region][i]["dexno"]
		name = parsed[region][i]["name"]
		type1 = parsed[region][i]["type1"]
		tyep2 = parsed[region][i]["type2"]
		ball = parsed[region][i]["ball"].downcase.gsub(/[[:space:]]/,'')
		nature = parsed[region][i]["nature"]
		ability = parsed[region][i]["ability"]
		eggmoves = parsed[region][i]["eggmoves"]
		ivs = parsed[region][i]["ivs"]

		# This is where you format the output
		f.puts "[b] ##{dexno} #{name} [/b]"
		f.puts "[img]http://www.pokestadium.com/sprites/xy/#{name.downcase}.gif[/img] [img]http://www.serebii.net/itemdex/sprites/#{ball}.png[/img]"
		f.puts nature
		f.puts ability
		if eggmoves != ""
			f.puts "[i]#{eggmoves}[/i]"
		end
		f.puts ivs
		f.puts ""
	end
	f.puts "[/CENTER]"
end