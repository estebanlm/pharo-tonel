Extension {
	#name : #Slot
}

{
	#category : #'*GT-SpotterExtensions-Core',
	#timestamp : ' 8/31/2017 05:26:36'
}
Slot>>spotterAccessesFor: aStep [
	<spotterOrder: 10>
	(aStep hasPreviousStep and: [
		(aStep previousStep origin isKindOf: Class) or: [
			aStep origin isKindOf: Class]]) ifTrue: [
		aStep listProcessor
				title: 'Accesses';
				allCandidates: [ 
					SystemNavigation default 
						allAccessesTo: self name 
						from: aStep previousStep origin ];
				itemName: [:each | each asString];
				filter: GTFilterSubstring ]
]
