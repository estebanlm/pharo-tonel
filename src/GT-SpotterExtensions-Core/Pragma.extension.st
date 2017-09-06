Extension {
	#name : #Pragma
}

{
	#category : #'*GT-SpotterExtensions-Core',
	#timestamp : ' 8/31/2017 05:26:36'
}
Pragma>>spotterActDefault [
    ^ self method browse
]

{
	#category : #'*GT-SpotterExtensions-Core',
	#timestamp : ' 8/31/2017 05:26:36'
}
Pragma>>spotterForBytecodesFor: aStep [
	<spotterOrder: 15>
	self method spotterForBytecodesFor: aStep
]

{
	#category : #'*GT-SpotterExtensions-Core',
	#timestamp : ' 8/31/2017 05:26:36'
}
Pragma>>spotterForImplementorsFor: aStep [
	<spotterOrder: 10>
	self method spotterForImplementorsFor: aStep
]

{
	#category : #'*GT-SpotterExtensions-Core',
	#timestamp : ' 8/31/2017 05:26:36'
}
Pragma>>spotterForSendersFor: aStep [
	<spotterOrder: 10>
	self method spotterForSendersFor: aStep
]

{
	#category : #'*GT-SpotterExtensions-Core',
	#timestamp : ' 8/31/2017 05:26:36'
}
Pragma>>spotterPreviewIn: composite [
	<spotterPreview: 10>
   self method spotterPreviewCodeIn: composite
]
