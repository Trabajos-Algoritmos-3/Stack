!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:29:55'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:01'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:09'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:48'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:20'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:24'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'fj 6/6/2021 18:43:58'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ].
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!


!classDefinition: #NullStackElement category: 'Stack-Exercise'!
Object subclass: #NullStackElement
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!NullStackElement methodsFor: 'as yet unclassified' stamp: 'fj 6/6/2021 18:31:13'!
isEmpty
	^true.! !

!NullStackElement methodsFor: 'as yet unclassified' stamp: 'fj 6/6/2021 18:30:34'!
pop
	^self error: OOStack stackEmptyErrorDescription.! !

!NullStackElement methodsFor: 'as yet unclassified' stamp: 'fj 6/6/2021 18:30:54'!
top
	^self error: OOStack stackEmptyErrorDescription.! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'elementOnTop size'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'as yet unclassified' stamp: 'fj 6/6/2021 18:49:08'!
increaseSize.
	size := size +1.
	! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'fj 6/6/2021 18:32:33'!
isEmpty
	^elementOnTop isEmpty .! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'fj 6/6/2021 18:49:34'!
pop
	| topElement nextTopElement |
	topElement := elementOnTop pop.
	nextTopElement := elementOnTop next.
	elementOnTop := nextTopElement.
	self reduceSize .
	^topElement .! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'fj 6/6/2021 18:49:41'!
push: anElement
	|newTopElement|
	newTopElement := StackElement with: anElement followedBy: elementOnTop.
	elementOnTop := newTopElement .
	self increaseSize .
	! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'fj 6/6/2021 18:49:23'!
reduceSize
	size := size -1.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'fj 6/6/2021 18:42:00'!
size
	^size.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'fj 6/6/2021 18:33:12'!
top
	^elementOnTop top.! !


!OOStack methodsFor: 'initialization' stamp: 'fj 6/6/2021 18:40:57'!
initialize
	elementOnTop := NullStackElement new.
	size := 0.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!


!classDefinition: #StackElement category: 'Stack-Exercise'!
Object subclass: #StackElement
	instanceVariableNames: 'value nextStackElement'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StackElement methodsFor: 'as yet unclassified' stamp: 'fj 6/6/2021 18:40:02'!
initializeWith: anElement followedBy: elementOnTop
	value := anElement.
	nextStackElement := elementOnTop.! !

!StackElement methodsFor: 'as yet unclassified' stamp: 'fj 6/6/2021 18:31:47'!
isEmpty
	^false.! !

!StackElement methodsFor: 'as yet unclassified' stamp: 'fj 6/6/2021 18:40:35'!
next
	^nextStackElement .! !

!StackElement methodsFor: 'as yet unclassified' stamp: 'fj 6/6/2021 18:32:06'!
pop
	^value.! !

!StackElement methodsFor: 'as yet unclassified' stamp: 'fj 6/6/2021 18:32:15'!
top
	^value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'StackElement class' category: 'Stack-Exercise'!
StackElement class
	instanceVariableNames: ''!

!StackElement class methodsFor: 'as yet unclassified' stamp: 'fj 6/6/2021 18:38:58'!
with: anElement followedBy: elementOnTop.
	^self new initializeWith: anElement followedBy: elementOnTop .! !
