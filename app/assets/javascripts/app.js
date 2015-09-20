var App = {
    Models: {},
    Collections: {},
    Views: {},
    Routers: {},
    initialize: function() {
        new App.Routers.Recipes();
        Backbone.history.start();
    }
};
