Extension {
	#name : #MCRepository
}

{
	#category : #'*Metacello-Core',
	#timestamp : ' 8/31/2017 07:16:49'
}
MCRepository>>flushForScriptGet [
    "noop"
]

{
	#category : #'*Metacello-Core',
	#timestamp : ' 8/31/2017 07:16:49'
}
MCRepository>>repositoryBranchName [
  "extract a branch name from the repository ... if possible"

  ^ ''
]

{
	#category : #'*Metacello-Core',
	#timestamp : ' 8/31/2017 07:16:49'
}
MCRepository>>repositoryDescription [
  "return a description that includes a repositoryVersionString and repositoryBranchName if present"

  ^ self description
]

{
	#category : #'*Metacello-Core',
	#timestamp : ' 8/31/2017 07:16:49'
}
MCRepository>>repositoryVersionString [
  "extract a version string from the repository ... if possible"

  ^ ''
]
