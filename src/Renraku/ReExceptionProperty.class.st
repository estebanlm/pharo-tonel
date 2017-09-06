"
This property represents exceptions that occured during other properties computation. This way tools can work witout interuptions, but users will be aware the there were some exceptions.
"
Class {
	#name : #ReExceptionProperty,
	#superclass : #ReProperty,
	#instVars : [
		'stack',
		'message'
	],
	#category : #Renraku-Critiques,
	#timestamp : 'YuriyTymchuk 7/15/2017 23:46'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:37'
}
ReExceptionProperty class>>for: anEntity with: anException [
	
	^ self new
		initializeSourceAnchor: (
			ReSourceAnchor entity: anEntity);
		stack: anException signalerContext copyStack;
		message: anException description;
		yourself
		
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReExceptionProperty>>actions [

	^ {RePropertyAction new
			icon: (self iconNamed: #smallDebug);
			description: 'Debug the exception';
			action: [ :prop |
				UIManager default
					debugProcess: Processor activeProcess 
					context: prop stack
					label: prop message 
					fullView: true ];
			yourself}
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReExceptionProperty>>icon [
	^ self iconNamed: #exceptionIcon
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReExceptionProperty>>message [
	^ message
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReExceptionProperty>>message: anObject [
	message := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReExceptionProperty>>stack [
	^ stack
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReExceptionProperty>>stack: anObject [
	stack := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReExceptionProperty>>title [
	^ '~Exception: [', message, ']'
]
