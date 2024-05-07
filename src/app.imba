import './a-file'

# make it work(DIY), make it right(Github), make it fast(...)
# mbaPending (frontendBench dbmonster domReconsileBench busyEye gameOfLife imba-ui) jherr(Fight spectrum ) secretLlama movieApp

let items = []
var selected = 0
var next = 1

tag Header
	<self [mb:4]>

tag Row
	prop i
	prop row
	<self>
		<tr> 
			<td> "{i+1}"
			<td> "{row}"
			<td> 
				<div [cursor:pointer] @click=(items.splice(i,1))> "❌"

tag Main
	def genRow row\number
		for i in [1...row + 1]
			items[i - 1] = i

	def addRow row
		for i in [0...row]
			items.push i

	def updateRow
		for row, i in items
			if (i+1) % 10 === 0
				items[i] = "Mod"

	def swapRow 
		for row, i in items
			if (i+1) % 10 == 0
				let tmp = items[i]
				items[i] = items[i - 10]
				items[i - 10] =  tmp

	<self>
		<div [d:flex bg:warm2]>
			<div [fs:4xl d:vcc w:100]> "VanillaJS-\"keyed\""
			<div [ta:right w:110]>
				css button bg:blue7 @hover:blue8 c:white p:2 w:50 m:1 rd:lg
				<button @click=genRow(1000)> "create 1000 rows"
				<button @click=genRow(10_000)> "create 10,000 rows"
				<button @click=addRow(1000)> "append 1000 rows"
				<button @click=updateRow> "update every 10th row"
				<button @click=(items = [])> "Clear"
				<button @click=swapRow> "Swap Rows"
		<table>
			for row, i in items
				<Row row=row i=i >

imba.mount <Main>
