"
RGTraitDescriptionDefinition is the common parent for traits and metatraits that know their users (ie. classes/metaclasses)
"
Class {
	#name : #RGTraitDescriptionDefinition,
	#superclass : #RGBehaviorDefinition,
	#instVars : [
		'users'
	],
	#category : #Ring-Core-Kernel,
	#timestamp : 'VeronicaUquillas 4/19/2011 16:02'
}

{
	#category : #'adding/removing users',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGTraitDescriptionDefinition>>addUser: aRGBehavior [

	self users add: aRGBehavior
]

{
	#category : #variables,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGTraitDescriptionDefinition>>allClassVarNames [

	^#()
]

{
	#category : #variables,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGTraitDescriptionDefinition>>allInstVarNames [

	^#()
]

{
	#category : #variables,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGTraitDescriptionDefinition>>allSharedPoolNames [

	^#()
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGTraitDescriptionDefinition>>isTrait [

	^true
]

{
	#category : #'adding/removing users',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGTraitDescriptionDefinition>>removeUser: aRGBehavior [

	self users remove: aRGBehavior ifAbsent:[]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGTraitDescriptionDefinition>>traitUsers [
	"Retrieves the receiver's classes and traits"
	
	^users ifNil:[ users := OrderedCollection new ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGTraitDescriptionDefinition>>traitUsers: aCollection [

	users:= aCollection
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGTraitDescriptionDefinition>>users [
	"Retrieves the receiver's classes and traits"
	
	^users ifNil:[ users := OrderedCollection new ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGTraitDescriptionDefinition>>users: aCollection [

	users:= aCollection
]
