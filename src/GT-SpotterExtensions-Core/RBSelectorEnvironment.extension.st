Extension {
	#name : #RBSelectorEnvironment
}

{
	#category : #'*GT-SpotterExtensions-Core-private',
	#timestamp : ' 8/31/2017 05:26:36'
}
RBSelectorEnvironment>>withClassesFixedForNautilus [
	classSelectors ifEmpty: [ 
		metaClassSelectors keysAndValuesDo: [ :class :selectors | 
			classSelectors at: class ifAbsentPut: [ IdentitySet new ] ] ]
]
