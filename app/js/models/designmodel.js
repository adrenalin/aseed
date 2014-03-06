(function() {

  define(['carpetModel'], function(CarpetModel) {
    var DesignModel;
    return DesignModel = (function() {

      function DesignModel(width, height) {
        var model;
        model = this;
        this.carpet = new CarpetModel(width, height);
        this.images = [];
        this.texts = [];
        this.screen_width = $(window).width();
        this.screen_height = $(window).height();
        this.in_gallery = "1";
        this.can_contact = "0";
        this.participate = "0";
        this.rules = "0";
        this.user_agent = navigator.userAgent;
        this.design_name = 'Nimetön';
        this.author_name = '';
        this.author_email = '';
        this.author_phone = '';
        this.author_company = '';
        this.author_street = '';
        this.author_postcode = '';
        this.author_city = '';
      }

      return DesignModel;

    })();
  });

}).call(this);
