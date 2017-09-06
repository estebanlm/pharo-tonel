Extension {
	#name : #RGMethodDefinition
}

{
	#category : #'*ring-monticello',
	#timestamp : ' 8/31/2017 07:17:02'
}
RGMethodDefinition>>sameAsMCDefinition: anMCMethodDefinition [
	^ anMCMethodDefinition selector = self selector
		and:
			[ 
			anMCMethodDefinition className = self className
				and:
					[ 
					anMCMethodDefinition classIsMeta = self isMetaSide
						and:
							[ 
							anMCMethodDefinition category = self protocol
								and: [ anMCMethodDefinition source = self sourceCode ] ] ] ]
]
