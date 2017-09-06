"

"
Class {
	#name : #HowToContributeHelp,
	#superclass : #CustomHelp,
	#category : #HowToContributeHelp,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
HowToContributeHelp class>>bookName [
	^'Contribute to base code'
]

{
	#category : #pages,
	#timestamp : ' 8/31/2017 05:26:21'
}
HowToContributeHelp class>>introduction [
	"This method was automatically generated."
	<script: 'self edit: #introduction'>
	^HelpTopic
		title: 'Introduction'
		contents: 
'This help summarizes the process to contribute to the Pharo base code. Proposing a bug fix or enhancement is easy and relatively well documented. 
The following website contains a clear description of the change:
	http://pharo.org/contribute-propose-fix 
 !' readStream nextChunkText
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
HowToContributeHelp class>>pages [
	^#(introduction)
]
