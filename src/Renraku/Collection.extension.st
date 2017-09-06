Extension {
	#name : #Collection
}

{
	#category : #'*renraku',
	#timestamp : ' 8/31/2017 05:26:37'
}
Collection>>select: selectBlock thenDo: doBlock ifNone: alternativeBlock [
    "same as #select:thenDo: but also allows to evaluate an alternative block if nothing was selected"
	| found |

	found := false.

    self do: [: each |
        ( selectBlock value: each ) 
			ifTrue: [
				found := true.
				doBlock value: each ]
    ].

	found ifFalse: alternativeBlock
]
