"

"
Class {
	#name : #LazyTabPage,
	#superclass : #BorderedMorph,
	#instVars : [
		'actualPageMorph',
		'labelMorph',
		'lazyPageMorphCreation',
		'toolbar'
	],
	#category : #Glamour-Morphic-Widgets,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
LazyTabPage>>actualPageMorph [
	^ actualPageMorph ifNil: 
		[actualPageMorph := 
			self lazyPageMorphCreation value
				hResizing: #spaceFill;
				vResizing: #spaceFill;
				yourself]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
LazyTabPage>>actualPageMorph: anObject [
	actualPageMorph := anObject
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:34'
}
LazyTabPage>>isRendered [
	^ actualPageMorph notNil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
LazyTabPage>>labelMorph [
	^ labelMorph
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
LazyTabPage>>labelMorph: anObject [
	labelMorph := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
LazyTabPage>>lazyPageMorphCreation [
	^ lazyPageMorphCreation
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
LazyTabPage>>lazyPageMorphCreation: anObject [
	lazyPageMorphCreation := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
LazyTabPage>>toolbar [
	^ toolbar
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
LazyTabPage>>toolbar: anObject [
	toolbar := anObject
]
