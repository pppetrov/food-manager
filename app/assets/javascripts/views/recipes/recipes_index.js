App.Views.RecipesIndex = Backbone.View.extend({

    id: 'recipes',
    
    initialize: function() {
        this.render();
        this.listenTo(this.collection, "add", this.add);
        _.each(this.collection.models, function(recipe) {
            this.add(recipe);
        }.bind(this));
    },

    render: function() {
this.$el.html(JST['recipes/index']());
        var $parent = $("#container");
        $parent.empty();
        $parent.append(this.$el);
    },

    add: function(recipe) {
        var view = new App.Views.Recipe({model: recipe});
        view.render();
        $("#recipe-list").append(view.$el);
    }
});
