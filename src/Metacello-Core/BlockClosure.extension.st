Extension {
	#name : #BlockClosure
}

{
	#category : #'*Metacello-Core-scripting',
	#timestamp : ' 8/31/2017 07:16:49'
}
BlockClosure>>execute: projectSpecBlock against: aScriptExecutor [
    aScriptExecutor executeBlock: self do: projectSpecBlock
]

{
	#category : #'*Metacello-Core',
	#timestamp : ' 8/31/2017 07:16:49'
}
BlockClosure>>setAuthorInMetacelloConfig: aMetacelloConfig [

	aMetacelloConfig setAuthorWithBlock: self
]

{
	#category : #'*Metacello-Core',
	#timestamp : ' 8/31/2017 07:16:49'
}
BlockClosure>>setBaseline: aString withInMetacelloConfig: aMetacelloConfig [
    aMetacelloConfig setBaseline: aString withBlock: self
]

{
	#category : #'*Metacello-Core',
	#timestamp : ' 8/31/2017 07:16:49'
}
BlockClosure>>setBlessingInMetacelloConfig: aMetacelloConfig [

	aMetacelloConfig setBlessingWithBlock: self
]

{
	#category : #'*Metacello-Core',
	#timestamp : ' 8/31/2017 07:16:49'
}
BlockClosure>>setConfiguration: aString withInMetacelloConfig: aMetacelloConfig [
    aMetacelloConfig setConfiguration: aString withBlock: self
]

{
	#category : #'*Metacello-Core',
	#timestamp : ' 8/31/2017 07:16:49'
}
BlockClosure>>setDescriptionInMetacelloConfig: aMetacelloConfig [

	aMetacelloConfig setDescriptionWithBlock: self
]

{
	#category : #'*Metacello-Core',
	#timestamp : ' 8/31/2017 07:16:49'
}
BlockClosure>>setPackage: aString withInMetacelloConfig: aMetacelloConfig [

	aMetacelloConfig setPackage: aString withBlock: self
]

{
	#category : #'*Metacello-Core',
	#timestamp : ' 8/31/2017 07:16:49'
}
BlockClosure>>setProject: aString withInMetacelloConfig: aMetacelloConfig [

	aMetacelloConfig setProject: aString withBlock: self
]

{
	#category : #'*Metacello-Core',
	#timestamp : ' 8/31/2017 07:16:49'
}
BlockClosure>>setTimestampInMetacelloConfig: aMetacelloConfig [

	aMetacelloConfig setTimestampWithBlock: self
]
