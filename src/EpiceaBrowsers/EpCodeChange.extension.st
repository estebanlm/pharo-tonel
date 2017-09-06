Extension {
	#name : #EpCodeChange
}

{
	#category : #'*EpiceaBrowsers',
	#timestamp : ' 8/31/2017 05:26:27'
}
EpCodeChange>>applyCodeChange [
	"Apply this code change in current image"

	^ self accept: EpApplyVisitor new

]

{
	#category : #'*EpiceaBrowsers',
	#timestamp : ' 8/31/2017 05:26:27'
}
EpCodeChange>>asRevertedCodeChange [
	"Answer a code change that represents my inverse operation. For example, a class addition will answer a class removal."

	^ self accept: EpInverseVisitor new

]

{
	#category : #'*EpiceaBrowsers',
	#timestamp : ' 8/31/2017 05:26:27'
}
EpCodeChange>>previewedApplyEvents [

	^ self accept: EpApplyPreviewer new
]
