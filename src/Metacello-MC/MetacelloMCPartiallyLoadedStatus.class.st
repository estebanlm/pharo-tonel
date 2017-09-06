"

"
Class {
	#name : #MetacelloMCPartiallyLoadedStatus,
	#superclass : #Object,
	#instVars : [
		'hasNoPackage',
		'hasNoProject',
		'aProjectIsLoaded',
		'aPackageIsLoaded',
		'aLoadedProjectIsExact',
		'aLoadedPackageIsExact',
		'aLoadedProjectIsCurrent',
		'aLoadedPackageIsCurrent',
		'aLoadedProjectIsNotCurrent',
		'aLoadedPackageIsNotCurrent',
		'aProjectNotLoaded',
		'aPackageNotLoaded',
		'vrsnStatus',
		'abort'
	],
	#category : #Metacello-MC-Specs,
	#timestamp : ''
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCPartiallyLoadedStatus class>>new [
	^ self basicNew initialize
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCPartiallyLoadedStatus>>aLoadedPackageIsCurrent [
	^ aLoadedPackageIsCurrent
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCPartiallyLoadedStatus>>aLoadedPackageIsCurrent: aBoolean [
	aLoadedPackageIsCurrent := aBoolean
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCPartiallyLoadedStatus>>aLoadedPackageIsExact [
	^ aLoadedPackageIsExact
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCPartiallyLoadedStatus>>aLoadedPackageIsExact: aBoolean [
	aLoadedPackageIsExact := aBoolean
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCPartiallyLoadedStatus>>aLoadedPackageIsNotCurrent [
	^ aLoadedPackageIsNotCurrent
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCPartiallyLoadedStatus>>aLoadedPackageIsNotCurrent: aBoolean [
	aLoadedPackageIsNotCurrent := aBoolean
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCPartiallyLoadedStatus>>aLoadedProjectIsCurrent: aBoolean [
	aLoadedProjectIsCurrent := aBoolean
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCPartiallyLoadedStatus>>aLoadedProjectIsExact [
	^ aLoadedProjectIsExact
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCPartiallyLoadedStatus>>aLoadedProjectIsExact: aBoolean [
	aLoadedProjectIsExact := aBoolean
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCPartiallyLoadedStatus>>aLoadedProjectIsNotCurrent [
	^ aLoadedProjectIsNotCurrent
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCPartiallyLoadedStatus>>aLoadedProjectIsNotCurrent: aBoolean [
	aLoadedProjectIsNotCurrent := aBoolean
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCPartiallyLoadedStatus>>aPackageIsLoaded [
	^aPackageIsLoaded
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCPartiallyLoadedStatus>>aPackageIsLoaded: aBoolean [
	aPackageIsLoaded := aBoolean
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCPartiallyLoadedStatus>>aPackageNotLoaded [
	^aPackageNotLoaded
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCPartiallyLoadedStatus>>aPackageNotLoaded: aBoolean [
	aPackageNotLoaded := aBoolean
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCPartiallyLoadedStatus>>aProjectIsLoaded [
	^aProjectIsLoaded
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCPartiallyLoadedStatus>>aProjectIsLoaded: aBoolean [
	aProjectIsLoaded := aBoolean
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCPartiallyLoadedStatus>>aProjectNotLoaded [
	^aProjectNotLoaded
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCPartiallyLoadedStatus>>aProjectNotLoaded: aBoolean [
	aProjectNotLoaded := aBoolean
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCPartiallyLoadedStatus>>abort [
	^ abort
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCPartiallyLoadedStatus>>abort: aBoolean [
	abort := aBoolean
]

{
	#category : #evaulation,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCPartiallyLoadedStatus>>evaluateStatus: validStatusList [
	^self abort
		ifTrue: [ false ]
		ifFalse: [ 
			(self hasNoProject or: [ self vrsnStatus isEmpty ])
				ifTrue: [ true ]
				ifFalse: [ 
					| valid |
					valid := true.
					vrsnStatus
						do: [ :status | 
							(validStatusList includes: status)
								ifFalse: [ valid := false ] ].
					valid ] ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCPartiallyLoadedStatus>>hasNoPackage [
	^ hasNoPackage
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCPartiallyLoadedStatus>>hasNoPackage: aBoolean [
	hasNoPackage := aBoolean
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCPartiallyLoadedStatus>>hasNoProject [
	^ hasNoProject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCPartiallyLoadedStatus>>hasNoProject: aBoolean [
	hasNoProject := aBoolean
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCPartiallyLoadedStatus>>initialize [
	super initialize.
	hasNoPackage := hasNoProject := true.
	aProjectIsLoaded := aPackageIsLoaded := false.
	aLoadedProjectIsExact := aLoadedPackageIsExact := false.
	aLoadedProjectIsCurrent := aLoadedPackageIsCurrent := false.
	aLoadedProjectIsNotCurrent := aLoadedPackageIsNotCurrent := false.
	aProjectNotLoaded := aPackageNotLoaded := false.
	vrsnStatus := Set new.
	abort := false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCPartiallyLoadedStatus>>isAllLoadedToSpec: matchBlock [
        "all projects and packages are loaded and match specification"

	(self evaluateStatus: #(#allLoadedToSpec))
		ifTrue: [ 
			((hasNoPackage
				or: [ 
					aPackageIsLoaded & aPackageNotLoaded not & aLoadedPackageIsExact & aLoadedPackageIsNotCurrent not
						& aLoadedPackageIsCurrent not ])
				and: [ 
					hasNoProject
						or: [ 
							aProjectIsLoaded & aProjectNotLoaded not & aLoadedProjectIsExact & aLoadedProjectIsNotCurrent not
								& aLoadedProjectIsCurrent not ] ])
				ifTrue: [ matchBlock value: #allLoadedToSpec ] ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCPartiallyLoadedStatus>>isLoadedMatchConstraints: matchBlock [
	"all loaded projects and packages match constraints (at least one package loaded)"

	| matchStatus |
	matchStatus := #loadedMatchConstraints.
	(self evaluateStatus: #(#allLoadedToSpec #loadedToSpec #loadedMatchConstraints))
		ifTrue: [ 
			aPackageIsLoaded & aProjectIsLoaded
				ifTrue: [ 
					(aLoadedPackageIsExact | aLoadedPackageIsCurrent & aLoadedPackageIsNotCurrent not
						and: [ aLoadedProjectIsExact | aLoadedProjectIsCurrent & aLoadedProjectIsNotCurrent not ])
						ifTrue: [ matchBlock value: matchStatus ] ]
				ifFalse: [ 
					aPackageIsLoaded
						ifTrue: [ 
							aLoadedPackageIsExact | aLoadedPackageIsCurrent & aLoadedPackageIsNotCurrent not
								ifTrue: [ matchBlock value: matchStatus ] ]
						ifFalse: [ 
							hasNoPackage & (aLoadedProjectIsExact | aLoadedProjectIsCurrent) & aLoadedProjectIsNotCurrent not
								ifTrue: [ matchBlock value: matchStatus ] ] ] ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCPartiallyLoadedStatus>>isLoadedToSpec: matchBlock [
	"all loaded projects and packages match specifications (at least one package loaded)"

	| matchStatus |
	matchStatus := #loadedToSpec.
	(self evaluateStatus: #(#allLoadedToSpec #loadedToSpec))
		ifTrue: [ 
			aPackageIsLoaded & aProjectIsLoaded
				ifTrue: [ 
					(aLoadedPackageIsExact & aLoadedPackageIsCurrent not & aLoadedPackageIsNotCurrent not
						and: [ aLoadedProjectIsExact & aLoadedProjectIsCurrent not & aLoadedProjectIsNotCurrent not ])
						ifTrue: [ matchBlock value: matchStatus ] ]
				ifFalse: [ 
					aPackageIsLoaded
						ifTrue: [ 
							aLoadedPackageIsExact & aLoadedPackageIsCurrent not & aLoadedPackageIsNotCurrent not
								ifTrue: [ matchBlock value: matchStatus ] ]
						ifFalse: [ 
							hasNoPackage & aLoadedProjectIsExact & aLoadedProjectIsCurrent not & aLoadedProjectIsNotCurrent not
								ifTrue: [ matchBlock value: matchStatus ] ] ] ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCPartiallyLoadedStatus>>isSomethingLoaded: somethingLoadedBlock [
	"at least one package loaded"

	(self evaluateStatus: #(#allLoadedToSpec #loadedToSpec #loadedMatchConstraints #somethingLoaded))
		ifTrue: [ 
			aPackageIsLoaded
				ifTrue: [ somethingLoadedBlock value: #somethingLoaded ] ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCPartiallyLoadedStatus>>vrsnStatus [
	^vrsnStatus
]
