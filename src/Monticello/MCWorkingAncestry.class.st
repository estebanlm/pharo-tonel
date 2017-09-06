"
The interim record of ancestry for a working copy, gets merged version added to the ancestry, and is used to create the VersionInfo when the working copy becomes a version. 
"
Class {
	#name : #MCWorkingAncestry,
	#superclass : #MCAncestry,
	#category : #Monticello-Versioning,
	#timestamp : '<historical>'
}

{
	#category : #adding,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCWorkingAncestry>>addAncestor: aNode [
	ancestors := (self ancestors reject: [ :each | aNode hasAncestor: each ]) copyWith: aNode lazy
]

{
	#category : #adding,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCWorkingAncestry>>addStepChild: aVersionInfo [
	stepChildren := stepChildren copyWith: aVersionInfo lazy
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCWorkingAncestry>>ancestors: anObject [
	ancestors := anObject collect: [ :a | a lazy ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCWorkingAncestry>>infoWithName: nameString message: messageString [
	^ MCVersionInfo
		name: nameString
		id: UUID new
		message: messageString
		date: Date today
		time: Time now
		author: Author fullName
		ancestors: ancestors asArray
		stepChildren: self stepChildren asArray
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCWorkingAncestry>>lazy [
	^ self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCWorkingAncestry>>name [
	^ '<working copy>'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCWorkingAncestry>>summary [
	^ 'Ancestors: ', self ancestorString
]
