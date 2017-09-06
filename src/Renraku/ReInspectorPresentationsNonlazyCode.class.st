"
If you execute some code during the method execution it will  slow down the inspector.

Try to put all the code in blocks in the setup messages, such as #title:, #display:,  #when:. Buy doing this your code will be executed lazily when the presentation is selected.
"
Class {
	#name : #ReInspectorPresentationsNonlazyCode,
	#superclass : #ReAbstractRule,
	#category : #Renraku-Rules,
	#timestamp : 'YuriyTymchuk 1/13/2016 10:55'
}

{
	#category : #testing-interest,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReInspectorPresentationsNonlazyCode class>>checksMethod [
	^ true
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReInspectorPresentationsNonlazyCode>>check: aMethod forCritiquesDo: aCriticBlock [

	(aMethod hasPragmaNamed: #gtInspectorPresentationOrder:) ifFalse: [ ^ self ].
	
	^ (aMethod ast statements
			reject: [ :statement |
				self
					presentation: aMethod ast arguments first
					isTheLeftmostRecepientIn: (statement isReturn
						ifTrue: [ statement value ]
						ifFalse: [ statement ]) ]			
			thenCollect: [ :statement |
				aCriticBlock cull: (ReTrivialCritique
					withAnchor: (ReIntervalSourceAnchor
						entity: aMethod
						interval: statement sourceInterval)
					by: self) ])
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReInspectorPresentationsNonlazyCode>>group [
	^ 'Optimization'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReInspectorPresentationsNonlazyCode>>name [

	^ 'Code executed outside of the presentation setup'
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReInspectorPresentationsNonlazyCode>>presentation: aPresentation isTheLeftmostRecepientIn: aStatement [

	^ (aStatement isMessage or:
	 [ aStatement isCascade ])  and: [ 
			aStatement leftmostChainReceiver = aPresentation ]
]
