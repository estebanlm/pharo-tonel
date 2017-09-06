"
I provide an api for computing tags.
"
Trait {
	#name : #GLMTBlockTags,
	#traits : '{}',
	#classTraits : '{}',
	#category : #Glamour-Presentations,
	#timestamp : 'AndreiChis 4/20/2014 23:10'
}

{
	#category : #tags,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTBlockTags>>computeTagsFilterFor: aGlamourValue  [

	^ self computeTagsFor: aGlamourValue from: self tagsFilterBlock
]

{
	#category : #tags,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTBlockTags>>computeTagsFor: aGlamourValue  [

	^ self computeTagsFor: aGlamourValue from: self tagsBlock
]

{
	#category : #tags,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTBlockTags>>computeTagsFor: aGlamourValue from: aBlock [
	| value |
	
	aBlock ifNil: [ ^ OrderedCollection new ].
	value := aBlock glamourValue: aGlamourValue.
	^ value isString
		ifTrue: [ OrderedCollection with: value ]
		ifFalse: [ value asOrderedCollection ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTBlockTags>>hasTags [
	^ self tagsBlock notNil
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTBlockTags>>hasTagsFilter [
	^ self tagsFilterBlock notNil
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTBlockTags>>tags: aBlock [

	self tagsBlock: aBlock.
	self hasTagsFilter ifFalse:[ self tagsFilter: aBlock ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTBlockTags>>tagsBlock [
	self explicitRequirement
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTBlockTags>>tagsBlock: anObject [
	self explicitRequirement
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTBlockTags>>tagsFilter: anObject [
	self explicitRequirement
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTBlockTags>>tagsFilterBlock [
	self explicitRequirement
]
