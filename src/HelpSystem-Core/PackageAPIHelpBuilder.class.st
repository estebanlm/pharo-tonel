"
A builder for the API of the various packages
"
Class {
	#name : #PackageAPIHelpBuilder,
	#superclass : #HelpBuilder,
	#category : #HelpSystem-Core-Builders,
	#timestamp : 'TorstenBergmann 2/4/2014 21:17'
}

{
	#category : #building,
	#timestamp : ' 8/31/2017 05:26:19'
}
PackageAPIHelpBuilder>>build  [
	|pTopic|
	topicToBuild := (HelpTopic named: rootToBuildFrom bookName).
	rootToBuildFrom helpPackages do: [:package|
		pTopic := HelpTopic named: package.
		topicToBuild addSubtopic: pTopic.
		self buildPackageTopic: pTopic.
		
	]

]

{
	#category : #building,
	#timestamp : ' 8/31/2017 05:26:19'
}
PackageAPIHelpBuilder>>buildPackageTopic: pTopic [
 
	| classTopic classes |
	classes := (RPackageSet named: pTopic title) classes 
		asSortedCollection: [:cl1 :cl2 | cl1 name < cl2 name].
	classes do: [ :aClass | 
		classTopic := ClassAPIHelpBuilder 
			buildHierarchicalHelpTopicFrom: aClass 
			withSubclasses: false 
			withMethods: true.
		pTopic addSubtopic: classTopic ]
]
