"
Contains methods for accessing points stored in variable word classes.
Initially used by PointArray & ShortPointArray
"
Trait {
	#name : #TPointAccess,
	#traits : '{}',
	#classTraits : '{}',
	#category : #Balloon-Collections,
	#timestamp : 'HenrikSperreJohansen 1/26/2011 15:54'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
TPointAccess>>at: index [

	^(super at: index * 2 - 1) @ (super at: index * 2)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
TPointAccess>>at: index put: aPoint [

	super at: index * 2 - 1 put: aPoint x asInteger.
	super at: index * 2 put: aPoint y asInteger.
	^aPoint
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
TPointAccess>>bounds [
	| min max |
	min := max := self at: 1.
	self do:[:pt|
		min := min min: pt.
		max := max max: pt].
	^min corner: max
		
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
TPointAccess>>defaultElement  [

	"Return the default element of the receiver"
	^0@0
]
