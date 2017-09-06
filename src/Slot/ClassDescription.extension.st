Extension {
	#name : #ClassDescription
}

{
	#category : #'*Slot',
	#timestamp : ' 8/31/2017 07:16:35'
}
ClassDescription>>superclass: aSuperclass layout: aLayout [
	layout := aLayout. 
	
	self
		superclass: aSuperclass
		methodDictionary: MethodDictionary new
		format: aLayout format.
]

{
	#category : #'*Slot',
	#timestamp : ' 8/31/2017 07:16:35'
}
ClassDescription>>superclass: aSuperclass withLayoutType: layoutType slots: slotArray [
	| superLayout newScope newLayout |
	superLayout := aSuperclass
						ifNil: [ EmptyLayout instance ]
						ifNotNil: [ aSuperclass classLayout ].
	newScope := superLayout slotScope extend: slotArray.
	newLayout := layoutType extending: superLayout scope: newScope host: self.
	newLayout checkSanity.
	self
		superclass: aSuperclass
		layout: newLayout
]
