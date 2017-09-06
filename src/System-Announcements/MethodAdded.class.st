"
This announcement is emited when we add a method to a class or a trait using:
	=> Behavior >> compile: or TraitBehavior >> compile:
"
Class {
	#name : #MethodAdded,
	#superclass : #MethodAnnouncement,
	#category : #System-Announcements-System-Methods,
	#timestamp : 'cyrilledelaunay 1/18/2011 13:06'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:17:00'
}
MethodAdded class>>method: aCompiledMethod [
	^self new
		method: aCompiledMethod;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
MethodAdded>>methodAdded [
	^ method
]
