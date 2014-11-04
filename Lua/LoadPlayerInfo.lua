--gloabl data definition
player_info_file = "player_info.csv"

--API, load player info from given file
function LoadPlayerInfo(fileName)
	players = {}
	numLines, allLines = GetLines(fileName)
	--load labels
	labelCount, myLabels = GetValues(allLines[1])

	for i = 2, numLines do
		count, playerInfo = GetValues(allLines[i])
		players[i - 1] = {}
		for j = 1, count do
			players[i - 1][j] = playerInfo[j]
		end
	end

	--print the info out
	for i = 1, numLines - 1 do
		for j = 1, count do
			print(myLabels[j], players[i][j])
		end
	end
end

-- read all lines from a file
function GetLines(fileName)
	idx = 0
	myLines = {}
	for line in io.lines(fileName) do
		idx = idx + 1
		myLines[idx] = line
	end
	return idx, myLines
end

--parse every line into split values
function GetValues(myString)
	num = 0
	values = {}
	if myString ~= nil then
		while string.find(myString, ",") ~= nil do
			i, j = string.find(myString, ",")
			num = num + 1
			values[num] = string.sub(myString, 1, j - 1)
			myString = string.sub(myString, j + 1, string.len(myString))
		end
		num = num + 1
		values[num] = myString
	end
	return num, values
end

--main function
LoadPlayerInfo(player_info_file)
