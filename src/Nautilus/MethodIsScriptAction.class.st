"
Action when the method is an executable script tagged with  the following pragma

someMethod
  <script>
  ...
"
Class {
	#name : #MethodIsScriptAction,
	#superclass : #AbstractMethodIconAction,
	#category : #Nautilus-Widgets,
	#timestamp : 'FranckWarlouzet 6/3/2015 09:58'
}

{
	#category : #order,
	#timestamp : ' 8/31/2017 05:26:22'
}
MethodIsScriptAction>>actionOrder [
	"Return the priority of this action"
	
	^0
]

{
	#category : #order,
	#timestamp : ' 8/31/2017 05:26:22'
}
MethodIsScriptAction>>actionStateToCache [
    "Return the state of the icon for caching purpose"
   ^ icon
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:22'
}
MethodIsScriptAction>>isActionHandled [

	^ method methodClass isMeta
		and: [ method numArgs isZero and: [ method pragmas anySatisfy: [ :each | each keyword = #script ] ] ]
]

{
	#category : #'private - accessing',
	#timestamp : ' 8/31/2017 05:26:22'
}
MethodIsScriptAction>>pragmaName [
	"The name of the pragma we handle"
	
	 ^#script
]

{
	#category : #'private - accessing',
	#timestamp : ' 8/31/2017 05:26:22'
}
MethodIsScriptAction>>privateActionIcon [

	 ^IconicButton new 
			target: self;
			actionSelector: #runScript;
			labelGraphic: (self iconNamed: #scriptManagerIcon) ;
			color: Color transparent;
			extent: self iconExtent;
			helpText: 'Run the script(s)';
			borderWidth: 0 
]

{
	#category : #'private - actions',
	#timestamp : ' 8/31/2017 05:26:22'
}
MethodIsScriptAction>>runScript [
	method pragmas
		select: [ :pragma | pragma keyword = self pragmaName ]
		thenDo: [ :pragma | 
			self runScriptForPragma: pragma.
			UIManager default inform: 'Script executed: ' , method name asString ]
		
	 
]

{
	#category : #'private - actions',
	#timestamp : ' 8/31/2017 05:26:22'
}
MethodIsScriptAction>>runScriptForPragma: pragma [

	method methodClass theNonMetaClass perform: method selector.
	 
]
