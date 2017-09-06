Extension {
	#name : #Collection
}

{
	#category : #'*Collections-arithmetic',
	#timestamp : ' 8/31/2017 07:16:28'
}
Collection>>* arg [

	^ arg adaptToCollection: self andSend: #*
]

{
	#category : #'*Collections-arithmetic',
	#timestamp : ' 8/31/2017 07:16:28'
}
Collection>>+ arg [

	^ arg adaptToCollection: self andSend: #+
]

{
	#category : #'*Collections-arithmetic',
	#timestamp : ' 8/31/2017 07:16:28'
}
Collection>>- arg [

	^ arg adaptToCollection: self andSend: #-
]

{
	#category : #'*Collections-arithmetic',
	#timestamp : ' 8/31/2017 07:16:28'
}
Collection>>/ arg [

	^ arg adaptToCollection: self andSend: #/
]

{
	#category : #'*Collections-arithmetic',
	#timestamp : ' 8/31/2017 07:16:28'
}
Collection>>// arg [

	^ arg adaptToCollection: self andSend: #//
]

{
	#category : #'*Collections-arithmetic',
	#timestamp : ' 8/31/2017 07:16:28'
}
Collection>>\\ arg [

	^ arg adaptToCollection: self andSend: #\\
]

{
	#category : #'*Collections-arithmetic-collectors',
	#timestamp : ' 8/31/2017 07:16:28'
}
Collection>>abs [
	"Absolute value of all elements in the collection"
	^ self collect: [:a | a abs]
]

{
	#category : #'*Collections-arithmetic-collectors',
	#timestamp : ' 8/31/2017 07:16:28'
}
Collection>>arcCos [
	^self collect: [:each | each arcCos]
]

{
	#category : #'*Collections-arithmetic-collectors',
	#timestamp : ' 8/31/2017 07:16:28'
}
Collection>>arcSin [
	^self collect: [:each | each arcSin]
]

{
	#category : #'*Collections-arithmetic-collectors',
	#timestamp : ' 8/31/2017 07:16:28'
}
Collection>>arcTan [
	^self collect: [:each | each arcTan]
]

{
	#category : #'*Collections-arithmetic',
	#timestamp : ' 8/31/2017 07:16:28'
}
Collection>>average [
	"
	#(3 5 7) average 
	>>> 5
	"

	^ self sum / self size
]

{
	#category : #'*Collections-arithmetic-collectors',
	#timestamp : ' 8/31/2017 07:16:28'
}
Collection>>ceiling [
	^ self collect: [:a | a ceiling]
]

{
	#category : #'*Collections-arithmetic-collectors',
	#timestamp : ' 8/31/2017 07:16:28'
}
Collection>>cos [
	^self collect: [:each | each cos]
]

{
	#category : #'*Collections-arithmetic-collectors',
	#timestamp : ' 8/31/2017 07:16:28'
}
Collection>>degreeCos [
	^self collect: [:each | each degreeCos]
]

{
	#category : #'*Collections-arithmetic-collectors',
	#timestamp : ' 8/31/2017 07:16:28'
}
Collection>>degreeSin [
	^self collect: [:each | each degreeSin]
]

{
	#category : #'*Collections-arithmetic-collectors',
	#timestamp : ' 8/31/2017 07:16:28'
}
Collection>>exp [
	^self collect: [:each | each exp]
]

{
	#category : #'*Collections-arithmetic-collectors',
	#timestamp : ' 8/31/2017 07:16:28'
}
Collection>>floor [
	^ self collect: [:a | a floor]
]

{
	#category : #'*Collections-arithmetic-collectors',
	#timestamp : ' 8/31/2017 07:16:28'
}
Collection>>ln [
	^self collect: [:each | each ln]
]

{
	#category : #'*Collections-arithmetic-collectors',
	#timestamp : ' 8/31/2017 07:16:28'
}
Collection>>log [
	^ self collect: [:each | each log]
]

{
	#category : #'*Collections-arithmetic',
	#timestamp : ' 8/31/2017 07:16:28'
}
Collection>>max [
	^ self inject: self anyOne into: [:max :each | max max: each]
]

{
	#category : #'*Collections-arithmetic',
	#timestamp : ' 8/31/2017 07:16:28'
}
Collection>>min [
	^ self inject: self anyOne into: [:min :each | min min: each]
]

{
	#category : #'*Collections-arithmetic-collectors',
	#timestamp : ' 8/31/2017 07:16:28'
}
Collection>>negated [
	"Negated value of all elements in the collection"
	^ self collect: [:a | a negated]
]

{
	#category : #'*Collections-arithmetic',
	#timestamp : ' 8/31/2017 07:16:28'
}
Collection>>raisedTo: arg [

	^ arg adaptToCollection: self andSend: #raisedTo:
]

{
	#category : #'*Collections-arithmetic',
	#timestamp : ' 8/31/2017 07:16:28'
}
Collection>>range [
	^ self max - self min
]

{
	#category : #'*Collections-arithmetic-collectors',
	#timestamp : ' 8/31/2017 07:16:28'
}
Collection>>reciprocal [
	"Return the reciever full of reciprocated elements"
	^ self collect: [:a | a reciprocal]
]

{
	#category : #'*Collections-arithmetic-collectors',
	#timestamp : ' 8/31/2017 07:16:28'
}
Collection>>roundTo: quantum [
	^self collect: [ :ea | ea roundTo: quantum ]
]

{
	#category : #'*Collections-arithmetic-collectors',
	#timestamp : ' 8/31/2017 07:16:28'
}
Collection>>rounded [
	^ self collect: [:a | a rounded]
]

{
	#category : #'*Collections-arithmetic-collectors',
	#timestamp : ' 8/31/2017 07:16:28'
}
Collection>>sign [
	^self collect: [:each | each sign]
]

{
	#category : #'*Collections-arithmetic-collectors',
	#timestamp : ' 8/31/2017 07:16:28'
}
Collection>>sin [
	^self collect: [:each | each sin]
]

{
	#category : #'*Collections-arithmetic-collectors',
	#timestamp : ' 8/31/2017 07:16:28'
}
Collection>>sqrt [
	^ self collect: [:each | each sqrt]
]

{
	#category : #'*Collections-arithmetic-collectors',
	#timestamp : ' 8/31/2017 07:16:28'
}
Collection>>squared [
	^ self collect: [:each | each * each]
]

{
	#category : #'*Collections-arithmetic',
	#timestamp : ' 8/31/2017 07:16:28'
}
Collection>>sum [
	"This is implemented using a variant of the normal inject:into: pattern. 
	The reason for this is that it is not known whether we're in the normal 
	number line, i.e. whether 0 is a good initial value for the sum. 
	Consider a collection of measurement objects, 0 would be the unitless 
	value and would not be appropriate to add with the unit-ed objects."
	| sum sample |
	sample := self anyOne.
	sum := self inject: sample into: [:accum :each | accum + each].
	^ sum - sample
]

{
	#category : #'*Collections-arithmetic-collectors',
	#timestamp : ' 8/31/2017 07:16:28'
}
Collection>>tan [
	^self collect: [:each | each tan]
]

{
	#category : #'*Collections-arithmetic-collectors',
	#timestamp : ' 8/31/2017 07:16:28'
}
Collection>>truncated [
	^ self collect: [:a | a truncated]
]
