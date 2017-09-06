"

"
Class {
	#name : #MetacelloLoadData,
	#superclass : #Object,
	#instVars : [
		'dataMap',
		'versionInfoMap',
		'packageNameMap'
	],
	#category : #Metacello-MC-Loaders,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloLoadData>>addVersion: version versionInfo: versionInfo resolvedReference: resolvedReference packageSpec: packageSpec [
	| vis |
	"check for duplicates and use the one that is being added"
	(vis := self packageNameMap at: packageSpec name ifAbsent: [  ]) ~~ nil
		ifTrue: [ 
			"remove old references"
			vis
				do: [ :vi | 
					self dataMap removeKey: vi name.
					self versionInfoMap removeKey: vi name ] ].
	self dataMap
		at: version info name
		put:
			{version.
			resolvedReference.
			packageSpec}.
	self versionInfoMap at: versionInfo name put: {versionInfo}.
	self packageNameMap at: packageSpec name put: {versionInfo}
]

{
	#category : #versionInfo,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloLoadData>>ancestorsFor: packageSpec ifAbsent: aBlock [

	^self versionInfoMap 
		at: packageSpec file 
		ifAbsent: [ 
			self  packageNameMap 
				at: packageSpec name
				ifAbsent: aBlock ]
]

{
	#category : #versionInfo,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloLoadData>>currentVersionInfoFor: packageSpec ifAbsent: aBlock [

	^self versionInfoMap 
		at: packageSpec file 
		ifAbsent: [ 
			self  packageNameMap 
				at: packageSpec name
				ifAbsent: aBlock ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloLoadData>>dataMap [

	dataMap == nil ifTrue: [ dataMap := Dictionary new ].
	^dataMap
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloLoadData>>do: aBlock [

	self dataMap valuesDo: [:ar |
		aBlock value: (ar at: 1) value: (ar at: 2) value: (ar at: 3) ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloLoadData>>isEmpty [

	^self dataMap isEmpty
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloLoadData>>packageNameMap [

	packageNameMap == nil ifTrue: [ packageNameMap := Dictionary new ].
	^packageNameMap
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloLoadData>>versionInfoMap [

	versionInfoMap == nil ifTrue: [ versionInfoMap := Dictionary new ].
	^versionInfoMap
]
