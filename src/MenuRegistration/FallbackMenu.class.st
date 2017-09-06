"
I appear when there is an error while trying to build a menu from pragmas.

I include items to:
* Debug: give the user an opportunity to see and correct the error
* Explain: why they're seeing a different menu
* Custom: clients can add items to me by implementing #fallbackMenuOn:. Browse implementors for examples.
"
Class {
	#name : #FallbackMenu,
	#superclass : #Object,
	#instVars : [
		'builder',
		'client'
	],
	#category : #MenuRegistration-Core,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:13'
}
FallbackMenu class>>when: aPragmaMenuBuilder fails: anObject [
	
	^ self new
			builder: aPragmaMenuBuilder;
			client: anObject;
			menu.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:13'
}
FallbackMenu>>builder: aPragmaMenuBuilder [

	builder := aPragmaMenuBuilder.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:13'
}
FallbackMenu>>client: anObject [

	client := anObject.
]

{
	#category : #'menu actions',
	#timestamp : ' 8/31/2017 05:26:13'
}
FallbackMenu>>debug [

	"If we don't reset the builder after debugging, the fallback menu does not appear anymore"
	[ builder menuSpec asMenuMorph ] ensure: [ builder reset ].
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:13'
}
FallbackMenu>>fallbackMenuExplanations [

	| workspace wsBindings |
	wsBindings := Dictionary newFrom: { #menu-> self }.
	workspace := Smalltalk tools workspace
		openContents: '"Something is wrong with this menu. 
To investigate just debug following expression:"
menu debug'.
	workspace
		label: 'Fallback menu explanations';
		setBindings: wsBindings.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:13'
}
FallbackMenu>>menu [
	"Build the menu that is put up if something is going wrong with the menubuilder"

	| menu |
	menu := UIManager default newMenuIn: ActiveWorld for: self.
	menu buildTitle: [ :menuTitle | menuTitle
		onlyCloseAndPinable
	].
	menu add: 'Why you see this menu'
		target: self
		selector: #fallbackMenuExplanations.
	menu add: 'Debug'
		target: self
		selector: #debug.
	menu addLine.
	client fallbackMenuOn: menu.
	^ menu
]
