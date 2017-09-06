Extension {
	#name : #ProtoObject
}

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
ProtoObject>>metaLinkOptions [
	^{
	#isNil -> #( + optionCompileOnLinkInstallation).
	#metaLinkOptions -> #( + optionCompileOnLinkInstallation)
	}
]

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
ProtoObject>>rFwithArgs: argArray executeMethod: compiledMethod [
	"Execute compiledMethod against the receiver and args in argArray"
	"This method is used by reflectivity internally. All meta-links are ignored"
	<disableReflectivity>
	<primitive: 188>
	self primitiveFailed
]
