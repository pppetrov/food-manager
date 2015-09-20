var App = {
    Models: {},
    Collections: {},
    Views: {},
    Routers: {},
    
    initialize: function(data) {
        this.recipes = new App.Collections.Recipes(data.recipes);
        this.router = new App.Routers.Recipes({collection: this.recipes}); 
        Backbone.history.start();
    }
};
