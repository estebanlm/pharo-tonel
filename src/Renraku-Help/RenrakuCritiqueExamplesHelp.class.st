"
In the topics of this book You will find references to the concrete critiques implementations. For more please browse the subclasses of ReAbstractCritique
"
Class {
	#name : #RenrakuCritiqueExamplesHelp,
	#superclass : #RenrakuCritiqueHelp,
	#category : #Renraku-Help,
	#timestamp : 'YuriyTymchuk 7/10/2016 15:59'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:45'
}
RenrakuCritiqueExamplesHelp class>>bookDescription [

	^ 'In the topics of this book You will find references to the concrete critiques implementations. For more please browse the subclasses of ReAbstractCritique'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:45'
}
RenrakuCritiqueExamplesHelp class>>bookName [

	^ 'Critique Examples'
]

{
	#category : #pages,
	#timestamp : ' 8/31/2017 05:26:45'
}
RenrakuCritiqueExamplesHelp class>>missingMethod [

	^ self topicForClass: ReMissingMethodCritique
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:45'
}
RenrakuCritiqueExamplesHelp class>>pages [


	^ #(trivial missingMethod transformation replaceNode refactoring)
]

{
	#category : #pages,
	#timestamp : ' 8/31/2017 05:26:45'
}
RenrakuCritiqueExamplesHelp class>>refactoring [

	^ self topicForClass: ReRefactoringCritique  
]

{
	#category : #pages,
	#timestamp : ' 8/31/2017 05:26:45'
}
RenrakuCritiqueExamplesHelp class>>replaceNode [

	^ self topicForClass: ReReplaceNodeCritique 
]

{
	#category : #pages,
	#timestamp : ' 8/31/2017 05:26:45'
}
RenrakuCritiqueExamplesHelp class>>transformation [

	^ self topicForClass: ReTransformationCritique
]

{
	#category : #pages,
	#timestamp : ' 8/31/2017 05:26:45'
}
RenrakuCritiqueExamplesHelp class>>trivial [

	^ self topicForClass: ReTrivialCritique
]
