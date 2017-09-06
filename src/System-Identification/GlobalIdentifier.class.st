"
I keep global IDs that are used for tracking user activity, e.g. computer id. By default, you should access me by calling #uniqueInstance.

Responsibility:
The IDs that are important to store onto disk (and shared by all images) should be placed in persistedInformation instance variable. On other hand, if you do not want to store it onto disk, create a new instance variable. I can #loadPreferences and #savePreferences onto a disk.

I know computer ID and secret ID. Computer ID is a global UUID that is share among all the images. It is stored on a local disk. Secret ID is use for encrypting information, e.g., class names, method names. You can use #hashForText: method.

Collaborators: I do not collaborate with other classes. I only offer the basic IDs for other frameworks.

Public API and Key Messages

- computerUUID 
- ensureComputerUUID
- hashForText:
- loadPreferences 
- savePreferences.

Before using #computerUUID, you should call #ensureComputerUUID. It will update UUID from the disk or stores existing one if it is not stored yet. I behave like this as automatic storing data to disk on image start-up leads to errors.

Internal Representation and Key Implementation Points.

    Instance Variables
	persistedInformation:		<Dictionary>
	preferences:		<FileReference>

"
Class {
	#name : #GlobalIdentifier,
	#superclass : #Object,
	#instVars : [
		'persistenceStrategy',
		'persistedInformation'
	],
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #System-Identification,
	#timestamp : 'AndreiChis 10/12/2015 23:13'
}

{
	#category : #cleanup,
	#timestamp : ' 8/31/2017 05:26:36'
}
GlobalIdentifier class>>cleanUp [
	"Clean unique instance."	
	self reset.
]

{
	#category : #'class initialization',
	#timestamp : ' 8/31/2017 05:26:36'
}
GlobalIdentifier class>>initialize [

	SessionManager default
		register: (ClassSessionHandler forClassNamed: self name)
		inCategory: SessionManager default systemCategory  
		atPriority: SessionManager default defaultPriority - 100.
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:36'
}
GlobalIdentifier class>>initializeUniqueInstance [
	uniqueInstance := self basicNew initialize.
	uniqueInstance ensure.
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:36'
}
GlobalIdentifier class>>new [
	"Users should not create instances of this class.
	Within the framework more instances are created when loading data and when testing."
	self shouldNotImplement
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:36'
}
GlobalIdentifier class>>reset [
	"self reset"
	uniqueInstance := nil
]

{
	#category : #'system startup',
	#timestamp : ' 8/31/2017 05:26:36'
}
GlobalIdentifier class>>startUp: resuming [

	self reset
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GlobalIdentifier class>>uniqueInstance [
	"self uniqueInstance"
	uniqueInstance ifNil: [ self initializeUniqueInstance ].
	^ uniqueInstance
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GlobalIdentifier>>computerUUID [
	"This value identifies a user logged into the computer.
	Before calling #computerUUID method, you should call #ensure."
	^ persistedInformation at: #computerUUID
]

{
	#category : #'load and saving',
	#timestamp : ' 8/31/2017 05:26:36'
}
GlobalIdentifier>>ensure [
	self persistenceStrategy ensure: self persistedInformation
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:36'
}
GlobalIdentifier>>initialize [
	super initialize.
	"Dictionary contains all the values that we want to persist on disk."
	persistedInformation := Dictionary new.
	persistedInformation at: #computerUUID put: UUID new asString.
	persistedInformation at: #secretUUID put: UUID new asString.
	persistenceStrategy := GlobalIdentifierPersistence ston.
	persistenceStrategy previous: GlobalIdentifierPersistence fuel.
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:36'
}
GlobalIdentifier>>obfuscate: anObject [
	"If you have an information that you want to obfuscate before sending,
	this is likely a good solution for you."
	^ anObject hash bitXor: self secretUUID hash
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GlobalIdentifier>>persistedInformation [
	^ persistedInformation
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GlobalIdentifier>>persistenceStrategy [
	^ persistenceStrategy
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GlobalIdentifier>>persistenceStrategy: anObject [
	persistenceStrategy := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GlobalIdentifier>>secretUUID [
	"This value can be used for obfuscating an information before sending it.
	See #obfuscate: method.
	Before calling #secretUUID method, you should call #ensure."
	^ persistedInformation at: #secretUUID
]
