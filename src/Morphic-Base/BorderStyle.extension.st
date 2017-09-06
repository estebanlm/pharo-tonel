Extension {
	#name : #BorderStyle
}

{
	#category : #'*Morphic-Base',
	#timestamp : ' 8/31/2017 05:26:13'
}
BorderStyle class>>complexAltFramed [
	^ComplexBorder style: #complexAltFramed
]

{
	#category : #'*Morphic-Base',
	#timestamp : ' 8/31/2017 05:26:13'
}
BorderStyle class>>complexAltInset [
	^ComplexBorder style: #complexAltInset
]

{
	#category : #'*Morphic-Base',
	#timestamp : ' 8/31/2017 05:26:13'
}
BorderStyle class>>complexAltRaised [
	^ComplexBorder style: #complexAltRaised
]

{
	#category : #'*Morphic-Base',
	#timestamp : ' 8/31/2017 05:26:13'
}
BorderStyle class>>complexFramed [
	^ComplexBorder style: #complexFramed
]

{
	#category : #'*Morphic-Base',
	#timestamp : ' 8/31/2017 05:26:13'
}
BorderStyle class>>complexInset [
	^ComplexBorder style: #complexInset
]

{
	#category : #'*Morphic-Base',
	#timestamp : ' 8/31/2017 05:26:13'
}
BorderStyle class>>complexRaised [
	^ComplexBorder style: #complexRaised
]

{
	#category : #'*Morphic-Base',
	#timestamp : ' 8/31/2017 05:26:13'
}
BorderStyle class>>inset [
	^InsetBorder new
]

{
	#category : #'*Morphic-Base',
	#timestamp : ' 8/31/2017 05:26:13'
}
BorderStyle class>>raised [
	^RaisedBorder new
]

{
	#category : #'*Morphic-Base',
	#timestamp : ' 8/31/2017 05:26:13'
}
BorderStyle class>>simple [
	"Answer a simple border style"

	^ SimpleBorder new
]

{
	#category : #'*Morphic-Base',
	#timestamp : ' 8/31/2017 05:26:13'
}
BorderStyle class>>width: aNumber color: aColor [
	^SimpleBorder new color: aColor; width: aNumber; yourself
]
