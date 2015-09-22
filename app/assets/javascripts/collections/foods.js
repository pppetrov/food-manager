App.Collections.Foods = Backbone.Collection.extend({
    model: App.Models.Food,

    initialize: function(options) {
        this.url = options.url;
        this.fetch();
    }
});
