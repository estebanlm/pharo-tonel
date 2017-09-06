"
This announcement correspond to code evaluation.  For example, a DoIt or PrintIt evaluated in a workspace raises one of this announcements.
"
Class {
	#name : #ExpressionEvaluated,
	#superclass : #SystemAnnouncement,
	#instVars : [
		'context',
		'expressionEvaluated'
	],
	#category : #System-Announcements-System-Base,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:17:00'
}
ExpressionEvaluated class>>expression: theEvaluatedExpression [
	^self expression: theEvaluatedExpression context: nil
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:17:00'
}
ExpressionEvaluated class>>expression: theEvaluatedExpression context: anExecutionContext [
	^self new
			expressionEvaluated: theEvaluatedExpression;
			context: anExecutionContext;
			yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
ExpressionEvaluated>>context [
	
	^ context
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
ExpressionEvaluated>>context: anObject [
	
	context := anObject
]

{
	#category : #'temporal for remove',
	#timestamp : ' 8/31/2017 07:17:00'
}
ExpressionEvaluated>>expression [
	^self expressionEvaluated
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
ExpressionEvaluated>>expressionEvaluated [
	
	^ expressionEvaluated
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
ExpressionEvaluated>>expressionEvaluated: anObject [
	
	expressionEvaluated := anObject
]

{
	#category : #'temporal for remove',
	#timestamp : ' 8/31/2017 07:17:00'
}
ExpressionEvaluated>>item [
	^expressionEvaluated
]
