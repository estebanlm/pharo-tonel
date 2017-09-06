"
I register settings only needed for GTDebugger.
"
Class {
	#name : #GTDebuggerSystemSettings,
	#superclass : #Object,
	#category : #GT-Debugger-Model,
	#timestamp : 'AndreiChis 1/7/2016 10:10'
}

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTDebuggerSystemSettings class>>debugSettingsOn: aBuilder [
	<systemsettings>
	
	(aBuilder setting: #enableStackColoring)
		label: 'Color the stack';
		target: GTGenericStackDebugger;
		parent: #debugging;
		description:
				'When true, the stack context are colored based on their relationship with the selected context.'.
	
	(aBuilder setting: #enableDebuggerWindowDistinctColor)
		label: 'Color the window';
		target: GTGenericStackDebugger;
		parent: #debugging;
		description:
				'When true, the window border is colored with red to make it distinct from other windows.'.
				
	(aBuilder setting: #GTDebuggerStatus)
		parent: #gt;
		target: GTGenericStackDebugger;
		getSelector: #isGTDebuggerEnabled;
		setSelector: #setGTDebuggerEnabledStatus:; 
		label: 'GTDebugger';
		description: 
			'Enable or disable the GTDebugger.'
	

]
