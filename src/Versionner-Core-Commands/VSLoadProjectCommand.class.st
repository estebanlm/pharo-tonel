"
Load a project configuration into the image. The project should have a configuration class. It will always load the latest version of the configuration package.
"
Class {
	#name : #VSLoadProjectCommand,
	#superclass : #VSConfigurationCommand,
	#category : #Versionner-Core-Commands,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
VSLoadProjectCommand>>askProjectName [
	^ UIManager default request: 'Enter a project name'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
VSLoadProjectCommand>>configurationNameForProject: aProjectName [
	^ 'ConfigurationOf', aProjectName
]

{
	#category : #execute,
	#timestamp : ' 8/31/2017 05:26:38'
}
VSLoadProjectCommand>>execute [
	| mcRepository projectName configurationName  |
	mcRepository := MCTool newRepository.
	(mcRepository isNil or: [ mcRepository location isEmpty ])
		ifTrue: [ ^ self ].

	projectName := ([ mcRepository project ]
		on: Error
		do: [ UIManager default request: 'Enter the name of the project to load' ]) value.
	(projectName isNil or: [ projectName isEmpty ]) ifTrue: [ ^ self ].
	
	configurationName := self configurationNameForProject: projectName.
	[ Gofer new
		url: mcRepository location;
		package: configurationName;
		load ]
		on: Error
		do: [ :ex | 
			self inform: 'Cannot find the repository or the configuration. Please check'.
			^ self ].
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
VSLoadProjectCommand>>title [
	^ 'load project'
]
