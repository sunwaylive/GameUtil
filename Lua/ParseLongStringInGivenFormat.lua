myString = "This is my rather long string."
cnt = 1
for myWord in string.gmatch(myString, "%a+") do
	print(string.format("Word #%d: %s", cnt, myWord))
	cnt = cnt + 1
end
