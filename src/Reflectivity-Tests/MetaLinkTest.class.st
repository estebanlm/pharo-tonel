"
Tests for MetaLink
"
Class {
	#name : #MetaLinkTest,
	#superclass : #TestCase,
	#category : #Reflectivity-Tests,
	#timestamp : 'MarcusDenker 3/1/2015 18:23'
}

{
	#category : #'tests - misc',
	#timestamp : ' 8/31/2017 05:26:31'
}
MetaLinkTest>>testAvailableReifications [
	self assert: (RBMessageNode new availableReifications includes: #receiver).
	self assert: (RBMessageNode new availableReifications includes: #value).
	self assert: ((ReflectivityExamples classVariableNamed: #ClassVar) availableReifications includes: #name).
	self deny: ((ReflectivityExamples classVariableNamed: #ClassVar) availableReifications includes: #selector).
]

{
	#category : #'tests - simple',
	#timestamp : ' 8/31/2017 05:26:31'
}
MetaLinkTest>>testBlockLink [
	| link |
	link := MetaLink new 
	metaObject: [1+2].
	
	self assert: link metaObject value = 3.
	self assert: link selector = #value.
]

{
	#category : #'tests - simple',
	#timestamp : ' 8/31/2017 05:26:31'
}
MetaLinkTest>>testConditionLink [
	| link |
	link := MetaLink new 
	metaObject: [1+2];
	condition: true.
	
	self assert: link metaObject value = 3.
	self assert: link selector = #value.
	self assert: link condition.
	self assert: link hasCondition.
]

{
	#category : #'tests - simple',
	#timestamp : ' 8/31/2017 05:26:31'
}
MetaLinkTest>>testCotrolInstead [
	| link |
	link := MetaLink new 
	metaObject: [1+2];
	control: #instead.
	
	self assert: link metaObject value = 3.
	self assert: link selector = #value.
	self assert: link control = #instead.
	
	self deny: ((ReflectivityExamples>>#exampleMethod) ast hasMetalinkInstead). 	
	
]

{
	#category : #'tests - simple',
	#timestamp : ' 8/31/2017 05:26:31'
}
MetaLinkTest>>testCotrolLink [
	| link |
	link := MetaLink new 
	metaObject: [1+2];
	control: #after.
	
	self assert: link metaObject value = 3.
	self assert: link selector = #value.
	self assert: link control = #after.
]

{
	#category : #'tests - options',
	#timestamp : ' 8/31/2017 05:26:31'
}
MetaLinkTest>>testLinkOption [
	| link |
	link := MetaLink new 
		options: #(+option1 -option2).
	
	self assert: link option1.
	self deny: link option2.
]

{
	#category : #'tests - options',
	#timestamp : ' 8/31/2017 05:26:31'
}
MetaLinkTest>>testLinkOptionsDefault [
	| link |
	link := MetaLink new.

	self assert: link optionInlineMetaObject.
	self deny: link optionCompileOnLinkInstallation.
]

{
	#category : #'tests - options',
	#timestamp : ' 8/31/2017 05:26:31'
}
MetaLinkTest>>testOptionFor [

	self assert: (((ReflectivityExamples>>#exampleMethodWithMetaLinkOptions) ast optionsFor: MetaLink new) includes: #optionCompileOnLinkInstallation).
	self assert: (((ReflectivityExamples class>>#exampleMethodWithMetaLinkOptionsViaClass) ast optionsFor: MetaLink new) includes: #optionCompileOnLinkInstallation).
]

{
	#category : #'tests - simple',
	#timestamp : ' 8/31/2017 05:26:31'
}
MetaLinkTest>>testReificationError [
	| link |
	link := MetaLink new 
		metaObject: #unknown.
	self should: [ (ReflectivityExamples>>#exampleMethod) ast link: link ] raise: Error.
	self should: [ (ReflectivityExamples classVariableNamed: #ClassVar) link: link ] raise: Error.
]

{
	#category : #'tests - simple',
	#timestamp : ' 8/31/2017 05:26:31'
}
MetaLinkTest>>testSimpleHaltLink [
	| link |
	link := MetaLink new 
	metaObject: Halt;
	selector: #now.
	
	self assert: link metaObject = Halt.
	self assert: link selector = #now.
]
