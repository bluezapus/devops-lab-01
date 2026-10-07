package com.bluezapus.petclinic.customers.repository;

import com.bluezapus.petclinic.customers.model.Customer;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CustomerRepository extends JpaRepository<Customer, Long> {
}
