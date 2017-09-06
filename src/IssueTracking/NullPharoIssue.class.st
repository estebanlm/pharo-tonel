"
I am an instance of the Null Object Pattern [1] so that users of PharoIssue do not have to put nil checks everywhere.

1. http://en.wikipedia.org/wiki/Null_Object_pattern
"
Class {
	#name : #NullPharoIssue,
	#superclass : #Object,
	#category : #IssueTracking,
	#timestamp : 'SeanDeNigris 5/7/2015 13:52'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
NullPharoIssue>>number [
	^ nil
]

{
	#category : #acccessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
NullPharoIssue>>title [
	^ nil
]
