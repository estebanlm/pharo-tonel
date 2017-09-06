"

"
Class {
	#name : #GTSpotterProfiler,
	#superclass : #KMCategory,
	#category : #GT-Spotter-Utils,
	#timestamp : ''
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterProfiler class>>isGlobalCategory [
	^ true
]

{
	#category : #profiling,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterProfiler class>>profileOneCycle [
	"Tally only the UI process"
	
	(self confirm: 'MessageTally the UI process one cycle')
		ifTrue: [TimeProfiler
			onBlock: [
				|spotterModel done|
				done := false.
				GTSpotterGlobalShortcut reset.
				spotterModel := GTSpotter new.
				
				spotterModel announcer when: GTSpotterSearchFinished do: [ done := true ].
					
				GTSpotterMorph new
					extent: (World width / 2.4 @ (World height / 1.6)) asIntegerPoint;
					spotterModel: spotterModel;
					openCenteredInWorld.
		
				spotterModel class markOpened.
				[ done ] whileFalse: [ World doOneCycle ] ] ]
]

{
	#category : #shortcuts,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterProfiler>>keymapProfileOneCycle [
	"KMRepository reset"
	<shortcut>
	^ KMKeymap
			shortcut: $u meta
			action: [ self class profileOneCycle ]
]
