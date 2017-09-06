"
An organization with categories
"
Class {
	#name : #RGOrganization,
	#superclass : #RGAbstractContainer,
	#category : #Ring-Core-Containers,
	#timestamp : 'TorstenBergmann 2/12/2014 23:06'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGOrganization>>categories [
	"Retrieves categories in the system (tag-packages)"

	^self elements at: #categories ifAbsent:[ #() ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGOrganization>>categories: aCollection [
	"Set the categories collection"

	self elements at: #categories put: aCollection
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGOrganization>>fullName [

	^#organization
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGOrganization>>initialize [

	super initialize.
	self categories: OrderedCollection new.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGOrganization>>isOrganization [

	^true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGOrganization>>isSameRevisionAs: aRGOrganization [
	"This method look for equality of the properties of the receiver"

	^(self class = aRGOrganization class)
		and:[ self categories = aRGOrganization categories ]
]
