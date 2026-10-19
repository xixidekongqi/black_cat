package com.shop;

import com.shop.entity.Product;
import com.shop.mapper.ProductMapper;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
public class DynamicSqlTest {

    @Autowired
    private ProductMapper productMapper;

    @Test
    void testDynamicSql() {
        System.out.println("========== 测试 1：只传商品名称（不传分类，不传上架状态） ==========");
        // 假设数据库里有关键字带“笔”的商品
        List<Product> list1 = productMapper.searchProductsDynamic("笔", null, null);
        System.out.println("查询结果数量：" + list1.size());

        System.out.println("\n========== 测试 2：传商品名称 + 上架状态 ==========");
        List<Product> list2 = productMapper.searchProductsDynamic("笔", null, true);
        System.out.println("查询结果数量：" + list2.size());

        System.out.println("\n========== 测试 3：什么条件都不传（全表查） ==========");
        List<Product> list3 = productMapper.searchProductsDynamic(null, null, null);
        System.out.println("查询结果数量：" + list3.size());
    }
    @Test
    void testChooseAndSet() {
        System.out.println("========== 测试 choose：价格升序 ==========");
        List<Product> list1 = productMapper.searchProductsWithSort(null, "price_asc");
        System.out.println("第一条商品：" + list1.get(0).getTitle()); // 看看是不是最便宜的

        System.out.println("\n========== 测试 choose：默认排序 ==========");
        List<Product> list2 = productMapper.searchProductsWithSort(null, null); // 没传 sortBy

        System.out.println("\n========== 测试 set：只更新价格，不更新标题 ==========");
        // 假设 id=1 的商品存在。只传 price，title 传 null
        int rows = productMapper.updateProductSelective(1L, null, new java.math.BigDecimal("888.88"), null);
        System.out.println("受影响的行数：" + rows);
    }
    @Test
    void testForeach() {
        System.out.println("========== 测试 foreach：批量查询 ID 为 1、2、3 的商品 ==========");

        // 准备一个 ID 列表
        java.util.List<Long> ids = java.util.Arrays.asList(1L, 2L, 3L);

        // 调用接口
        List<Product> list = productMapper.selectByIds(ids);

        System.out.println("查到了多少条商品：" + list.size());
        // 循环打印一下查到的商品标题，证明查对了
        list.forEach(product -> System.out.println("商品名称：" + product.getTitle()));
    }
    @Test
    void testDollarSign() {
        System.out.println("========== 测试 ${} 动态拼接列名 ==========");
        // 假设我们想按 price 倒序
        List<Product> list = productMapper.searchWithOrderBy("price");
        System.out.println("查询结果：" + list.get(0).getTitle());
    }
    @Test
    void testResultMap() {
        System.out.println("========== 测试 resultMap ==========");
        Product p = productMapper.selectWithMap(1L);
        System.out.println("商品名：" + p.getTitle());
        // 如果这里能打印出价格（不是 null），说明映射成功
        System.out.println("商品价格：" + p.getPrice());
    }
    @Test
    void testQueryWrapper() {
        System.out.println("========== 测试 Java API (QueryWrapper) ==========");
        // 构建查询条件：标题包含"笔"，并且状态为上架 (listed = true)
        com.baomidou.mybatisplus.core.conditions.query.QueryWrapper<Product> wrapper =
                new com.baomidou.mybatisplus.core.conditions.query.QueryWrapper<>();

        wrapper.like("title", "笔")
                .eq("listed", true);

        List<Product> list = productMapper.selectList(wrapper);
        System.out.println("查到的商品数量：" + list.size());
        list.forEach(p -> System.out.println(p.getTitle()));
    }
    @Test
    void testInsertAndKeyBack() {
        System.out.println("========== 测试 insert 与主键回填 ==========");

        com.shop.entity.Product p = new com.shop.entity.Product();
        p.setTitle("测试新增商品-作业展示");
        p.setPrice(new java.math.BigDecimal("99.99"));
        p.setCategoryId(1L);
        p.setListed(true);
        p.setSellerId(1L);
        p.setDescription("这是一段为了通过 MyBatis insert 测试而写的描述。");

        // 补充：随便给个封面图路径（或者用你数据库里现有的图片路径）
        p.setCoverImage("/uploads/test.jpg");

        System.out.println("插入前 ID：" + p.getId());
        productMapper.insertProduct(p);
        System.out.println("插入后回填的 ID：" + p.getId());
    }
    @Test
    void testAnnotation() {
        System.out.println("========== 测试注解开发（无 XML） ==========");

        // 假设分类 1 是在售商品的分类
        List<com.shop.entity.Product> list = productMapper.selectByCategoryWithAnno(1);

        System.out.println("分类 1 的在售商品数量：" + list.size());
        list.forEach(p -> System.out.println("商品名：" + p.getTitle()));
    }
    @Test
    void testSqlInclude() {
        System.out.println("========== 测试 <sql> 与 <include> 片段复用 ==========");
        com.shop.entity.Product p = productMapper.selectSimpleInfo(1L);

        if (p != null) {
            System.out.println("查询成功！商品名：" + p.getTitle());
        } else {
            System.out.println("查询失败，未找到商品。");
        }
    }
    @Test
    void testBatchDelete() {
        System.out.println("========== 测试 <delete> 批量删除 ==========");

        // 先插入一条测试数据
        com.shop.entity.Product p = new com.shop.entity.Product();
        p.setTitle("待删除测试商品");
        p.setPrice(new java.math.BigDecimal("1.00"));
        p.setCategoryId(1L);
        p.setListed(true);
        p.setSellerId(1L);
        p.setDescription("待删除描述");
        p.setCoverImage("/uploads/test.jpg");
        productMapper.insertProduct(p);

        System.out.println("刚刚插入的商品 ID：" + p.getId());

        // 批量删除它
        int rows = productMapper.deleteByIds(java.util.Arrays.asList(p.getId()));
        System.out.println("成功删除了 " + rows + " 条数据。");
    }
}