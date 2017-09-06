"
Open an inspector on the remote repository.
"
Class {
	#name : #VSOpenRepositoryCommand,
	#superclass : #VSCommand,
	#category : #Versionner-Core-Commands,
	#timestamp : '<historical>'
}

{
	#category : #execute,
	#timestamp : ' 8/31/2017 05:26:38'
}
VSOpenRepositoryCommand>>execute [
	self repository 
		ifNil: [ UIManager default inform: 'No repository associated to this configuration' ]
		ifNotNil: [ :repository | repository morphicOpen ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
VSOpenRepositoryCommand>>repository [
	^ (target repositories) 
		ifNil: [ nil ]
		ifNotNil: [ :repos |self chooseRepositoryFromList: repos ]

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
VSOpenRepositoryCommand>>title [
	^ 'open repository'
]
