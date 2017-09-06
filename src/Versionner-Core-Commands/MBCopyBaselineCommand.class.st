"
Command to copy a baseline in Versionner
"
Class {
	#name : #MBCopyBaselineCommand,
	#superclass : #MBVersionCommand,
	#category : #Versionner-Core-Commands,
	#timestamp : 'TorstenBergmann 2/20/2014 14:11'
}

{
	#category : #execute,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBCopyBaselineCommand>>copyBaselineWithNumber: baselineNumberAsString [
	"Copy myself into a new baseline, with a different number"

	| sourceCode newSource newNumber newSelector comment |
	self 
		assert: [ baselineNumberAsString ~= target versionString ] 
		description: 'Cannot assign the same baseline number than me to my copy'.
		
	self 
		assert: [ (baselineNumberAsString endsWith: 'baseline') not ] 
		description: 'The baseline number cannot end with "-baseline". It will be automatically added.'.

	comment := self uiManager request: 'Enter a comment for the new baseline'.
	MetacelloToolBox 
		createBaseline: baselineNumberAsString, '-baseline' 
		for: target configurationBasename 
		from: target versionString 
		description: comment.
]

{
	#category : #documentation,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBCopyBaselineCommand>>documentation [
	^ 'Copy the selected baseline under a new name'
]

{
	#category : #execute,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBCopyBaselineCommand>>execute [

	| answer |
	answer := self uiManager request: 'give a new baseline number (the prefix "-baseline" will be added)'.
	answer ifNil: [ ^ self ].

	self copyBaselineWithNumber: answer


]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBCopyBaselineCommand>>title [
	^ 'copy baseline'
]
