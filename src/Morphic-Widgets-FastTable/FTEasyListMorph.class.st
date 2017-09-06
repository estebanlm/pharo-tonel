"
I'm an easy list used to simplify the creation of lists.
My parent is too powerful, I'm just a simplification of it (and no, I will not go to the psy to deal with that).

 Example: 
=========
FTEasyListMorph new
	extent: 300@550;
	elements: Morph methods;
	display: [ :method | method selector ];		
	openInWindow.
	
"
Class {
	#name : #FTEasyListMorph,
	#superclass : #FTTableMorph,
	#category : #Morphic-Widgets-FastTable-Easy,
	#timestamp : 'EstebanLorenzano 6/3/2015 15:01'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTEasyListMorph>>display: aBlock [
	self dataSource display: aBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTEasyListMorph>>elements: aSequenceableCollection [
	self dataSource elements: aSequenceableCollection
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTEasyListMorph>>header: aString [
	self ensureAtLeastOneColumn.
	self columns first id: aString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTEasyListMorph>>icon: aBlock [
	self dataSource icon: aBlock
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTEasyListMorph>>initialize [
	super initialize.
	self dataSource: FTEasyListDataSource new
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTEasyListMorph>>menu: aBlock [
	self dataSource menu: aBlock
]
