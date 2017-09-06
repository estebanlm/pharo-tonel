"
Usage: [<subcommand>] [--help] [--copyright] [--version] [--list] [ --no-quit ]
	--help       print this help message
	--copyright  print the copyrights
	--version    print the version for the image and the vm
	--list       list a description of all active command line handlers
	--no-quit    keep the image running without activating any other command line handler
	<subcommand> a valid subcommand in --list
	
	Preference File Modification:
	--preferences-file   load the preferences from the given <FILE>
	--no-default-preferences    do not load any preferences from the default locations
	
Documentation:
A PharoCommandLineHandler handles default command line arguments and options.
The PharoCommandLineHandler is activated before all other handlers. 
It first checks if another handler is available. If so it will activate the found handler.
"
Class {
	#name : #PharoCommandLineHandler,
	#superclass : #BasicCommandLineHandler,
	#category : #System-CommandLineHandler,
	#timestamp : 'AlistairGrant 4/17/2017 22:06'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:46'
}
PharoCommandLineHandler class>>activateWith: aCommandLine	 [
	"Make sure that the PharoCommandLineHandler starts at the top of the stack in the main UI thread."
	UIManager default defer:  [ 
		super activateWith: aCommandLine ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:46'
}
PharoCommandLineHandler class>>description [
	^ 'responsible for the default options and activating other commands'
]

{
	#category : #'handler selection',
	#timestamp : ' 8/31/2017 07:16:46'
}
PharoCommandLineHandler class>>isResponsibleFor: aCommandLine [
	"I do not match ever, because my activation is manual"
	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:46'
}
PharoCommandLineHandler class>>priority  [
	"Highest priority"
	^ Float infinity
]

{
	#category : #activation,
	#timestamp : ' 8/31/2017 07:16:46'
}
PharoCommandLineHandler>>activate [

	self isChangingPreferences
		ifTrue: [ self changePreferences ]
		ifFalse: [ self runPreferences ].
		
	^ super activate.
]

{
	#category : #'private - preferences',
	#timestamp : ' 8/31/2017 07:16:46'
}
PharoCommandLineHandler>>changePreferences	 [
	| preferenceFile |
	
	self isOmittingPreferences
		ifTrue: [ 
			commandLine := commandLine copySubcommand.
			^ self ].
		
	preferenceFile := (self optionAt: 'preferences-file') asFileReference.
	commandLine := commandLine copySubcommand.
	
	StartupPreferencesLoader default load: { preferenceFile }.
]

{
	#category : #commands,
	#timestamp : ' 8/31/2017 07:16:46'
}
PharoCommandLineHandler>>default [
	Smalltalk isHeadless 
		ifFalse: [ ^ self noQuit ].
	
	^ super default
]

{
	#category : #'private - preferences',
	#timestamp : ' 8/31/2017 07:16:46'
}
PharoCommandLineHandler>>isChangingPreferences [

	^ self isOverridingPreferences or: [ self isOmittingPreferences ]
]

{
	#category : #'private - preferences',
	#timestamp : ' 8/31/2017 07:16:46'
}
PharoCommandLineHandler>>isOmittingPreferences [

	^ self hasOption: 'no-default-preferences'
]

{
	#category : #'private - preferences',
	#timestamp : ' 8/31/2017 07:16:46'
}
PharoCommandLineHandler>>isOverridingPreferences [

	^ self hasOption: 'preferences-file'
]

{
	#category : #'private - preferences',
	#timestamp : ' 8/31/2017 07:16:46'
}
PharoCommandLineHandler>>runPreferences [

	Smalltalk at: #SystemSettingsPersistence ifPresent: [:persistence | 
		persistence resumeSystemSettings].
	Smalltalk at: #StartupPreferencesLoader ifPresent: [:loader |
		loader default loadFromDefaultLocations ].

]
