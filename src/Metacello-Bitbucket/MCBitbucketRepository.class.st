"

"
Class {
	#name : #MCBitbucketRepository,
	#superclass : #MCGitBasedNetworkRepository,
	#category : #Metacello-Bitbucket,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:32'
}
MCBitbucketRepository class>>basicDescription [
  ^ 'bitbucket'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:32'
}
MCBitbucketRepository class>>cacheDirectoryPath [
  <preference: 'BitBucket Cache' category: 'Metacello' description: '' type:
    #'String'>
  ^ super cacheDirectoryPath
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:32'
}
MCBitbucketRepository class>>isEnabled [

	^true
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:32'
}
MCBitbucketRepository class>>projectTagsUrlFor: projectPath [
  ^ 'https://bitbucket.org/api/1.0/repositories/' , projectPath , '/tags'
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:32'
}
MCBitbucketRepository class>>projectZipUrlFor: projectPath versionString: versionString [
  ^ 'https://bitbucket.org/' , projectPath , '/get/' , versionString , '.zip'
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:32'
}
MCBitbucketRepository>>normalizeTagsData: jsonObject [
  "return a dictionay mapping the tag name to the commit SHA."

  | tagDict |
  jsonObject
    at: 'error'
    ifPresent: [ :errorObject | 
      self
        error:
          'Error accessing tags for bitbucket project: ' , self projectPath printString
            , ' -> ' , (errorObject at: 'message') printString
            ,
              ((errorObject at: 'detail')
                ifNil: [ '' ]
                ifNotNil: [ :detail | ' :: ' , detail printString ]) ].
  tagDict := Dictionary new.
  jsonObject
    keysAndValuesDo: [ :tag :tagObject | 
      | sha |
      sha := tagObject at: 'node'.
      tagDict at: tag put: sha ].
  ^ tagDict
]
