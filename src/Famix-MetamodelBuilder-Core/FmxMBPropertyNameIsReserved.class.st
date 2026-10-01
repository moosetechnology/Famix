Class {
	#name : #FmxMBPropertyNameIsReserved,
	#superclass : #Error,
	#category : #'Famix-MetamodelBuilder-Core-Exception'
}

{ #category : #accessing }
FmxMBPropertyNameIsReserved >> messageText [

	<ignoreForCoverage>
	^ String streamContents: [ :stream | stream << 'Properties cannot have this name' ]
]
