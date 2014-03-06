(function() {
  var __hasProp = Object.prototype.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; };

  define(['baseModel', 'jquery'], function(BaseModel, $) {
    var CarpetModel;
    return CarpetModel = (function(_super) {

      __extends(CarpetModel, _super);

      function CarpetModel(x, y) {
        var model;
        BaseModel.init(this);
        model = this;
        this.type = 'carpet';
        if (x) {
          this.x = x;
        } else {
          this.x = 100;
        }
        if (y) {
          this.y = y;
        } else {
          this.y = 75 / 85 * 100;
        }
        this.color = "#ffffff";
        this.colorComponents = BaseModel.hexToRGB(this.color);
        this.updateColorFromHex = BaseModel.updateColorFromHex;
        this.updateColorFromSlider = BaseModel.updateColorFromSlider;
        this.width = function() {
          return this.x + '%';
        };
        this.height = function() {
          return this.y + '%';
        };
      }

      return CarpetModel;

    })(BaseModel);
  });

}).call(this);
