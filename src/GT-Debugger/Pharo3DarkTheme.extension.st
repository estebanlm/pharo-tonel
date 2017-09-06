Extension {
	#name : #Pharo3DarkTheme
}

{
	#category : #'*GT-Debugger',
	#timestamp : ' 8/31/2017 05:26:36'
}
Pharo3DarkTheme>>sameClassContextStyleFor: aContext  [

	^ {TextColor cyan}
]

{
	#category : #'*GT-Debugger',
	#timestamp : ' 8/31/2017 05:26:36'
}
Pharo3DarkTheme>>samePackageContextStyleFor: aContext [

	^ {TextColor magenta}
]

{
	#category : #'*GT-Debugger',
	#timestamp : ' 8/31/2017 05:26:36'
}
Pharo3DarkTheme>>unrelatedContextStyleFor: aContext [

	^ {TextColor color: Color white}
]
