"
SUnit tests for class ConfigurationCommandLineHandler
"
Class {
	#name : #ConfigurationCommandLineHandlerTest,
	#superclass : #TestCase,
	#category : #ConfigurationCommandLineHandler-Tests,
	#timestamp : 'TorstenBergmann 2/6/2014 08:16'
}

{
	#category : #convenience,
	#timestamp : ' 8/31/2017 05:26:41'
}
ConfigurationCommandLineHandlerTest>>activate: arguments [
	^ PharoCommandLineHandler activateWith: (self argumentsWith: arguments)
]

{
	#category : #convenience,
	#timestamp : ' 8/31/2017 05:26:41'
}
ConfigurationCommandLineHandlerTest>>argumentsWith: aCollection [
	^ CommandLineArguments withArguments: aCollection
]

{
	#category : #convenience,
	#timestamp : ' 8/31/2017 05:26:41'
}
ConfigurationCommandLineHandlerTest>>command: arguments [
	^ ConfigurationCommandLineHandler commandLine: (self argumentsWith: arguments)
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:41'
}
ConfigurationCommandLineHandlerTest>>testGroups [
	| cli |
	cli := self command: #('http://ss3.gemstone.com/ss/MetaRepoForPharo20' '--group=foo').
	self assertCollection: cli groups equals: {'foo'}.
	
	cli := self command: #('http://ss3.gemstone.com/ss/MetaRepoForPharo20' '--group=foo,boo').
	self assertCollection: cli groups equals: {'foo' . 'boo'}.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:41'
}
ConfigurationCommandLineHandlerTest>>testHasConfiguration [
	| cli |
	cli := self command: #('http://ss3.gemstone.com/ss/MetaRepoForPharo20').
	self deny: cli hasConfiguration.
	
	cli := self command: #('http://ss3.gemstone.com/ss/MetaRepoForPharo20' '--install').
	self deny: cli hasConfiguration.
	
	cli := self command: #('http://ss3.gemstone.com/ss/MetaRepoForPharo20' 'ConfigurationOfFoo').
	self assert: cli hasConfiguration.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:41'
}
ConfigurationCommandLineHandlerTest>>testListConfigurations [
	self skip: 'Currently quits the image when in non-interactive mode'.
	self activate: #('config' 'http://ss3.gemstone.com/ss/MetaRepoForPharo20').
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:41'
}
ConfigurationCommandLineHandlerTest>>testResponsibility [
	| args |
	args := self argumentsWith: #('config').
	self assert: (ConfigurationCommandLineHandler isResponsibleFor: args).
]
