package acc.springboot.springsecurity.web;

import acc.springboot.springsecurity.model.Product;
import acc.springboot.springsecurity.repository.ProductRepository;
import acc.springboot.springsecurity.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.util.List;
import java.util.Optional;


@Controller
public class ProductController {

    @Autowired
    private ProductService service;

    @Autowired
    private ProductRepository _productRepository;

    @RequestMapping(value = "/product", method = RequestMethod.GET)
    public List<Product> Get() {
        return _productRepository.findAll();
    }

    @RequestMapping(value = "/product/{id}", method = RequestMethod.GET)
    public ResponseEntity<Product> GetById(@PathVariable(value = "id") long id)
    {
        Optional<Product> product = _productRepository.findById(id);
        if(product.isPresent())
            return new ResponseEntity<Product>(product.get(), HttpStatus.OK);
        else
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
    }

    @RequestMapping(value = "/product", method =  RequestMethod.POST)
    public Product Post(@Valid @RequestBody Product product)
    {
        return _productRepository.save(product);
    }

    @RequestMapping(value = "/product/{id}", method =  RequestMethod.PUT)
    public ResponseEntity<Product> Put(@PathVariable(value = "id") long id, @Valid @RequestBody Product newProduct)
    {
        Optional<Product> oldProduct = _productRepository.findById(id);
        if(oldProduct.isPresent()){
            Product product = oldProduct.get();
            product.setName(newProduct.getName());
            _productRepository.save(product);
            return new ResponseEntity<Product>(product, HttpStatus.OK);
        }
        else
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
    }

    @RequestMapping(value = "/product/{id}", method = RequestMethod.DELETE)
    public ResponseEntity<Object> Delete(@PathVariable(value = "id") long id)
    {
        Optional<Product> pessoa = _productRepository.findById(id);
        if(pessoa.isPresent()){
            _productRepository.delete(pessoa.get());
            return new ResponseEntity<>(HttpStatus.OK);
        }
        else
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
    }

    @RequestMapping(value = "/products", method = RequestMethod.GET)
    public String viewHomePage(Model model) {
        List<Product> listProducts = service.listAll();
        model.addAttribute("listProducts", listProducts);

        return "products";
    }

    @RequestMapping("/product/new")
    public String showNewProductPage(Model model) {
        Product product = new Product();
        model.addAttribute("product", product);

        return "new_product";
    }

    @RequestMapping(value = "/product/save", method = RequestMethod.POST)
    public String saveProduct(@ModelAttribute("product") Product product) {
        service.save(product);

        return "redirect:/products";
    }

    @RequestMapping("/product/edit/{id}")
    public ModelAndView showEditProductPage(@PathVariable(name = "id") int id) {
        ModelAndView mav = new ModelAndView("edit_product");
        Product product = service.get(id);
        mav.addObject("product", product);

        return mav;
    }

    @RequestMapping("/product/delete/{id}")
    public String deleteProduct(@PathVariable(name = "id") int id) {
        service.delete(id);
        return "redirect:/products";
    }

}
