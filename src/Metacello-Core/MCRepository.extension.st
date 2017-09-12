Extension { #name : #MCRepository }

{ #category : #'*Metacello-Core' }
MCRepository >> flushForScriptGet [
    "noop"
]

{ #category : #'*Metacello-Core' }
MCRepository >> repositoryBranchName [
  "extract a branch name from the repository ... if possible"

  ^ ''
]

{ #category : #'*Metacello-Core' }
MCRepository >> repositoryDescription [
  "return a description that includes a repositoryVersionString and repositoryBranchName if present"

  ^ self description
]

{ #category : #'*Metacello-Core' }
MCRepository >> repositoryVersionString [
  "extract a version string from the repository ... if possible"

  ^ ''
]
