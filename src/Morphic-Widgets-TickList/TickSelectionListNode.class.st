"
A TickSelectionListNode is node for the tree used to render the tick list

selected
	- xxxxx

"
Class {
	#name : #TickSelectionListNode,
	#superclass : #MorphTreeNodeModel,
	#category : #Morphic-Widgets-TickList,
	#timestamp : '<historical>'
}

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:17'
}
TickSelectionListNode>>name [

	^ self item itemName asString
]

{
	#category : #morph,
	#timestamp : ' 8/31/2017 05:26:17'
}
TickSelectionListNode>>nameMorph [

	^ LabelMorph new contents: self name; enabled: false; hResizing: #spaceFill;yourself
]

{
	#category : #event,
	#timestamp : ' 8/31/2017 05:26:17'
}
TickSelectionListNode>>pressed: anIndex [

	self model pressed: anIndex
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
TickSelectionListNode>>selected [

	^ self item selected
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
TickSelectionListNode>>selected: aBoolean [

	self item selected: aBoolean
]

{
	#category : #morph,
	#timestamp : ' 8/31/2017 05:26:17'
}
TickSelectionListNode>>selectedMorph [
	^ (TickSelectionCheckboxMorph basicNew index: (self model rootItems indexOf: self item);
		initialize;	
		model: self item;
		getStateSelector: #selected;
		setStateSelector: #selected:;
		updateSelection;
		getEnabledSelector: nil;
		font: StandardFonts defaultFont;
		label: '';
		hResizing: #shrinkWrap;
		vResizing: #shrinkWrap;
		setBalloonText: nil) color: Color transparent; yourself
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:17'
}
TickSelectionListNode>>toogleSelectionValue [
	
	self item toogleSelectionValue
]
