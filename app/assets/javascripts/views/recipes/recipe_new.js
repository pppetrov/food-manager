App.Views.RecipeNew = Backbone.View.extend({
    tagName: 'form',
    id: 'new-recipe',

    events: {
        "click .back": "clear",
        "keyup": "suggest"
    },

    initialize: function(options) {
        this.render();
    },

    render: function() {
        this.$el.html(JST['recipes/new']());
        $("#recipes").prepend(this.$el);
    },

    clear: function() {
        this.$el.remove();
    },

    suggest: function(el) {
        $.ajax({
            method: "POST",
            url: "/api/v1/foods/search",
            dataType: "json",
            data: {"query": this.$("#query").val()},
            success: function(data) {
                $("#foods").empty();
                data.forEach(function(e) {
                    var $sugg = $("<option>",{value: e.long_desc});
                    $("#foods").append($sugg);
                });
            },

            failiure: function() {

            }
        });
    }
});
