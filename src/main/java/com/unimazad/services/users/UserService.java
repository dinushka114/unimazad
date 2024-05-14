/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.unimazad.services.users;

import com.unimazad.models.Bid;
import com.unimazad.models.Product;
import com.unimazad.utils.DbConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


public class UserService {
    private static PreparedStatement preparedStatement;
    private static Connection connection;
    private static ResultSet resultSet;
    
    public static ArrayList<Product> getAllProducts(){
        ArrayList<Product> myListings = new ArrayList<Product>();
        
        try{
            connection = DbConnection.getDbConnection();
            String query = "SELECT * FROM products";
            preparedStatement = connection.prepareStatement(query);
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
    
     public static ArrayList<Product> getProductsByCategory(int id){
        ArrayList<Product> myListings = new ArrayList<Product>();
        
        try{
            connection = DbConnection.getDbConnection();
            String query = "SELECT * FROM products WHERE category_id = ?";
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
     
    public static ArrayList<Bid> getCurrentBids(int productId){
        ArrayList<Bid> bids = new ArrayList<Bid>();
        
        try{
            connection = DbConnection.getDbConnection();
            String query = "SELECT * FROM bids WHERE product_id = ?";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, productId);
            resultSet = preparedStatement.executeQuery();
            
            while(resultSet.next()){
                Bid bid = new Bid();
                bid.setBidId(resultSet.getInt("bid_id"));
                bid.setBidAmount(resultSet.getDouble("bid_amount"));
                bid.setBidTime(resultSet.getString("bid_time"));
                bid.setBidderId(resultSet.getInt("bidder_id"));
                bid.setProductId(resultSet.getInt("product_id"));
                bids.add(bid);
                
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return bids;
    }
    
    public static boolean makeAbid(Bid bid){
        boolean result = false;
        
        try{
            connection = DbConnection.getDbConnection();
            String query = "INSERT INTO bids (bid_amount, bidder_id, product_id) VALUES (?,?,?)";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setDouble(1, bid.getBidAmount());
            preparedStatement.setInt(2, bid.getBidderId());
            preparedStatement.setInt(3, bid.getProductId());
            result = preparedStatement.executeUpdate() > 0;
            
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return result;
    }
}
