"

"
Class {
	#name : #RubSegmentIconMenuMorph,
	#superclass : #EmbeddedMenuMorph,
	#category : #Rubric-Editing-Widgets,
	#timestamp : ''
}

{
	#category : #'adding item',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubSegmentIconMenuMorph>>addToggle: aString target: anObject selector: aSymbol getStateSelector: stateSymbol enablementSelector: enableSymbol argumentList: argList [
	"Append a menu item with the given label. If the item is selected, it will send the given selector to the target object."

	|item|
	item := RubSegmentIconMenuItemMorph new
		contents: aString translated;
		target: anObject;
		selector: aSymbol;
		arguments: argList;
		getStateSelector: stateSymbol;
		enablementSelector: enableSymbol.
	^ self addMenuItem: item.

]
