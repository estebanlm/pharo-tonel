"
Use cascaded nextPutAll:''s instead of #, in #nextPutAll:.
Indeed this is really important to understand that the implementation of the concatenation of strings creates a new string for each uses of ,.
Therefore if you use five , to concatenate an expression you create 5 intermediate strings for nothing. Using nextPutAll: just add the string in the stream.

Have a look at  streamContents:. Here is an example

String streamContents: [ :s|
		s nextPutAll: '---'.
		s nextPutAll: self.
		s nextPutAll: '---' ].
"
Class {
	#name : #RBCascadedNextPutAllsRule,
	#superclass : #RBTransformationRule,
	#category : #Refactoring-Critics-TransformationRules,
	#timestamp : 'StephaneDucasse 11/29/2014 17:42'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBCascadedNextPutAllsRule class>>uniqueIdentifierName [
	"This number should be unique and should change only when the rule completely change semantics"
	
	^'CascadedNextPutAllsRule'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBCascadedNextPutAllsRule>>group [
	^ 'Coding Idiom Violation'
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBCascadedNextPutAllsRule>>initialize [
	super initialize.
	self rewriteRule
		replace: '``@rcvr nextPutAll: ``@object1 , ``@object2' with: '``@rcvr nextPutAll: ``@object1; nextPutAll: ``@object2';
		replace: '``@rcvr show: ``@object1 , ``@object2' with: '``@rcvr show: ``@object1; show: ``@object2'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBCascadedNextPutAllsRule>>name [
	^ 'Use cascaded nextPutAll:''s instead of #, in #nextPutAll:'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBCascadedNextPutAllsRule>>rationale  [
	^ 'Use cascaded nextPutAll:''s instead of #, in #nextPutAll:.'
]
