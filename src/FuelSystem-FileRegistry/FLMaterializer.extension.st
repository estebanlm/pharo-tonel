Extension {
	#name : #FLMaterializer
}

{
	#category : #'*FuelSystem-FileRegistry',
	#timestamp : ' 8/31/2017 05:26:13'
}
FLMaterializer class>>fileReaderServicesForFile: fullName suffix: suffix [
	<fileService>
	suffix = 'fuel'
		ifFalse: [ ^ #() ].
	^ { self serviceFuelMaterialize }
]

{
	#category : #'*FuelSystem-FileRegistry',
	#timestamp : ' 8/31/2017 05:26:13'
}
FLMaterializer class>>serviceFuelMaterialize [
	^ SimpleServiceEntry 
		provider: self 
		label: 'Materialize Fuel file'
		selector: #materializeFromFileNamed:
		description: 'Materialize objects previously serialized with Fuel'
		buttonLabel: 'materialize'
]
