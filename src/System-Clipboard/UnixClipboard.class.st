"
The Unix vm does not do line-ending conversion, thus this subclass which specifies we convert CR's to LF's when pasting to it
"
Class {
	#name : #UnixClipboard,
	#superclass : #Clipboard,
	#category : #System-Clipboard,
	#timestamp : 'HenrikSperreJohansen 1/28/2011 15:15'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
UnixClipboard>>clipboardText: text  [

        | string |
        string := text asString.
        self noteRecentClipping: text asText copyWithoutExternalReferences.
        contents := text asText  copyWithoutExternalReferences.
        string := string convertToWithConverter: UTF8TextConverter new.
        string := string replaceAll: 13 asCharacter with: 10 asCharacter.
        self primitiveClipboardText: string.
]
