"
A GTInspectorPresentationFilter is the root class for filters that can limit the number if visible presentations for an object.

Subclasses need to implement  #shouldDisplayPresentationCreateBy: to indicate whether or not a give presentation should be displayed.

"
Class {
	#name : #GTInspectorPresentationFilter,
	#superclass : #Object,
	#category : #GT-Inspector,
	#timestamp : 'AndreiChis 1/27/2015 23:31'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspectorPresentationFilter>>changeFilterRequestFor: aGTInspector [

	self subclassResponsibility
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspectorPresentationFilter>>openListChooseLabeled: sString forInspector: aGTInspector with: allElements select: selectedElements format: aBlockOrSelector actionSelector: aSymbol [
	|treeModel|
	
	treeModel := MorphTreeModel new.
	treeModel
		 beCheckList;
		 rootItems: allElements;
		 wrapBlockOrSelector: aBlockOrSelector;
		 autoMultiSelection: true.
	 (treeModel openDialogWindowIn: World title: sString selectedtems: selectedElements) ifNotNil: [ :selection | 
		self perform: aSymbol with: selection with: aGTInspector ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspectorPresentationFilter>>shouldDisplayPresentationCreatedBy: aMethod [

	self subclassResponsibility
]
