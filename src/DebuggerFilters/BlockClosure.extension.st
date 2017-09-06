Extension {
	#name : #BlockClosure
}

{
	#category : #'*DebuggerFilters-Extension',
	#timestamp : ' 8/31/2017 05:26:17'
}
BlockClosure>>asFilter [
 	^ BlockFilter forBlock: self. 
]
