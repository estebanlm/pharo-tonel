"
Abstract superClass for fontProviders
	examples of possible fontProviders are 
		StrikeFontProvider
		FreeTypeFontProvider
		Win32NativeFontProvider
		
"
Class {
	#name : #FontProviderAbstract,
	#superclass : #Object,
	#category : #FontInfrastructure,
	#timestamp : 'tween 3/14/2007 22:59'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FontProviderAbstract>>families [
	self subclassResponsibility
]
