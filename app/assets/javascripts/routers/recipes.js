App.Routers.Recipes = Backbone.Router.extend({

    initialize: function(options) {
        
        this.el = $("#recipes");
        this.collection = options.collection;

        // $("#container").on('click', 'a:not([data-bypass])', function (evt) {

        //     var href = $(this).attr('href');
        //     var protocol = this.protocol + '//';

        //     if (href.slice(protocol.length) !== protocol) {
        //         evt.preventDefault();
        //         App.router.navigate(href, true);
        //     }
        // });
        
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
        var view = new App.Views.RecipeNew();
    },

    show: function(id) {
        
    }
});
