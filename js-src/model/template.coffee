define ['model', 'model/user'], (Model, User) ->
  class template extends Model
    # Expose subclasses
    _namespace:
      'User': User
    _fields:
      id:
        type: 'Number'
        default: null
      name:
        type: 'String'
        default: ''
      user:
        type: 'User'
        default: new User
      users:
        type: 'Array:User'
        default: []