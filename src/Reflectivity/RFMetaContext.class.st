"
I model the meta level when activating a MetaLink.
"
Class {
	#name : #RFMetaContext,
	#superclass : #Object,
	#instVars : [
		'level'
	],
	#category : #Reflectivity-Contexts,
	#timestamp : 'MarcusDenker 3/11/2015 08:44'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFMetaContext class>>current  [
	ActiveMetaContext value ifNil:[ActiveMetaContext value: self new].
	^ActiveMetaContext value

]

{
	#category : #reset,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFMetaContext class>>reset [
	ActiveMetaContext value: self new.
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFMetaContext>>initialize [
 level := 0
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFMetaContext>>isActive: n [
	^level = n
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFMetaContext>>isMeta [
	^level > 0
]

{
	#category : #level,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFMetaContext>>shiftLevelDown [
	level := (level - 1) max: 0.
	self assert: level >=0
]

{
	#category : #level,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFMetaContext>>shiftLevelUp [
	level := level + 1
]
