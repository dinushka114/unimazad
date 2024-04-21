/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.unimazad.services;

import com.unimazad.models.User;
import com.unimazad.utils.DbConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class AuthService {

    private static PreparedStatement preparedStatement;
    private static Connection connection;
    private static ResultSet resultSet;

    public static boolean registerUser(User user) {
        boolean result = false;

        try {
            connection = DbConnection.getDbConnection();
            String query = "INSERT INTO users (username, password,user_type) VALUES (?,?,?)";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, user.getEmail());
            preparedStatement.setString(2, user.getPassword());
            preparedStatement.setString(3, user.getType());
            result = preparedStatement.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }

    public static User loginUser(User user) {
        User loggedUser = null;

        try {
            connection = DbConnection.getDbConnection();
            String query = "SELECT * FROM users WHERE username = ? AND password = ?";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, user.getEmail());
            preparedStatement.setString(2, user.getPassword());
            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                loggedUser = new User();
                loggedUser.setId(resultSet.getInt("user_id"));
                loggedUser.setEmail(resultSet.getString("username"));
                loggedUser.setPassword(resultSet.getString("password"));
                loggedUser.setType(resultSet.getString("user_type"));

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return loggedUser;
    }
}
