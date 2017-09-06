"

"
Class {
	#name : #MetacelloProjectSpecGenerator,
	#superclass : #Object,
	#instVars : [
		'target'
	],
	#category : #Metacello-Core-Scripts,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectSpecGenerator>>projectSpecCreationBlock [
    ^ [ :projectName | {(MetacelloMCProject new projectSpec name: projectName)} ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectSpecGenerator>>projectSpecListBlock [
    ^ [ MetacelloProjectRegistration projectSpecs ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectSpecGenerator>>projectSpecLookupBlock [
    ^ [ :projectName | 
    {(MetacelloProjectRegistration
        projectSpecForClassNamed: (MetacelloScriptEngine baselineNameFrom: projectName)
        ifAbsent: [  ]).
    (MetacelloProjectRegistration
        projectSpecForClassNamed: (MetacelloScriptEngine configurationNameFrom: projectName)
        ifAbsent: [  ])} ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectSpecGenerator>>target [
	^ target
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectSpecGenerator>>target: anObject [
	target := anObject
]
