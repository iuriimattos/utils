$.ajax({
    url: 'https://www.receitaws.com.br/v1/cnpj/' + cnpj,
    method: "GET",
    jsonp: "callback",
    dataType: "jsonp",
    timeout: 3000,
})
    .complete(function(data){
	form.find('input[name=razao_social]').val(data.nome);
	form.find('input[name=nome_fantasia]').val(data.fantasia);
	form.find('input[name=address]').val( data.logradouro );
	form.find('input[name=cep]').val(data.cep.split('.').join(''));
	form.find('input[name=email]').val(data.email);
	form.find('input[name=company_name]').val(data.nome);
	stageOne.hide();
	form.show();
    })
    .always(function(data) {
	if(data.status == "ERROR") {
	    swal("Campo inválido", data.message)
	    form.find('label[for=razao_social]').hide();
	    form.find('input[name=razao_social]').hide();
	    form.find('label[for=nome_fantasia]').hide();
	    form.find('input[name=nome_fantasia]').hide();
	    form.find('label[for=company_type]').hide();
	    form.find('input[name=company_type]').hide();
	    form.find('label[for=company_name]').hide();
	    form.find('select[name=company_type]').hide();
	    form.hide();
	    stageOne.show();
	    return;
	}

    })
    .fail(function(x, t, m) {
	console.log(x)
	console.log(t)
	console.log(m)
	if(t==="timeout") {
	    swal("Aviso", "CNPJ Validado o CNPJ validar seu cnpj no momento, tente novamente em alguns instantes")
	    return;
	}
    });
