/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.unimazad.services.seller;

import com.unimazad.models.Product;
import com.unimazad.utils.DbConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


public class SellerService {
    
    private static PreparedStatement preparedStatement;
    private static Connection connection;
    private static ResultSet resultSet;
    
    public static boolean newListing(Product product){
        boolean result = false;
        
        try{
            connection = DbConnection.getDbConnection();
            String query = "INSERT INTO products (name, image, description, category_id, start_price, start_time, end_time, auctioner_id) VALUES (?,?,?,?,?,?,?,?)";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, product.getName());
            preparedStatement.setString(2, product.getImage());
            preparedStatement.setString(3, product.getDescription());
            preparedStatement.setInt(4, product.getCategoryId());
            preparedStatement.setDouble(5, product.getStartPrice());
            preparedStatement.setString(6, product.getStartDate());
            preparedStatement.setString(7, product.getEndDate());
            preparedStatement.setInt(8, product.getAucId());
            
            result = preparedStatement.executeUpdate() > 0;
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return result;
    }
    
    public static ArrayList<Product> getMyListings(int id){
        ArrayList<Product> myListings = new ArrayList<Product>();
        
        try{
            connection = DbConnection.getDbConnection();
            String query = "SELECT * FROM products WHERE auctioner_id = ?";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, id);
            resultSet = preparedStatement.executeQuery();
            
            while(resultSet.next()){
                Product product = new Product();
                product.setId(resultSet.getInt("product_id"));
                product.setName(resultSet.getString("name"));
                product.setImage(resultSet.getString("image"));
                product.setDescription(resultSet.getString("description"));
                product.setCategoryId(resultSet.getInt("category_id"));
                product.setStartDate(resultSet.getString("start_time"));
                product.setEndDate(resultSet.getString("end_time"));
                product.setStartPrice(resultSet.getDouble("start_price"));
                myListings.add(product);
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return myListings;
    }
}