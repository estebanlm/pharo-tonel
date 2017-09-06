"
I represent a style element of a VTermOutputStyle.
I can change my color
"
Class {
	#name : #VTermOutputStyleElement,
	#superclass : #Object,
	#instVars : [
		'color'
	],
	#pools : [
		'VTermOutputStyles'
	],
	#category : #System-CommandLine,
	#timestamp : 'ValentinRyckewaert 8/9/2016 11:35'
}

{
	#category : #'text coloring',
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputStyleElement>>black [
	"Change the current color of writing"

	self color: Color black
]

{
	#category : #'text coloring',
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputStyleElement>>black: aString [
	"Change the color of writing of aString and set it back to default color afterward"

	self print: aString withColor: Color black
]

{
	#category : #'text coloring',
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputStyleElement>>blue [
	"Change the current color of writing"

	self color: Color blue
]

{
	#category : #'text coloring',
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputStyleElement>>blue: aString [
	"Change the color of writing of aString and set it back to default color afterward"

	self print: aString withColor: Color blue
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputStyleElement>>color [

	^ color
]

{
	#category : #'text coloring',
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputStyleElement>>color: aColor [
	"Change the current color of writing"

	color := aColor.
]

{
	#category : #'text coloring',
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputStyleElement>>cyan [
	"Change the current color of writing"

	self color: Color cyan
]

{
	#category : #'text coloring',
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputStyleElement>>cyan: aString [
	"Change the color of writing of aString and set it back to default color afterward"

	self print: aString withColor: Color cyan
]

{
	#category : #'text coloring',
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputStyleElement>>green [
	"Change the current color of writing"

	self color: Color green
]

{
	#category : #'text coloring',
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputStyleElement>>green: aString [
	"Change the color of writing of aString and set it back to default color afterward"

	self print: aString withColor: Color green
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputStyleElement>>initialize [

	super initialize.
	color := VTermDefaultColor new
]

{
	#category : #'text coloring',
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputStyleElement>>magenta [
	"Change the current color of writing"

	self color: Color magenta
]

{
	#category : #'text coloring',
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputStyleElement>>magenta: aString [
	"Change the color of writing of aString and set it back to default color afterward"

	self print: aString withColor: Color magenta
]

{
	#category : #'text coloring',
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputStyleElement>>postCopy [
	color := self color copy.
]

{
	#category : #'text coloring',
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputStyleElement>>red [
	"Change the current color of writing"

	self color: Color red
]

{
	#category : #'text coloring',
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputStyleElement>>red: aString [
	"Change the color of writing of aString and set it back to default color afterward"

	self print: aString withColor: Color red
]

{
	#category : #styling,
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputStyleElement>>setInDriver: aVTermOutputDriver  [
	self subclassResponsibility
]

{
	#category : #'text coloring',
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputStyleElement>>white [
	"Change the current color of writing"

	self color: Color white
]

{
	#category : #'text coloring',
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputStyleElement>>white: aString [
	"Change the color of writing of aString and set it back to default color afterward"

	self print: aString withColor: Color white
]

{
	#category : #'text coloring',
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputStyleElement>>yellow [
	"Change the current color of writing"

	self color: Color yellow
]

{
	#category : #'text coloring',
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputStyleElement>>yellow: aString [
	"Change the color of writing of aString and set it back to default color afterward"

	self print: aString withColor: Color yellow
]
