"

"
Class {
	#name : #MetacelloConfigurationSpecGenerator,
	#superclass : #MetacelloProjectSpecGenerator,
	#category : #Metacello-Core-Scripts,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloConfigurationSpecGenerator>>projectSpecCreationBlock [
    ^ [ :projectName | {(MetacelloMCProject new configurationOfProjectSpec name: projectName)} ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloConfigurationSpecGenerator>>projectSpecListBlock [
    ^ [ MetacelloProjectRegistration configurationProjectSpecs ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloConfigurationSpecGenerator>>projectSpecLookupBlock [
    ^ [ :projectName | 
    {(MetacelloProjectRegistration
        projectSpecForClassNamed: (MetacelloScriptEngine configurationNameFrom: projectName)
        ifAbsent: [  ])} ]
]
