"
I am an abstract critic class.

My subclasses should define whether they provide a selection interval, or refactory change
"
Class {
	#name : #ReAbstractCritique,
	#superclass : #ReProperty,
	#instVars : [
		'rule',
		'tinyHint'
	],
	#category : #Renraku-Critiques,
	#timestamp : 'YuriyTymchuk 10/16/2015 01:52'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:37'
}
ReAbstractCritique class>>for: anEntity by: aRule [

	^ self basicNew
		initializeRule: aRule
		target: anEntity;
		yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:37'
}
ReAbstractCritique class>>withAnchor: anAnchor by: aRule [

	^ self basicNew
		initializeRule: aRule
		sourceAnchor: anAnchor;
		yourself
]

{
	#category : #'special instance creation',
	#timestamp : ' 8/31/2017 05:26:37'
}
ReAbstractCritique class>>withAnchor: anAnchor by: aRule hint: aString [

	^ (self
		withAnchor: anAnchor
		by: aRule)
		tinyHint: aString;
		yourself
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReAbstractCritique>>actions  [

	| actions |
	
	actions := OrderedCollection new: 3.

	actions add: (RePropertyAction new
			icon: (self iconNamed: #smallQuestionIcon);
			description: 'View rationale behind the rule';
			action: [ :crit |
				crit popDescriptionUp.
				ReSystemAnnouncer uniqueInstance
					notifyCritique: crit
					descriptionViewedFor: crit sourceAnchor entity ];
			yourself).
	
	self providesChange ifTrue: [ 
		actions add: (RePropertyAction new
			icon: (self iconNamed: #repairIcon);
			description: 'Automatically resolve the issue';
			action: [ :crit |
				| changesBrowser |

				ReSystemAnnouncer uniqueInstance notifyViewedDiffFor: crit of: crit sourceAnchor entity.
				
				changesBrowser := (ChangesBrowser changes: { crit change })
					extent: 500@400;
					setModal: SystemWindow topWindow;
					yourself.
					
				changesBrowser openDialogWithSpec
					okAction: [ ReSystemAnnouncer uniqueInstance
								notifyCritique: crit
								AutoFixedFor: crit sourceAnchor entity.
								changesBrowser accept ];
					centered ];
			yourself) ].
	
	actions add: (RePropertyAction new
			icon: (self iconNamed: #smallCancelIcon);
			description: 'Ban this rule';
			action: [ :crit | crit guidedBan ];
			yourself).

	^ actions
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReAbstractCritique>>ban [
	
	sourceAnchor sourceEntity ban: self  
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReAbstractCritique>>change [
	
	^ self subclassResponsibility 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReAbstractCritique>>description [
	^ rule rationale
]

{
	#category : #gt-extension,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReAbstractCritique>>gtInspectorDescriptionIn: composite [
	<gtInspectorPresentationOrder: 1>

	^ composite text
		title: 'Description';
		display: [ self description ]
]

{
	#category : #gt-extension,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReAbstractCritique>>gtInspectorSourceCodeIn: composite [
	<gtInspectorPresentationOrder: 0>

	sourceAnchor gtInspectorAnchorIn: composite
	
		
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReAbstractCritique>>guidedBan [

	ReCriticEngine guidedBy: sourceAnchor entity ban: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReAbstractCritique>>icon [

	^ self iconNamed: ('small', rule severity capitalized, 'Icon') asSymbol
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReAbstractCritique>>initializeRule: aRule sourceAnchor: anAnchor [

	self initializeSourceAnchor: anAnchor.
	rule := aRule.
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReAbstractCritique>>initializeRule: aRule target: anEntity [

	self
		initializeRule: aRule
		sourceAnchor: (ReSourceAnchor entity: anEntity)
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReAbstractCritique>>isCritique [
	^ true
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReAbstractCritique>>popDescriptionUp [
	UIManager default longMessage: self description title: self title
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReAbstractCritique>>provideNegativeFeedback: aComment [
	ReFeedbacker negativeFeedback: aComment About: self
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReAbstractCritique>>providePositiveFeedback: aComment [
	ReFeedbacker positiveFeedback: aComment About: self
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReAbstractCritique>>providesChange [

	^ self subclassResponsibility 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReAbstractCritique>>rule [
	^ rule
]

{
	#category : #gt-extension,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReAbstractCritique>>spotterPreviewRationaleIn: aComposite [
	<spotterPreview: 5>
	aComposite text
		title: [ self title ];
		display: [ self description ];
		entity: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReAbstractCritique>>tinyHint [

	^ tinyHint
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReAbstractCritique>>tinyHint: anObject [
	tinyHint := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReAbstractCritique>>title [
	^ (self tinyHint isNil or: [ self tinyHint isEmpty ])
		ifTrue: [ rule name ]
		ifFalse: [
			String streamContents: [ :s |
				s
					nextPut: $[;
					nextPutAll: self tinyHint;
					nextPutAll: '] ';
					nextPutAll: rule name ] ]
]
