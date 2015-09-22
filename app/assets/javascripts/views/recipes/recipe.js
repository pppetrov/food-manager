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
        if (!this.model.foods) {
            this.model.foods = new App.Collections.Foods({url: '/api/v1/recipes/' + this.model.get("id") + '/foods'});
            this.model.foods.fetch();
        }
        if (!this.model.nutrients) {
            this.model.nutrients = new App.Collections.Nutrients({url: '/api/v1/recipes/' + this.model.get("id") + '/nutrients'});
            this.model.nutrients.fetch();
        }
        App.router.navigate("recipes/" + this.model.get("id"), true);
    }
});
