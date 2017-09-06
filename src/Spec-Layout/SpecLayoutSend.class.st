"
A SpecLayoutSend is a spec layout action used when a selector is sent to the layout
"
Class {
	#name : #SpecLayoutSend,
	#superclass : #AbstractSpecLayoutAction,
	#category : #Spec-Layout,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayoutSend class>>selector: selector arguments: arguments [

	^ self new
		arguments: arguments;
		selector: selector;
		yourself
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayoutSend>>asSpecElements [

	^ {self selector.}, self arguments
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayoutSend>>bottomFraction [

	^ 0
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayoutSend>>bottomFraction: aNumber [

	^ 0
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayoutSend>>bottomOffset [

	^ 0
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayoutSend>>bottomOffset: aNumber [

	^ 0
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayoutSend>>isSplitter [

	^ false
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayoutSend>>leftFraction [

	^ 0
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayoutSend>>leftFraction: aNumber [

	^ 0
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayoutSend>>leftOffset [

	^ 0
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayoutSend>>leftOffset: aNumber [

	^ 0
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayoutSend>>rightFraction [

	^ 0
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayoutSend>>rightFraction: aNumber [

	^ 0
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayoutSend>>rightOffset [

	^ 0
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayoutSend>>rightOffset: aNumber [

	^ 0
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayoutSend>>topFraction [

	^ 0
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayoutSend>>topFraction: aNumber [

	^ 0
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayoutSend>>topOffset [

	^ 0
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayoutSend>>topOffset: aNumber [

	^ 0
]
