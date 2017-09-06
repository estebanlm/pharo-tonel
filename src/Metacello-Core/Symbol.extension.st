Extension {
	#name : #Symbol
}

{
	#category : #'*Metacello-Core',
	#timestamp : ' 8/31/2017 07:16:49'
}
Symbol>>asMetacelloAttributeList [
    ^ {self}
]

{
	#category : #'*Metacello-Core',
	#timestamp : ' 8/31/2017 07:16:49'
}
Symbol>>asMetacelloAttributePath [
    ^ MetacelloMethodSectionPath with: {self}
]

{
	#category : #'*Metacello-Core',
	#timestamp : ' 8/31/2017 07:16:49'
}
Symbol>>setForDo: aBlock withInMetacelloConfig: aMetacelloConstructore [
    aMetacelloConstructore setFor: {self} do: aBlock
]

{
	#category : #'*Metacello-Core',
	#timestamp : ' 8/31/2017 07:16:49'
}
Symbol>>setForVersion: aString withInMetacelloConfig: aMetacelloConstructore [
    aMetacelloConstructore setFor: {self} version: aString
]

{
	#category : #'*Metacello-Core',
	#timestamp : ' 8/31/2017 07:16:49'
}
Symbol>>setPostLoadDoItInMetacelloSpec: aMetacelloSpec [
    self precedence == 0
        ifTrue: [ self error: 'Invalid selector' ].
    aMetacelloSpec
        setPostLoadDoIt:
            (aMetacelloSpec project valueHolderSpec
                value: self;
                yourself)
]

{
	#category : #'*Metacello-Core',
	#timestamp : ' 8/31/2017 07:16:49'
}
Symbol>>setPreLoadDoItInMetacelloSpec: aMetacelloSpec [
    self precedence == 0
        ifTrue: [ self error: 'Invalid selector' ].
    aMetacelloSpec
        setPreLoadDoIt:
            (aMetacelloSpec project valueHolderSpec
                value: self;
                yourself)
]
