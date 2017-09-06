"
I represent a Pharo development issue.

Responsibilities:
- create text templates (e.g. for the mailing list or issue tracker comments) for common events like issue creation and slice submission
- communicate with the issue tracker

Collaborators:
- ZnClient - my link to the issue tracker
- MCSliceInfo - I can get you one if you need it

Public API and Key Messages:
Most of my behavior is illustrated in my tests. The noticable exception are my text template creation messages, the testing of which seemed to hurt as much in duplication as it added in QA.
"
Class {
	#name : #PharoIssue,
	#superclass : #Object,
	#instVars : [
		'number',
		'title'
	],
	#category : #IssueTracking,
	#timestamp : 'SeanDeNigris 5/7/2015 10:27'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:25'
}
PharoIssue class>>number: anInteger  [
	^ self new
		number: anInteger;
		yourself
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:25'
}
PharoIssue>>changesFromSliceCommitMessage [

	| messageHeaderLines changesLines |
	messageHeaderLines := 3.
	changesLines := self sliceCommitMessage lines allButFirst: messageHeaderLines.
	^ changesLines joinUsing: Character cr
]

{
	#category : #communicating,
	#timestamp : ' 8/31/2017 05:26:25'
}
PharoIssue>>creationNotification [
	^ String streamContents: [ :str |
		str nextPutAll: self headerString;
		cr;
		print: self trackerUrl ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:25'
}
PharoIssue>>downloadTitle [
	^ ZnClient new
		url: 'http://tracker.pharo.org/issues/name/', self number asString;
		enforceHttpSuccess: true;
		get.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:25'
}
PharoIssue>>headerString [
	^ 'Issue ', self number asString, ': ', self title.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
PharoIssue>>number [
	^ number
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
PharoIssue>>number: anInteger [
	number := anInteger
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
PharoIssue>>slice [
	^ MCSliceInfo new
		issueNumber: self number asString;
		title: self title;
		yourself
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:25'
}
PharoIssue>>sliceCommitMessage [
	^ self slice workingCopy versionInfo message.
	
]

{
	#category : #communicating,
	#timestamp : ' 8/31/2017 05:26:25'
}
PharoIssue>>sliceNotification [
	^ String streamContents: [ :str |
		str
			nextPutAll: 'Fix in inbox: ';
			nextPutAll: self slice workingCopy versionInfo name;
		cr;
		cr;
		nextPutAll: self changesFromSliceCommitMessage ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
PharoIssue>>title [

	^ title ifNil: [ title := self downloadTitle ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
PharoIssue>>title: aString [
	title := aString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
PharoIssue>>trackerUrl [
	^ ('https://pharo.fogbugz.com/default.asp?', self number asString) asUrl
	
]
