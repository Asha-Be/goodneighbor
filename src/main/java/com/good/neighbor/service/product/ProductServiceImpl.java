package com.good.neighbor.service.product;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import model.product.ProductDTO;
import util.PageTest;

@Service
public class ProductServiceImpl implements ProductService {

  @Autowired
  SqlSessionFactory sqlSessionFactory;

  // 0.상품 총 개수 구하기 ------------------------------------------------------------------------>
  @Override
  public int countProduct() throws IOException {
    SqlSession sqlSession = sqlSessionFactory.openSession();
    int count = sqlSession.selectOne("ProductMapper.countProduct");
    sqlSession.close();
    return count;
  }

  // 1.상품 등록 ---------------------------------------------------------------------------------->
  @Override
  public void insertProduct(ProductDTO productDTO) throws IOException {
    SqlSession sqlSession = sqlSessionFactory.openSession();
    sqlSession.insert("ProductMapper.insertProduct", productDTO);
    sqlSession.commit();
    sqlSession.close();
  }

  // 2.상품 목록 ---------------------------------------------------------------------------------->
  @Override
  public List<ProductDTO> listProduct(PageTest pageTest) {
    SqlSession sqlSession = sqlSessionFactory.openSession();
    pageTest.setSkip((pageTest.getCurPage() - 1) * pageTest.getPageSize());
    pageTest.setAmount(pageTest.getPageSize());
    Map<String, Object> map = new HashMap<String, Object>();
    map.put("pageTest", pageTest);
    List<ProductDTO> productList = sqlSession.selectList("ProductMapper.listProduct", map);
    sqlSession.close();
    return productList;
  }

  // 3.상품 상세 ---------------------------------------------------------------------------------->
  @Override
  public ProductDTO detailProduct(int product_id) throws IOException {
    SqlSession sqlSession = sqlSessionFactory.openSession();
    ProductDTO productDTO = sqlSession.selectOne("ProductMapper.detailProduct", product_id);
    sqlSession.close();
    return productDTO;
  }

  // 4.상품 검색 ---------------------------------------------------------------------------------->
  @Override
  public List<ProductDTO> searchProduct(String product_name) throws IOException {
    SqlSession sqlSession = sqlSessionFactory.openSession();
    List<ProductDTO> productList = sqlSession.selectList("ProductMapper.searchProduct", product_name);
    sqlSession.close();
    return productList;
  }

  // 5.상품 수정 ---------------------------------------------------------------------------------->
  @Override
  public void updateProduct(ProductDTO productDTO) throws IOException {
    SqlSession sqlSession = sqlSessionFactory.openSession();
    sqlSession.update("ProductMapper.updateProduct", productDTO);
    sqlSession.commit();
    sqlSession.close();
  }

  // 6.상품 삭제 ---------------------------------------------------------------------------------->
  @Override
  public void deleteProduct(int product_id) throws IOException {
    SqlSession sqlSession = sqlSessionFactory.openSession();
    sqlSession.delete("ProductMapper.deleteProduct", product_id);
    sqlSession.commit();
    sqlSession.close();
  }

}