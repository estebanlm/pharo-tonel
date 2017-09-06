"

"
Class {
	#name : #MetacelloBaselineSpecGenerator,
	#superclass : #MetacelloProjectSpecGenerator,
	#category : #Metacello-Core-Scripts,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloBaselineSpecGenerator>>projectSpecCreationBlock [
    ^ [ :projectName | {(MetacelloMCBaselineProject new baselineOfProjectSpec name: projectName)} ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloBaselineSpecGenerator>>projectSpecListBlock [
    ^ [ MetacelloProjectRegistration baselineProjectSpecs ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloBaselineSpecGenerator>>projectSpecLookupBlock [
    ^ [ :projectName | 
    {(MetacelloProjectRegistration
        projectSpecForClassNamed: (MetacelloScriptEngine baselineNameFrom: projectName)
        ifAbsent: [  ])} ]
]
