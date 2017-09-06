"
This announcement will be emitted when a class or a trait definition changes and completally installed.

It is different than ClassModifiedClassDefinition because it signalled only after new version of class/trait object is installed to system by become operation.  And that's why only modifiedClass variable is available (after #becomeForward: operation old version of class/trait disappear)
"
Class {
	#name : #ClassModificationApplied,
	#superclass : #ClassAnnouncement,
	#instVars : [
		'modifiedClass'
	],
	#category : #System-Announcements-System-Classes,
	#timestamp : 'DenisKudryashov 11/10/2016 13:08'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:17:00'
}
ClassModificationApplied class>>toClass: aClassOrTrait [

	^self new 
		modifiedClass: aClassOrTrait
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
ClassModificationApplied>>classAffected [
	^modifiedClass 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
ClassModificationApplied>>modifiedClass: anObject [
	modifiedClass := anObject
]
