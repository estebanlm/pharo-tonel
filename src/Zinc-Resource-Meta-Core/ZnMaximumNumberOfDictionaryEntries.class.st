"
I am ZnMaximumNumberOfDictionaryEntries.
I am a DynamicVariable and a ProcessSpecificVariable.

I am used to control the maximum number of entries being added to a limited ZnMultiValueDictionary.

Used by ZnMultiValueDictionary and thus for reading headers,  url query and application form url encoded entity fields. This helps to protect us from malicious content.

"
Class {
	#name : #ZnMaximumNumberOfDictionaryEntries,
	#superclass : #DynamicVariable,
	#category : #Zinc-Resource-Meta-Core,
	#timestamp : 'SvenVanCaekenberghe 5/10/2017 16:47'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
ZnMaximumNumberOfDictionaryEntries>>default [
	"The default maximum number dictionary entries to accept."
	
	^ 256
]
