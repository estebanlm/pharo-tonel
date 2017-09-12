Extension { #name : #DiffModel }

{ #category : #'*Spec-Tools-VersionBrowser' }
DiffModel >> aboutToStyle: aBoolean [
]

{ #category : #'*Spec-Tools-VersionBrowser' }
DiffModel >> behavior [
	^ self contextClass
]

{ #category : #'*Spec-Tools-VersionBrowser' }
DiffModel >> behavior: aClass [

	self contextClass: aClass
]

{ #category : #'*Spec-Tools-VersionBrowser' }
DiffModel >> doItReceiver: aReceiver [
]

{ #category : #'*Spec-Tools-VersionBrowser' }
DiffModel >> getText [

	^ self rightText
]

{ #category : #'*Spec-Tools-VersionBrowser' }
DiffModel >> text: aPairOfString [

	(aPairOfString isText or: [aPairOfString isString])
		ifTrue: [
			self leftText: ''.
			self rightText: aPairOfString
			 ]
		ifFalse: [
			self leftText: aPairOfString first.
			self rightText: aPairOfString second ]
]
