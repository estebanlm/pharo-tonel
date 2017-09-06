"
I implement a filtering strategy for processors based on method signatures (method selector and class).

I only allow processors created by a method currently added to the filter.

I can attach to each processor a configuration block.

For examples view my class side methods in teh category 'example'
"
Class {
	#name : #GTSpotterMethodListProcessorFilter,
	#superclass : #GTSpotterProcessorFilter,
	#instVars : [
		'selectedMethodSignatures',
		'configurationBlocks'
	],
	#category : #GT-Spotter-Model,
	#timestamp : 'AndreiChis 9/24/2015 18:17'
}

{
	#category : #adding,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterMethodListProcessorFilter>>allowProcessorsFrom: aMethod [
	|signature|
	
	signature := self signatureFor: aMethod.
	(selectedMethodSignatures includes: signature) ifFalse: [ selectedMethodSignatures add: signature ].
	
]

{
	#category : #adding,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterMethodListProcessorFilter>>allowProcessorsFrom: aMethod configuredWith: aBlock [
	
	self allowProcessorsFrom: aMethod.
	configurationBlocks at: aMethod printString put: aBlock.
	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterMethodListProcessorFilter>>configurationBlockForProcessorsCreatedBy: aMethod [
	
	^ configurationBlocks at: aMethod printString ifAbsent: [ self nullConfigurationBlock ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterMethodListProcessorFilter>>initialize [
	super initialize.

	selectedMethodSignatures := OrderedCollection new.
	configurationBlocks := Dictionary new.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterMethodListProcessorFilter>>nullConfigurationBlock [

	^ [ :processor | ]
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterMethodListProcessorFilter>>printSignature: aSignature [

	^ aSignature first name, '>>', aSignature second asString
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterMethodListProcessorFilter>>shouldEnableProcessorsCreateBy: aMethod [

	^ selectedMethodSignatures anySatisfy: [ :aSignature | 
		aSignature first = aMethod methodClass and: [ aSignature second = aMethod selector ] ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterMethodListProcessorFilter>>signatureFor: aMethod [

	^ {aMethod methodClass . aMethod selector}
]
