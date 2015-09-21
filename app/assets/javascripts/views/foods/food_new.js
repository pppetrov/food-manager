App.Views.FoodNew = Backbone.View.extend({
    tagName: 'li',

    initialize: function(options) {
        var that = this;
        $.ajax({
            method: "GET",
            url: "/api/v1/foods/" + options.id + "/weights",
            success: function(weights) {
                that.$el.html(JST['foods/new']({weights: weights, name: options.name}));
                $(".selected-foods").append(that.$el);
            }
        });
    }
});
