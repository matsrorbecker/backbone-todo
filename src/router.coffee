class window.TodoApp extends Backbone.Router

    initialize: =>
        @todoItems = new TodoItems()
        @todosView = new TodosView({ collection: @todoItems })
        @todosView.render()

        $('.btn-clear').click (e) =>
            @todosView.filterCompleted()

        $('.btn-success').click (e) =>
            @todoItems.create({ val: $('#newTodo').val(), completed: false })
            $('#newTodo').val('')

    routes:
        '': 'index'

    index: =>
        $('#app').html(@todosView.el)
        @todoItems.fetch()

    start: ->
        Backbone.history.start()
