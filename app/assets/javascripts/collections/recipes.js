var Recipes = Backbone.Collection.extend({
    model: Recipe,
    url: '/api/v1/users/1/recipes'
});
