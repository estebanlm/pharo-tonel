"

"
Class {
	#name : #MetacelloEnsureFetchingMCSpecLoader,
	#superclass : #MetacelloFetchingMCSpecLoader,
	#category : #Metacello-MC-Loaders,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloEnsureFetchingMCSpecLoader>>ensureSpecLoader [
	^ self
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloEnsureFetchingMCSpecLoader>>scheduleFetchFor: packageSpec cachedReference: reference [
  "reference already in the cache during fetch ...schedule a load directive for reference, so ensured load will come from cache"

  ^ self
    scheduleFetchFor: packageSpec
    reference: reference
    message:
      'Fetched -> (cached) ' , reference name , ' --- '
        , reference repository repositoryDescription , ' --- '
        , reference repository description
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloEnsureFetchingMCSpecLoader>>scheduleFetchFor: packageSpec nearestReference: reference [
  "latest version in repository already matches the cached reference...schedule a load directive for reference, so ensured load will come from cache"

  ^ self
    scheduleFetchFor: packageSpec
    reference: reference
    message:
      'Fetched -> (nearest) ' , reference name , ' --- '
        , reference repository repositoryDescription , ' --- '
        , reference repository description
]
