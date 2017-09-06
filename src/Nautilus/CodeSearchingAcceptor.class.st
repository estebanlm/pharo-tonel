"
I am an acceptor in the context of code searching, using RBParseTreeSearcher
"
Class {
	#name : #CodeSearchingAcceptor,
	#superclass : #AbstractAcceptor,
	#category : #Nautilus-Acceptors,
	#timestamp : 'NicolaiHess 11/30/2014 22:28'
}

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:22'
}
CodeSearchingAcceptor>>accept: aText notifying: aController [
	| environment tree rule result |
	self model sourceTextModel clearUserEdits.
	environment := self model browsedEnvironment.
	tree := self class compiler evaluate: aText.
	
	rule := CodeSearchingRule new
		matcher: tree;
		yourself.
	
	result := RBSmalllintChecker runRule: rule onEnvironment: environment.
	Smalltalk tools messageList browse: result result methods title: rule name

]
