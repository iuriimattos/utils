(function() {
  'use strict'
  var APP = APP || {};

  APP.home = (function($) {
    init();

    function ajaxForm() {
      jQuery("#solicitacao").submit(function(event){
          event.preventDefault();
          var nome = jQuery("#nome").val();
          var email = jQuery("#email").val();
          var cpf = jQuery("#cpf").val();
          var endereco = jQuery("#endereco").val();
          var nascimento = jQuery("#nascimento").val();
          var tel1 = jQuery("#tel1").val();
          var tel2 = jQuery("#tel2").val();
          jQuery.ajax({
              url: "http://chamacomunicacao.com.br/teste/email-contato.php",
              type: "POST",
              data: {
                  ip: ip,
                  nome: nome,
                  cpf: cpf,
                  email: email,
                  nascimento: nascimento,
                  endereco: endereco,
                  tel1: tel1,
                  tel2: tel2
              },
              success:function(msg){
                  alert(msg);
              }
          });
      });
    }

    function init() {
      ajaxForm();
    }

  }(jQuery));

})();
