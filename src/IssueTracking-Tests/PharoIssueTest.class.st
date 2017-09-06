"

"
Class {
	#name : #PharoIssueTest,
	#superclass : #TestCase,
	#instVars : [
		'issue',
		'issueNumber',
		'madeUpTitleString'
	],
	#category : #IssueTracking-Tests,
	#timestamp : ''
}

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:43'
}
PharoIssueTest>>setUp [
	issueNumber := 6489.
	issue := PharoIssue number: issueNumber.
	madeUpTitleString := 'A title'.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:43'
}
PharoIssueTest>>testAutoTitle [
	| actualTitleFromTracker |
	actualTitleFromTracker := 'Spec-ify DropListModel / TextModel'.
	self assert: issue title equals: actualTitleFromTracker
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:43'
}
PharoIssueTest>>testCreating [
	PharoIssue number: 6489.
]

{
	#category : #tests-implementation,
	#timestamp : ' 8/31/2017 05:26:43'
}
PharoIssueTest>>testHeaderString [
	self assert: issue headerString equals: 'Issue 6489: Spec-ify DropListModel / TextModel'
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:43'
}
PharoIssueTest>>testNumber [
	self assert: issue number equals: issueNumber
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:43'
}
PharoIssueTest>>testSettingTitle [
	issue title: madeUpTitleString.
	self assert: issue title equals: madeUpTitleString
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:43'
}
PharoIssueTest>>testSlice [
	self assert: (issue slice isKindOf: MCSliceInfo)
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:43'
}
PharoIssueTest>>testTrackerUrl [
	self assert: issue trackerUrl equals: ('https://pharo.fogbugz.com/default.asp?', issueNumber asString) asUrl
]
