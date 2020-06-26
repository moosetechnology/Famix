Class {
	#name : #FmxMBPropertyNameIsReserved,
	#superclass : #Error,
	#category : #'Famix-MetamodelBuilder-Core-Implementation'
}

{ #category : #accessing }
FmxMBPropertyNameIsReserved >> messageText [
	<ignoreForCoverage>
	^ String
		streamContents: [ :stream |
			stream << 'Properties cannot have this name: '.
			self receiver builder reservedKeywords
				do: [ :keyword | 
					stream
						<< '''';
						<< keyword;
						<< '''' ]
				separatedBy: [ stream space ] ]
]
