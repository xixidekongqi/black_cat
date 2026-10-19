package com.shop.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.shop.entity.Product;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 商品 Mapper
 */
@Mapper
public interface ProductMapper extends BaseMapper<Product> {

    /**
     * 动态 SQL 练习：多条件搜索
     */
    List<Product> searchProductsDynamic(
            @Param("name") String name,
            @Param("categoryId") Integer categoryId,
            @Param("listed") Boolean listed
    );
    /**
     * 练习 2：动态排序查询
     */
    List<Product> searchProductsWithSort(
            @Param("keyword") String keyword,
            @Param("sortBy") String sortBy
    );

    /**
     * 练习 3：选择性更新（只更新有值的字段）
     */
    int updateProductSelective(
            @Param("id") Long id,
            @Param("title") String title,
            @Param("price") java.math.BigDecimal price,
            @Param("categoryId") Integer categoryId
    );
    /**
     * 练习 4：批量查询
     */
    List<Product> selectByIds(@Param("ids") List<Long> ids);
    List<Product> searchWithOrderBy(@Param("orderByField") String orderByField);
    Product selectWithMap(@Param("id") Long id);
    int insertProduct(Product product);
    /**
     * 练习：纯注解开发，不使用 XML
     */
    @org.apache.ibatis.annotations.Select("SELECT * FROM product WHERE category_id = #{categoryId} AND listed = 1")
    List<Product> selectByCategoryWithAnno(@org.apache.ibatis.annotations.Param("categoryId") Integer categoryId);
    Product selectSimpleInfo(@Param("id") Long id);
    int deleteByIds(@Param("ids") List<Long> ids);

}