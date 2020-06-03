(function() {
  'use strict'
  var APP = APP || {};

  APP.home = (function($) {
    init();

    function validaForm() {
      $("[name='company_name']").bind("keyup", function(event) {
        var RegExpression = /^[A-zÀ-ú\s]*$/;

        if (!RegExpression.test($(this).val())) {
          var str = $(this).val().slice(0, -1);
          $(this).val(str);
        }
      })
      $("[name='full_name']").bind("keyup", function(event) {
        var RegExpression = /^[A-zÀ-ú\s]*$/;

        if (!RegExpression.test($(this).val())) {
          var str = $(this).val().slice(0, -1);
          $(this).val(str);
        }
      })
      $("[name='razao_social']").bind("keyup", function(event) {
        var RegExpression = /^[A-zÀ-ú\s]*$/;

        if (!RegExpression.test($(this).val())) {
          var str = $(this).val().slice(0, -1);
          $(this).val(str);
        }
      })
      $("[name='nome_fantasia']").bind("keyup", function(event) {
        var RegExpression = /^[A-zÀ-ú\s]*$/;

        if (!RegExpression.test($(this).val())) {
          var str = $(this).val().slice(0, -1);
          $(this).val(str);
        }
      })
      $("[name='email']").bind("keyup", function(event) {
        var RegExpression = /^[A-z0-9@!#$%&'*+-=?^_`{|}~\s]*$/;

        if (!RegExpression.test($(this).val())) {
          var str = $(this).val().slice(0, -1);
          $(this).val(str);
        }
      })
    }

    function init() {
      validaForm();
    }

  }(jQuery));

})();
