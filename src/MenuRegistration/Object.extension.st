Extension {
	#name : #Object
}

{
	#category : #'*MenuRegistration-Core',
	#timestamp : ' 8/31/2017 05:26:13'
}
Object>>fallbackMenuOn: aMenuMorph [
	"When pragma menu building goes wrong, a fallback menu is created. To add custom items to that menu, override me in subclasses. See WorldState>>#fallbackMenuOn: for an example"
]
