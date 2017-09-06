"
KMRepository reset
"
Class {
	#name : #GTSpotterGlobalShortcut,
	#superclass : #KMCategory,
	#category : #GT-Spotter-UI,
	#timestamp : 'TudorGirba 11/18/2014 02:57'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterGlobalShortcut class>>isGlobalCategory [
	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterGlobalShortcut class>>openGlobalSpotter [
	| spotterModel |
		
	self reset.
	spotterModel := GTSpotter new.
	
	self class environment at: #GTSpotterEventCollector ifPresent: [ :eventCollector |
		eventCollector new
			perform: #occupant: with: spotterModel;
			perform: #category: with: #spotter;
			register;
			perform: #linkToSpotter: with: spotterModel;
			perform: #recordSpotterOpenEvent ].
	
	GTSpotterMorph new
		extent: (World width / 2.4 @ (World height / 1.6)) asIntegerPoint;
		spotterModel: spotterModel;
		doLayout;
		openCenteredInWorld.
		
	spotterModel class markOpened.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterGlobalShortcut class>>openGlobalSpotterDebug [

	GTSpotterMorph new
		extent: (World width / 2.25 @ (World height / 1.25)) asIntegerPoint;
		spotterModel: (GTSpotter new
			beDebugging;
			yourself);
		openInWindowLabeled: 'Spotter Debug Mode';
		showPreview
]

{
	#category : #cleanup,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterGlobalShortcut class>>reset [
	
	(World findA: GTSpotterMorph) ifNotNil: [ :aSpotterMorph | aSpotterMorph spotterModel exitDueTo: #reset ]
]

{
	#category : #shortcuts,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterGlobalShortcut>>keymapToggle [
	"KMRepository reset"
	<shortcut>
	^ KMKeymap
			shortcut: Character cr shift
			action: [ self class openGlobalSpotter ]
]

{
	#category : #shortcuts,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterGlobalShortcut>>keymapToggleDebug [
	"KMRepository reset"
	"This shortcut is still using command because the current Virtual Machine interprets Ctrl-cr as a different KEY.
	This should be replaced for #meta as soon as the new VMs are fixed and shipped"
	<shortcut>
	^ KMKeymap
			shortcut: Character cr command shift
			action: [ self class openGlobalSpotterDebug ]
]
