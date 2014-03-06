(function() {
  var __hasProp = Object.prototype.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; };

  define(['baseModel'], function(BaseModel) {
    var ImageModel;
    return ImageModel = (function(_super) {

      __extends(ImageModel, _super);

      function ImageModel(opt) {
        var k, model, v;
        BaseModel.init(this);
        model = this;
        this.type = 'image';
        if (typeof opt === 'string') {
          this.content = opt;
        } else {
          for (k in opt) {
            v = opt[k];
            this[k] = v;
          }
        }
      }

      return ImageModel;

    })(BaseModel);
  });

}).call(this);
