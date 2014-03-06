(function() {
  var __hasProp = Object.prototype.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; };

  define(['baseModel'], function(BaseModel) {
    var TextModel;
    return TextModel = (function(_super) {

      __extends(TextModel, _super);

      function TextModel(opt) {
        var k, model, v;
        BaseModel.init(this);
        model = this;
        this.x = 0.25;
        this.y = 0.2;
        this.type = 'text';
        this.family = null;
        this.style = 'normal';
        this.weight = 400;
        this.align = 'left';
        this.updateColorFromHex = BaseModel.updateColorFromHex;
        this.updateColorFromSlider = BaseModel.updateColorFromSlider;
        if (typeof opt === 'string') {
          this.content = opt;
        } else {
          for (k in opt) {
            v = opt[k];
            this[k] = v;
          }
        }
      }

      return TextModel;

    })(BaseModel);
  });

}).call(this);
