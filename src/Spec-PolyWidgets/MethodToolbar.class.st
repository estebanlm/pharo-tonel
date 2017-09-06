"
A MethodToolbar is xxxxxxxxx.

self example
"
Class {
	#name : #MethodToolbar,
	#superclass : #ComposableModel,
	#instVars : [
		'methodHolder',
		'browseModel',
		'sendersModel',
		'implementorsModel',
		'versionModel',
		'dropListModel',
		'model',
		'usersModel'
	],
	#category : #Spec-PolyWidgets-Widgets,
	#timestamp : 'Spirita 7/22/2016 17:01'
}

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:19'
}
MethodToolbar class>>defaultSpec [
	<spec>
	^ SpecLayout composed
		newRow:
				[ :row | 
			row
				add: #(#model #browseModel);
				add: #(#model #usersModel);
				add: #(#model #sendersModel);
				add: #(#model #implementorsModel);
				add: #(#model #versionModel);
				add: #(#model #dropListModel) ];
		yourself
]

{
	#category : #example,
	#timestamp : ' 8/31/2017 05:26:19'
}
MethodToolbar class>>example [
	| example |
	example := MethodToolbar new.
	example
		method: ButtonModel >> #state:;
		method: nil;
		extent: 550 @ 100;
		openWithSpec.
		^example 
]

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:19'
}
MethodToolbar class>>title [

	^ 'Toolbar'
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:19'
}
MethodToolbar>>addAll: aWindow  withSpec: aSpec [

	aWindow
		addMorph: (self buildWithSpec: aSpec)
		fullFrame: ((0@0 corner: 1@0) asLayoutFrame bottomOffset: 30).
		
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:19'
}
MethodToolbar>>addItemLabeled: aString do: aBlock [

	dropListModel addItemLabeled: aString do: aBlock
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:19'
}
MethodToolbar>>browseMethod [

	methodHolder value
		ifNotNil: [:aMethod | aMethod browse ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
MethodToolbar>>browseModel [

	^ browseModel
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
MethodToolbar>>dropListModel [

	^ dropListModel
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:19'
}
MethodToolbar>>emptyDropList [
	
	dropListModel emptyList
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:19'
}
MethodToolbar>>implementorsMethod [

	methodHolder value
		ifNotNil: [:aMethod | self model browseMessagesFrom: aMethod selector ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
MethodToolbar>>implementorsModel [

	^ implementorsModel
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:19'
}
MethodToolbar>>initialize [

	methodHolder := nil asValueHolder.
	model := AbstractTool new.
	
	super initialize.
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:19'
}
MethodToolbar>>initializeWidgets [
	browseModel := self newButton.
	usersModel := self newButton.
	sendersModel := self newButton.
	implementorsModel := self newButton.
	versionModel := self newButton.
	dropListModel := self newDropList.
	self
		setFocusOrder;
		setBrowseModel;
		setUsersModel;
		setVersionModel;
		setSendersModel;
		setImplementorsModel
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:19'
}
MethodToolbar>>method: aMethod [

	methodHolder value: aMethod
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
MethodToolbar>>model [

	^ model
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:19'
}
MethodToolbar>>registerForChanges [
	methodHolder
		whenChangedDo:
			[ :contents | 
			| boolean |
			boolean := contents ifNil: [ false ] ifNotNil: [ true ].
			browseModel state: boolean.
			usersModel state: boolean.
			sendersModel state: boolean.
			versionModel state: boolean.
			implementorsModel state: boolean ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:19'
}
MethodToolbar>>sendersMethod [

	methodHolder value
		ifNotNil: [:aMethod | self model browseSendersOfMessagesFrom: aMethod selector ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
MethodToolbar>>sendersModel [

	^ sendersModel
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:19'
}
MethodToolbar>>setBrowseModel [
	
	browseModel
		state: false;
		label: 'Browse';
		action: [ self browseMethod ].
	

]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:19'
}
MethodToolbar>>setFocusOrder [

	self focusOrder
		add: browseModel;
		add: usersModel;
		add: sendersModel;
		add: implementorsModel;
		add: versionModel.
		
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:19'
}
MethodToolbar>>setImplementorsModel [
	
	implementorsModel
		state: false;
		label: 'Implementors';
		action: [ self implementorsMethod ].
	

]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:19'
}
MethodToolbar>>setSendersModel [
	
	sendersModel
		state: false;
		label: 'Senders';
		action: [ self sendersMethod ].
	

]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:19'
}
MethodToolbar>>setUsersModel [
	usersModel
		state: false;
		label: 'Users';
		action: [ self usersMethod ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:19'
}
MethodToolbar>>setVersionModel [
	
	versionModel
		state: false;
		label: 'Version';
		action: [ self versionMethod ].
	

]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:19'
}
MethodToolbar>>usersMethod [
	methodHolder value methodClass ifNotNil: [ :class | self model browseClassRefsOf: class ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
MethodToolbar>>usersModel [
	^ usersModel
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:19'
}
MethodToolbar>>versionMethod [

	methodHolder value
		ifNotNil: [:aMethod | self model browseVersionsFrom: aMethod ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
MethodToolbar>>versionModel [

	^ versionModel
]
