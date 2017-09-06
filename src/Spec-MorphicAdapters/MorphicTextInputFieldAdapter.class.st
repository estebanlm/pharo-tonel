"
I am the adapter used to bridge a TextInputFieldModel and a PluggableTextFieldMorph
"
Class {
	#name : #MorphicTextInputFieldAdapter,
	#superclass : #MorphicTextAdapter,
	#category : #Spec-MorphicAdapters,
	#timestamp : '<historical>'
}

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTextInputFieldAdapter>>accept: aText [

	self model accept: aText
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTextInputFieldAdapter>>acceptOnCR [

	^ self model acceptOnCR
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTextInputFieldAdapter>>adapt: aModel [
	
	super adapt: aModel.
	aModel whenBuiltDo: [ :w | w widget color: Smalltalk ui theme backgroundColor ]
]

{
	#category : #factory,
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTextInputFieldAdapter>>buildWidget [
	| plu |
	plu := PluggableTextFieldMorph new
		convertTo: String;
		on: self
			text: #getText
			accept: #accept:
			readSelection: nil
			menu: nil
			setSelection: #setSelection:.
	plu
		entryCompletion: self entryCompletion;
		autoAccept: self autoAccept;
		ghostText: self ghostText;
		enabled: self enabled;
		encrypted: self encrypted;
		setBalloonText: self help;
		dragEnabled: self dragEnabled;
		dropEnabled: self dropEnabled;
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		acceptOnCR: self acceptOnCR;
		hideScrollBarsIndefinitely.
	^ plu
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTextInputFieldAdapter>>encrypted [

	^ self model encrypted
]

{
	#category : #'spec protocol',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTextInputFieldAdapter>>encrypted: aBoolean [

	self widgetDo: [ :w | 
		w encrypted: aBoolean.
		w changed ]
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTextInputFieldAdapter>>entryCompletion [

	^ self model entryCompletion
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTextInputFieldAdapter>>ghostText [

	^ self model ghostText
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTextInputFieldAdapter>>ghostText: aText [

	^ self model ghostText: aText
]

{
	#category : #NOCompletion,
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTextInputFieldAdapter>>isCodeCompletionAllowed [
	
	^ false
]
