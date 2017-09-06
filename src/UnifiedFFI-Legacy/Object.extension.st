Extension {
	#name : #Object
}

{
	#category : #'*UnifiedFFI-Legacy',
	#timestamp : ' 8/31/2017 05:26:10'
}
Object>>nbCall: fnSpec [
	" you can override this method if you need to"
	
	^ (self ffiCalloutIn: thisContext sender)
		convention: self ffiCallingConvention;
		function: fnSpec module: self ffiLibraryName
]

{
	#category : #'*UnifiedFFI-Legacy',
	#timestamp : ' 8/31/2017 05:26:10'
}
Object>>nbCall: fnSpec module: aModuleNameOrHandle [
	" you can override this method if you need to"
	^ (self ffiCalloutIn: thisContext sender)
		convention: self ffiCallingConvention;
		function: fnSpec module: aModuleNameOrHandle
]

{
	#category : #'*UnifiedFFI-Legacy',
	#timestamp : ' 8/31/2017 05:26:10'
}
Object>>nbCall: fnSpec module: aModuleNameOrHandle options: callOptions [
	" you can override this method if you need to"
	^ (self ffiCalloutIn: thisContext sender)
		convention: self ffiCallingConvention;
		options: callOptions;
		function: fnSpec module: aModuleNameOrHandle
]

{
	#category : #'*UnifiedFFI-Legacy',
	#timestamp : ' 8/31/2017 05:26:10'
}
Object>>nbCall: fnSpec options: callOptions [
	" you can override this method if you need to"

	^ (self ffiCalloutIn: thisContext sender)
		convention: self ffiCallingConvention;
		options: callOptions;
		function: fnSpec module: self ffiLibraryName
]
