"
Display errors found in a configuration validation.

"
Class {
	#name : #VSConfigurationValidationIssuesDisplayCommand,
	#superclass : #VSCommand,
	#category : #Versionner-Core-Commands,
	#timestamp : 'ChristopheDemarey 3/17/2014 11:07'
}

{
	#category : #execute,
	#timestamp : ' 8/31/2017 05:26:38'
}
VSConfigurationValidationIssuesDisplayCommand>>execute [
	| list |

	list := ListModel new.
	list openWithSpec.
	list title: target messageText.
	list items: target issues.
]
