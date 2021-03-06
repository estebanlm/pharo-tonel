Extension { #name : #TClass }

{ #category : #'*GT-SpotterExtensions-Core' }
TClass >> spotterActDefault [
	^ self browse
]

{ #category : #'*GT-SpotterExtensions-Core' }
TClass >> spotterClassMethodsFor: aStep [
	<spotterOrder: 15>
	aStep listProcessor
			title: 'Class methods';
			allCandidates: [ self classSide methods ];
			itemName: [ :method | method selector ];
			filter: GTFilterSubstring
]

{ #category : #'*GT-SpotterExtensions-Core' }
TClass >> spotterMethodsFor: aStep [
	<spotterOrder: 10>
	aStep listProcessor
			title: 'Instance methods';
			allCandidates: [ self methods ];
			itemName: [ :method | method selector ];
			filter: GTFilterSubstring
]

{ #category : #'*GT-SpotterExtensions-Core' }
TClass >> spotterPreviewCodeIn: aComposite [
	<spotterPreview: 10>
	aComposite pharoMethod
		title: [self name];
		display: #definitionForNautilus;
		smalltalkClass: [ nil ];
		entity: self.
		
	self flag: 'move "entity: self" somewhere else, maybe'
]

{ #category : #'*GT-SpotterExtensions-Core' }
TClass >> spotterReferenceFor: aStep [
	<spotterOrder: 30>
	aStep listProcessor
			title: 'References';
			allCandidates: [ (SystemNavigation default allReferencesTo: self binding) collect: #compiledMethod ];
			itemName: [ :method | method gtDisplayString ];
			filter: GTFilterSubstring
]

{ #category : #'*GT-SpotterExtensions-Core' }
TClass >> spotterSuperClassMethodsFor: aStep [
	<spotterOrder: 16>
	|superclasses|
	superclasses := self class withAllSuperclasses select: #isMeta.
	aStep listProcessor
			title: 'Super class methods';
			allCandidates: [ self classSide allMethods select: [ :each |(each methodClass = self classSide) not & (superclasses includes: each methodClass) ] ];
			filter: GTFilterSubstring
]

{ #category : #'*GT-SpotterExtensions-Core' }
TClass >> spotterSuperMethodsFor: aStep [
	<spotterOrder: 11>
	aStep listProcessor
			title: 'Super instance methods';
			allCandidates: [ self allMethods reject: [ :each | each methodClass = self ] ];
			filter: GTFilterSubstring
]
