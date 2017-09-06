"
This class defines the full reference help for the system.
(contents for the full API Help).

Just run ""HelpBrowser openOn: SystemReference"".




"
Class {
	#name : #SystemReference,
	#superclass : #Object,
	#category : #HelpSystem-Core-Utilities,
	#timestamp : 'tbn 4/30/2010 15:35'
}

{
	#category : #'help topic creation',
	#timestamp : ' 8/31/2017 05:26:19'
}
SystemReference class>>all [
	"HelpBrowser openOn: self all "
	
	^(ClassAPIHelpBuilder new)
		rootToBuildFrom: ProtoObject;
		addSubclasses: true;
		addMethods: true;
		subclassesAsSeparateTopic: false;
		build;
		topicToBuild 
	 
		 
]

{
	#category : #'help topic creation',
	#timestamp : ' 8/31/2017 05:26:19'
}
SystemReference class>>asHelpTopic  [
	"HelpBrowser openOn: SystemReference"
	
	^self hierarchyFor: ProtoObject 
	 
		 
]

{
	#category : #'help topic creation',
	#timestamp : ' 8/31/2017 05:26:19'
}
SystemReference class>>forClass: aClass [
	|root topic |
	root := HelpTopic named: 'System reference for ', aClass name.
	topic := ClassAPIHelpBuilder buildHelpTopicFrom: aClass.
	root addSubtopic: topic.
	^root
]

{
	#category : #'help topic creation',
	#timestamp : ' 8/31/2017 05:26:19'
}
SystemReference class>>hierarchyFor: aClass [
	 
	|root topic |
	root := HelpTopic named: 'System reference for ', aClass name.
	topic := (ClassAPIHelpBuilder new)
					rootToBuildFrom: aClass;
					addSubclasses: true;
					addMethods: false;
					subclassesAsSeparateTopic: false;
					build;
					topicToBuild.
	root addSubtopic: topic.
	^root				
	 
		 
]

{
	#category : #'help topic creation',
	#timestamp : ' 8/31/2017 05:26:19'
}
SystemReference class>>hierarchyWithMethodsFor: aClass [
	 
	|root topic |
	root := HelpTopic named: 'System reference for ', aClass name.
	topic := (ClassAPIHelpBuilder new)
					rootToBuildFrom: aClass;
					addSubclasses: true;
					addMethods: true;
					subclassesAsSeparateTopic: true;
					build;
					topicToBuild.
	root addSubtopic: topic.
	^root				
	 
		 
]
