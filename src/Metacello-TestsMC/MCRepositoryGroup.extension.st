Extension {
	#name : #MCRepositoryGroup
}

{
	#category : #'*metacello-testsmc',
	#timestamp : ' 8/31/2017 05:26:32'
}
MCRepositoryGroup>>removeIdenticalRepository: aRepository [
  1 to: repositories size do: [ :index | 
    (repositories at: index) == aRepository
      ifTrue: [ 
        repositories removeAt: index.
        ^ self ] ]
]
