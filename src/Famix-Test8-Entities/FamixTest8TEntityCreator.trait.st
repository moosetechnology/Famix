"
This trait is used by Famix models.
It provides an API for creating entities and adding them to the model.
"
Trait {
	#name : #FamixTest8TEntityCreator,
	#category : #'Famix-Test8-Entities-Model'
}

{ #category : #meta }
FamixTest8TEntityCreator classSide >> annotation [

	<FMClass: #TEntityCreator super: #Object>
	<package: #'Famix-Test8-Entities'>
	<generated>
	^ self
]

{ #category : #'entity creation' }
FamixTest8TEntityCreator >> newAnimal [

	<generated>
	^ self add: FamixTest8Animal new
]

{ #category : #'entity creation' }
FamixTest8TEntityCreator >> newBacteria [

	<generated>
	^ self add: FamixTest8Bacteria new
]

{ #category : #'entity creation' }
FamixTest8TEntityCreator >> newBiotope [

	<generated>
	^ self add: FamixTest8Biotope new
]

{ #category : #'entity creation' }
FamixTest8TEntityCreator >> newInfection [

	<generated>
	^ self add: FamixTest8Infection new
]

{ #category : #'entity creation' }
FamixTest8TEntityCreator >> newLivingBeing [

	<generated>
	^ self add: FamixTest8LivingBeing new
]

{ #category : #'entity creation' }
FamixTest8TEntityCreator >> newPlant [

	<generated>
	^ self add: FamixTest8Plant new
]

{ #category : #'entity creation' }
FamixTest8TEntityCreator >> newResidence [

	<generated>
	^ self add: FamixTest8Residence new
]

{ #category : #'entity creation' }
FamixTest8TEntityCreator >> newVirus [

	<generated>
	^ self add: FamixTest8Virus new
]
