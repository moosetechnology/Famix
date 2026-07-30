Extension { #name : 'Class' }

{ #category : '*Famix-MetamodelBuilder-Core' }
Class >> customTraitNames [
	^ self traits reject: #isMetamodelEntity thenCollect: #name
]

{ #category : '*Famix-MetamodelBuilder-Core' }
Class >> generatedSlots [
	^ self localSlots select: #isFameSlot
]
