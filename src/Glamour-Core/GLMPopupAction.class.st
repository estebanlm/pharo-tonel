"

"
Class {
	#name : #GLMPopupAction,
	#superclass : #GLMAction,
	#category : #Glamour-Core,
	#timestamp : ''
}

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPopupAction>>popupActOn: aPresentation from: aButton [

	GLMPopupActionBrick new
		closer: (GLMPopupBrickCloser predicate: GLMPopupBrickOutisideClickPredicate new);
		onCreated: [ :popup |self action glamourValueWithArgs: (Array 
				with: aPresentation 
				withAll: { aPresentation entity . popup }) ];
		openOn: aButton;
		beRightToLeftWithOffset: 0
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPopupAction>>renderGlamorouslyOn: aRenderer [
	^aRenderer renderPopupAction: self
]
