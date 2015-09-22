App.Views.RecipeNew = Backbone.View.extend({

    tagName: 'form',
    id: 'new-recipe',

    events: {
        "click .back": "clear",
        "keyup": "suggest",
        "click #add": "add",
        "click #create": "create"
    },

    initialize: function(options) {
        this.collection = options.collection;
        this.render();
    },

    render: function() {
        this.$el.html(JST['recipes/new']());
        var $parent = $("#container");
        $parent.empty();
        $parent.append(this.$el);
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
                    var $sugg = $("<option>",{value: e.long_desc, data_id: e.id});
                    $("#foods").append($sugg);
                });
            },

            failiure: function() {
            }
        });
    },

    add: function(event){
        event.preventDefault();
        var val = $("#query").val();
        var match = _.findWhere($("option"), {value: val});
        var name = $(match).attr("value");
        var id = parseInt($(match).attr("data_id"));
        new App.Views.FoodNew({id: id, name: name});
        $("#query").val("");
    },

    create: function(event) {
        event.preventDefault();
        var food_joins = _.map($("li"), function(el){
            return {
                food_id: el.id,
                weight_id: $(".weights", el).val(),
                amount: $(".food", el).val()
            };
        });
        var newRecipe = new App.Models.Recipe({
            name: $("input[name='name']").val(),
            recipe_food_joins: food_joins
        });
        
        newRecipe.save(null, {
            success: function() {
                this.collection.add(newRecipe);
                App.router.navigate("", {trigger: true});
            }.bind(this)
        });


    }
});
