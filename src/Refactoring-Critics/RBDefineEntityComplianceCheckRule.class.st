"
The rule checks if the class rule in question specifies which entities it can check
"
Class {
	#name : #RBDefineEntityComplianceCheckRule,
	#superclass : #RBBlockLintRule,
	#category : #Refactoring-Critics-BlockRules,
	#timestamp : 'YuriyTymchuk 1/13/2016 22:34'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBDefineEntityComplianceCheckRule class>>checksClass [
	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBDefineEntityComplianceCheckRule class>>uniqueIdentifierName [
	
	^ 'RBDefineEntityComplianceCheckRule'
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBDefineEntityComplianceCheckRule>>basicCheck: aClass  [
	
	^ (aClass inheritsFrom: RBLintRule) and: [ 
		aClass isVisible and: [
			self complianceMethods noneSatisfy: [ :method |
				aClass perform: method ] ] ]
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBDefineEntityComplianceCheckRule>>checkClass: aClass  [
	(self basicCheck: aClass) ifTrue: [ result addClass: aClass ]
]

{
	#category : #properties,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBDefineEntityComplianceCheckRule>>complianceMethods [

	^ #(checksMethod checksClass checksPackage)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBDefineEntityComplianceCheckRule>>group [
	^ 'Coding Idiom Violation'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBDefineEntityComplianceCheckRule>>name [
	^ 'Rule does not define entity compliance'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBDefineEntityComplianceCheckRule>>rationale [

	^ 'You should override on the CLASS SIDE at least one of #',
	  (self complianceMethods joinUsing: ', #'),
	  ' methods to return true and so indicate which entities can be checked by your rule.'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBDefineEntityComplianceCheckRule>>resultClass [
	^ RBClassEnvironment
]
