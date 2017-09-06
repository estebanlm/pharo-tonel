"
Critique is an object that binds an entity with a rule that is violated by that entity. The critique describes a specific violation, and may provide a solutions to fix it.
"
Class {
	#name : #RenrakuCritiqueHelp,
	#superclass : #RenrakuHelp,
	#category : #Renraku-Help,
	#timestamp : 'YuriyTymchuk 7/10/2016 15:55'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:45'
}
RenrakuCritiqueHelp class>>bookDescription [
	^ 'Critique is an object that binds an entity with a rule that is violated by that entity. The critique describes a specific violation, and may provide a solutions to fix it.'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:45'
}
RenrakuCritiqueHelp class>>bookName [

	^ 'Critiques'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:45'
}
RenrakuCritiqueHelp class>>pages [

	^ #(RenrakuCritiqueDesignHelp RenrakuCritiqueExamplesHelp)
]
