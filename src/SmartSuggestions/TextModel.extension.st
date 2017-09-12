Extension { #name : #TextModel }

{ #category : #'*SmartSuggestions' }
TextModel >> sugsContext [
	^ SugsMessageBrowserContext model: self.
]
