App.Collections.Nutrients = Backbone.Collection.extend({
    model: App.Models.Nutrient,

    initialize: function(options) {
        this.url = options.url;
    }
});
