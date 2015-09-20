App.Collections.Nutrients = Backbone.Collection.extend({
    model: App.Models.Nutrient,
    url: 'api/v1/nutrients'
});
