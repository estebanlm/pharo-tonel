"
This announcement is emited when we RE-compile a method in a class or a trait, with: ClassDescription >> compile: or TraitDescription >> compile:. If the method is not yet registered in the class or the trait, the announcement will not be emitted.

The action of renaming a method will be handled by SystemMethodRemovedAnnouncement and SystemMethodAddedAnnouncement, since this refactoring is concretely composed by removing the old method and add a new with the new name  
"
Class {
	#name : #MethodModified,
	#superclass : #MethodAnnouncement,
	#instVars : [
		'oldMethod',
		'oldProtocol'
	],
	#category : #System-Announcements-System-Methods,
	#timestamp : 'BenjaminVanRyseghem 4/1/2011 16:04'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:17:00'
}
MethodModified class>>methodChangedFrom: oldMethod to: newMethod oldProtocol: oldProtocol  [
	^ self new
		method: newMethod;
		oldMethod: oldMethod;
		oldProtocol: oldProtocol;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
MethodModified>>newMethod [

	^ method
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
MethodModified>>newProtocol [
	
	^ self protocol
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
MethodModified>>oldMethod [
	^ oldMethod
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
MethodModified>>oldMethod: aCompiledMethod [
	oldMethod := aCompiledMethod.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
MethodModified>>oldProtocol [
	
	^ oldProtocol
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
MethodModified>>oldProtocol: anObject [
	
	oldProtocol := anObject
]
