"
A basic Roassal backend for FamixUMLDocumentor
"
Class {
	#name : #FamixUMLRoassalBackend,
	#superclass : #FamixUMLAbstractBackend,
	#instVars : [
		'canvas'
	],
	#category : #'Famix-UMLDocumentor-Backend'
}

{ #category : #accessing }
FamixUMLRoassalBackend >> canvas [

	^canvas 
]

{ #category : #api }
FamixUMLRoassalBackend >> export: famixUMLEntities [
	"note: formating is described in #modelDescriptor:"
	| builder |

	builder := RSUMLClassBuilder new.
	builder modelDescriptor: (FamixUMLRoassalDescriptor new umlModel: famixUMLEntities ; yourself).

	builder classes: (famixUMLEntities select: [:e | e class = FamixUMLClass]).
	builder build.

	canvas := builder canvas.
	^canvas
]
