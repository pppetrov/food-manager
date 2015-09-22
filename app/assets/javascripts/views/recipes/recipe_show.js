App.Views.RecipeShow = Backbone.View.extend({

    model: App.Models.Recipe,

    className: 'recipe',

    initialize: function() {
        this.render();
        this.model.fetchFoods();
        this.model.fetchNutrients();
        var foodsView = new App.Views.Foods({collection: this.model.foods});
        var nutrientsView = new App.Views.Nutrients({collection: this.model.nutrients});
    },

    render: function() {
        this.$el.html(JST['recipes/show'](this.model.attributes));
        var $parent = $("#container");
        $parent.empty();
        $parent.append(this.$el);
    }
});
