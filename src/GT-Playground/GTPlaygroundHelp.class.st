"
A utility class containing the help for the GT Playground.
"
Class {
	#name : #GTPlaygroundHelp,
	#superclass : #CustomHelp,
	#category : #GT-Playground,
	#timestamp : 'TudorGirba 1/21/2016 16:51'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTPlaygroundHelp class>>bookName  [
	^'GT Playground'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTPlaygroundHelp class>>key [
	^ self name
]

{
	#category : #documentation,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTPlaygroundHelp class>>overview [
	^ HelpTopic 
		title: 'Overview'
		contents: 
'GT Playground provides an interface for scripting and live programming. It is part of Pharo and was developed as part of the Glamorous Toolkit project (http://gt.moosetechnology.org).'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTPlaygroundHelp class>>pages [
	^#(overview )
]
