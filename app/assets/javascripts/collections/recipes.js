App.Collections.Recipes = Backbone.Collection.extend({
    model: App.Models.Recipe,
    url: '/api/v1/recipes'

});
