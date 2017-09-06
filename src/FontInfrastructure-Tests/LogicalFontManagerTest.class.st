"
A LogicalFontManagerTest is a test class for testing the behavior of LogicalFontManager
"
Class {
	#name : #LogicalFontManagerTest,
	#superclass : #TestCase,
	#category : #FontInfrastructure-Tests,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:42'
}
LogicalFontManagerTest>>currentProviderOrError [
	| provider |
	provider := FreeTypeFontProvider readSlotNamed: #current.
	self assert: provider notNil.
	^ provider
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
LogicalFontManagerTest>>testHasCurrentFreeTypeFontProvider [
	"If it fails, LogicalFontManager unload should be called."
	self assert: (LogicalFontManager current identityIncludesFontProvider: self currentProviderOrError)
	
]
