"
Specialized list item wrapper for dependents
"
Class {
	#name : #MCDependentsWrapper,
	#superclass : #ListItemWrapper,
	#category : #MonticelloGUI,
	#timestamp : 'TorstenBergmann 2/20/2014 15:53'
}

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCDependentsWrapper>>= anMCDependentsWrapper [

	self class = anMCDependentsWrapper class ifFalse: [^ false].
	^ (self item package name = anMCDependentsWrapper item package name) and: [self model = anMCDependentsWrapper model].

]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCDependentsWrapper>>asString [
	^item description
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCDependentsWrapper>>contents [
	| list workingCopies |
	workingCopies := model unsortedWorkingCopies.
	list := item requiredPackages collect: 
					[:each | 
					workingCopies detect: [:wc | wc package = each] ifNone: [nil]]
				thenSelect: [:x | x notNil].
	^list collect: [:each | self class with: each model: model]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCDependentsWrapper>>hasContents [
	^item requiredPackages isEmpty not
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCDependentsWrapper>>hash [
	^ (self item package name hash * 37) + self model hash 

]
