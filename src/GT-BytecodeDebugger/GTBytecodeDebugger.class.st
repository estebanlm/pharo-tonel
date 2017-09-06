"
I am a debugger that provides the ability to step through the execution at the bytecode level (e.g. one bytecode at a time).
"
Class {
	#name : #GTBytecodeDebugger,
	#superclass : #GTGenericStackDebugger,
	#category : #GT-BytecodeDebugger-UI,
	#timestamp : 'AndreiChis 12/30/2015 10:49'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
GTBytecodeDebugger class>>defaultTitle [

	^ 'Bytecode'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
GTBytecodeDebugger class>>helpClass [
	^ GTBytecodeDebuggerHelp
]

{
	#category : #'tools registry',
	#timestamp : ' 8/31/2017 05:26:37'
}
GTBytecodeDebugger class>>register [

	self registerToolsOn: Smalltalk tools.
]

{
	#category : #'tools registry',
	#timestamp : ' 8/31/2017 05:26:37'
}
GTBytecodeDebugger class>>registerToolsOn: registry [

	"Add ourselves to registry. See [Smalltalk tools]" 
	registry registerDebugger: self withRank: 5.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
GTBytecodeDebugger class>>sessionClass [

	^ GTBytecodeDebuggerSession
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
GTBytecodeDebugger class>>variablesBrowserClass [

	^ GTBytecodeDebuggerVariablesBrowser
]

{
	#category : #'building actions',
	#timestamp : ' 8/31/2017 05:26:37'
}
GTBytecodeDebugger>>bytecodeActionsPragmas [

	^ #( bytecodeCodeDebuggingAction )
]

{
	#category : #'building presentations',
	#timestamp : ' 8/31/2017 05:26:37'
}
GTBytecodeDebugger>>bytecodeIn: aComposite forContext: aContext [

	(self methodBytecodeWidgetIn: aComposite forContext: aContext)
		initialize: [ :bytecodePresentation |
				bytecodePresentation selection: (self session symbolicBytecodeForCurrentPCFrom: self currentContext) ];
		with: [ :bytecode | self installActionsForRootPragmas: self bytecodeActionsPragmas in: bytecode ].
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
GTBytecodeDebugger>>bytecodePane [

	^ self browser paneNamed: #bytecode
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
GTBytecodeDebugger>>bytecodePresentation [
	
	^ self bytecodePane presentations first
]

{
	#category : #building,
	#timestamp : ' 8/31/2017 05:26:37'
}
GTBytecodeDebugger>>debuggerStructureIn: browser [
	
	browser
		row: #stack;
		row: [ :c | c
			column: #code; 
			column: #bytecode ] span: 2;
		row: #inspector.
		
]

{
	#category : #building,
	#timestamp : ' 8/31/2017 05:26:37'
}
GTBytecodeDebugger>>debuggerTransmissionsIn: browser [

	super debuggerTransmissionsIn: browser.
	browser transmit
		from: #stack port: #selection;
		to: #bytecode;
		andShow: [ :composite :aContext | self bytecodeIn: composite forContext: aContext ]

]

{
	#category : #'building presentations',
	#timestamp : ' 8/31/2017 05:26:37'
}
GTBytecodeDebugger>>decompiledCodeWidgetIn: composite forContext: aContext [

	^ composite pharoMethod
		title: 'Decompiled';
		format: [ aContext method codeForNoSource ];
		smalltalkClass: [  aContext methodClass ];
		doItReceiver: [ aContext receiver ];
		doItContext: [  aContext ]
]

{
	#category : #printing/formatting,
	#timestamp : ' 8/31/2017 05:26:37'
}
GTBytecodeDebugger>>formatBytecode: aBytecode [
	| textAttributes|
	
	textAttributes := {TextColor new color: Smalltalk ui theme textColor}.
	self selectedContext pc = aBytecode offset ifTrue: [ textAttributes := {TextColor new color: Smalltalk ui theme textColor. TextEmphasis italic} ]. 
	self selectedContext pc > aBytecode offset ifTrue: [ textAttributes := {TextColor new color: Color gray} ].
	^ Text 
		string: aBytecode printString
		attributes: textAttributes
]

{
	#category : #'building presentations',
	#timestamp : ' 8/31/2017 05:26:37'
}
GTBytecodeDebugger>>methodBytecodeWidgetIn: aComposite forContext: aContext [

	^ aComposite tree
		title: 'Bytecode';
		rootsExpanded;
		display: [ aContext method symbolicBytecodes ];
		children: [ :each | each isArray ifTrue: [each] ifFalse: #() ];
		format: [ :each | self formatBytecode: each ];
		onChangeOfPort: #selection act: [ :bytecodes | 
			self codePresentation 
				selectionInterval: (bytecodes selection
					ifNil: [ 1 to: 0 ] 
					ifNotNil: [:selectedBytecode| selectedBytecode sourceInterval]) ] 
]

{
	#category : #'building presentations',
	#timestamp : ' 8/31/2017 05:26:37'
}
GTBytecodeDebugger>>methodCodeIn: composite forContext: aContext [

	(self methodCodeWidgetIn: composite forContext: aContext)
		with: [ :code | self installCodeActionsFor: code ].
	"self decompiledCodeWidgetIn: composite forContext: aContext"
]
