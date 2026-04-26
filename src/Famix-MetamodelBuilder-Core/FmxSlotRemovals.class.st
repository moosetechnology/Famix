"
Description
--------------------

I represent a the removal of slots from a class when updating an already generated metamodel.

The slot removal is also managed in `FmxBehavioralAddition`, but if we do not do it before, we might end up with a duplicated slot in a hierarchy. So we first remove slots to remove and then we update the hierarchy.
"
Class {
	#name : 'FmxSlotRemovals',
	#superclass : 'FmxCodeChange',
	#instVars : [
		'slots'
	],
	#category : 'Famix-MetamodelBuilder-Core-Changes',
	#package : 'Famix-MetamodelBuilder-Core',
	#tag : 'Changes'
}

{ #category : 'accessing' }
FmxSlotRemovals class >> priority [
	"Slots are romevd after methods. They should happen before class addition or update, else we could have duplicated slots."

	^ 2
]

{ #category : 'instance creation' }
FmxSlotRemovals class >> slots: aCollection [

	^ self new
		  slots: aCollection;
		  yourself
]

{ #category : 'accessing' }
FmxSlotRemovals >> apply [

	slots do: [ :e | e owningClass removeInstVarNamed: e name  ]
]

{ #category : 'accessing' }
FmxSlotRemovals >> slots [

	^ slots
]

{ #category : 'accessing' }
FmxSlotRemovals >> slots: anObject [

	slots := anObject
]
