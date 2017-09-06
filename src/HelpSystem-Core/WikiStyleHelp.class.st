"
This help type extends the system with a wiki like help descriptions
"
Class {
	#name : #WikiStyleHelp,
	#superclass : #Object,
	#category : #HelpSystem-Core-Utilities,
	#timestamp : 'tbn 1/14/2011 00:35'
}

{
	#category : #conversion,
	#timestamp : ' 8/31/2017 05:26:19'
}
WikiStyleHelp class>>asHelpTopic  [
	<systemHelp>
	
	^WikiStyleHelpBuilder new build topicToBuild
]
