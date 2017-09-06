"

"
Class {
	#name : #SystemOrganizerTest,
	#superclass : #TestCase,
	#category : #Tests-System,
	#timestamp : ''
}

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
SystemOrganizerTest>>testDefault [
	
	self assert: (SystemOrganizer default == self class environment organization).
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
SystemOrganizerTest>>testDefaultEnvironment [
	"self debug: #testDefaultEnvironment"
	
	"When no environment is specified, point to the default one"
	
	self assert: (SystemOrganizer new  environment == Smalltalk globals)
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
SystemOrganizerTest>>testThatExistingPackagenamesDoesNotContainIllegalCharacters [
	| illegalCharacters | 
	
	illegalCharacters := #(  $\ $/ $: $* $? $" $< $> $|  ).
	
	self class environment organization categories do: [ :aPackageName |
		self deny: (aPackageName includesAnyOf: illegalCharacters)
	]
]
