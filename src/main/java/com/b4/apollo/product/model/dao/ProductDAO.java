package com.b4.apollo.product.model.dao;

import com.b4.apollo.product.model.dto.ProductDTO;
import com.b4.apollo.product.model.dto.ProductImageDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ProductDAO {
    ProductDTO productDetail(int code);

    List<ProductDTO> productList();

    int registProduct(ProductDTO prod);

    int productDelete(Integer code);

    int editProduct(ProductDTO newProd);

    int addProductImage(ProductImageDTO prodImg);
}
