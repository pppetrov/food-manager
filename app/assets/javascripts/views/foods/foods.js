App.Views.Foods = Backbone.View.extend({
    id: 'foods',

    initialize: function(options) {
        // this.collection = options.collection;
        this.render();
        this.listenTo(this.collection, "add", this.add);
        // _.each(this.collection.models, function(food) {
        //     this.add(food);
        // }.bind(this));
        this.collection.fetch();
    },
    
    render: function() {
        this.$el.html(JST['foods/foods']());
        var $parent = $(".recipe");
        $parent.append(this.$el);
    },

    add: function(food) {
        var view = new App.Views.Food({model: food});
        view.render();
        $("#foods-list").append(view.$el);
    }
});
