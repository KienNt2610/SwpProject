<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin Dashboard</title>
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    </head>
    <body>
        <h1>Admin Dashboard</h1>

        <div>
            <h3>Total Products in Inventory: ${totalInventory}</h3>
            <h3>Total Products Sold: ${totalSold}</h3>
        </div>

        <!-- Revenue Chart -->
        <h2>Revenue Chart</h2>
        <canvas id="revenueChart"></canvas>
        <script>
            var ctx = document.getElementById('revenueChart').getContext('2d');
            var revenueChart = new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: <%= request.getAttribute("revenueData").stream().map(p -> p.get("ProductName")).toList() %>,
                    datasets: [{
                            label: 'Revenue',
                            data: <%= request.getAttribute("revenueData").stream().map(p -> p.get("Revenue")).toList() %>,
                            backgroundColor: 'rgba(255, 99, 132, 0.2)',
                            borderColor: 'rgba(255, 99, 132, 1)',
                            borderWidth: 1
                        }]
                },
                options: {
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            });
        </script>

        <!-- Top Selling Products Chart -->
        <h2>Top Selling Products</h2>
        <canvas id="topSellingChart"></canvas>
        <script>
            var ctx = document.getElementById('topSellingChart').getContext('2d');
            var topSellingChart = new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: ${topSellingProducts.stream().map(p -> p.get("ProductName")).toList()},
                    datasets: [{
                            label: 'Quantity Sold',
                            data: ${topSellingProducts.stream().map(p -> p.get("QuantitySold")).toList()},
                            backgroundColor: 'rgba(54, 162, 235, 0.2)',
                            borderColor: 'rgba(54, 162, 235, 1)',
                            borderWidth: 1
                        }]
                },
                options: {
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            });
        </script>

        <!-- Low Stock Products Table -->
        <h2>Low Stock Products</h2>
        <table>
            <tr>
                <th>Product Name</th>
                <th>Quantity</th>
            </tr>
            <c:forEach var="product" items="${lowStockProducts}">
                <tr>
                    <td>${product.ProductName}</td>
                    <td>${product.Quantity}</td>
                </tr>
            </c:forEach>
        </table>

    </body>
</html>
