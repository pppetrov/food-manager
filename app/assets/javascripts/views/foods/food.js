App.Views.Food = Backbone.View.extend({
    model: App.Models.Food,

    tagName: 'li',

    initialize: function() {
        this.listenTo(this.model, 'change', this.render);
    },

    render: function() {
        var html = JST['foods/food'](this.model.attributes);
        this.$el.html(html);
    }
});
