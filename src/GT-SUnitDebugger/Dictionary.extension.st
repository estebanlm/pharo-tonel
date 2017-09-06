Extension {
	#name : #Dictionary
}

{
	#category : #'*GT-SUnitDebugger',
	#timestamp : ' 8/31/2017 05:26:37'
}
Dictionary>>gtDebuggerSUnitPrint [

	^ String streamContents: [ :aStream | 
		self keysSortedSafely
				do: [:key | aStream print: key;
						 space;
						 nextPutAll: '->';	
						 space;			
						 print: (self at: key);
						 cr]].
]
