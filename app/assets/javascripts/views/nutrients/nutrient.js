App.Views.Nutrient = Backbone.View.extend({
    model: App.Models.Nutrient,

    tagName: 'li',

    initialize: function() {
        this.listenTo(this.model, 'change', this.render);
    },

    render: function() {
        var html = JST['nutrients/nutrient'](this.model.attributes);
        this.$el.html(html);
    }
});



