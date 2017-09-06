"
A MCSystemCategoryParser extracts or set a category/protocol to the corresponding MCOrganizationDefinition.
"
Class {
	#name : #MCSystemCategoryParser,
	#superclass : #MCDoItParser,
	#category : #'Monticello-Chunk Format',
	#timestamp : '<historical>'
}

{
	#category : #'factory identification hook',
	#timestamp : ' 8/31/2017 07:17:01'
}
MCSystemCategoryParser class>>pattern [
	^ 'SystemOrganization*'
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCSystemCategoryParser>>addDefinitionsTo: aCollection [
	| definition |
	definition := aCollection 
					detect: [:ea | ea isOrganizationDefinition ] 
					ifNone: [aCollection add: (MCOrganizationDefinition categories: #())].
	definition categories: (definition categories copyWith: self category).
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCSystemCategoryParser>>category [
	| tokens  |
	tokens := source parseLiterals.
	tokens size = 3 ifFalse: [self error: 'Unrecognized category definition'].
	^ tokens at: 3
]
