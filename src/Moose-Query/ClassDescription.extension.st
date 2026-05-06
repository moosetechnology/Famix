Extension { #name : 'ClassDescription' }

{ #category : '*Moose-Query' }
ClassDescription >> asMetadescription [
	"In case you have created your own subclass of MooseEntity, and #asMetadescription returns nil, you may want to do 'MooseModel resetMeta'. Naturally, you need to have the proper annotation on the class side of your class. "

	^ self instanceSide metamodel
		  ifNotNil: [ :mm | mm fmTypeOf: self instanceSide ]
		  ifNil: [ FM3NullClass new ]
]
