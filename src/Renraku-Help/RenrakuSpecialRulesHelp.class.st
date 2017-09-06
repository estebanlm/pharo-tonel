"
There are certain special rules with predefined functionality that allows to easily perform complex checks. The subsections of this Book contain references to the rules
"
Class {
	#name : #RenrakuSpecialRulesHelp,
	#superclass : #RenrakuRuleCreationHelp,
	#category : #Renraku-Help,
	#timestamp : 'YuriyTymchuk 7/10/2016 15:59'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:45'
}
RenrakuSpecialRulesHelp class>>bookDescription [
	^ 'There are certain special rules with predefined functionality that allows to easily perform complex checks. The subsections of this Book contain references to the rules'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:45'
}
RenrakuSpecialRulesHelp class>>bookName [

	^ 'Special Rules'
]

{
	#category : #pages,
	#timestamp : ' 8/31/2017 05:26:45'
}
RenrakuSpecialRulesHelp class>>matchRules [

	^ self topicForClass: ReNodeMatchRule
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:45'
}
RenrakuSpecialRulesHelp class>>pages [
	^ #(matchRules rewriteRules)
]

{
	#category : #pages,
	#timestamp : ' 8/31/2017 05:26:45'
}
RenrakuSpecialRulesHelp class>>rewriteRules [

	^ self topicForClass: ReNodeRewriteRule
]
