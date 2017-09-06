Extension {
	#name : #CompiledMethod
}

{
	#category : #'*Reflectivity-Tools',
	#timestamp : ' 8/31/2017 05:26:28'
}
CompiledMethod>>hasBreakpoint [
	^ Breakpoint isInstalledIn: self
	
	
]
