"
A NautilusPluginManagerTree is a tree which is used to render the plugins selection
"
Class {
	#name : #NautilusPluginManagerTree,
	#superclass : #MorphTreeModel,
	#instVars : [
		'model'
	],
	#category : #NautilusCommon-Plugin-Manager,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusPluginManagerTree class>>model: aModel [
	
	^ self new model: aModel
]

{
	#category : #building,
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusPluginManagerTree>>buildPluginsTree [
	| tree | 
	tree := IdentityMorphTreeMorph on: self.
	tree
		listManager: (IdentityMorphTreeListManager new client: tree);
		columns: {
				MorphTreeColumn new startWidth: 100;
					rowMorphGetSelector: #firstMorph;
					headerButtonLabel: 'Plugin name' font:  nil.
				MorphTreeColumn new startWidth: 75;
					rowMorphGetSelector: #secondMorph;
					headerButtonLabel: 'Position' font:  nil};
		withHLines: true;
		beMultiple;
		autoDeselection: false;
		rowInset: 4;
		columnInset: 4;
		getMenuSelector: #menu:shifted:.

	^ tree
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusPluginManagerTree>>model [

	^ model
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusPluginManagerTree>>model: anObject [
	
	model := anObject
]

{
	#category : #'t - accessing',
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusPluginManagerTree>>rootItems [

	^ self model getPluginsList
]

{
	#category : #'t - accessing',
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusPluginManagerTree>>rootNodeClassFromItem: anItem [
	^ PluginTreeNode
]

{
	#category : #'t - accessing',
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusPluginManagerTree>>update [

	self updateList
]
