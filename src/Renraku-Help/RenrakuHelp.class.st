"
Renraku is a framework for defining and processing quality rules. The framework operates with three main concepts: entities, rules and critiques.

!! Entities
Entities are not a part of Renraku, but Renraku is validating entities. Theoretically entity can be any object, but in practice we mostly focus on code entities such as methods, classes, packages, AST nodes.

!! Rules
Rules are the objects that describe constraints about entities. A rule can check an entity and produce critiques that describe the violations of the entity according to the rule.

!! Critiques
Critique is an object that binds an entity with a rule that is violated by that entity. The critique describes a specific violation, and may provide a solutions to fix it.
"
Class {
	#name : #RenrakuHelp,
	#superclass : #CustomHelp,
	#category : #Renraku-Help,
	#timestamp : 'YuriyTymchuk 7/10/2016 15:49'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:45'
}
RenrakuHelp class>>bookDescription [
	^ 'Renraku is a framework for defining and processing quality rules. The framework operates with three main concepts: entities, rules and critiques.

!! Entities
Entities are not a part of Renraku, but Renraku is validating entities. Theoretically entity can be any object, but in practice we mostly focus on code entities such as methods, classes, packages, AST nodes.

!! Rules
Rules are the objects that describe constraints about entities. A rule can check an entity and produce critiques that describe the violations of the entity according to the rule.

!! Critiques
Critique is an object that binds an entity with a rule that is violated by that entity. The critique describes a specific violation, and may provide a solutions to fix it.'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:45'
}
RenrakuHelp class>>bookName [
	    ^'Renraku Quality Rules'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:45'
}
RenrakuHelp class>>pages [
	^#(RenrakuRuleHelp)
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:45'
}
RenrakuHelp class>>readInHelpBrowser [

	^ HelpBrowser openOn: (
		HelpTopic new
			addSubtopic: self asHelpTopic;
			yourself)
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:45'
}
RenrakuHelp class>>topicForClass: aClass [

	^ ClassAPIHelpBuilder new
		addMethodsWithoutComment: false;
		rootToBuildFrom: aClass;
		build;
		topicToBuild
]
