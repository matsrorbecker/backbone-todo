class window.TodoItem extends Backbone.Model

    toggle: =>
        @save({ completed: !@get('completed') })

    updateText: (text) =>
        @set('val', text)

class window.TodoItems extends Backbone.Collection

    model: TodoItem

    localStorage: new Store('backbone-todo')

    initialize: =>
        @on('destroy', @removeElement, this)

    removeElement: (model) =>
        @remove(model)

    filterCompleted: =>
        @remove @filter (item) ->
            item.get('completed')

