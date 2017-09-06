"
I implement a pre debug window for GTDebugger. I reuse the debug window for the SpecDebugger and adapt the way stack frames are obtained from the debugger.

I receive a instance to a full debugger that I'll open if the user continues debugging.

"
Class {
	#name : #GTSpecPreDebugWindow,
	#superclass : #SpecPreDebugWindow,
	#category : #GT-Debugger-UI,
	#timestamp : 'AndreiChis 2/18/2016 11:43'
}

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpecPreDebugWindow>>clear [

	self debugger ifNotNil: [ :aDebugger | aDebugger windowIsClosing ]
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpecPreDebugWindow>>columnsFor: aContext [

	^ { 
		self debugger formatStackClassColumnForContext: aContext.
		self debugger formatStackMethodColumnForContext: aContext.
		self debugger formatStackExtraColumnForContext: aContext  }
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpecPreDebugWindow>>initialExtent [

	^ 700 @ 180
]

{
	#category : #'initialization widgets',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpecPreDebugWindow>>initializeStackPane [
	
	self stackPane
		displayBlock: [ :aContext | self columnsFor: aContext ];
		items: (self debugger session stackOfSize: 50 ) ;
		whenSelectedItemChanged: [ :aContext | 
			"Set the selection before, as debugAction removes the link with the debugger. "
			self debugger stackPresentation selection: aContext.
			self openFullDebugger ]
		
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpecPreDebugWindow>>openFullDebugger [
	| currentDebugger |
	
	currentDebugger := self debugger.
	self debugger: nil.
	self close.
	currentDebugger 
		open
]
