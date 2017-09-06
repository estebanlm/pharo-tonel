"
SimpleGridExample new open
"
Class {
	#name : #SimpleGridExample,
	#superclass : #MorphTreeModel,
	#category : #Morphic-Examples-MorphTreeWidget,
	#timestamp : 'AlainPlantec 2/1/2010 11:58'
}

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:14'
}
SimpleGridExample class>>example [

	SimpleGridExample new open
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:14'
}
SimpleGridExample>>open [
	(self treeMorph buildContents;
		embeddedInMorphicWindowLabeled: 'Simple grid example') openInWorld
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
SimpleGridExample>>rootItems [
	^ rootItems ifNil: [rootItems := (1 to: 1000)
		collect: [:i | PersonDataExample
				firstName: 'Person' , i asString
				secondName: 'Person' , i asString , ' second name'
				age: i
				married: false] ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
SimpleGridExample>>rootNodeClassFromItem: anItem [
	^ SimpleGridNodeExample
]

{
	#category : #'user interface',
	#timestamp : ' 8/31/2017 05:26:14'
}
SimpleGridExample>>treeMorph [
	| treeMorph oddColor evenColor |
	treeMorph := (self treeMorphClass on: self)
		beCheckList;
		beMultiple;
		columns: {MorphTreeColumn new startWidth: 100;
						rowMorphGetSelector: #firstNameMorph;
						headerButtonLabel: 'First name' font:  nil.
					MorphTreeColumn new startWidth: 150;
						rowMorphGetSelector: #secondNameMorph;
						headerButtonLabel: 'Second name' font:  nil.
					MorphTreeColumn new startWidth: 50;
						rowMorphGetSelector: #ageMorph;
						headerButtonLabel: 'Age' font:  nil.
					MorphTreeColumn new startWidth: 50;
						rowMorphGetSelector: #marriedMorph;
					 	headerButtonLabel: 'Married' font: nil};
		columnInset: 3;
		rowInset: 1;
		preferedPaneColor: Color white;
		rowColorForEven:  Color veryLightGray muchLighter odd: Color white .
	^ treeMorph 
]
