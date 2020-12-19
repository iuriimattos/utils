var app = {
	setup: function(){
		jQuery("#item-add").click(function(){
			var item_nome = prompt("Adicionar nome do item:");
			var item_desc = prompt("Adicionar descricao do item:");
			var item_preco = prompt("Adicionar preco do item do item: (com casa decimais ex: 2.20)");
			var item_categoria = prompt("Adicionar categoria do item: (observe o ID da CATEGORIA ao lado)");
			if(item_nome != ""){
				jQuery.ajax({
					url:"application/item-add",
					type: "POST",
					dataType: "html",
					data: {
						'item_nome' : item_nome,
						'item_desc' : item_desc,
						'item_preco' : item_preco,
						'item_categoria' : item_categoria,
					},
					success:function(){
						window.location.reload();
					}
				});
			}
		});
	}		
}
jQuery(document).ready(function() {
	app.setup();
});
