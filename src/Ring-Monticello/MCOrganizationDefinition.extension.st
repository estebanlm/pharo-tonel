Extension {
	#name : #MCOrganizationDefinition
}

{
	#category : #'*Ring-Monticello',
	#timestamp : ' 8/31/2017 07:17:02'
}
MCOrganizationDefinition>>asRingDefinition [

	^RGOrganization new
		categories: self categories;
		yourself  
]
