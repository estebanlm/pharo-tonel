Extension {
	#name : #UndefinedObject
}

{
	#category : #'*Metacello-Core',
	#timestamp : ' 8/31/2017 07:16:49'
}
UndefinedObject>>asMetacelloSemanticVersionNumber [
    ^ MetacelloSemanticVersionNumber fromString: ''
]

{
	#category : #'*Metacello-Core',
	#timestamp : ' 8/31/2017 07:16:49'
}
UndefinedObject>>asMetacelloVersionNumber [

	^MetacelloVersionNumber fromString: ''
]

{
	#category : #'*Metacello-Core',
	#timestamp : ' 8/31/2017 07:16:49'
}
UndefinedObject>>metacelloRegistrationHash [
    ^ self hash
]

{
	#category : #'*Metacello-Core',
	#timestamp : ' 8/31/2017 07:16:49'
}
UndefinedObject>>registrationsCompareEqual: aMetacelloProjectSpec [
    ^ self = aMetacelloProjectSpec
]

{
	#category : #'*Metacello-Core',
	#timestamp : ' 8/31/2017 07:16:49'
}
UndefinedObject>>setAuthorInMetacelloVersion: aMetacelloVersionSpec [

	aMetacelloVersionSpec setAuthor: self
]

{
	#category : #'*Metacello-Core',
	#timestamp : ' 8/31/2017 07:16:49'
}
UndefinedObject>>setBlessingInMetacelloVersion: aMetacelloVersionSpec [

	aMetacelloVersionSpec setBlessing: self
]

{
	#category : #'*Metacello-Core',
	#timestamp : ' 8/31/2017 07:16:49'
}
UndefinedObject>>setDescriptionInMetacelloVersion: aMetacelloVersionSpec [

	aMetacelloVersionSpec setDescription: self
]

{
	#category : #'*Metacello-Core',
	#timestamp : ' 8/31/2017 07:16:49'
}
UndefinedObject>>setPostLoadDoItInMetacelloSpec: aMetacelloSpec [

	aMetacelloSpec setPostLoadDoIt: 
		(aMetacelloSpec project valueHolderSpec
			value: self;
			yourself)
]

{
	#category : #'*Metacello-Core',
	#timestamp : ' 8/31/2017 07:16:49'
}
UndefinedObject>>setPreLoadDoItInMetacelloSpec: aMetacelloSpec [

	aMetacelloSpec setPreLoadDoIt: 
		(aMetacelloSpec project valueHolderSpec
			value: self;
			yourself)
]

{
	#category : #'*Metacello-Core',
	#timestamp : ' 8/31/2017 07:16:49'
}
UndefinedObject>>setProject: aString withInMetacelloConfig: aMetacelloConfig [

	aMetacelloConfig setProject: aString withString: self
]

{
	#category : #'*Metacello-Core',
	#timestamp : ' 8/31/2017 07:16:49'
}
UndefinedObject>>setTimestampInMetacelloVersion: aMetacelloVersionSpec [

	aMetacelloVersionSpec setTimestamp: self
]
