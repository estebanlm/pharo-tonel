Extension { #name : #Object }

{ #category : #'*Tool-Base' }
Object >> basicInspect [
	^ Smalltalk tools basicInspector inspect: self
]

{ #category : #'*Tool-Base' }
Object >> browse [
	^ Smalltalk tools browser openOnClass: self class
]

{ #category : #'*Tool-Base' }
Object >> browseHierarchy [

	self systemNavigation browseHierarchy: self class
]

{ #category : #'*Tool-Base' }
Object >> defaultBackgroundColor [
	"Answer the color to be used as the base window color for a window whose model is an object of the receiver's class"
	
	"I don't want to do a self theme  because otherwise I will need to implement it on Object"
	^  Smalltalk ui theme windowColorFor: self
]

{ #category : #'*Tool-Base' }
Object >> explore [
	^Smalltalk tools inspector explore: self
]

{ #category : #'*Tool-Base' }
Object >> inspect [
	"Create and schedule an Inspector in which the user can examine the receiver's variables."
	^ Smalltalk tools inspector inspect: self
]

{ #category : #'*Tool-Base' }
Object >> inspectOnce [
	"Inspect unless we have already done it once."
	
	| node |
	node := thisContext sender sourceNodeExecuted.
	(node hasProperty: #Once) ifTrue: [^self]. 
	node propertyAt: #Once put: true.
	^self inspect
]

{ #category : #'*Tool-Base' }
Object >> inspectWithLabel: aLabel [
	"Create and schedule an Inspector in which the user can examine the receiver's variables."
	^Smalltalk tools inspector inspect: self label: aLabel
]

{ #category : #'*Tool-Base' }
Object >> inspector [
	^ Smalltalk tools inspector inspector: self
]

{ #category : #'*Tool-Base' }
Object >> inspectorClass [
	"Answer the class of the inspector to be used on the receiver.  Called by inspect; 
	use basicInspect to get a normal (less useful) type of inspector."

	^ Smalltalk tools inspectorClass
]
