package com.example.SportStore.repositories;

import com.example.SportStore.models.Product;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ProductRepository extends JpaRepository<Product, Long> {
    List<Product> findByTitle(String title);
    void deleteById(Long id);
}
