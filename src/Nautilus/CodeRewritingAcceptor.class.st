"
I am an acceptor in the context of code rewriting using RBTreeRewriting
"
Class {
	#name : #CodeRewritingAcceptor,
	#superclass : #AbstractAcceptor,
	#category : #Nautilus-Acceptors,
	#timestamp : '<historical>'
}

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:22'
}
CodeRewritingAcceptor>>accept: aText notifying: aController [
	| environment tree rule result |
	self model sourceTextModel clearUserEdits.
	environment := self model browsedEnvironment.
	tree := self class compiler evaluate: aText.
	rule := RBTransformationRule new
		rewriteRule: tree;
		yourself.
	result := RBSmalllintChecker
		runRule: rule
		onEnvironment: environment.
	(ChangesBrowser changes: result builder changes) open
]
