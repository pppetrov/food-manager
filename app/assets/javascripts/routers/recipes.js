App.Routers.Recipes = Backbone.Router.extend({

    initialize: function(options) {
        this.el = $("#container");
        this.collection = options.collection;
    },

    routes: {
        "": "index",
        "new": "newRecipe",
        "recipes/:id" : "show"
    },

    index: function() {
        var view = new App.Views.RecipesIndex({collection: this.collection});
    },

    newRecipe: function() {
        var view = new App.Views.RecipeNew({collection: this.collection});
    },

    show: function(id) {
    }
});
