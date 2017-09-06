"
An IgorsPlugin is a plugin which displays info about the current selection
"
Class {
	#name : #AnnotationPanePlugin,
	#superclass : #InformationLinePlugin,
	#category : #NautilusCommon-Plugin,
	#timestamp : '<historical>'
}

{
	#category : #information,
	#timestamp : ' 8/31/2017 05:26:22'
}
AnnotationPanePlugin class>>description [

	^ 'Display the information of the selected class/method'
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:22'
}
AnnotationPanePlugin>>buildString [
	| mdl |
	mdl := self model.
	^ String
		streamContents: [ :s | 
			mdl selectedClass
				ifNil: [ '' ]
				ifNotNil: [ :class | 
					mdl selectedMethod
						ifNotNil: [ :method | 
							s
								nextPutAll:
									(AnnotationRequest new
										onCompiledMethod: method;
										annotationRequests: #(#timeStamp #messageCategory #sendersCount #implementorsCount);
										yourself) getAnnotations ] ] ]
]
