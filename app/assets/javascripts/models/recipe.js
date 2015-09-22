App.Models.Recipe = Backbone.Model.extend({
    url: '/api/v1/recipes',

    fetchFoods: function() {
        if (!this.foods) {
            this.foods = new App.Collections.Foods({url: '/api/v1/recipes/' + this.get("id") + '/foods'});
            this.foods.fetch();
        } 
    },

    fetchNutrients: function() {
        if (!this.nutrients) {
            this.nutrients = new App.Collections.Nutrients({url: '/api/v1/recipes/' + this.get("id") + '/nutrients'});
            this.nutrients.fetch();
        }
    }
});
