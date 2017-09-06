"
I'm a set of permissions for a Directory Entry
"
Class {
	#name : #FileSystemPermission,
	#superclass : #Object,
	#instVars : [
		'posixPermission'
	],
	#category : #FileSystem-Core-Public,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:22'
}
FileSystemPermission class>>default [
	^ self posixPermissions: 8r777
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:22'
}
FileSystemPermission class>>new  [
	self error: 'Should not be called. Use #posixPermission: instead'
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:22'
}
FileSystemPermission class>>posixPermissions: aNumber [
	^self basicNew 
		initialize: aNumber;
		yourself
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileSystemPermission>>< other [
	^ posixPermission < other posixPermission
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileSystemPermission>><= other [
	^ (posixPermission > other posixPermission) not
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileSystemPermission>>> other [
	^ other posixPermission < posixPermission
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileSystemPermission>>>= other [
	^ other posixPermission <= posixPermission
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileSystemPermission>>groupExecute [
	^ self permissionBitAt: 4
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileSystemPermission>>groupRead [
	^ self permissionBitAt: 6
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileSystemPermission>>groupWrite [
	^ self permissionBitAt: 5
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileSystemPermission>>initialize: aNumber [
	posixPermission := aNumber.
	self initialize.	
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileSystemPermission>>isReadable [
	^ self ownerRead
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileSystemPermission>>isWritable [
	^ self ownerWrite
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileSystemPermission>>otherExecute [
	^ self permissionBitAt: 1
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileSystemPermission>>otherRead [
	^ self permissionBitAt: 3
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileSystemPermission>>otherWrite [
	^ self permissionBitAt: 2
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileSystemPermission>>ownerExecute [
	^ self permissionBitAt: 7
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileSystemPermission>>ownerRead [
	^ self permissionBitAt: 9
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileSystemPermission>>ownerWrite [
	^ self permissionBitAt: 8
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileSystemPermission>>permissionBitAt: bitIndex [
	^ (posixPermission bitAt: bitIndex) == 1
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileSystemPermission>>posixPermission [
	^ posixPermission
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileSystemPermission>>printOn: aStream [
	aStream 
		"Owner"
		nextPut: (self ownerRead ifTrue: [ $r ] ifFalse: [ $- ]);
		nextPut: (self ownerWrite ifTrue: [ $w ] ifFalse: [ $- ]);
		nextPut: (self ownerExecute ifTrue: [ $x ] ifFalse: [ $- ]);
		"Group"
		nextPut: (self groupRead ifTrue: [ $r ] ifFalse: [ $- ]);
		nextPut: (self groupWrite ifTrue: [ $w ] ifFalse: [ $- ]);
		nextPut: (self groupExecute ifTrue: [ $x ] ifFalse: [ $- ]);
		"Other"
		nextPut: (self otherRead ifTrue: [ $r ] ifFalse: [ $- ]);
		nextPut: (self otherWrite ifTrue: [ $w ] ifFalse: [ $- ]);
		nextPut: (self otherExecute ifTrue: [ $x ] ifFalse: [ $- ])
		
]
