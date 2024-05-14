/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.unimazad.controllers.seller;

import com.unimazad.models.Bid;
import com.unimazad.models.User;
import com.unimazad.services.users.UserService;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MakeBidController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("bidder");
        int productId = Integer.parseInt(request.getParameter("product_id"));
        double bidAmount = Double.parseDouble(request.getParameter("bid_amount"));
        double startPrice = Double.parseDouble(request.getParameter("starting_bid"));
        ArrayList<Bid> bids = UserService.getCurrentBids(productId);

        double highestBid = 0;

        if (bidAmount < startPrice) {
            request.setAttribute("BID_LOW", "You must bid higher than " + startPrice);
            request.getRequestDispatcher("index.jsp").forward(request, response);
            return;
        }

        if (user != null) {
            for (Bid bid : bids) {
                if (bid.getBidderId() == user.getId()) {
                    request.setAttribute("ALREADY_BIDDED", "You already bid to this item");
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                    return;
                }

                if (bid.getBidAmount() > highestBid) {
                    highestBid = bid.getBidAmount();
                }

            }

            if (bidAmount < highestBid) {
                request.setAttribute("BID_LOW", "You must bid higher than " + highestBid);
                request.getRequestDispatcher("index.jsp").forward(request, response);
                return;
            } else {
                Bid newBid = new Bid();

                newBid.setBidAmount(bidAmount);
                newBid.setBidderId(user.getId());
                newBid.setProductId(productId);

                UserService.makeAbid(newBid);

                request.setAttribute("OK", "You have bid successfully");
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }
        } else {

            response.sendRedirect("loginreg.jsp");
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
