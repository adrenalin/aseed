(function() {

  define([], function() {
    var BaseModel;
    return BaseModel = (function() {

      function BaseModel() {
        BaseModel.init(this);
      }

      BaseModel.init = function(obj) {
        var model;
        obj.id = Math.floor(Math.random() * 10000);
        obj.x = 0;
        obj.y = 0;
        obj.scale = 1;
        obj.scaleMin = 0.1;
        obj.scaleMax = 20;
        obj.scaleStep = 0.1;
        obj.scalePrecision = 1;
        obj.rotate = 0;
        obj.rotateMin = 0;
        obj.rotateMax = 360;
        obj.rotateStep = 1;
        obj.rotatePrecision = 0;
        obj.opacity = 100;
        obj.content = '';
        obj.color = '#ffffff';
        obj.colorMin = 0;
        obj.colorMax = 0;
        obj.colorComponents = {
          r: BaseModel.hexToRGB(obj.color).r,
          g: BaseModel.hexToRGB(obj.color).r,
          b: BaseModel.hexToRGB(obj.color).g
        };
        obj.z_index = 1;
        obj.getColor = function() {
          return obj.rgbToHex(this.colorComponents.r, this.colorComponents.g, this.colorComponents.b);
        };
        obj.rgbToHex = function(r, g, b) {
          return BaseModel.rgbToHex(r, g, b);
        };
        obj.getRelative = function(model) {
          switch (model) {
            case 'rotate':
              return (100 * obj[model] / obj.rotateMax) + '%';
            case 'scale':
              return (100 * obj[model] / obj.scaleMax) + '%';
            case 'r':
              return (100 * obj.colorComponents[model] / 255) + '%';
            case 'g':
              return (100 * obj.colorComponents[model] / 255) + '%';
            case 'b':
              return (100 * obj.colorComponents[model] / 255) + '%';
            default:
              return obj[model] + '%';
          }
        };
        return model = obj;
      };

      BaseModel.rgbToHex = function(r, g, b) {
        var originals, parts, str;
        if (typeof r.r !== 'undefined' && typeof r.g !== 'undefined' && typeof r.b !== 'undefined') {
          return BaseModel.rgbToHex(r.r, r.g, r.b);
        }
        originals = {
          r: r,
          g: g,
          b: b
        };
        r = Number(r).toString(16);
        g = Number(g).toString(16);
        b = Number(b).toString(16);
        if (r === '0') r = '00';
        if (g === '0') g = '00';
        if (b === '0') b = '00';
        if (r.length < 2) r = '0' + String(r);
        if (g.length < 2) g = '0' + String(g);
        if (b.length < 2) b = '0' + String(b);
        parts = [r, g, b];
        str = '#' + parts.join('');
        return str;
      };

      BaseModel.hexToRGB = function(hex) {
        var rval;
        if (!hex.match(/^#?[0-9a-fA-F]{6}$/)) {
          throw new Error('Input not hex formatted');
        }
        rval = {
          r: parseInt(hex.substr(1, 2), 16),
          g: parseInt(hex.substr(3, 2), 16),
          b: parseInt(hex.substr(5, 2), 16)
        };
        if (hex.substr(5, 2)) {
          rval.a = parseInt(hex.substr(5, 2), 16);
        } else {
          rval.a = 1;
        }
        return rval;
      };

      BaseModel.updateColorFromHex = function() {
        var color;
        if (!this.color.match(/^#/)) this.color = '#' + this.color;
        try {
          color = BaseModel.hexToRGB(this.color);
        } catch (error) {
          return;
        }
        return this.colorComponents = color;
      };

      BaseModel.updateColorFromSlider = function() {
        return this.color = BaseModel.rgbToHex(this.colorComponents);
      };

      return BaseModel;

    })();
  });

}).call(this);
