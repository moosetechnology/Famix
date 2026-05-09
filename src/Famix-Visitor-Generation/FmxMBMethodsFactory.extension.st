Extension { #name : 'FmxMBMethodsFactory' }

{ #category : '*Famix-Visitor-Generation' }
FmxMBMethodsFactory class >> acceptFor: aName [

	^ 'accept: aVisitor

	<generated>
	^ aVisitor visit{1}: self' format: { aName }
]

{ #category : '*Famix-Visitor-Generation' }
FmxMBMethodsFactory class >> visitBehavioral: aBehavioral [

	^ String streamContents: [ :aStream |
			  aStream << ('visit{1}: a{1}

	<generated>
' format: { aBehavioral fullName }).

			  aBehavioral behaviorsToVisit
				  do: [ :behavior |
						  aStream << ('	self visit{1}: a{2}' format: {
										   behavior fullName.
										   aBehavioral fullName }) ]
				  separatedBy: [
						  aStream
							  << '.';
							  cr ];
				  ifNotEmpty: [
						  aBehavioral relations ifNotEmpty: [
								  aStream
									  << $.;
									  cr;
									  cr ] ].
			  aBehavioral relations
				  do: [ :relation |
						  aStream << ('	self visit{1}: a{2} {3}' format: {
								   (relation isOne
									    ifTrue: [ 'Entity' ]
									    ifFalse: [ 'Collection' ]).
								   aBehavioral fullName.
								   relation name }) ]
				  separatedBy: [
						  aStream
							  << $.;
							  cr ] ]
]

{ #category : '*Famix-Visitor-Generation' }
FmxMBMethodsFactory class >> visitCollection [

	^ 'visitCollection: aCollection

	<generated>
	^ aCollection collect: [ :each | each accept: self ]'
]

{ #category : '*Famix-Visitor-Generation' }
FmxMBMethodsFactory class >> visitEntity [

	^ 'visitEntity: aFamixEntity

	<generated>
	^ aFamixEntity ifNotNil: [ aFamixEntity accept: self ]'
]
