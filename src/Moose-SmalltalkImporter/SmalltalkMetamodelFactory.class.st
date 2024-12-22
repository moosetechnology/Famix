Class {
	#name : #SmalltalkMetamodelFactory,
	#superclass : #FMMetamodelFactory,
	#category : #'Moose-SmalltalkImporter'
}

{ #category : #accessing }
SmalltalkMetamodelFactory class >> defaultModel [
	^ FamixStModel
]

{ #category : #accessing }
SmalltalkMetamodelFactory >> access [

	^ self entityNamed: #Access
]

{ #category : #accessing }
SmalltalkMetamodelFactory >> anchor [

	^ self entityNamed: #PharoEntitySourceAnchor
]

{ #category : #accessing }
SmalltalkMetamodelFactory >> annotationInstance [ 

	^ self entityNamed: #AnnotationInstance
]

{ #category : #accessing }
SmalltalkMetamodelFactory >> annotationInstanceAttribute [

	^ self entityNamed: #AnnotationInstanceAttribute
]

{ #category : #accessing }
SmalltalkMetamodelFactory >> annotationType [

	^ self entityNamed: #AnnotationType
]

{ #category : #accessing }
SmalltalkMetamodelFactory >> annotationTypeAttribute [

	^ self entityNamed: #AnnotationTypeAttribute
]

{ #category : #accessing }
SmalltalkMetamodelFactory >> attribute [

	^ self entityNamed: #Attribute
]

{ #category : #accessing }
SmalltalkMetamodelFactory >> classEntity [

	^ self entityNamed: #Class
]

{ #category : #accessing }
SmalltalkMetamodelFactory >> comment [

	^ self entityNamed: #Comment
]

{ #category : #accessing }
SmalltalkMetamodelFactory >> entity [

	^ self entityNamed: #Entity
]

{ #category : #accessing }
SmalltalkMetamodelFactory >> globalVariable [

	^ self entityNamed: #GlobalVariable
]

{ #category : #accessing }
SmalltalkMetamodelFactory >> implicitVariable [

	^ self entityNamed: #ImplicitVariable
]

{ #category : #accessing }
SmalltalkMetamodelFactory >> inheritance [

	^ self entityNamed: #Inheritance
]

{ #category : #accessing }
SmalltalkMetamodelFactory >> invocation [

	^ self entityNamed: #Invocation
]

{ #category : #accessing }
SmalltalkMetamodelFactory >> localVariable [

	^ self entityNamed: #LocalVariable
]

{ #category : #accessing }
SmalltalkMetamodelFactory >> method [

	^ self entityNamed: #Method
]

{ #category : #accessing }
SmalltalkMetamodelFactory >> namedEntity [

	^ self entityNamed: #NamedEntity
]

{ #category : #accessing }
SmalltalkMetamodelFactory >> namespace [

	^ self entityNamed: #Namespace
]

{ #category : #accessing }
SmalltalkMetamodelFactory >> package [

	^ self entityNamed: #Package
]

{ #category : #accessing }
SmalltalkMetamodelFactory >> parameter [

	^ self entityNamed: #Parameter
]

{ #category : #accessing }
SmalltalkMetamodelFactory >> pharoAnchor [

	^ self entityNamed: #PharoAnchor
]

{ #category : #accessing }
SmalltalkMetamodelFactory >> reference [

	^ self entityNamed: #Reference
]

{ #category : #accessing }
SmalltalkMetamodelFactory >> sourceAnchor [

	^ self entityNamed: #SourceAnchor
]

{ #category : #accessing }
SmalltalkMetamodelFactory >> sourceLanguage [

	^ self entityNamed: #SourceLanguage
]

{ #category : #accessing }
SmalltalkMetamodelFactory >> sourceTextAnchor [

	^ self entityNamed: #SourceTextAnchor
]

{ #category : #accessing }
SmalltalkMetamodelFactory >> sourcedEntity [

	^ self entityNamed: #SourcedEntity
]

{ #category : #accessing }
SmalltalkMetamodelFactory >> typeDeclaration [

	^ self entityNamed: #TypeDeclaration
]

{ #category : #accessing }
SmalltalkMetamodelFactory >> unknownVariable [

	^ self entityNamed: #UnknownVariable
]
