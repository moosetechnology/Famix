Extension { #name : #ClassDescription }

{ #category : #'*Moose-Core' }
ClassDescription >> asMooseDescription [

	"
	In case you have created your own subclass of MooseEntity, and #asMooseDescription returns nil, you may want to do 'MooseModel resetMeta'. Naturally, you need to have the proper annotation on the class side of your class. 
	"

	^ self instanceSide metamodel
		  ifNotNil: [ :mm | mm fmTypeOf: self instanceSide ]
		  ifNil: [ FM3NullClass new ]
]
