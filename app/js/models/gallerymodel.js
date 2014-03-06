(function() {

  define(['jquery'], function($) {
    var GalleryModel;
    return GalleryModel = (function() {

      function GalleryModel(mainpage) {
        var i, images, _ref;
        if (mainpage) {
          mainpage = true;
        } else {
          mainpage = false;
        }
        images = [
          {
            thumbnail: 'app/images/gallery/thumbnail_benetton.jpg',
            preview: 'app/images/gallery/preview_benetton.jpg',
            url: 'app/images/gallery/benetton.jpg',
            guid: 'benetton.jpg',
            mainpage: false
          }, {
            thumbnail: 'app/images/gallery/thumbnail_cafeteria.jpg',
            preview: 'app/images/gallery/preview_cafeteria.jpg',
            url: 'app/images/gallery/cafeteria.jpg',
            guid: 'cafeteria.jpg',
            mainpage: true
          }, {
            thumbnail: 'app/images/gallery/thumbnail_finlandiatalo.jpg',
            preview: 'app/images/gallery/preview_finlandiatalo.jpg',
            url: 'app/images/gallery/finlandiatalo.jpg',
            guid: 'finlandiatalo.jpg',
            mainpage: false
          }, {
            thumbnail: 'app/images/gallery/thumbnail_kerava-2.jpg',
            preview: 'app/images/gallery/preview_kerava-2.jpg',
            url: 'app/images/gallery/kerava-2.jpg',
            guid: 'kerava-2.jpg',
            mainpage: true
          }, {
            thumbnail: 'app/images/gallery/thumbnail_merihaka.jpg',
            preview: 'app/images/gallery/preview_merihaka.jpg',
            url: 'app/images/gallery/merihaka.jpg',
            guid: 'merihaka.jpg',
            mainpage: true
          }, {
            thumbnail: 'app/images/gallery/thumbnail_rantatie-1.jpg',
            preview: 'app/images/gallery/preview_rantatie-1.jpg',
            url: 'app/images/gallery/rantatie-1.jpg',
            guid: 'rantatie-1.jpg',
            mainpage: false
          }, {
            thumbnail: 'app/images/gallery/thumbnail_vet.jpg',
            preview: 'app/images/gallery/preview_vet.jpg',
            url: 'app/images/gallery/vet.jpg',
            guid: 'vet.jpg',
            mainpage: true
          }, {
            thumbnail: 'app/images/gallery/thumbnail_cafeteria-2.jpg',
            preview: 'app/images/gallery/preview_cafeteria-2.jpg',
            url: 'app/images/gallery/cafeteria-2.jpg',
            guid: 'cafeteria-2.jpg',
            mainpage: true
          }, {
            thumbnail: 'app/images/gallery/thumbnail_decoshop.jpg',
            preview: 'app/images/gallery/preview_decoshop.jpg',
            url: 'app/images/gallery/decoshop.jpg',
            guid: 'decoshop.jpg',
            mainpage: true
          }, {
            thumbnail: 'app/images/gallery/thumbnail_hoas.jpg',
            preview: 'app/images/gallery/preview_hoas.jpg',
            url: 'app/images/gallery/hoas.jpg',
            guid: 'hoas.jpg',
            mainpage: true
          }, {
            thumbnail: 'app/images/gallery/thumbnail_kerava.jpg',
            preview: 'app/images/gallery/preview_kerava.jpg',
            url: 'app/images/gallery/kerava.jpg',
            guid: 'kerava.jpg',
            mainpage: true
          }, {
            thumbnail: 'app/images/gallery/thumbnail_optikko.jpg',
            preview: 'app/images/gallery/preview_optikko.jpg',
            url: 'app/images/gallery/optikko.jpg',
            guid: 'optikko.jpg',
            mainpage: true
          }, {
            thumbnail: 'app/images/gallery/thumbnail_rantatie-2.jpg',
            preview: 'app/images/gallery/preview_rantatie-2.jpg',
            url: 'app/images/gallery/rantatie-2.jpg',
            guid: 'rantatie-2.jpg',
            mainpage: false
          }
        ];
        if (mainpage) {
          this.items = [];
          for (i = 0, _ref = images.length; 0 <= _ref ? i < _ref : i > _ref; 0 <= _ref ? i++ : i--) {
            if (images[i].mainpage) this.items.push(images[i]);
          }
        } else {
          this.items = images;
        }
        this.showPreview = function(event) {
          var container, img;
          if ($(event.target).find('.preview').length) return;
          container = $('<div />').appendTo(event.target);
          container.addClass('image-preview');
          img = new Image();
          img.onload = function() {
            container.css('margin-left', (-1 * (this.width / 2 + Number(container.css('border-width').replace(/px/, '')))) + 'px');
            container.append(this);
            return container.addClass('loaded');
          };
          return img.src = this.item.preview;
        };
        this.origin = String(window.location.origin);
        this.facebookShare = function(e, obj) {
          var opts, pageLoad;
          pageLoad = {
            page: 'design-emailed'
          };
          ga('send', 'pageview', window.location.hash, 'click', pageLoad);
          if (typeof FB !== 'undefined') {
            opts = {
              method: 'feed',
              link: $(e.target).attr('href'),
              caption: 'Suunnittelin oman design-maton'
            };
            FB.ui(opts, function(response) {
              var r;
              return r = response;
            });
          }
          if (e.preventDefault) e.preventDefault();
          if (e.stopPropagation) e.stopPropagation();
          return false;
        };
        return this;
      }

      return GalleryModel;

    })();
  });

}).call(this);
