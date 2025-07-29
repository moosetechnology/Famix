Class {
	#name : 'MooseEntityAnnouncement',
	#superclass : 'Announcement',
	#instVars : [
		'entity'
	],
	#category : 'Moose-Core',
	#package : 'Moose-Core'
}

{ #category : 'accessing' }
MooseEntityAnnouncement >> entity [
	^ entity
]

{ #category : 'accessing' }
MooseEntityAnnouncement >> entity: anObject [
	entity := anObject
]
