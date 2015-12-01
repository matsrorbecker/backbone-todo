class window.TodoView extends Backbone.View

    initialize: =>
        @model.on('change', @render, this)

    events:
        'change input[type=checkbox]': 'toggle'
        'change .form-control': 'update'
        'click .btn-danger': 'remove'

    toggle: =>
        @model.toggle()

    update: =>
        @model.updateText(this.$('.form-control').val())

    remove: =>
        @model.destroy()

    template: _.template($("#item-template").html())

    render: =>
        this.$el.html(@template(@model.toJSON()))
        return this

    className: 'input-group input-group-lg'

class window.TodosView extends Backbone.View

    initialize: =>
        @collection.on('add', @addOne, this)
        @collection.on('reset', @addAll, this)
        @collection.on('destroy', @render, this)

    addOne: (todoItem) =>
        todoView = new TodoView({ model: todoItem })
        this.$el.append(todoView.render().el)

    addAll: =>
        this.$el.empty()
        @collection.forEach(@addOne, this)

    render: =>
        @addAll()
        return this

    filterCompleted: =>
        @collection.filterCompleted()
        @render()