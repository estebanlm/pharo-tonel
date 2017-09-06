Extension {
	#name : #GLMPresentation
}

{
	#category : #'*glamour-morphic-renderer',
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPresentation>>morphicAct: aBlock entitled: aString  [
	 
	self addAction: 
			((GLMMorphicAction new) 
				action: aBlock; 
				title: aString; 
				yourself)
]

{
	#category : #'*glamour-morphic-renderer',
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPresentation>>morphicAct: aBlock icon: anIcon entitled: aString  [
	 
	self addAction: 
			((GLMMorphicAction new) 
				action: aBlock; 
				title: aString; 
				icon: anIcon;
				yourself)
]

{
	#category : #'*glamour-morphic-renderer',
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPresentation>>morphicAct: aBlock on: aCharacter entitled: aString  [
	 
	self 
		addAction: 
			((GLMMorphicAction new) 
				action: aBlock; 
				shortcut: aCharacter; 
				title: aString; 
				yourself)
]

{
	#category : #'*glamour-morphic-renderer',
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPresentation>>morphicAct: aBlock on: aCharacter icon: anIcon entitled: aString  [
	 
	self 
		addAction: 
			((GLMMorphicAction new) 
				action: aBlock; 
				shortcut: aCharacter; 
				icon: anIcon;
				title: aString; 
				yourself)
]

{
	#category : #'*glamour-morphic-renderer',
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPresentation>>morphicPopulate: aPortSymbol icon: anIcon on: aCharacter entitled: aString with: aBlock  [
	 
	self 
		addAction: 
			((GLMMorphicAction new) 
				action: 
						((GLMPortUpdater new) 
								portSymbol: aPortSymbol; 
								valueBlock: aBlock; 
								yourself); 
				shortcut: aCharacter; 
				icon: anIcon;
				title: aString;
				yourself)
]

{
	#category : #'*glamour-morphic-renderer',
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPresentation>>morphicSelectionAct: aBlock entitled: aString  [
	 
	self addSelectionAction: 
			((GLMMorphicAction new) 
				action: aBlock; 
				title: aString; 
				yourself)
]

{
	#category : #'*glamour-morphic-renderer',
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPresentation>>morphicSelectionAct: aBlock icon: anIcon entitled: aString [
	self 
		addSelectionAction: 
			((GLMMorphicAction new) 
				action: aBlock; 
				icon: anIcon;
				title: aString;
				yourself)
]

{
	#category : #'*glamour-morphic-renderer',
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPresentation>>morphicSelectionAct: aBlock icon: anIcon on: aCharacter entitled: aString [
	self 
		addSelectionAction: 
			((GLMMorphicAction new) 
				action: aBlock; 
				shortcut: aCharacter; 				
				icon: anIcon;
				title: aString;
				yourself)
]
