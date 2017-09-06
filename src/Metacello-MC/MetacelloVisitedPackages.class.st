"

"
Class {
	#name : #MetacelloVisitedPackages,
	#superclass : #Object,
	#instVars : [
		'groups',
		'packages',
		'projects'
	],
	#category : #Metacello-MC-Specs,
	#timestamp : ''
}

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloVisitedPackages>>initialize [

	groups := Set new.
	packages := Set new.
	projects := Set new.
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloVisitedPackages>>pushProject: aBlock [

	| oldGroups oldPackages oldProjects |
	oldGroups := groups.
	oldPackages := packages.
	oldProjects := projects.
	groups := Set new.
	packages := Set new.
	^aBlock ensure: [
		groups := oldGroups.
		packages := oldPackages.
		projects := oldProjects ]
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloVisitedPackages>>visit: aSpec doing: aBlock [

	aSpec
		projectDo: [:spec | 
			(projects includes: spec name) ifTrue: [ ^self ].
			projects add: spec name ] 
		packageDo: [:spec | 
			(packages includes: spec name) ifTrue: [ ^self ].
			packages add: spec name ] 
		groupDo: [:spec | 
			(groups includes: spec name) ifTrue: [ ^self ].
			groups add: spec name ].
	aBlock value: aSpec
]
