"

"
Class {
	#name : #MetacelloMethodSectionPath,
	#superclass : #Array,
	#type : #variable,
	#category : #Metacello-Core-Constructors,
	#timestamp : ''
}

{
	#category : #conversion,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloMethodSectionPath>>asAttributeOrPath [
    self size = 1
        ifTrue: [ 
            | attribute |
            attribute := self at: 1.
            ^ attribute size = 1
                ifTrue: [ attribute at: 1 ]
                ifFalse: [ attribute ] ].
    ^ self
]

{
	#category : #conversion,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloMethodSectionPath>>asMetacelloAttributePath [
    ^ self
]
