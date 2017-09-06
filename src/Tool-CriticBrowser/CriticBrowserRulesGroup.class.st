"
I represent a group of rules in CriticBrowser tree view
"
Class {
	#name : #CriticBrowserRulesGroup,
	#superclass : #Object,
	#instVars : [
		'name',
		'rules'
	],
	#category : #Tool-CriticBrowser,
	#timestamp : 'SlotIntegrationTest 7/13/2016 01:09'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:37'
}
CriticBrowserRulesGroup class>>named: aString rules: aCollection [

	^ self new
		name: aString;
		rules: aCollection;
		yourself
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 05:26:37'
}
CriticBrowserRulesGroup>>do: aBlock [

	rules do: aBlock
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:37'
}
CriticBrowserRulesGroup>>isComposite [

	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
CriticBrowserRulesGroup>>name [
	^ name
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
CriticBrowserRulesGroup>>name: anObject [
	name := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
CriticBrowserRulesGroup>>rules [
	^ rules
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
CriticBrowserRulesGroup>>rules: anObject [
	rules := anObject
]
