Extension {
	#name : #RBSelectorEnvironment
}

{
	#category : #'*manifest-core',
	#timestamp : ' 8/31/2017 05:26:30'
}
RBSelectorEnvironment>>smallLintCritics [
	
	| array |
			
	array := OrderedCollection new.
	self classes do: [:cl | 
		self selectorsForClass: cl do: [:sel | array add:  (cl>>sel)]]. 
			
	^ array
]
