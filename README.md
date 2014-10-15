$bx: Jasmine spies DSL
==================================

Smooth and easy DSL to describe Jasmine spies

```coffee
describe '...', ->
  ...

    $radio =    broadcast:  $bx().spy()
    rest =      logout:     $bx().spy -> RSVP.defer()
    modal =                 $bx().spy()
    $storage =              $bx().spies 'get', 'set', 'isExist', 'remove'
    $window =               _.extend $bx().spies('addEventListener', 
                                                 'removeEventListener'),
                              open: $bx().spy ->
                                focus: $bx().spy()
                                close: $bx().spy()

    $bx().register
      $q: RSVP
      $window:    $window
      $radio:     $radio
      rest:       rest
      modal:      modal
      $storage:   $storage

  ...
    expect($radio.broadcast.callCount).to.equal 0
    rest.logout.$bxResult.resolve()
    expect($window.open.$bxResult.focus.callCount).equal 1  
```

```coffee
describe '...', ->
  $modal =  $bx().spy -> $bx().spies 'hide', 'show'

  $bx().register
    $modal: $modal

```

```coffee
describe '...', ->
  $location =   $bx().spies 'url'
  $rootScope =  $bx().spies '$on'

  $bx().register
    $rootScope: $rootScope
    $location:  $location
```
