# make it work(DIY), make it right(Github), make it fast(...)
# mbaPending (frontendBench dbmonster domReconsileBench busyEye gameOfLife imba-ui) jherr(Fight spectrum ) secretLlama movieApp

const A = ["pretty", "large", "big", "small", "tall", "short", "long", "handsome", "plain", "quaint", "clean", "elegant", "easy", "angry", "crazy", "helpful", "mushy", "odd", "unsightly", "adorable", "important", "inexpensive", "cheap", "expensive", "fancy"]
const C = ["red", "yellow", "blue", "green", "pink", "brown", "purple", "brown", "white", "black", "orange"]
const N = ["table", "chair", "house", "bbq", "desk", "car", "pony", "cookie", "sandwich", "burger", "pizza", "mouse",  "keyboard"]

extend tag element
	attr aria-hidden

var items = []
var selected = 10
var nextId = 1

tag Row < tr
	prop data
	def render
		# return if data === prev
		# prev = data
		<self>
			css
				&>td lh:2 p:0.5rem border-top:1px warm4
				& bg@odd:gray1 @hover:warm3
				&.danger bg:red1
				
			<td> "{data.id}"
			<td> "{data.label}"
			<td> 
				<div aria-hidden="true" [cursor:pointer] @click=emit('remove', data)> "❌"

global css body ff:sans

tag Header
	<self [mb:4]>


def choose max
	return Math.round(Math.random() * 1000) % max

def buildData count\number
	var newItems = new Array(count)
	var i = 0
	while i < count
		newItems[i] = {
			id: nextId,
			label: "{A[choose(A.length)]} {C[choose(C.length)]} {N[choose(N.length)]}"
		}
		i += 1
		nextId += 1
	newItems

tag Main
	def setup
		items = buildData(10)

	def handleRemove e
		items.splice(items.indexOf(e.detail), 1)

	def run
		items = buildData(1000)

	def runLots
		items = buildData(10_000)
	
	def add
		items = items.concat(buildData(1000))

	def update
		var i = 0
		while i < items.length
			var item = items[i]
			items[i] = {id: item.id, label: item.label + ' !!!'}
			i += 10

	def clear
		items = []

	def swapRow 
		if items.length > 998
			[items[1], items[998]] = [items[998], items[1]]

	<self>
		<div>
			css & d:flex d@lt-md:vflex jc:flex-end ai:center bg:gray13 mb:2 rd:xl
			<div [fs:4xl ta:center flg:1]> "VanillaJS-\"keyed\""
			<div [w:85]>
				css button bg:#337ab7 @hover:#286090 bc:#2e6da4 @hover:#204d74 c:white py:1.5 px:3 fs:sm bd:0 m:1 rd:2 min-width:40
				<button @click=run> "create 1000 rows"
				<button @click=runLots> "create 10,000 rows"
				<button @click=add> "append 1000 rows"
				<button @click=update> "update every 10th row"
				<button @click=clear> "Clear"
				<button @click=swapRow> "Swap Rows"
		<table [border-spacing:0 w:100vw]>
			for item in items
				<Row key=item.id data=item .danger=(item.id === selected) 
				# <Row data=item .danger=(item.id === selected) 
					@click=(selected = item.id) 
					@remove=handleRemove>

imba.mount <Main>
