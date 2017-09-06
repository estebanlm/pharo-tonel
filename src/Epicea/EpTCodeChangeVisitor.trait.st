"
I am a visitor for EpCodeChange subinstances.
"
Trait {
	#name : #EpTCodeChangeVisitor,
	#traits : '{}',
	#classTraits : '{}',
	#category : #Epicea-Visitors,
	#timestamp : '<historical>'
}

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpTCodeChangeVisitor>>visitBehaviorCategoryChange: aChange [
	^ self visitBehaviorChange: aChange
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpTCodeChangeVisitor>>visitBehaviorChange: aChange [
	^ self visitCodeChange: aChange
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpTCodeChangeVisitor>>visitBehaviorCommentChange: aChange [
	^ self visitBehaviorChange: aChange
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpTCodeChangeVisitor>>visitBehaviorNameChange: aChange [
	^ self visitBehaviorChange: aChange
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpTCodeChangeVisitor>>visitCategoryAddition: aChange [
	^ self visitCategoryChange: aChange
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpTCodeChangeVisitor>>visitCategoryChange: aChange [
	^ self visitCodeChange: aChange
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpTCodeChangeVisitor>>visitCategoryRemoval: aChange [
	^ self visitCategoryChange: aChange
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpTCodeChangeVisitor>>visitCategoryRename: aChange [
	^ self visitCategoryChange: aChange
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpTCodeChangeVisitor>>visitClassAddition: aChange [
	^ self visitClassChange: aChange
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpTCodeChangeVisitor>>visitClassChange: aChange [
	^ self visitBehaviorChange: aChange
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpTCodeChangeVisitor>>visitClassModification: aChange [
	^ self visitClassChange: aChange
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpTCodeChangeVisitor>>visitClassRemoval: aChange [
	^ self visitClassChange: aChange
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpTCodeChangeVisitor>>visitCodeChange: aChange [
	^ self explicitRequirement
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpTCodeChangeVisitor>>visitMethodAddition: aChange [
	^ self visitMethodChange: aChange
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpTCodeChangeVisitor>>visitMethodChange: aChange [
	^ self visitCodeChange: aChange
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpTCodeChangeVisitor>>visitMethodModification: aChange [
	^ self visitMethodChange: aChange
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpTCodeChangeVisitor>>visitMethodRemoval: aChange [
	^ self visitMethodChange: aChange
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpTCodeChangeVisitor>>visitProtocolAddition: aProtocolAddition [
	^ self visitProtocolChange: aProtocolAddition
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpTCodeChangeVisitor>>visitProtocolChange: aProtocolAddition [
	^ self visitBehaviorChange: aProtocolAddition.
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpTCodeChangeVisitor>>visitProtocolRemoval: aProtocolRemoved [
	^ self visitProtocolChange: aProtocolRemoved
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpTCodeChangeVisitor>>visitTraitAddition: aChange [
	^ self visitTraitChange: aChange
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpTCodeChangeVisitor>>visitTraitChange: aChange [
	^ self visitBehaviorChange: aChange
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpTCodeChangeVisitor>>visitTraitModification: aChange [
	^ self visitTraitChange: aChange
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpTCodeChangeVisitor>>visitTraitRemoval: aChange [
	^ self visitTraitChange: aChange
]
