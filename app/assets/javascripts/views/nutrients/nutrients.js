App.Views.Nutrients = Backbone.View.extend({
    id: 'nutrients',

    initialize: function(options) {
        // this.collection = options.collection;
        this.render();
        this.listenTo(this.collection, "add", this.add);
        // _.each(this.collection.models, function(nutrient) {
        //     this.add(nutrient);
        // }.bind(this));
        this.collection.fetch();
    },

    render: function() {
        this.$el.html(JST['nutrients/nutrients']());
        var $parent = $(".recipe");
        $parent.append(this.$el);
    },

    add: function(nutrient) {
        var view = new App.Views.Nutrient({model: nutrient});
        view.render();
        $("#nutrients-list").append(view.$el);
    }
});
