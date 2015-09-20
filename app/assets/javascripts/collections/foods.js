App.Collections.Foods = Backbone.Collection.extend({
    model: App.Models.Food,
    url: '/api/v1/foods'
});
