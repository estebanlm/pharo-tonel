Extension {
	#name : #Set
}

{
	#category : #'*GT-InspectorExtensions-Core',
	#timestamp : ' 8/31/2017 05:26:35'
}
Set>>gtInspectorItemsIn: composite [
	"we override this because sets do not work well in morph tree morphs"

	^ (super gtInspectorItemsIn: composite)
		display: [ :set | set asOrderedCollection ]
]
