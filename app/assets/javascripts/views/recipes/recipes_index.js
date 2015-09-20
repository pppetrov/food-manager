App.Views.RecipesIndex = Backbone.View.extend({
    initialize: function() {
        this.render();
    },

    render: function() {
        this.$el.html(JST['recipes/index']());
        $("#recipes").append(this.$el);
    }
});
