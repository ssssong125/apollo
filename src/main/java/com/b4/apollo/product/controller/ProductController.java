package com.b4.apollo.product.controller;

import com.b4.apollo.product.model.dto.ProductDTO;
import com.b4.apollo.product.model.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/list")
public class ProductController {
    private final ProductService productService;

    @Autowired
    public ProductController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping("/list")
    public ModelAndView productList(ModelAndView mv) {

        List<ProductDTO> productList = productService.productList();
        productList.stream().forEach(product -> System.out.println("product = " + product));

        mv.addObject("productList", productList);
        mv.setViewName("product/list");
        return mv;
    }

    @GetMapping("/detail  /*  int code 에 대한 것을 {}로 써야함 ???  */")
    public ModelAndView productDetail(ModelAndView mv, int code) {
        ProductDTO productDetail = productService.productDetail(code);
        mv.addObject("productDetail", productDetail);
        mv.setViewName("product/detail");
        return mv;
    }

        @PostMapping("regist")
    public ModelAndView registProduct(ModelAndView mv, ProductDTO newProd/*, RedirectAttributes rttr*/) /*throws Exception*/ {

        productService.registProduct(newProd);
        mv.setViewName("redirect:/list");
//        rttr.addFlashAttribute("successMessage","신규 메뉴 등록에 성공하셨습니다." );

        return mv;
    }
    @PostMapping("edit")
    public ModelAndView editProduct(ModelAndView mv, ProductDTO newProd/*, RedirectAttributes rttr*/) /*throws Exception*/ {

        productService.editProduct(newProd);
        mv.setViewName("redirect:/edit");
//        rttr.addFlashAttribute("successMessage","신규 메뉴 등록에 성공하셨습니다." );

        return mv;
    }
    @GetMapping("/delete") /*  int code 에 대한 것을 {}로 써야함 ???  */
    public ModelAndView productDelete(ModelAndView mv, int code) {
        ProductDTO productDelete = productService.productDelete(code);
        mv.addObject("productDelete", productDelete);
        mv.setViewName("product/delete");
        return mv;
    }
}