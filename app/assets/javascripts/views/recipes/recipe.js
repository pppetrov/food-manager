App.Views.Recipe = Backbone.View.extend({
    model: App.Models.Recipe,
    
    tagName: 'li',

    events: {
        "click": "show"
    },
    
    initialize: function() {
        this.listenTo(this.model, "change", this.render);
    },

    render: function() {
        var html = JST['recipes/summary'](this.model.attributes);
        this.$el.html(html);
    },

    show: function() {
        App.router.navigate("recipes/" + this.model.get("id"), true);
    }
});
