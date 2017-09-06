"

"
Class {
	#name : #HermesCommandLineHandler,
	#superclass : #CommandLineHandler,
	#category : #Hermes-CommandLineHandler,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HermesCommandLineHandler class>>commandName [
	^ 'loadHermes'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HermesCommandLineHandler class>>description [
	^ 'Loads the hermes file passed as parameter'
]

{
	#category : #activation,
	#timestamp : ' 8/31/2017 07:16:17'
}
HermesCommandLineHandler>>activate [
	| installer readPackage reader |
	self activateHelp
		ifTrue: [ ^ self ].
	(self commandLine hasFileWithExtension: '.hermes')
		ifFalse: [ ^ self exitFailure: 'Missing Hermes file as argument' ].
	(self commandLine allFilesWithExtension: '.hermes')
		do: [ :file | 
			installer := HEInstaller new.
			('[Hermes] Reading ' , file) logCr.
			reader := HEBinaryReaderWriter new
				stream: (File named: file) readStream;
				yourself.
			readPackage := HEPackage readFrom: reader.
			('[Hermes] Installing ' , file) logCr.
			installer installPackage: readPackage
			].
	(self hasOption: 'save')
		ifTrue: [ Smalltalk snapshot: true andQuit: false ].
	self exitSuccess
]
