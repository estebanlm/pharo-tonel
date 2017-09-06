Extension {
	#name : #Object
}

{
	#category : #'*NewValueHolder',
	#timestamp : ' 8/31/2017 05:26:15'
}
Object>>asValueHolder [
	"See NewValueHolder class comment"

	^ NewValueHolder value: self
]
